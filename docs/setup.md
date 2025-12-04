# Guía de Configuración de Supabase - Simbioma

Esta guía te ayudará a configurar Supabase para el proyecto Simbioma, tanto para desarrollo local como para producción.

## 📋 Tabla de Contenidos

- [Opción 1: Supabase Cloud (Recomendado para Empezar)](#opción-1-supabase-cloud)
- [Opción 2: Supabase Local (Desarrollo Avanzado)](#opción-2-supabase-local)
- [Configurar Variables de Entorno](#configurar-variables-de-entorno)
- [Ejecutar Migraciones](#ejecutar-migraciones)
- [Configurar Autenticación](#configurar-autenticación)
- [Row Level Security (RLS)](#row-level-security-rls)
- [Verificar Instalación](#verificar-instalación)

---

## 🌐 Opción 1: Supabase Cloud

### 1. Crear Cuenta y Proyecto

1. Ve a [supabase.com](https://supabase.com)
2. Haz clic en "Start your project"
3. Crea una cuenta (gratis para empezar)
4. Crea un nuevo proyecto:
   - **Name**: `simbioma-dev` (o el nombre que prefieras)
   - **Database Password**: Genera una contraseña segura y guárdala
   - **Region**: Selecciona la más cercana (ej: South America - Sao Paulo)

⏱️ La creación del proyecto toma ~2 minutos.

### 2. Obtener Credenciales

Una vez creado el proyecto:

1. Ve a **Settings** > **API**
2. Copia los siguientes valores:

```
Project URL: https://xxxxx.supabase.co
anon/public key: eyJhbGc...
```

### 3. Configurar en Simbioma

Crea o edita `.env.local` en la raíz del proyecto:

```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=eyJhbGc...
```

---

## 💻 Opción 2: Supabase Local

Para desarrollo avanzado o trabajo offline.

### 1. Instalar Supabase CLI

**macOS/Linux**:
```bash
brew install supabase/tap/supabase
```

**Windows**:
```bash
scoop install supabase
```

**Verificar instalación**:
```bash
supabase --version
```

### 2. Iniciar Supabase Local

```bash
# En la raíz del proyecto
supabase init

# Iniciar todos los servicios (Docker debe estar corriendo)
supabase start
```

Esto iniciará:
- PostgreSQL
- PostgREST API
- Supabase Studio (UI)
- Auth server
- Storage server

### 3. Obtener Credenciales Locales

Después de `supabase start`, verás:

```
API URL: http://localhost:54321
DB URL: postgresql://postgres:postgres@localhost:54322/postgres
Studio URL: http://localhost:54323
anon key: eyJhbGc...
```

### 4. Configurar Variables de Entorno

```env
# .env.local
NEXT_PUBLIC_SUPABASE_URL=http://localhost:54321
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=eyJhbGc...
```

---

## 🔧 Configurar Variables de Entorno

### Desarrollo Local

1. **Copiar template**:
```bash
cp .env.example .env.local
```

2. **Editar `.env.local`** con tus valores:
```env
NEXT_PUBLIC_SUPABASE_URL=https://xxxxx.supabase.co
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=eyJhbGc...
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

3. **Reiniciar servidor**:
```bash
npm run dev
```

### Producción (Vercel)

1. Ve a tu proyecto en Vercel
2. Settings > Environment Variables
3. Agrega:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY`
   - `NEXT_PUBLIC_APP_URL` (ej: https://simbioma.com)

---

## 📊 Ejecutar Migraciones

### Desde Supabase Cloud

1. Ve a **SQL Editor** en Supabase Dashboard
2. Copia y pega el contenido de `supabase/migrations/*.sql`
3. Ejecuta cada archivo en orden

### Desde CLI (Local)

```bash
# Aplicar todas las migraciones
supabase db push

# Ver estado
supabase db status

# Crear nueva migración
supabase migration new nombre_migracion
```

### Migración Inicial (Ejemplo)

> **Nota**: Estas son las tablas básicas. El proyecto puede requerir migraciones adicionales.

```sql
-- supabase/migrations/001_initial_schema.sql

-- Tabla de perfiles de usuario
CREATE TABLE public.profiles (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email TEXT NOT NULL,
    full_name TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Tabla de organizaciones (municipalidades)
CREATE TABLE public.organizations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    type TEXT CHECK (type IN ('municipalidad', 'empresa', 'gobierno')),
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Relación usuarios-organizaciones
CREATE TABLE public.user_organizations (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
    role TEXT CHECK (role IN ('admin', 'member', 'viewer')),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(user_id, organization_id)
);

-- Habilitar Row Level Security
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE organizations ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_organizations ENABLE ROW LEVEL SECURITY;
```

---

## 🔐 Configurar Autenticación

### 1. Habilitar Proveedores de Auth

En Supabase Dashboard:

1. **Authentication** > **Providers**
2. Habilita:
   - ✅ **Email** (para login con email/password)
   - Opcional: Google, GitHub, etc.

### 2. Configurar Email Templates (Opcional)

1. **Authentication** > **Email Templates**
2. Personaliza:
   - Confirm signup
   - Reset password
   - Change email

### 3. Configurar Redirect URLs

En **Authentication** > **URL Configuration**:

```
Site URL: http://localhost:3000 (desarrollo)
Site URL: https://simbioma.com (producción)

Redirect URLs:
- http://localhost:3000/**
- https://simbioma.com/**
```

---

## 🔒 Row Level Security (RLS)

### ¿Qué es RLS?

Row Level Security permite controlar qué usuarios pueden acceder a qué filas de datos. Es **crítico** para la seguridad multi-tenant.

### Políticas Básicas

#### Profiles

```sql
-- Ver solo su propio perfil
CREATE POLICY "Users can view own profile"
ON profiles FOR SELECT
USING (auth.uid() = id);

-- Actualizar solo su propio perfil
CREATE POLICY "Users can update own profile"
ON profiles FOR UPDATE
USING (auth.uid() = id);
```

#### Organizations

```sql
-- Ver solo organizaciones a las que pertenecen
CREATE POLICY "Users can view their organizations"
ON organizations FOR SELECT
USING (
    EXISTS (
        SELECT 1 FROM user_organizations
        WHERE user_organizations.organization_id = organizations.id
        AND user_organizations.user_id = auth.uid()
    )
);
```

### Verificar RLS

En SQL Editor:

```sql
-- Ver todas las políticas
SELECT schemaname, tablename, policyname, permissive, roles, cmd
FROM pg_policies
WHERE schemaname = 'public';

-- Verificar que RLS está habilitado
SELECT tablename, rowsecurity
FROM pg_tables
WHERE schemaname = 'public';
```

---

## ✅ Verificar Instalación

### Checklist de Verificación

```bash
# 1. Variables de entorno configuradas
cat .env.local

# 2. Servidor de desarrollo corriendo
npm run dev

# 3. Conexión a Supabase
# Abre http://localhost:3000 y verifica que no hay errores en consola
```

### Test Manual

1. **Ir a `/login`**
2. **Intentar crear cuenta** (si auth está configurado)
3. **Verificar en Supabase Dashboard** > **Authentication** > **Users**

### Test Programático

```typescript
// scripts/test-supabase.ts
import { createClient } from '@supabase/supabase-js';

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY!;

const supabase = createClient(supabaseUrl, supabaseKey);

async function testConnection() {
    const { data, error } = await supabase.from('profiles').select('count');
    
    if (error) {
        console.error('❌ Error conectando a Supabase:', error);
    } else {
        console.log('✅ Conexión exitosa a Supabase');
    }
}

testConnection();
```

Ejecutar:
```bash
npx tsx scripts/test-supabase.ts
```

---

## 🚨 Troubleshooting

### Error: "Invalid API key"

- Verifica que copiaste la **anon key**, no la service_role key
- Reinicia el servidor después de cambiar `.env.local`

### Error: "Failed to fetch"

- Verifica que la URL no tenga espacios o caracteres extra
- Verifica que Supabase esté corriendo (si usas local)

### Error: "Row Level Security"

- Asegúrate de haber ejecutado las migraciones con políticas RLS
- Verifica que `auth.uid()` no sea null (usuario debe estar autenticado)

### Docker no inicia (Supabase Local)

```bash
# Verificar si Docker está corriendo
docker ps

# Reiniciar Docker Desktop
# Intentar de nuevo
supabase stop
supabase start
```

---

## 📚 Recursos

- [Supabase Docs](https://supabase.com/docs)
- [Next.js + Supabase Guide](https://supabase.com/docs/guides/getting-started/quickstarts/nextjs)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)
- [Supabase CLI Reference](https://supabase.com/docs/reference/cli)

---

## 🆘 Soporte

Si tienes problemas:

1. Revisa los logs del servidor Next.js
2. Revisa la consola del navegador
3. Verifica Supabase Dashboard > Logs
4. Abre un issue en GitHub
5. Contacta: `dev@simbioma.com`

---

**Última actualización**: 2025-11-29
