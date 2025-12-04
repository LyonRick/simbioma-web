-- ===================================================
-- RLS POLICIES + ROLES - Simbioma Platform v4.0
-- Fecha: 2025-12-02  
-- Versión: Actualizada según database-schema-v4.0-OFICIAL.md
-- ===================================================

-- ===================================================
-- 1. AGREGAR CAMPO ROLE A TABLA USERS
-- ===================================================

ALTER TABLE public.users
  ADD COLUMN IF NOT EXISTS role VARCHAR(50) DEFAULT 'viewer'
    CHECK (role IN ('superadmin', 'admin', 'editor', 'viewer'));

CREATE INDEX IF NOT EXISTS idx_users_role ON public.users(role);

COMMENT ON COLUMN public.users.role IS 'Rol del usuario: superadmin | admin | editor | viewer';

-- ===================================================
-- 2. ENABLE RLS EN TABLAS PRINCIPALES
-- ===================================================

-- Tabla users
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;

-- Tabla waitlist
ALTER TABLE public.waitlist ENABLE ROW LEVEL SECURITY;

-- Tablas de datos
-- NOTA: Según schema v4.0, las siguientes tablas deben existir o se deben crear
-- Si alguna tabla no existe aún en Supabase, comentar su línea hasta que se cree

ALTER TABLE public.indicator_records ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.metas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.strategic_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.reports ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.waste_declarations ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.establishments ENABLE ROW LEVEL SECURITY;

-- ===================================================
-- 3. POLICIES PARA TABLA USERS
-- ===================================================

-- Policy: Los usuarios pueden ver su propio perfil
CREATE POLICY "Users can view own profile"
ON public.users
FOR SELECT
USING (auth.uid() = id);

-- Policy: Los usuarios pueden actualizar su propio perfil
CREATE POLICY "Users can update own profile"
ON public.users
FOR UPDATE
USING (auth.uid() = id);

-- Policy: Superadmins pueden ver todos los perfiles
CREATE POLICY "Superadmins can view all profiles"
ON public.users
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

-- ===================================================
-- 4. POLICIES PARA WAITLIST (Solo Admin + Insert Público)
-- ===================================================

-- Policy: Solo superadmin puede ver y gestionar waitlist
CREATE POLICY "Only superadmin can manage waitlist"
ON public.waitlist
FOR ALL
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

-- Policy: Permitir INSERT público (para el formulario de homepage)
CREATE POLICY "Public can insert to waitlist"
ON public.waitlist
FOR INSERT
WITH CHECK (true);

-- ===================================================
-- 5. POLICIES PARA DATOS - AISLAMIENTO ORGANIZACIONAL
-- ===================================================

-- ========== INDICATOR RECORDS (Time-Series) ==========
-- v4.0: Cambiado de indicator_values a indicator_records

