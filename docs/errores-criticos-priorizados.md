# Errores Críticos Priorizados - Simbioma v1.0
**Fecha:** 2025-11-26
**Estado del Proyecto:** Fase 1 (Homepage + Blog) - Pre-producción
**Contexto:** Sin backend, sin Supabase, sin correos configurados

---

## ✅ RESOLVER AHORA (No dependen de infraestructura)

### 1. 🔴 ESLint Errors: Comillas sin escapar (26 errores)
**Severidad:** Alta
**Tiempo estimado:** 30-45 minutos
**Esfuerzo:** Bajo (buscar y reemplazar)

**Archivos afectados:**
- `app/blog/simbioma-beneficios-gestion-ambiental/page.tsx` (10 errores)
- `app/privacidad/page.tsx` (8 errores)
- `app/terminos/page.tsx` (22 errores)

**Problema:**
```tsx
// ❌ Incorrecto
<p>Simbioma SpA (en adelante "Simbioma", "nosotros")</p>

// ✅ Correcto
<p>Simbioma SpA (en adelante &quot;Simbioma&quot;, &quot;nosotros&quot;)</p>
```

**Acción:**
- Buscar todas las comillas `"` dentro de JSX
- Reemplazar por `&quot;` o usar comillas tipográficas `""`

---

### 2. 🔴 Alt text genérico en imágenes
**Severidad:** Alta (Accesibilidad crítica)
**Tiempo estimado:** 20 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/sections/Solucion.tsx` (3 imágenes)
- `app/blog/page.tsx` (1 imagen)

**Problema:**
```tsx
// ❌ Alt text genérico
<Image alt={step.title} />  // "Elige la fuente de datos"

// ✅ Alt text descriptivo
<Image alt="Dashboard mostrando integración de múltiples fuentes de datos ambientales en tiempo real" />
```

**Acción:**
- Reemplazar todos los alt texts genéricos por descripciones específicas del contenido visual

---

### 3. 🟠 Labels faltantes en formularios
**Severidad:** Alta (Accesibilidad crítica)
**Tiempo estimado:** 15 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/sections/CTAFinal.tsx` (4 inputs)

**Problema:**
```tsx
// ❌ Sin label
<input placeholder="Nombre completo" />

// ✅ Con label (sr-only para mantener diseño visual)
<label htmlFor="name" className="sr-only">Nombre completo</label>
<input id="name" placeholder="Nombre completo" aria-label="Nombre completo" />
```

**Acción:**
- Agregar labels sr-only o aria-label a todos los inputs

---

