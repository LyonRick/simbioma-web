-- =================================================================
-- LIMPIEZA: Eliminar usuarios creados incorrectamente
-- =================================================================
-- Ejecuta este script ANTES de correr create-demo-users.ts
-- para limpiar los usuarios que fueron creados con SQL directo.

-- 1. Eliminar usuarios de public.users
DELETE FROM public.users WHERE id IN (
    'a1111111-1111-1111-1111-111111111111',
    'b1111111-1111-1111-1111-111111111111',
    'b2222222-2222-2222-2222-222222222222',
    'b3333333-3333-3333-3333-333333333333',
    'c1111111-1111-1111-1111-111111111111',
    'c2222222-2222-2222-2222-222222222222',
    'd1111111-1111-1111-1111-111111111111'
);

-- 2. Eliminar usuarios de auth.users
-- NOTA: Esto solo se puede hacer desde el dashboard de Supabase
-- o usando la Admin API. El SQL directo en auth.users no funciona bien.
-- 
-- Ve a: Authentication > Users en tu dashboard de Supabase
-- y elimina manualmente los usuarios con estos emails:
--
-- - superadmin@simbioma.com
-- - admin.municipal@demo.cl
-- - editor.municipal@demo.cl
-- - viewer.municipal@demo.cl  
-- - gerente@empresademo.cl
-- - operario@empresademo.cl
-- - admin@goredemo.cl

-- Verificar que están eliminados
SELECT id, email, full_name, role 
FROM public.users 
WHERE email LIKE '%simbioma.com' 
   OR email LIKE '%demo.cl';