CREATE POLICY "Users can view own organization indicator records"
ON public.indicator_records
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  -- Superadmins pueden ver todo
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert indicator records"
ON public.indicator_records
FOR INSERT
WITH CHECK (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

CREATE POLICY "Editors and admins can update own indicator records"
ON public.indicator_records
FOR UPDATE
USING (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== PROJECTS ==========

CREATE POLICY "Users can view own organization projects"
ON public.projects
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert projects"
ON public.projects
FOR INSERT
WITH CHECK (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

CREATE POLICY "Editors and admins can update own projects"
ON public.projects
FOR UPDATE
USING (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== METAS ==========

CREATE POLICY "Users can view own organization metas"
ON public.metas
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Admins can manage metas"
ON public.metas
FOR ALL
USING (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'admin'
  )
);

-- ========== STRATEGIC DOCUMENTS ==========

CREATE POLICY "Users can view own organization documents"
ON public.strategic_documents
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert documents"
ON public.strategic_documents
FOR INSERT
WITH CHECK (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== REPORTS ==========

CREATE POLICY "Users can view own organization reports"
ON public.reports
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert reports"
ON public.reports
FOR INSERT
WITH CHECK (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== WASTE DECLARATIONS (SINADER) ==========

CREATE POLICY "Users can view own organization waste declarations"
ON public.waste_declarations
FOR SELECT
USING (
  establishment_id IN (
    SELECT e.id 
    FROM public.establishments e
    INNER JOIN public.users u ON u.organization_id = e.organization_id
    WHERE u.id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert waste declarations"
ON public.waste_declarations
FOR INSERT
WITH CHECK (
  establishment_id IN (
    SELECT e.id 
    FROM public.establishments e
    INNER JOIN public.users u ON u.organization_id = e.organization_id
    WHERE u.id = auth.uid() 
    AND u.role IN ('admin', 'editor')
  )
);

CREATE POLICY "Editors and admins can update own waste declarations"
ON public.waste_declarations
FOR UPDATE
USING (
  establishment_id IN (
    SELECT e.id 
    FROM public.establishments e
    INNER JOIN public.users u ON u.organization_id = e.organization_id
    WHERE u.id = auth.uid() 
    AND u.role IN ('admin', 'editor')
  )
);

-- ========== ESTABLISHMENTS ==========

CREATE POLICY "Users can view own organization establishments"
ON public.establishments
FOR SELECT
USING (
  organization_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Admins can manage establishments"
ON public.establishments
FOR ALL
USING (
  organization_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'admin'
  )
);

-- ===================================================
-- 6. COMENTARIOS DE DOCUMENTACIÓN
-- ===================================================

COMMENT ON POLICY "Users can view own profile" ON public.users IS 
  'Permite a los usuarios ver solo su propio perfil';

COMMENT ON POLICY "Users can update own profile" ON public.users IS 
  'Permite a los usuarios actualizar solo su propio perfil';

COMMENT ON POLICY "Superadmins can view all profiles" ON public.users IS 
  'Superadmins pueden ver todos los perfiles de usuario';

COMMENT ON POLICY "Only superadmin can manage waitlist" ON public.waitlist IS 
  'Solo superadmins pueden gestionar la lista de espera';

COMMENT ON POLICY "Public can insert to waitlist" ON public.waitlist IS 
  'El formulario público de homepage puede insertar leads en waitlist';

COMMENT ON POLICY "Users can view own organization indicator records" ON public.indicator_records IS 
  'Los usuarios solo pueden ver los indicator_records de su organización';

COMMENT ON POLICY "Users can view own organization projects" ON public.projects IS 
  'Los usuarios solo pueden ver los proyectos de su organización';

-- ===================================================
-- 7. VERIFICACIÓN (Queries de testing)
-- ===================================================

-- Verificar que RLS está habilitado
SELECT 
  tablename,
  rowsecurity
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN ('users', 'waitlist', 'indicator_records', 'projects', 'metas', 'establishments', 'waste_declarations');

-- Listar todas las policies creadas
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- ===================================================
-- NOTAS IMPORTANTES
-- ===================================================
/*
CAMBIOS vs SCHEMA ANTERIOR:
1. ✅ gobierno_local + actors → Eliminados (no existen en schema actual)
2. ✅ indicator_values → indicator_records (nuevo modelo time-series)
3. ✅ owner_id → organization_id (referencia directa a organizations vía tabla users)
4. ✅ Agregadas policies para establishments y waste_declarations (SINADER)

TABLAS QUE REQUIEREN EXISTIR EN SUPABASE:
- users (con campos: id, organization_id, role)
- waitlist (completa)
- indicator_records (reemplaza indicator_values)
- projects (con campo organization_id)
- metas (con campo organization_id)
- strategic_documents (con campo organization_id)
- reports (con campo organization_id)
- waste_declarations (con campo establishment_id)
- establishments (con campos: id, organization_id)

Si alguna tabla no existe aún, comentar las líneas correspondientes
hasta que se migre/cree la tabla.
*/


-- Tabla waitlist
ALTER TABLE public.waitlist ENABLE ROW LEVEL SECURITY;

-- Tablas de datos (ejemplos, agregar más según necesidad)
ALTER TABLE public.indicator_values ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.metas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.strategic_documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.reports ENABLE ROW LEVEL SECURITY;

-- ===================================================
-- 3. POLICIES PARA TABLA USERS
-- ===================================================

-- Policy: Los usuarios pueden ver su propio perfil
CREATE POLICY "Users can view own profile"
ON public.users
FOR SELECT
USING (auth.uid() = id);

-- Policy: Los usuarios pueden actualizar su propio perfil
CREATE POLICY "Users can update own profile"
ON public.users
FOR UPDATE
USING (auth.uid() = id);

-- Policy: Superadmins pueden ver todos los perfiles
CREATE POLICY "Superadmins can view all profiles"
ON public.users
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

-- ===================================================
-- 4. POLICIES PARA ORGANIZACIONES
-- ===================================================

-- Policy: Users can view their own government organization
CREATE POLICY "Users can view own government organization"
ON public.gobierno_local
FOR SELECT
USING (
  id IN (
    SELECT organization_id 
    FROM public.users 
    WHERE id = auth.uid() 
    AND organization_type = 'gobierno_local'
  )
);

-- Policy: Users can view their own private organization (actors)
CREATE POLICY "Users can view own private organization"
ON public.actors
FOR SELECT
USING (
  id IN (
    SELECT organization_id 
    FROM public.users 
    WHERE id = auth.uid() 
    AND organization_type = 'actor'
  )
);

-- Policy: Superadmins can view all organizations
CREATE POLICY "Superadmins can view all government organizations"
ON public.gobierno_local
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Superadmins can view all private organizations"
ON public.actors
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

-- ===================================================
-- 5. POLICIES PARA WAITLIST (Solo Admin)
-- ===================================================

-- Policy: Solo superadmin puede ver y gestionar waitlist
CREATE POLICY "Only superadmin can manage waitlist"
ON public.waitlist
FOR ALL
USING (
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

-- Policy: Permitir INSERT público (para el formulario de homepage)
CREATE POLICY "Public can insert to waitlist"
ON public.waitlist
FOR INSERT
WITH CHECK (true);

-- ===================================================
-- 6. POLICIES PARA DATOS - AISLAMIENTO ORGANIZACIONAL
-- ===================================================

-- ========== INDICATOR VALUES ==========
CREATE POLICY "Users can view own organization indicator values"
ON public.indicator_values
FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  -- Superadmins pueden ver todo
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert indicator values"
ON public.indicator_values
FOR INSERT
WITH CHECK (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

CREATE POLICY "Editors and admins can update own indicator values"
ON public.indicator_values
FOR UPDATE
USING (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== PROJECTS ==========
CREATE POLICY "Users can view own organization projects"
ON public.projects
FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert projects"
ON public.projects
FOR INSERT
WITH CHECK (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

CREATE POLICY "Editors and admins can update own projects"
ON public.projects
FOR UPDATE
USING (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== METAS ==========
CREATE POLICY "Users can view own organization metas"
ON public.metas
FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Admins can manage metas"
ON public.metas
FOR ALL
USING (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'admin'
  )
);

-- ========== STRATEGIC DOCUMENTS ==========
CREATE POLICY "Users can view own organization documents"
ON public.strategic_documents
FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert documents"
ON public.strategic_documents
FOR INSERT
WITH CHECK (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ========== REPORTS ==========
CREATE POLICY "Users can view own organization reports"
ON public.reports
FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM public.users WHERE id = auth.uid()
  )
  OR
  EXISTS (
    SELECT 1 FROM public.users 
    WHERE id = auth.uid() 
    AND role = 'superadmin'
  )
);

CREATE POLICY "Editors and admins can insert reports"
ON public.reports
FOR INSERT
WITH CHECK (
  owner_id IN (
    SELECT organization_id FROM public.users 
    WHERE id = auth.uid() 
    AND role IN ('admin', 'editor')
  )
);

-- ===================================================
-- 7. COMENTARIOS DE DOCUMENTACIÓN
-- ===================================================

COMMENT ON POLICY "Users can view own profile" ON public.users IS 
  'Permite a los usuarios ver solo su propio perfil';

COMMENT ON POLICY "Users can update own profile" ON public.users IS 
  'Permite a los usuarios actualizar solo su propio perfil';

COMMENT ON POLICY "Superadmins can view all profiles" ON public.users IS 
  'Superadmins pueden ver todos los perfiles de usuario';

COMMENT ON POLICY "Users can view own government organization" ON public.gobierno_local IS 
  'Los usuarios solo pueden ver la organización gubernamental a la que pertenecen';

COMMENT ON POLICY "Users can view own private organization" ON public.actors IS 
  'Los usuarios solo pueden ver la organización privada (empresa) a la que pertenecen';

COMMENT ON POLICY "Only superadmin can manage waitlist" ON public.waitlist IS 
  'Solo superadmins pueden gestionar la lista de espera';

COMMENT ON POLICY "Public can insert to waitlist" ON public.waitlist IS 
  'El formulario público de homepage puede insertar leads en waitlist';

-- ===================================================
-- 8. VERIFICACIÓN (Queries de testing)
-- ===================================================

-- Verificar que RLS está habilitado
SELECT 
  tablename,
  rowsecurity
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename IN ('users', 'gobierno_local', 'actors', 'waitlist', 'indicator_values', 'projects');

-- Listar todas las policies creadas
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd
FROM pg_policies
WHERE schemaname = 'public'
ORDER BY tablename, policyname;

-- Testing básico de policies (ejecutar como usuario autenticado)
-- SELECT * FROM users; -- Solo debería ver su propio perfil
-- SELECT * FROM waitlist; -- Solo si eres superadmin
-- SELECT * FROM indicator_values; -- Solo de tu organización