### 4. 🟠 Navegación por hash fragments rota
**Severidad:** Media (UX)
**Tiempo estimado:** 15 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/layout/Header.tsx` (navegación principal)
- `components/sections/*.tsx` (agregar IDs faltantes)

**Problema:**
```tsx
// Header tiene links que no coinciden con IDs en las secciones
{ name: "Soluciones", href: "#soluciones" }  // ❌ ID no existe

// Sección no tiene ID
<section className="...">  // ❌ Falta id="soluciones"
```

**Acción:**
Opción 1: Agregar IDs faltantes en secciones
```tsx
<section id="soluciones" className="...">
```

Opción 2: Actualizar links del Header para que coincidan con IDs existentes

---

### 5. 🟠 ConditionalLayout scroll to top interfiere con navegación
**Severidad:** Media (UX)
**Tiempo estimado:** 10 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/layout/ConditionalLayout.tsx`

**Problema:**
```tsx
// ❌ Scrollea a top siempre, anula navegación por hash
useEffect(() => {
  if (isFirstRender.current) {
    window.scrollTo(0, 0);
    isFirstRender.current = false;
  }
}, []);
```

**Acción:**
```tsx
// ✅ Respetar hash en URL
useEffect(() => {
  if (!window.location.hash && isFirstRender.current) {
    window.scrollTo(0, 0);
  }
  isFirstRender.current = false;
}, []);
```

---

### 6. 🟠 Framer Motion sin respeto a prefers-reduced-motion
**Severidad:** Media (Accesibilidad)
**Tiempo estimado:** 10 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `app/layout.tsx`

**Problema:**
Animaciones siempre activas, sin respetar preferencias del usuario.

**Acción:**
```tsx
// app/layout.tsx
import { MotionConfig } from 'framer-motion';

export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        <MotionConfig reducedMotion="user">
          {children}
        </MotionConfig>
      </body>
    </html>
  );
}
```

---

### 7. 🟡 Metadata SEO faltante en páginas internas
**Severidad:** Media (SEO)
**Tiempo estimado:** 20 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `app/blog/page.tsx`
- `app/privacidad/page.tsx`
- `app/terminos/page.tsx`
- `app/seguridad/page.tsx`

**Problema:**
Sin metadata específica, todas las páginas usan el título y descripción del root layout.

**Acción:**
```tsx
// app/blog/page.tsx
import type { Metadata } from 'next';

export const metadata: Metadata = {
  title: 'Blog | Simbioma',
  description: 'Noticias, tendencias y análisis sobre sustentabilidad en Chile.',
};
```

---

### 8. 🟡 Colores hardcoded en lugar de variables Tailwind
**Severidad:** Baja (Mantenibilidad)
**Tiempo estimado:** 20 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/sections/Segmentacion.tsx`
- `components/sections/Hero.tsx`
- `components/ui/Button.tsx`

**Problema:**
```tsx
// ❌ HEX hardcoded
<Button className="bg-[#2D9D78]">

// ✅ Variable de Tailwind
<Button className="bg-verde-bosque">
```

**Acción:**
- Reemplazar todos los HEX values por clases de Tailwind configuradas

---

### 9. 🟢 Error boundaries y loading states
**Severidad:** Baja (UX resiliente)
**Tiempo estimado:** 30 minutos
**Esfuerzo:** Bajo-Medio

**Archivos a crear:**
- `app/error.tsx` (global error boundary)
- `app/blog/loading.tsx` (loading state)

**Acción:**
Crear error boundaries para manejar errores de manera elegante.

---

### 10. 🟢 Estado de loading mejorado en formulario
**Severidad:** Baja (UX)
**Tiempo estimado:** 5 minutos
**Esfuerzo:** Bajo

**Archivos afectados:**
- `components/sections/CTAFinal.tsx`

**Problema:**
```tsx
// ❌ Solo spinner
<Loader2 className="w-6 h-6 animate-spin" />

// ✅ Spinner + texto descriptivo
<div className="flex items-center gap-2">
  <Loader2 className="w-6 h-6 animate-spin" />
  <span>Enviando...</span>
</div>
```

---

## ⏳ POSPONER PARA FASE 2 (Dependen de infraestructura)

### 1. 🔴 Formulario sin validación server-side
**Requiere:**
- Supabase configurado
- API Route `/api/beta-request`
- Correos corporativos (para enviar confirmaciones)
- Validación con Zod

**Mantener como está:** Simulación de envío está OK para demo/staging.

---

### 2. 🟠 Links con href="#" en Footer (redes sociales)
**Requiere:**
- Definir redes sociales de la empresa
- URLs reales de LinkedIn, Twitter, etc.

**Mantener como está:** Links placeholder están OK por ahora.

---

### 3. 🟡 Manejo de errores en formulario
**Requiere:**
- Backend implementado
- Estados de error reales basados en respuestas del servidor

**Mantener como está:** Sin backend, no hay errores reales que manejar.

---

### 4. 🟡 Link /login roto
**Requiere:**
- Sistema de autenticación implementado
- Supabase Auth configurado
- Página de login diseñada

**Opción temporal:** Deshabilitar link o mostrar "Próximamente".

---

## 📊 Resumen de Priorización

### Resolver AHORA (Total: ~3 horas)
1. ✅ ESLint errors (30-45 min) - **ALTA PRIORIDAD**
2. ✅ Alt text descriptivo (20 min) - **ALTA PRIORIDAD**
3. ✅ Labels en formularios (15 min) - **ALTA PRIORIDAD**
4. ✅ Navegación por hash (15 min) - **MEDIA PRIORIDAD**
5. ✅ Scroll to top fix (10 min) - **MEDIA PRIORIDAD**
6. ✅ Prefers-reduced-motion (10 min) - **MEDIA PRIORIDAD**
7. ✅ Metadata SEO (20 min) - **MEDIA PRIORIDAD**
8. ✅ Colores hardcoded (20 min) - **BAJA PRIORIDAD**
9. ✅ Error boundaries (30 min) - **BAJA PRIORIDAD**
10. ✅ Loading states (5 min) - **BAJA PRIORIDAD**

### Posponer para FASE 2
- ⏳ Formulario con backend real
- ⏳ Validación server-side
- ⏳ Manejo de errores reales
- ⏳ Sistema de autenticación
- ⏳ Redes sociales definidas

---

## 🎯 Plan de Acción Recomendado

### Sesión 1: Críticos de Accesibilidad (1 hora)
1. Resolver ESLint errors (comillas) - 30 min
2. Alt text descriptivo - 20 min
3. Labels en formularios - 15 min

### Sesión 2: UX y Navegación (45 min)
4. Navegación por hash - 15 min
5. Scroll to top fix - 10 min
6. Prefers-reduced-motion - 10 min
7. Loading states mejorados - 5 min

### Sesión 3: SEO y Mantenibilidad (1 hora)
8. Metadata SEO - 20 min
9. Colores hardcoded - 20 min
10. Error boundaries - 30 min

### Post-Fase 2: Infraestructura
- Backend para formularios
- Autenticación
- Validación server-side
- Redes sociales

---

## ✅ Checklist de Ejecución

```markdown
### Sesión 1: Accesibilidad (ALTA PRIORIDAD)
- [ ] app/blog/simbioma-beneficios-gestion-ambiental/page.tsx - Escapar comillas
- [ ] app/privacidad/page.tsx - Escapar comillas
- [ ] app/terminos/page.tsx - Escapar comillas
- [ ] components/sections/Solucion.tsx - Alt text descriptivo (3 imágenes)
- [ ] app/blog/page.tsx - Alt text descriptivo (1 imagen)
- [ ] components/sections/CTAFinal.tsx - Labels sr-only (4 inputs)

### Sesión 2: UX (MEDIA PRIORIDAD)
- [ ] components/sections/*.tsx - Agregar IDs para navegación
- [ ] components/layout/Header.tsx - Verificar coincidencia de links
- [ ] components/layout/ConditionalLayout.tsx - Fix scroll to top
- [ ] app/layout.tsx - MotionConfig reducedMotion
- [ ] components/sections/CTAFinal.tsx - Mejorar estado loading

### Sesión 3: SEO + Mantenibilidad (BAJA PRIORIDAD)
- [ ] app/blog/page.tsx - Export metadata
- [ ] app/privacidad/page.tsx - Export metadata
- [ ] app/terminos/page.tsx - Export metadata
- [ ] app/seguridad/page.tsx - Export metadata
- [ ] components/sections/Segmentacion.tsx - Reemplazar HEX por clases
- [ ] components/sections/Hero.tsx - Reemplazar HEX por clases
- [ ] components/ui/Button.tsx - Reemplazar HEX por clases
- [ ] app/error.tsx - Crear error boundary
- [ ] app/blog/loading.tsx - Crear loading state

### Post-Fase 2 (POSPUESTO)
- [ ] /api/beta-request - Crear API route
- [ ] components/sections/CTAFinal.tsx - Validación con Zod
- [ ] components/sections/CTAFinal.tsx - Manejo de errores real
- [ ] app/login/page.tsx - Crear página de login
- [ ] components/layout/Footer.tsx - URLs reales de redes sociales
```

---

**Siguiente paso:** Ejecutar Sesión 1 (Accesibilidad) - 1 hora de trabajo enfocado.
