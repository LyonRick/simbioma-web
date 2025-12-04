-- =================================================================
-- SCRIPT MAESTRO DE SEEDING: ECOSISTEMA COMPLETO (v2.0)
-- =================================================================
-- Este script prepara la base de datos con organizaciones de prueba
-- y plantillas para vincular usuarios reales de Supabase Auth.
--
-- INSTRUCCIONES:
-- 1. Ejecuta la SECCIÓN 1 (Creación de Organizaciones) tal cual.
-- 2. Crea los usuarios en Supabase Auth (Authentication -> Add User).
-- 3. Copia sus UUIDs y pégalos en la SECCIÓN 2 donde se indica.
-- 4. Ejecuta la SECCIÓN 2.
-- =================================================================

-- =================================================================
-- SECCIÓN 1: CREACIÓN DE ORGANIZACIONES
-- =================================================================

-- 1.1. SIMBIOMA (Plataforma / Superadmin)
INSERT INTO public.organizations (id, name, tax_id, type, is_active)
VALUES (
    'a0000000-0000-0000-0000-000000000001', 
    'Simbioma Platform',
    '00.000.000-1',
    'company', -- Actúa como la entidad administradora
    true
) ON CONFLICT (tax_id) DO NOTHING;

-- 1.2. MUNICIPIO DEMO (Cliente Principal)
INSERT INTO public.organizations (id, name, tax_id, type, is_active)
VALUES (
    'b0000000-0000-0000-0000-000000000001', 
    'I. Municipalidad de Demo',
    '69.000.000-1',
    'municipality',
    true
) ON CONFLICT (tax_id) DO NOTHING;

-- 1.3. EMPRESA DEMO (Generador de Residuos / Privado)
INSERT INTO public.organizations (id, name, tax_id, type, is_active)
VALUES (
    'c0000000-0000-0000-0000-000000000001', 
    'Industrias Demo S.A.',
    '76.000.000-1',
    'company',
    true
) ON CONFLICT (tax_id) DO NOTHING;

-- 1.4. GORE DEMO (Gobierno Regional / Supervisor)
INSERT INTO public.organizations (id, name, tax_id, type, is_active)
VALUES (
    'd0000000-0000-0000-0000-000000000001', 
    'Gobierno Regional Demo',
    '60.000.000-1',
    'gore',
    true
) ON CONFLICT (tax_id) DO NOTHING;


-- =================================================================
-- SECCIÓN 2: CREACIÓN DE USUARIOS DE DEMOSTRACIÓN
-- =================================================================
-- Este script crea usuarios completos en auth.users y public.users
-- con contraseñas de prueba. CAMBIAR EN PRODUCCIÓN.
-- 
-- Contraseña por defecto para TODOS: Demo2024!
-- =================================================================

-- -----------------------------------------------------------------
-- 2.1. USUARIO SUPERADMIN SIMBIOMA
-- -----------------------------------------------------------------
-- Crear en auth.users (tabla de autenticación)
INSERT INTO auth.users (
    id,
    instance_id,
    email,
    encrypted_password,
    email_confirmed_at,
    raw_app_meta_data,
    raw_user_meta_data,
    created_at,
    updated_at,
    confirmation_token,
    recovery_token,
    email_change_token_new,
    email_change
) VALUES (
    'a1111111-1111-1111-1111-111111111111',
    '00000000-0000-0000-0000-000000000000',
    'superadmin@simbioma.com',
    crypt('Demo2024!', gen_salt('bf')), -- Encriptación bcrypt
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Super Admin Simbioma"}',
    now(),
    now(),
    '',
    '',
    '',
    ''
) ON CONFLICT (id) DO NOTHING;

-- Crear/actualizar en public.users (tabla de perfil)
INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'a1111111-1111-1111-1111-111111111111',
    'superadmin@simbioma.com',
    'Super Admin Simbioma',
    'a0000000-0000-0000-0000-000000000001',
    'superadmin'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- -----------------------------------------------------------------
