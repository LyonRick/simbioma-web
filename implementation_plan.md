# Planificación de Desarrollo - Simbioma v3.0

## 1. Resumen del Proyecto
Simbioma es una plataforma SaaS dual (B2G y B2B) diseñada para gestionar la transición hacia la regeneración ecosistémica en Chile. Conecta a gobiernos locales y empresas privadas, permitiendo la consolidación de datos ambientales, reportes ESG automatizados y una visualización transparente del impacto territorial.

## 2. Estado Actual
- **Documentación**: Excelente y exhaustiva. El PRD v3.0, Modelo de Negocio y Arquitectura de Datos (v4.0) están claramente definidos y alineados.
- **Código**: En etapa inicial. Existe una estructura base en Next.js 16 con Tailwind, pero la implementación del frontend (Homepage) es básica y carece de la estética "premium" y funcionalidad requerida.
- **Infraestructura**: Definida (Supabase + Vercel) pero pendiente de configuración profunda (RLS, Auth, Storage).

## 3. Puntos Fuertes
- **Visión de Producto**: La estrategia dual (Público + Privado) y el sistema de indicadores con subscripciones y versionado son diferenciadores potentes y bien pensados.
- **Claridad Técnica**: El esquema de base de datos v4.0 (22 tablas) cubre casos de uso complejos como polimorfismo, versionado temporal y seguridad RLS.
- **Stack Tecnológico**: Selección moderna y robusta (Next.js 16, React 19, Tailwind 4, Supabase) que permite escalar.
- **Enfoque Local**: Adaptación específica a normativas chilenas (SINADER, REP, Firma Electrónica SII) crea una barrera de entrada fuerte para competidores globales.

## 4. Puntos de Mejora
- **Experiencia de Usuario (UX/UI)**: El frontend actual no cumple con la expectativa de "estética moderna" y "premium". Se requiere un rediseño visual con énfasis en micro-interacciones, tipografía y uso de espacio.
- **Implementación de Lógica Core**: El sistema de subscripciones de indicadores y versionado es complejo y aún no está implementado en código.
- **Validación**: Faltan pruebas automatizadas (E2E, Unitarias) para asegurar la robustez de los cálculos y migraciones de datos.

## 5. Arquitectura Técnica
- **Frontend**: 
  - Next.js 16 (App Router, Server Components).
  - Tailwind CSS 4 + Shadcn UI (personalizado con tokens de marca).
  - Framer Motion para animaciones y transiciones "premium".
- **Backend**: 
  - Supabase (PostgreSQL 15).
  - Autenticación: Supabase Auth (Soporte para roles y multi-tenant).
  - Lógica de Negocio: Supabase Edge Functions + Triggers en DB para integridad.
  - Almacenamiento: Supabase Storage (para reportes y certificados encriptados).
- **Seguridad**: 
  - RLS (Row Level Security) estricto para aislamiento de datos entre organizaciones.
  - Encriptación de campos sensibles (firmas, API keys).

## 6. Pasos Siguientes (Roadmap)

### Fase 1: Fundamentos y UI Premium (Semanas 1-2)
- [ ] **Rediseño Visual**: Implementar un sistema de diseño "Premium" (colores, tipografía, componentes base) en `globals.css` y configuración de Tailwind.
- [ ] **Homepage 2.0**: Reconstruir la landing page con animaciones (Framer Motion), secciones dinámicas y estética de alto nivel para validar la propuesta de valor.
- [ ] **Setup Base de Datos**: Implementar el esquema v4.0 en Supabase, incluyendo tablas de usuarios, organizaciones y roles.

### Fase 2: Core de Indicadores (Semanas 3-5)
- [ ] **Catálogo de Indicadores**: Desarrollar el CRUD de indicadores con soporte para namespaces y versionado.
- [ ] **Sistema de Subscripciones**: Implementar la lógica de suscripción por organización y las reglas de validación de planes.
- [ ] **Migraciones**: Crear el flujo de migración de versiones de indicadores (v1 -> v2).

### Fase 3: Dashboards y Gestión (Semanas 6-8)
- [ ] **Dashboard Dual**: Implementar vistas diferenciadas para Gobierno Local (agregación) y Empresa (benchmarking).
- [ ] **Ingreso de Datos**: Formularios inteligentes para carga de valores de indicadores.
- [ ] **Gestión de Proyectos**: Módulo de proyectos con desglose financiero (público/privado).

### Fase 4: Reportes y Firma (Semanas 9-10)
- [ ] **Generador de Reportes**: Motor de generación de PDF para SINADER/GRI.
- [ ] **Firma Electrónica**: Integración con proveedores de firma y flujo de validación.
