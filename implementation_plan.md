# Plan de Implementación: Autenticación Supabase y Dashboard

## 1. Dependencias y Configuración
- [ ] Instalar dependencias: `npm install @supabase/ssr @supabase/supabase-js`
- [ ] Configurar variables de entorno en `.env.local`:
  - `NEXT_PUBLIC_SUPABASE_URL`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## 2. Cliente Supabase (Lib)
- [ ] Crear `lib/supabase/client.ts`: Cliente para componentes cliente (Browser).
- [ ] Crear `lib/supabase/server.ts`: Cliente para componentes servidor y Server Actions.
- [ ] Crear `lib/supabase/middleware.ts`: Cliente para Middleware (gestión de sesiones).

## 3. Middleware y Protección de Rutas
- [ ] Crear `middleware.ts`:
  - Actualizar sesión de Supabase.
  - Proteger ruta `/dashboard`.
  - Redirigir usuarios no autenticados a `/login`.
  - Redirigir usuarios autenticados de `/login` a `/dashboard`.

## 4. Autenticación (Login)
- [ ] Crear Server Actions en `app/login/actions.ts`:
  - `login(formData: FormData)`: Autenticación con email/password.
  - `signup(formData: FormData)`: Registro (opcional por ahora, pero preparado).
- [ ] Crear página de Login en `app/login/page.tsx`:
  - Diseño alineado con Shadcn UI y filosofía "Simbioma".
  - Formulario con validación (client-side y server-side).
  - Feedback visual (errores, carga).
  - Referencia visual: Minimalista, profesional, uso de colores corporativos (Verde Bosque, Azul Océano).

## 5. Dashboard Inicial (Design System v2.0)
- [ ] Crear `app/dashboard/page.tsx`:
  - **Layout "PowerPoint-Ready"**:
    - Implementar Bento Grid para jerarquía visual (Alerta SINADER vs KPIs).
    - Asegurar que la información crítica sea visible sin scroll en pantallas 1080p.
  - **Estética "Eco-Modernism"**:
    - Backgrounds: `Warm Stone` (#FAFAF9) para Light Mode, `Forest Night` (#0A1612) para Dark Mode.
    - Tipografía: Inter Tight para títulos, Inter para cuerpo.
# Plan de Implementación: Autenticación Supabase y Dashboard

## 1. Dependencias y Configuración
- [ ] Instalar dependencias: `npm install @supabase/ssr @supabase/supabase-js`
- [ ] Configurar variables de entorno en `.env.local`:
  - `NEXT_PUBLIC_SUPABASE_URL`
  - `NEXT_PUBLIC_SUPABASE_ANON_KEY`

## 2. Cliente Supabase (Lib)
- [ ] Crear `lib/supabase/client.ts`: Cliente para componentes cliente (Browser).
- [ ] Crear `lib/supabase/server.ts`: Cliente para componentes servidor y Server Actions.
- [ ] Crear `lib/supabase/middleware.ts`: Cliente para Middleware (gestión de sesiones).

## 3. Middleware y Protección de Rutas
- [ ] Crear `middleware.ts`:
  - Actualizar sesión de Supabase.
  - Proteger ruta `/dashboard`.
  - Redirigir usuarios no autenticados a `/login`.
  - Redirigir usuarios autenticados de `/login` a `/dashboard`.

## 4. Autenticación (Login)
- [ ] Crear Server Actions en `app/login/actions.ts`:
  - `login(formData: FormData)`: Autenticación con email/password.
  - `signup(formData: FormData)`: Registro (opcional por ahora, pero preparado).
- [ ] Crear página de Login en `app/login/page.tsx`:
  - Diseño alineado con Shadcn UI y filosofía "Simbioma".
  - Formulario con validación (client-side y server-side).
  - Feedback visual (errores, carga).
  - Referencia visual: Minimalista, profesional, uso de colores corporativos (Verde Bosque, Azul Océano).

## 5. Dashboard Inicial (Design System v2.0)
- [ ] Crear `app/dashboard/page.tsx`:
  - **Layout "PowerPoint-Ready"**:
    - Implementar Bento Grid para jerarquía visual (Alerta SINADER vs KPIs).
    - Asegurar que la información crítica sea visible sin scroll en pantallas 1080p.
  - **Estética "Eco-Modernism"**:
    - Backgrounds: `Warm Stone` (#FAFAF9) para Light Mode, `Forest Night` (#0A1612) para Dark Mode.
    - Tipografía: Inter Tight para títulos, Inter para cuerpo.
    - Sombras suaves en lugar de bordes duros.
  - **Componentes Clave**:
    - Sidebar "Breathing" (flotante, con espacio).
    - Tarjetas de KPI con sparklines y números grandes.
    - Gráficos minimalistas (sin grid lines pesadas).

## 6. Design Adoption (Figma Code v1)
- [ ] **Dependencies**:
  - [ ] Install missing dependencies: `npm install @radix-ui/react-* lucide-react recharts embla-carousel-react vaul sonner clsx tailwind-merge`
- [ ] **Styles Configuration**:
  - [ ] Update `tailwind.config.ts` with colors and tokens from `index.css` (Eco-Modernism palette).
  - [ ] Update `app/globals.css` to match base styles (fonts, root variables).
- [ ] **Component Migration**:
  - [ ] Create `components/ui` for Shadcn/Radix primitives.
  - [ ] Migrate `LoginPage` to `app/login/page.tsx`.
  - [ ] Migrate `DashboardLayout` to `app/dashboard/layout.tsx`.
  - [ ] Migrate `DashboardHome` to `app/dashboard/page.tsx`.
  - [ ] Create placeholder pages for other routes (`/dashboard/indicadores`, etc.).
- [ ] **Verification**:
  - [ ] Verify Login screen appearance and functionality.
  - [ ] Verify Dashboard layout and responsiveness.
  - [ ] Check for accessibility issues (contrast, focus states).

## 7. Verificación Final
- [ ] **Automated Tests**:
  - [ ] Verificar que las dependencias se instalen correctamente.
- [ ] **Manual Verification**:
  - [ ] Navegar a `/dashboard` sin sesión -> Redirección a `/login`.
  - [ ] Ingresar credenciales inválidas -> Mensaje de error.
  - [ ] Ingresar credenciales válidas -> Redirección a `/dashboard`.
  - [ ] Recargar página en `/dashboard` -> Sesión persiste.
  - [ ] Logout -> Redirección a `/login`.
