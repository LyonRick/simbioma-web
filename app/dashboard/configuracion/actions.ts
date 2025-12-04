'use server'

import { createAdminClient } from '@/lib/supabase/admin'
import { createClient } from '@/lib/supabase/server'
import { revalidatePath } from 'next/cache'
import { z } from 'zod'

const inviteSchema = z.object({
    email: z.string().email({ message: "Email inválido" }),
    fullName: z.string().min(2, { message: "El nombre debe tener al menos 2 caracteres" }),
    role: z.enum(['admin', 'editor', 'viewer', 'member']),
    password: z.string().min(8, { message: "La contraseña debe tener al menos 8 caracteres" })
})

export type InviteState = {
    success?: boolean
    message?: string
    errors?: {
        email?: string[]
        fullName?: string[]
        role?: string[]
        password?: string[]
    }
}

export async function inviteUser(prevState: InviteState, formData: FormData): Promise<InviteState> {
    const validatedFields = inviteSchema.safeParse({
        email: formData.get('email'),
        fullName: formData.get('fullName'),
        role: formData.get('role'),
        password: formData.get('password'),
    })

    if (!validatedFields.success) {
        return {
            success: false,
            errors: validatedFields.error.flatten().fieldErrors,
            message: "Error en los datos del formulario"
        }
    }

    const { email, fullName, role, password } = validatedFields.data

    try {
        // 1. Verificar permisos del usuario actual (Admin)
        const supabase = await createClient()
        const { data: { user: currentUser } } = await supabase.auth.getUser()

        if (!currentUser) {
            return { success: false, message: "No autorizado" }
        }

        // Obtener organización del admin
        const { data: adminProfile } = await supabase
            .from('users')
            .select('organization_id, role')
            .eq('id', currentUser.id)
            .single()

        if (!adminProfile || (adminProfile.role !== 'admin' && adminProfile.role !== 'superadmin')) {
            return { success: false, message: "No tienes permisos para invitar usuarios" }
        }

        // 2. Crear usuario usando Admin Client
        const adminClient = createAdminClient()

        const { data: newUser, error: createError } = await adminClient.auth.admin.createUser({
            email: email,
            password: password,
            email_confirm: true, // Auto-confirmar para MVP
            user_metadata: {
                full_name: fullName
            }
        })

        if (createError) {
            console.error('Error creating user:', createError)
            return { success: false, message: `Error al crear usuario: ${createError.message}` }
        }

        if (!newUser.user) {
            return { success: false, message: "No se pudo crear el usuario" }
        }

        // 3. Actualizar perfil en public.users
        // El trigger on_auth_user_created ya creó el registro, solo actualizamos los campos faltantes
        const { error: updateError } = await adminClient
            .from('users')
            .update({
                full_name: fullName,
                organization_id: adminProfile.organization_id,
                role: role
            })
            .eq('id', newUser.user.id)

        if (updateError) {
            console.error('Error updating profile:', updateError)
            // Intentar rollback (eliminar usuario auth)
            await adminClient.auth.admin.deleteUser(newUser.user.id)
            return { success: false, message: "Error al configurar el perfil del usuario" }
        }

        revalidatePath('/dashboard/configuracion')
        return { success: true, message: "Usuario invitado correctamente" }

    } catch (error) {
        console.error('Unexpected error:', error)
        return { success: false, message: "Ocurrió un error inesperado" }
    }
}

export async function deleteUser(userId: string) {
    try {
        // 1. Verificar permisos
        const supabase = await createClient()
        const { data: { user: currentUser } } = await supabase.auth.getUser()

        if (!currentUser) throw new Error("No autorizado")

        const { data: adminProfile } = await supabase
            .from('users')
            .select('organization_id, role')
            .eq('id', currentUser.id)
            .single()

        if (!adminProfile || (adminProfile.role !== 'admin' && adminProfile.role !== 'superadmin')) {
            throw new Error("No tienes permisos")
        }

        // 2. Verificar que el usuario a eliminar pertenece a la misma organización
        const { data: targetUser } = await supabase
            .from('users')
            .select('organization_id')
            .eq('id', userId)
            .single()

        if (!targetUser || targetUser.organization_id !== adminProfile.organization_id) {
            throw new Error("Usuario no encontrado o no pertenece a tu organización")
        }

        // 3. Eliminar usuario (Hard Delete)
        const adminClient = createAdminClient()
        const { error } = await adminClient.auth.admin.deleteUser(userId)

        if (error) throw error

        revalidatePath('/dashboard/configuracion')
        return { success: true, message: "Usuario eliminado correctamente" }

    } catch (error: any) {
        console.error('Delete error:', error)
        return { success: false, message: error.message }
    }
}
