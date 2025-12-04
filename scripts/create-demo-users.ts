/**
 * Script para crear usuarios de demostración usando Supabase Admin API
 * 
 * Este script crea usuarios correctamente para que puedan autenticarse.
 * 
 * USO:
 * npx tsx scripts/create-demo-users.ts
 */

import { config } from 'dotenv'
import { createClient } from '@supabase/supabase-js'

// Cargar variables de entorno desde .env.local
config({ path: '.env.local' })

// Verificar variables de entorno
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error('❌ Error: Variables de entorno faltantes')
    console.error('Asegúrate de que existan:')
    console.error('- NEXT_PUBLIC_SUPABASE_URL')
    console.error('- SUPABASE_SERVICE_ROLE_KEY')
    process.exit(1)
}

// Crear cliente con permisos de administrador
const supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
})

// Definir usuarios de demostración
const demoUsers = [
    {
        id: 'a1111111-1111-1111-1111-111111111111',
        email: 'superadmin@simbioma.com',
        password: 'Demo2024!',
        fullName: 'Super Admin Simbioma',
        organizationId: 'a0000000-0000-0000-0000-000000000001',
        role: 'superadmin'
    },
    {
        id: 'b1111111-1111-1111-1111-111111111111',
        email: 'admin.municipal@demo.cl',
        password: 'Demo2024!',
        fullName: 'Admin Municipal',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'admin'
    },
    {
        id: 'b2222222-2222-2222-2222-222222222222',
        email: 'editor.municipal@demo.cl',
        password: 'Demo2024!',
        fullName: 'Funcionario Ambiente',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'editor'
    },
    {
        id: 'b3333333-3333-3333-3333-333333333333',
        email: 'viewer.municipal@demo.cl',
        password: 'Demo2024!',
        fullName: 'Auditor Municipal',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'viewer'
    },
    {
        id: 'c1111111-1111-1111-1111-111111111111',
        email: 'gerente@empresademo.cl',
        password: 'Demo2024!',
        fullName: 'Gerente Empresa',
        organizationId: 'c0000000-0000-0000-0000-000000000001',
        role: 'admin'
    },
    {
        id: 'c2222222-2222-2222-2222-222222222222',
        email: 'operario@empresademo.cl',
        password: 'Demo2024!',
        fullName: 'Operario Empresa',
        organizationId: 'c0000000-0000-0000-0000-000000000001',
        role: 'member'
    },
    {
        id: 'd1111111-1111-1111-1111-111111111111',
        email: 'admin@goredemo.cl',
        password: 'Demo2024!',
        fullName: 'Admin GORE',
        organizationId: 'd0000000-0000-0000-0000-000000000001',
        role: 'admin'
    }
]

async function main() {
    console.log('🚀 Creando usuarios de demostración...\n')

    for (const user of demoUsers) {
        console.log(`📧 Creando usuario: ${user.email}`)

        try {
            // 1. Crear usuario en auth.users usando Admin API
            const { data: authData, error: authError } = await supabase.auth.admin.createUser({
                email: user.email,
                password: user.password,
                email_confirm: true, // Auto-confirmar email
                user_metadata: {
                    full_name: user.fullName
                }
            })

            if (authError) {
                // Si el usuario ya existe, intentar obtenerlo
                if (authError.message.includes('already registered')) {
                    console.log(`   ⚠️  Usuario ya existe, actualizando...`)

                    // Actualizar contraseña
                    const { error: updateError } = await supabase.auth.admin.updateUserById(
                        user.id,
                        { password: user.password }
                    )

                    if (updateError) {
                        console.error(`   ❌ Error al actualizar: ${updateError.message}`)
                        continue
                    }
                } else {
                    console.error(`   ❌ Error: ${authError.message}`)
                    continue
                }
            } else {
                console.log(`   ✅ Usuario creado en auth.users`)
            }

            // 2. Crear/actualizar perfil en public.users
            const userId = authData?.user?.id || user.id
            const { error: profileError } = await supabase
                .from('users')
                .upsert({
                    id: userId,
                    email: user.email,
                    full_name: user.fullName,
                    organization_id: user.organizationId,
                    role: user.role
                })

            if (profileError) {
                console.error(`   ❌ Error al crear perfil: ${profileError.message}`)
                continue
            }

            console.log(`   ✅ Perfil creado/actualizado en public.users`)
            console.log(`   📝 Rol: ${user.role}`)
            console.log('')

        } catch (error) {
            console.error(`   ❌ Error inesperado:`, error)
        }
    }

    console.log('✨ Proceso completado!\n')
    console.log('📋 Resumen de usuarios creados:')
    console.log('━'.repeat(60))

    demoUsers.forEach(user => {
        console.log(`Email: ${user.email.padEnd(30)} | Contraseña: ${user.password}`)
    })

    console.log('━'.repeat(60))
    console.log('\n🔐 Todos los usuarios tienen la contraseña: Demo2024!')
    console.log('🌐 Puedes iniciar sesión en: http://localhost:3000/login\n')
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error('❌ Error fatal:', error)
        process.exit(1)
    })
