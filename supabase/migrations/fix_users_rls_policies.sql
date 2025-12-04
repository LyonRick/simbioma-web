-- ================================================================
-- FIX: Políticas RLS para tabla users
-- ================================================================
-- El login falla porque los usuarios no pueden leer sus propios perfiles
-- debido a que faltan políticas de Row Level Security (RLS)

-- 1. Verificar si RLS está habilitado en la tabla users
-- (Ejecuta esto primero para ver el estado actual)
SELECT tablename, rowsecurity 
FROM pg_tables 
WHERE schemaname = 'public' AND tablename = 'users';

-- 2. Ver políticas existentes
SELECT * FROM pg_policies WHERE tablename = 'users';

-- 3. Crear políticas necesarias para que los usuarios puedan:
--    a) Leer su propio perfil
--    b) Actualizar su propio perfil

-- Política: Los usuarios pueden leer su propio perfil
CREATE POLICY "Users can read own profile"
ON public.users
FOR SELECT
TO authenticated
USING (auth.uid() = id);

-- Política: Los usuarios pueden actualizar su propio perfil
CREATE POLICY "Users can update own profile"
ON public.users
FOR UPDATE
TO authenticated
USING (auth.uid() = id)
WITH CHECK (auth.uid() = id);

-- Política: Superadmins pueden leer todos los perfiles
CREATE POLICY "Superadmins can read all profiles"
ON public.users
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid() AND role = 'superadmin'
  )
);

-- Política: Admins pueden leer perfiles de su organización
CREATE POLICY "Admins can read org profiles"
ON public.users
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM public.users u
    WHERE u.id = auth.uid() 
    AND u.role IN ('admin', 'superadmin')
    AND u.organization_id = users.organization_id
  )
);

-- 4. Verificar que RLS esté habilitado
-- Si no está habilitado, ejecuta:
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