-- 2.2. USUARIOS MUNICIPIO
-- -----------------------------------------------------------------

-- 2.2.1. Admin Municipal (Alcalde)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'b1111111-1111-1111-1111-111111111111',
    '00000000-0000-0000-0000-000000000000',
    'admin.municipal@demo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Admin Municipal"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'b1111111-1111-1111-1111-111111111111',
    'admin.municipal@demo.cl',
    'Admin Municipal',
    'b0000000-0000-0000-0000-000000000001',
    'admin'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- 2.2.2. Editor Municipal (Funcionario Medio Ambiente)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'b2222222-2222-2222-2222-222222222222',
    '00000000-0000-0000-0000-000000000000',
    'editor.municipal@demo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Funcionario Ambiente"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'b2222222-2222-2222-2222-222222222222',
    'editor.municipal@demo.cl',
    'Funcionario Ambiente',
    'b0000000-0000-0000-0000-000000000001',
    'editor'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- 2.2.3. Viewer Municipal (Auditor)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'b3333333-3333-3333-3333-333333333333',
    '00000000-0000-0000-0000-000000000000',
    'viewer.municipal@demo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Auditor Municipal"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'b3333333-3333-3333-3333-333333333333',
    'viewer.municipal@demo.cl',
    'Auditor Municipal',
    'b0000000-0000-0000-0000-000000000001',
    'viewer'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- -----------------------------------------------------------------
-- 2.3. USUARIOS EMPRESA
-- -----------------------------------------------------------------

-- 2.3.1. Admin Empresa (Gerente)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'c1111111-1111-1111-1111-111111111111',
    '00000000-0000-0000-0000-000000000000',
    'gerente@empresademo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Gerente Empresa"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'c1111111-1111-1111-1111-111111111111',
    'gerente@empresademo.cl',
    'Gerente Empresa',
    'c0000000-0000-0000-0000-000000000001',
    'admin'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- 2.3.2. Member Empresa (Operario)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'c2222222-2222-2222-2222-222222222222',
    '00000000-0000-0000-0000-000000000000',
    'operario@empresademo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Operario Empresa"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'c2222222-2222-2222-2222-222222222222',
    'operario@empresademo.cl',
    'Operario Empresa',
    'c0000000-0000-0000-0000-000000000001',
    'member'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- -----------------------------------------------------------------
-- 2.4. USUARIOS GORE
-- -----------------------------------------------------------------

-- 2.4.1. Admin GORE (Intendente)
INSERT INTO auth.users (
    id, instance_id, email, encrypted_password, email_confirmed_at,
    raw_app_meta_data, raw_user_meta_data, created_at, updated_at,
    confirmation_token, recovery_token, email_change_token_new, email_change
) VALUES (
    'd1111111-1111-1111-1111-111111111111',
    '00000000-0000-0000-0000-000000000000',
    'admin@goredemo.cl',
    crypt('Demo2024!', gen_salt('bf')),
    now(),
    '{"provider":"email","providers":["email"],"role":"authenticated"}',
    '{"full_name":"Admin GORE"}',
    now(), now(), '', '', '', ''
) ON CONFLICT (id) DO NOTHING;

INSERT INTO public.users (id, email, full_name, organization_id, role)
VALUES (
    'd1111111-1111-1111-1111-111111111111',
    'admin@goredemo.cl',
    'Admin GORE',
    'd0000000-0000-0000-0000-000000000001',
    'admin'
) ON CONFLICT (id) DO UPDATE SET
    email = EXCLUDED.email,
    full_name = EXCLUDED.full_name,
    organization_id = EXCLUDED.organization_id,
    role = EXCLUDED.role;

-- -----------------------------------------------------------------
-- VERIFICACIÓN FINAL
-- -----------------------------------------------------------------
SELECT 
    u.email, 
    u.role, 
    o.name as organization, 
    o.type as org_type
FROM public.users u
LEFT JOIN public.organizations o ON u.organization_id = o.id
WHERE u.organization_id IS NOT NULL;
