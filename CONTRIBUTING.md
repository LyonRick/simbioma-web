# Guía de Contribución - Simbioma

¡Gracias por tu interés en contribuir a Simbioma! Esta guía te ayudará a entender cómo puedes participar en el desarrollo de la plataforma.

## 📋 Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [Cómo Contribuir](#cómo-contribuir)
- [Proceso de Desarrollo](#proceso-de-desarrollo)
- [Estándares de Código](#estándares-de-código)
- [Commits y Pull Requests](#commits-y-pull-requests)
- [Testing](#testing)

---

## 🤝 Código de Conducta

Al participar en este proyecto, te comprometes a mantener un ambiente respetuoso y profesional. Esperamos que todos los contribuyentes:

- Sean respetuosos y considerados
- Acepten críticas constructivas
- Se enfoquen en lo mejor para la comunidad
- Muestren empatía hacia otros miembros

---

## 🚀 Cómo Contribuir

### Reportar Bugs

Si encuentras un bug, abre un issue en GitHub con:

1. **Título descriptivo**: Resumen claro del problema
2. **Pasos para reproducir**: Lista detallada de pasos
3. **Comportamiento esperado**: Qué debería pasar
4. **Comportamiento actual**: Qué está pasando
5. **Screenshots**: Si es relevante
6. **Entorno**: Sistema operativo, navegador, versión de Node.js

**Template de Issue**:
```markdown
## Descripción
[Descripción clara del bug]

## Pasos para Reproducir
1. Ir a '...'
2. Click en '...'
3. Ver error

## Comportamiento Esperado
[Qué debería suceder]

## Comportamiento Actual
[Qué está sucediendo]

## Entorno
- OS: [ej. macOS 14.0]
- Browser: [ej. Chrome 120]
- Node.js: [ej. 20.10.0]
```

### Sugerir Mejoras

Para sugerir una nueva funcionalidad:

1. Verifica que no exista un issue similar
2. Abre un issue con el tag `enhancement`
3. Describe el problema que resuelve
4. Propón una solución
5. Considera alternativas

---

## 🔄 Proceso de Desarrollo

### 1. Fork y Clone

```bash
# Fork desde GitHub UI, luego:
git clone https://github.com/TU-USUARIO/simbioma-web.git
cd simbioma-web
git remote add upstream https://github.com/LyonRick/simbioma-web.git
```

### 2. Crear Rama

Usa nombres descriptivos siguiendo este formato:

```bash
# Nuevas funcionalidades
git checkout -b feature/nombre-descriptivo

# Corrección de bugs
git checkout -b fix/nombre-del-bug

# Mejoras de documentación
git checkout -b docs/tema-actualizado

# Refactorización
git checkout -b refactor/componente-actualizado
```

**Ejemplos**:
- `feature/dashboard-indicators`
- `fix/login-validation-error`
- `docs/update-setup-guide`
- `refactor/auth-logic`

### 3. Desarrollar

```bash
# Instalar dependencias
npm install

# Copiar variables de entorno
cp .env.example .env.local
# Edita .env.local con tus valores

# Iniciar servidor de desarrollo
npm run dev
```

### 4. Commit

```bash
git add .
git commit -m "feat: agregar indicadores al dashboard"
```

Ver [Commits y Pull Requests](#commits-y-pull-requests) para formato correcto.

### 5. Push y Pull Request

```bash
# Push a tu fork
git push origin feature/nombre-descriptivo

# Crea Pull Request desde GitHub UI
```

---

## 📝 Estándares de Código

### TypeScript

✅ **HACER**:
```typescript
// Usar tipos explícitos
interface User {
    id: string;
    email: string;
    name: string;
}

function getUser(id: string): Promise<User> {
    // ...
}

// Props correctamente tipadas
interface ButtonProps {
    onClick: () => void;
    label: string;
    disabled?: boolean;
}
```

❌ **NO HACER**:
```typescript
// Evitar any
function handleData(data: any) { /* ... */ }

// Props sin tipar
function Button(props) { /* ... */ }
```

### React / Next.js

✅ **HACER**:
```typescript
// Server Components por defecto
export default async function Page() {
    const data = await fetchData();
    return <div>{data}</div>;
}

// 'use client' solo cuando sea necesario
'use client';
export function InteractiveButton() {
    const [count, setCount] = useState(0);
    return <button onClick={() => setCount(count + 1)}>{count}</button>;
}

// Hooks correctamente usados
useEffect(() => {
    const timer = setInterval(() => {}, 1000);
    return () => clearInterval(timer); // Cleanup
}, []);
```

❌ **NO HACER**:
```typescript
// No usar 'use client' innecesariamente
'use client';
export default function StaticPage() {
    return <div>Hola</div>; // No necesita ser cliente
}

// No olvidar cleanup en useEffect
useEffect(() => {
    setInterval(() => {}, 1000); // Memory leak!
}, []);
```

### Estilos con Tailwind CSS

✅ **HACER**:
```tsx
// Usar clases de Tailwind
<button className="bg-primary hover:bg-primary/90 text-white px-4 py-2 rounded-lg">
    Click me
</button>

// Usar colores del sistema de diseño
<div className="text-[#2D9D78]">Verde Bosque</div>

// Componentes de shadcn/ui cuando sea posible
import { Button } from '@/components/ui/button';
<Button variant="default">Click me</Button>
```

❌ **NO HACER**:
```tsx
// No usar estilos inline sin razón
<button style={{ backgroundColor: 'blue' }}>Click me</button>

// No crear CSS custom cuando Tailwind lo provee
```

### Naming Conventions

```typescript
// Componentes: PascalCase
function DashboardHeader() {}

// Funciones: camelCase
function getUserData() {}

// Constantes: UPPER_SNAKE_CASE
const MAX_RETRIES = 3;

// Archivos de componentes: PascalCase.tsx
// DashboardHeader.tsx

// Archivos de utilidades: camelCase.ts
// formatDate.ts
```

---

## 📬 Commits y Pull Requests

### Formato de Commits (Conventional Commits)

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

**Types**:
- `feat`: Nueva funcionalidad
- `fix`: Corrección de bug
- `docs`: Cambios en documentación
- `style`: Formateo, espacios (no afecta código)
- `refactor`: Refactorización de código
- `test`: Agregar o modificar tests
- `chore`: Tareas de mantenimiento

**Ejemplos**:
```bash
feat(dashboard): agregar gráfico de residuos sólidos
fix(login): corregir validación de email
docs(readme): actualizar comandos de instalación
refactor(auth): extraer lógica de Supabase a hook
test(calendar): agregar tests para CalendarWidget
```

### Pull Request Guidelines

**Título del PR**:
```
feat: Dashboard de indicadores ambientales
fix: Corrección de autenticación en login
docs: Actualización de guía de contribución
```

**Descripción del PR**:
```markdown
## Qué cambia este PR

[Descripción clara de los cambios]

## Por qué

[Razón del cambio o problema que resuelve]

## Cómo testear

1. Paso 1
2. Paso 2

## Screenshots

[Si aplica]

## Checklist

- [ ] Código sigue los estándares del proyecto
- [ ] Tests pasan (`npm run test`)
- [ ] Linter pasa (`npm run lint`)
- [ ] Documentación actualizada (si aplica)
- [ ] Screenshots agregados (si aplica cambios visuales)
```

---

## 🧪 Testing

### Unit Tests con Vitest

```typescript
// components/Button.test.tsx
import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import { Button } from './Button';

describe('Button', () => {
    it('renders correctly', () => {
        render(<Button label="Click me" />);
        expect(screen.getByText('Click me')).toBeInTheDocument();
    });

    it('calls onClick when clicked', () => {
        const handleClick = vi.fn();
        render(<Button label="Click" onClick={handleClick} />);
        screen.getByText('Click').click();
        expect(handleClick).toHaveBeenCalledOnce();
    });
});
```

### Ejecutar Tests

```bash
# Todos los tests
npm run test

# Watch mode
npm run test:watch

# UI interactiva
npm run test:ui

# Coverage
npm run test:coverage
```

### Tests Requeridos

- **Nueva funcionalidad**: Agregar tests para lógica de negocio
- **Bug fix**: Agregar test que reproduzca el bug
- **Refactor**: Asegurar que tests existentes pasen

---

## 🏗️ Arquitectura y Patrones

### Server vs Client Components

```typescript
// Server Component (por defecto)
// app/dashboard/page.tsx
export default async function DashboardPage() {
    const data = await fetchServerData();
    return <DashboardView data={data} />;
}

// Client Component (solo cuando necesites interactividad)
// components/DashboardView.tsx
'use client';
export function DashboardView({ data }) {
    const [filter, setFilter] = useState('all');
    // ... lógica interactiva
}
```

### Organización de Imports

```typescript
// 1. Imports externos
import { useState } from 'react';
import { useRouter } from 'next/navigation';

// 2. Imports de componentes UI
import { Button } from '@/components/ui/button';
import { Card } from '@/components/ui/card';

// 3. Imports de componentes propios
import { DashboardHeader } from '@/components/layout/DashboardHeader';

// 4. Imports de utilidades
import { cn } from '@/lib/utils';

// 5. Imports de tipos
import type { User } from '@/types';
```

---

## 🎨 Accesibilidad (WCAG 2.2 AA)

Todos los componentes deben cumplir con WCAG 2.2 AA:

✅ **Checklist**:
- [ ] Contraste de colores mínimo 4.5:1
- [ ] Botones e iconos mínimo 24x24px
- [ ] Todas las imágenes tienen `alt` text
- [ ] Navegable completamente por teclado
- [ ] Botones sin texto tienen `aria-label`
- [ ] Formularios tienen labels asociados

```tsx
// ✅ Bueno
<button
    className="w-10 h-10"
    aria-label="Cerrar modal"
>
    <X className="w-5 h-5" aria-hidden="true" />
</button>

// ❌ Malo
<button className="w-4 h-4"> {/* Muy pequeño */}
    <X /> {/* Sin aria-label */}
</button>
```

---

## 🔒 Seguridad

- **NUNCA** commitear `.env.local` o secretos
- Validar inputs en cliente Y servidor
- Usar Supabase RLS para control de acceso
- No exponer API keys en código cliente
- Sanitizar outputs que vienen de usuario

---

## ❓ Preguntas

Si tienes dudas:

1. Revisa la [documentación](docs/)
2. Busca en issues existentes
3. Abre un nuevo issue con el tag `question`
4. Contacta al equipo: `dev@simbioma.com`

---

## 🙏 Agradecimientos

¡Gracias por contribuir a Simbioma! Tu trabajo ayuda a mejorar la gestión ambiental en Chile.

---

**Última actualización**: 2025-11-29
