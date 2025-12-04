-- Script de diagnóstico completo para usuarios demo
-- Ejecuta esto en Supabase SQL Editor

-- 1. Verificar usuarios en public.users
SELECT 
    'public.users' as tabla,
    id,
    email, 
    role, 
    full_name,
    organization_id
FROM public.users
WHERE email IN (
    'superadmin@simbioma.com',
    'admin.municipal@demo.cl',
    'editor.municipal@demo.cl',
    'viewer.municipal@demo.cl',
    'gerente@empresademo.cl',
    'operario@empresademo.cl',
    'admin@goredemo.cl'
)
ORDER BY email;

-- 2. Si la consulta anterior NO devuelve resultados, ejecuta esto para crear los perfiles manualmente:
-- NOTA: Primero necesitas los UUIDs de auth.users. Ve a Authentication > Users y copia los IDs.
-- Luego ejecuta los INSERT con los IDs correctos.

-- Ejemplo para superadmin (reemplaza 'UUID_DEL_AUTH_USER' con el ID real):
/*
INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'UUID_DEL_AUTH_USER',  -- Copia esto de Authentication > Users
    'superadmin@simbioma.com',
    'Super Admin Simbioma',
    'a0000000-0000-0000-0000-000000000001',
    'superadmin'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;
*/
