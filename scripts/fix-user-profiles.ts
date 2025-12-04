/**
 * Script para sincronizar perfiles de usuarios desde auth.users a public.users
 * 
 * Este script lee los usuarios existentes en auth.users y crea/actualiza
 * sus perfiles en public.users con la información correcta.
 * 
 * USO:
 * 1. Vuelve a agregar temporalmente SUPABASE_SERVICE_ROLE_KEY a .env.local
 * 2. npx tsx scripts/fix-user-profiles.ts
 * 3. Elimina SUPABASE_SERVICE_ROLE_KEY de .env.local
 */

import { config } from 'dotenv'
import { createClient } from '@supabase/supabase-js'

// Cargar variables de entorno
config({ path: '.env.local' })

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseServiceRoleKey = process.env.SUPABASE_SERVICE_ROLE_KEY

if (!supabaseUrl || !supabaseServiceRoleKey) {
    console.error('❌ Error: Variables de entorno faltantes')
    console.error('Asegúrate de que existan:')
    console.error('- NEXT_PUBLIC_SUPABASE_URL')
    console.error('- SUPABASE_SERVICE_ROLE_KEY')
    process.exit(1)
}

const supabase = createClient(supabaseUrl, supabaseServiceRoleKey, {
    auth: {
        autoRefreshToken: false,
        persistSession: false
    }
})

// Mapeo de emails a información de organización y rol
const userMapping = {
    'superadmin@simbioma.com': {
        fullName: 'Super Admin Simbioma',
        organizationId: 'a0000000-0000-0000-0000-000000000001',
        role: 'superadmin'
    },
    'admin.municipal@demo.cl': {
        fullName: 'Admin Municipal',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'admin'
    },
    'editor.municipal@demo.cl': {
        fullName: 'Funcionario Ambiente',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'editor'
    },
    'viewer.municipal@demo.cl': {
        fullName: 'Auditor Municipal',
        organizationId: 'b0000000-0000-0000-0000-000000000001',
        role: 'viewer'
    },
    'gerente@empresademo.cl': {
        fullName: 'Gerente Empresa',
        organizationId: 'c0000000-0000-0000-0000-000000000001',
        role: 'admin'
    },
    'operario@empresademo.cl': {
        fullName: 'Operario Empresa',
        organizationId: 'c0000000-0000-0000-0000-000000000001',
        role: 'member'
    },
    'admin@goredemo.cl': {
        fullName: 'Admin GORE',
        organizationId: 'd0000000-0000-0000-0000-000000000001',
        role: 'admin'
    }
}

async function main() {
    console.log('🔄 Sincronizando perfiles de usuarios...\n')

    // 1. Obtener todos los usuarios de auth.users
    const { data: authUsers, error: authError } = await supabase.auth.admin.listUsers()

    if (authError) {
        console.error('❌ Error al obtener usuarios de auth:', authError.message)
        process.exit(1)
    }

    console.log(`📋 Encontrados ${authUsers.users.length} usuarios en auth.users\n`)

    // 2. Para cada usuario demo, crear/actualizar su perfil
    let successCount = 0
    let errorCount = 0

    for (const [email, info] of Object.entries(userMapping)) {
        const authUser = authUsers.users.find(u => u.email === email)

        if (!authUser) {
            console.log(`⚠️  Usuario no encontrado en auth: ${email}`)
            continue
        }

        console.log(`📝 Procesando: ${email}`)
        console.log(`   ID: ${authUser.id}`)

        try {
            // Crear/actualizar perfil en public.users
            const { error: profileError } = await supabase
                .from('users')
                .upsert({
                    id: authUser.id,
                    email: email,
                    full_name: info.fullName,
                    organization_id: info.organizationId,
                    role: info.role
                }, {
                    onConflict: 'id'
                })

            if (profileError) {
                console.error(`   ❌ Error al crear perfil: ${profileError.message}`)
                errorCount++
            } else {
                console.log(`   ✅ Perfil creado/actualizado`)
                console.log(`   📌 Rol: ${info.role} | Org: ${info.organizationId}`)
                successCount++
            }
        } catch (error) {
            console.error(`   ❌ Error inesperado:`, error)
            errorCount++
        }

        console.log('')
    }

    console.log('━'.repeat(60))
    console.log(`✨ Proceso completado:`)
    console.log(`   ✅ Exitosos: ${successCount}`)
    console.log(`   ❌ Errores: ${errorCount}`)
    console.log('━'.repeat(60))

    if (successCount > 0) {
        console.log('\n🎉 ¡Perfiles sincronizados! Ahora puedes probar el login.')
        console.log('🌐 http://localhost:3000/login')
        console.log('📧 Email: superadmin@simbioma.com')
        console.log('🔑 Contraseña: Demo2024!\n')
    }
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error('❌ Error fatal:', error)
        process.exit(1)
    })
