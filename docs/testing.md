# Guía de Testing - Simbioma

Esta guía describe cómo ejecutar y escribir tests para la plataforma Simbioma.

## 📋 Tabla de Contenidos

- [Configuración](#configuración)
- [Ejecutar Tests](#ejecutar-tests)
- [Unit Tests con Vitest](#unit-tests-con-vitest)
- [Integration Tests](#integration-tests)
- [E2E Tests con Playwright](#e2e-tests-con-playwright-futuro)
- [Best Practices](#best-practices)

---

## 🛠️ Configuración

### Vitest (Ya Configurado)

El proyecto ya tiene Vitest configurado. El archivo de configuración está en `vitest.config.mts`:

```typescript
import { defineConfig } from 'vitest/config';
import react from '@vitejs/plugin-react';
import { resolve } from 'path';

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: ['./vitest.setup.ts'],
  },
  resolve: {
    alias: {
      '@': resolve(__dirname, '.'),
    },
  },
});
```

### Instalación de Dependencias (si es necesario)

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom @testing-library/user-event jsdom
```

---

## 🚀 Ejecutar Tests

### Comandos Disponibles

```bash
# Ejecutar todos los tests una vez
npm run test

# Watch mode (re-ejecuta al cambiar archivos)
npm run test:watch

# UI interactiva de Vitest
npm run test:ui

# Generar reporte de coverage
npm run test:coverage
```

### Ver Resultados en UI

La UI de Vitest proporciona una interfaz web interactiva:

```bash
npm run test:ui
```

Esto abrirá una interfaz en `http://localhost:51204` donde puedes:
- Ver todos los tests
- Filtrar por archivo
- Ver coverage visual
- Re-ejecutar tests específicos

---

## 🧪 Unit Tests con Vitest

### Estructura de Archivos

```
component/
├── Button.tsx
├── Button.test.tsx  ← Test al lado del componente
└── Button.stories.tsx (si usamos Storybook)
```

### Template Básico

```typescript
// components/ui/Button.test.tsx
import { render, screen } from '@testing-library/react';
import { describe, it, expect, vi } from 'vitest';
import userEvent from '@testing-library/user-event';
import { Button } from './Button';

describe('Button', () => {
    it('should render with label', () => {
        render(<Button>Click me</Button>);
        expect(screen.getByText('Click me')).toBeInTheDocument();
    });

    it('should call onClick when clicked', async () => {
        const handleClick = vi.fn();
        const user = userEvent.setup();
        
        render(<Button onClick={handleClick}>Click</Button>);
        await user.click(screen.getByText('Click'));
        
        expect(handleClick).toHaveBeenCalledOnce();
    });

    it('should be disabled when disabled prop is true', () => {
        render(<Button disabled>Click me</Button>);
        expect(screen.getByText('Click me')).toBeDisabled();
    });
});
```

### Testear Componentes con Hooks

```typescript
// components/Counter.test.tsx
import { render, screen } from '@testing-library/react';
import { describe, it, expect } from 'vitest';
import userEvent from '@testing-library/user-event';
import { Counter } from './Counter';

describe('Counter', () => {
    it('should increment count on button click', async () => {
        const user = userEvent.setup();
        render(<Counter />);
        
        const button = screen.getByRole('button', { name: /increment/i });
        const count = screen.getByText(/count: 0/i);
        
        expect(count).toBeInTheDocument();
        
        await user.click(button);
        expect(screen.getByText(/count: 1/i)).toBeInTheDocument();
    });
});
```

### Testear Server Components

Los Server Components no se pueden testear directamente con Vitest. En su lugar:

1. **Extrae la lógica** a funciones puras y testea esas
2. **Mock el data fetching** si es necesario

```typescript
// lib/utils/formatDate.ts
export function formatDate(date: Date): string {
    return new Intl.DateTimeFormat('es-CL').format(date);
}

// lib/utils/formatDate.test.ts
import { describe, it, expect } from 'vitest';
import { formatDate } from './formatDate';

describe('formatDate', () => {
    it('should format date in Chilean format', () => {
        const date = new Date('2025-01-15');
        expect(formatDate(date)).toBe('15-01-2025');
    });
});
```

---

## 🔗 Integration Tests

### Testear Componentes con Supabase

Para testear componentes que usan Supabase, crea un **mock** del cliente:

```typescript
// lib/supabase/__mocks__/client.ts
import { vi } from 'vitest';

export const createClient = vi.fn(() => ({
    from: vi.fn(() => ({
        select: vi.fn(() => ({
            data: [{ id: 1, name: 'Test' }],
            error: null,
        })),
        insert: vi.fn(() => ({ data: {}, error: null })),
        update: vi.fn(() => ({ data: {}, error: null })),
        delete: vi.fn(() => ({ data: {}, error: null })),
    })),
    auth: {
        getUser: vi.fn(() => ({
            data: { user: { id: '123', email: 'test@test.com' } },
            error: null,
        })),
    },
}));
```

Uso en tests:

```typescript
import { describe, it, expect, vi } from 'vitest';
import { createClient } from '@/lib/supabase/client';

vi.mock('@/lib/supabase/client');

describe('DataComponent', () => {
    it('should fetch and display data', async () => {
        const { data } = await createClient().from('table').select();
        expect(data).toHaveLength(1);
    });
});
```

---

## 🎭 E2E Tests con Playwright (Futuro)

### Instalación

```bash
npm install -D @playwright/test
npx playwright install
```

### Configuración

```javascript
// playwright.config.ts
import { defineConfig } from '@playwright/test';

export default defineConfig({
    testDir: './tests/e2e',
    use: {
        baseURL: 'http://localhost:3000',
        screenshot: 'only-on-failure',
        video: 'retain-on-failure',
    },
    webServer: {
        command: 'npm run dev',
        port: 3000,
        reuseExistingServer: !process.env.CI,
    },
});
```

### Ejemplo de Test E2E

```typescript
// tests/e2e/login.spec.ts
import { test, expect } from '@playwright/test';

test.describe('Login Flow', () => {
    test('should login successfully with valid credentials', async ({ page }) => {
        await page.goto('/login');
        
        await page.fill('[name="email"]', 'test@simbioma.com');
        await page.fill('[name="password"]', 'password123');
        await page.click('button[type="submit"]');
        
        await expect(page).toHaveURL('/dashboard');
        await expect(page.locator('h1')).toContainText('Dashboard');
    });

    test('should show error with invalid credentials', async ({ page }) => {
        await page.goto('/login');
        
        await page.fill('[name="email"]', 'wrong@email.com');
        await page.fill('[name="password"]', 'wrongpass');
        await page.click('button[type="submit"]');
        
        await expect(page.locator('[role="alert"]')).toBeVisible();
    });
});
```

---

## ✅ Best Practices

### 1. Nombre de Tests Descriptivos

```typescript
// ✅ Bueno
it('should display error message when email is invalid', () => {});

// ❌ Malo
it('test 1', () => {});
it('works', () => {});
```

### 2. Arrange-Act-Assert (AAA)

```typescript
it('should increment counter', async () => {
    // Arrange
    const user = userEvent.setup();
    render(<Counter />);
    
    // Act
    await user.click(screen.getByRole('button'));
    
    // Assert
    expect(screen.getByText('1')).toBeInTheDocument();
});
```

### 3. Testear Comportamiento, No Implementación

```typescript
// ✅ Bueno - Testea comportamiento del usuario
it('should show welcome message after login', async () => {
    render(<LoginForm />);
    await userEvent.click(screen.getByText('Login'));
    expect(screen.getByText('Welcome!')).toBeInTheDocument();
});

// ❌ Malo - Testea detalles de implementación
it('should call setState when button clicked', () => {
    const { setState } = render(<Counter />);
    expect(setState).toHaveBeenCalled();
});
```

### 4. Usar Testing Library Queries Apropiadas

**Prioridad de queries** (de mejor a peor):

1. `getByRole` - Más accesible
2. `getByLabelText` - Bueno para forms
3. `getByPlaceholderText`
4. `getByText`
5. `getByTestId` - Último recurso

```typescript
// ✅ Bueno
screen.getByRole('button', { name: /submit/i });
screen.getByLabelText(/email/i);

// ❌ Malo (evitar)
screen.getByTestId('submit-button');
document.querySelector('.btn');
```

### 5. Limpiar Efectos Secundarios

```typescript
import { afterEach, vi } from 'vitest';

afterEach(() => {
    vi.clearAllMocks(); // Limpiar mocks
    vi.restoreAllMocks(); // Restaurar implementaciones
});
```

### 6. Testear Casos de Error

```typescript
it('should handle network errors gracefully', async () => {
    // Mock de error
    vi.mocked(fetchData).mockRejectedValueOnce(new Error('Network error'));
    
    render(<DataComponent />);
    
    await waitFor(() => {
        expect(screen.getByText(/error/i)).toBeInTheDocument();
    });
});
```

---

## 📊 Coverage

### Generar Reporte

```bash
npm run test:coverage
```

### Ver Reporte HTML

El reporte se genera en `coverage/index.html`. Ábrelo en el navegador para ver:

- % de líneas cubiertas
- % de funciones cubiertas
- % de branches cubiertas
- Archivos sin cobertura

### Objetivos de Coverage

| Tipo | Objetivo |
|------|----------|
| **Lógica de negocio** | 80%+ |
| **Componentes UI** | 60%+ |
| **Utilidades** | 90%+ |
| **Total** | 70%+ |

---

## 🐛 Debugging Tests

### Usar `screen.debug()`

```typescript
it('should render correctly', () => {
    render(<MyComponent />);
    screen.debug(); // Imprime el DOM actual
});
```

### Ver Queries Disponibles

```typescript
it('helps find elements', () => {
    render(<MyComponent />);
    screen.logTestingPlaygroundURL(); // URL para visualizar queries
});
```

### Esperar a que Elementos Aparezcan

```typescript
it('should load data', async () => {
    render(<AsyncComponent />);
    
    // Esperar a que aparezca
    const element = await screen.findByText(/loaded/i);
    expect(element).toBeInTheDocument();
});
```

---

## 📚 Recursos

### Documentación Oficial
- [Vitest](https://vitest.dev/)
- [Testing Library](https://testing-library.com/docs/react-testing-library/intro/)
- [Playwright](https://playwright.dev/)

### Guías
- [Common Mistakes with React Testing Library](https://kentcdodds.com/blog/common-mistakes-with-react-testing-library)
- [Testing Library Cheatsheet](https://testing-library.com/docs/react-testing-library/cheatsheet/)

---

## ✅ Checklist para Nuevos Tests

- [ ] Nombre descriptivo del test
- [ ] Usa AAA pattern (Arrange-Act-Assert)
- [ ] Testea comportamiento del usuario, no implementación
- [ ] Usa queries accesibles (getByRole preferiblemente)
- [ ] Limpia efectos secundarios (mocks, timers)
- [ ] Testea casos de éxito Y error
- [ ] Coverage adecuado (70%+)

---

**Última actualización**: 2025-11-29
