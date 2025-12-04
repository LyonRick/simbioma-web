# 🌱 Simbioma - Plataforma de Gestión Ambiental Municipal

> Herramientas inteligentes para la sostenibilidad territorial y el cumplimiento normativo en gobiernos locales de Chile.

[![Next.js 15](https://img.shields.io/badge/Next.js-15-black)](https://nextjs.org/)
[![React 19](https://img.shields.io/badge/React-19-blue)](https://react.dev/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5-blue)](https://www.typescriptlang.org/)
[![Supabase](https://img.shields.io/badge/Supabase-Latest-green)](https://supabase.com/)

## 🚀 Inicio Rápido

### Requisitos Previos
- Node.js 20 o superior
- npm 10 o superior
- Cuenta de Supabase ([crear en supabase.com](https://supabase.com))

### Instalación

1. **Clonar el repositorio**:
```bash
git clone https://github.com/LyonRick/simbioma-web.git
cd simbioma-web
```

2. **Instalar dependencias**:
```bash
npm install
```

3. **Configurar variables de entorno**:
```bash
cp .env.example .env.local
```

Edita `.env.local` y completa:
```env
NEXT_PUBLIC_SUPABASE_URL=tu_supabase_project_url
NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY=tu_supabase_anon_key
```

> 📖 Ver [docs/setup.md](docs/setup.md) para instrucciones detalladas de Supabase.

4. **Ejecutar migraciones de base de datos**:
```bash
npx supabase db push
```

5. **Iniciar servidor de desarrollo**:
```bash
npm run dev
```

Abre [http://localhost:3000](http://localhost:3000) en tu navegador.

---

## 📁 Estructura del Proyecto

```
simbioma-web/
├── app/                    # Next.js App Router
│   ├── dashboard/         # Dashboard protegido
│   ├── login/             # Autenticación
│   ├── blog/              # Blog público
│   └── (legal)/           # Páginas legales (privacidad, términos)
├── components/
│   ├── ui/                # shadcn/ui components
│   ├── layout/            # Headers, footers, sidebars
│   ├── sections/          # Secciones de landing page
│   ├── dashboard/         # Componentes del dashboard
│   └── brand/             # Logo y elementos de marca
├── lib/
│   ├── supabase/          # Cliente y middleware de Supabase
│   └── utils.ts           # Utilidades (cn, validaciones)
├── docs/                  # Documentación técnica
├── design/                # Assets y mockups de diseño
└── supabase/              # Migraciones y configuración
```

---

## 🛠️ Stack Tecnológico

### Frontend
- **Framework**: Next.js 15 (App Router)
- **UI Library**: React 19
- **Lenguaje**: TypeScript 5
- **Estilos**: Tailwind CSS v4
- **Componentes**: shadcn/ui + Radix UI
- **Iconos**: Lucide React
- **Gráficos**: Recharts
- **Formularios**: React Hook Form + Zod
- **Theme**: next-themes (modo oscuro)
- **Notificaciones**: Sonner

### Backend & Database
- **Database**: Supabase (PostgreSQL)
- **Auth**: Supabase Auth
- **Storage**: Supabase Storage
- **Real-time**: Supabase Realtime

### Testing & Quality
- **Unit Tests**: Vitest
- **Linting**: ESLint
- **Type Checking**: TypeScript

---

## 🧪 Comandos Disponibles

```bash
# Desarrollo
npm run dev              # Inicia servidor de desarrollo en http://localhost:3000

# Build
npm run build            # Build de producción
npm run start            # Inicia servidor de producción
npm run lint             # Ejecuta ESLint

# Testing
npm run test             # Ejecuta tests con Vitest
npm run test:ui          # UI interactiva de Vitest

# Base de Datos (requiere Supabase CLI)
npx supabase db push     # Aplicar migraciones
npx supabase db reset    # Reset completo (solo desarrollo)
npx supabase status      # Ver estado del proyecto
```

---

## 🎨 Sistema de Diseño

### Colores de Marca

Simbioma utiliza una paleta inspirada en la naturaleza chilena:

- **#2D9D78** - Verde Bosque (Principal)
- **#1E5F8C** - Azul Océano (Secundario)
- **#F5A623** - Naranja Cobre (Acento)

### Tipografía

- **Headings**: Font family configurada en Tailwind
- **Body**: Sistema de fuentes por defecto de Next.js

Ver [design/design-system.md](design/design-system.md) para guías completas de UI/UX.

---

## 🌍 Despliegue

### Vercel (Recomendado)

[![Deploy with Vercel](https://vercel.com/button)](https://vercel.com/new/clone?repository-url=https://github.com/LyonRick/simbioma-web)

1. Conecta tu repositorio de GitHub a Vercel
2. Configura las variables de entorno en Vercel Dashboard:
   - `NEXT_PUBLIC_SUPABASE_URL`
   - `NEXT_PUBLIC_SUPABASE_PUBLISHABLE_DEFAULT_KEY`
3. Deploy automático en cada push a `main`

### Otras Plataformas

Simbioma es compatible con cualquier plataforma que soporte Next.js 15:
- **Netlify**: Requiere configuración de build
- **Railway**: Soporte nativo para Next.js
- **AWS Amplify**: Con configuración adicional

---

## 🤝 Contribuir

¡Las contribuciones son bienvenidas! Por favor lee [CONTRIBUTING.md](CONTRIBUTING.md) para conocer:

- Proceso de contribución
- Estándares de código
- Guías de commits
- Testing requirements

### Quick Start para Contribuir

1. Fork el repositorio
2. Crea una rama: `git checkout -b feature/mi-funcionalidad`
3. Haz tus cambios y commit: `git commit -m 'feat: descripción'`
4. Push: `git push origin feature/mi-funcionalidad`
5. Abre un Pull Request

---

## 📖 Documentación

La documentación completa está disponible en la carpeta [`docs/`](docs/):

### Documentos Principales

- [**📊 Estado del Proyecto**](ESTADO-PROYECTO.md) - Estado actual, métricas, changelog
- [**📋 Tareas Pendientes**](TAREAS-PENDIENTES.md) - Lista de trabajo organizada por categorías
- [Setup Guide](docs/setup.md) - Configuración inicial de Supabase
- [PRD](docs/PRD-Simbioma.md) - Product Requirements Document
- [Business Model](docs/business-model.md) - Modelo de negocio
- [Testing](docs/testing.md) - Guía de testing

### Documentación Técnica

- [Architecture](docs/architecture/) - Documentación de arquitectura
- [Database Schema v4.0](docs/architecture/database-schema-v4.0-OFICIAL.md) - Schema oficial (28 tablas)
- [SINADER Catalogs](docs/data/sinader-catalogs-documentation.md) - Códigos LER y tratamientos

---

## 🔒 Seguridad

Si descubres una vulnerabilidad de seguridad, por favor **NO** abras un issue público. En su lugar, envía un email a `security@simbioma.com`.

---

## 📄 Licencia

Copyright © 2025 Simbioma. Todos los derechos reservados.

Este proyecto es software propietario. El uso, modificación y distribución están sujetos a los términos especificados en el acuerdo de licencia.

---

## 🆘 Soporte

- **Documentación**: [docs/](docs/)
- **Issues**: [GitHub Issues](https://github.com/LyonRick/simbioma-web/issues)
- **Email**: soporte@simbioma.com
- **Website**: [simbioma.com](https://simbioma.com)

---

## 🙏 Agradecimientos

Desarrollado con tecnologías de código abierto:
- Next.js por Vercel
- React por Meta
- Supabase
- shadcn/ui por shadcn
- Tailwind CSS

---

<div align="center">

**Desarrollado con ❤️ para gobiernos locales de Chile**

🌱 *Transformando la gestión ambiental municipal con tecnología*

</div>
