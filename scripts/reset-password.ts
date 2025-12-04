/**
 * Script para restablecer la contraseña del superadmin
 * 
 * USO:
 * 1. Agrega SUPABASE_SERVICE_ROLE_KEY a .env.local
 * 2. npx tsx scripts/reset-password.ts
 * 3. Elimina SUPABASE_SERVICE_ROLE_KEY
 */

import { config } from 'dotenv'
import { createClient } from '@supabase/supabase-js'

config({ path: '.env.local' })

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error('❌ Error: Variables de entorno faltantes')
    process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
})

const email = 'superadmin@simbioma.com'
const newPassword = 'Demo2024!'

async function main() {
    console.log(`🔄 Restableciendo contraseña para ${email}...`)

    // 1. Buscar el usuario
    const { data: { users }, error: searchError } = await supabase.auth.admin.listUsers()

    if (searchError) {
        console.error('❌ Error al buscar usuarios:', searchError)
        return
    }

    const user = users.find(u => u.email === email)

    if (!user) {
        console.error('❌ Usuario no encontrado en auth.users')
        console.log('   Intentando crearlo...')

        const { error: createError } = await supabase.auth.admin.createUser({
            email,
            password: newPassword,
            email_confirm: true,
            user_metadata: { full_name: 'Super Admin Simbioma' }
        })

        if (createError) {
            console.error('❌ Error al crear usuario:', createError)
        } else {
            console.log('✅ Usuario creado exitosamente')
        }
        return
    }

    // 2. Actualizar contraseña
    const { error: updateError } = await supabase.auth.admin.updateUserById(
        user.id,
        { password: newPassword }
    )

    if (updateError) {
        console.error('❌ Error al actualizar contraseña:', updateError)
    } else {
        console.log('✅ Contraseña actualizada exitosamente')
        console.log(`📧 Email: ${email}`)
        console.log(`🔑 Password: ${newPassword}`)
    }
}

main()
