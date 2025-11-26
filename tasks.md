# Plan de Trabajo MVP 1 - Simbioma

Este documento detalla la hoja de ruta para alcanzar el MVP 1.0, enfocado en una web pública funcional, autenticación robusta y un módulo de gestión ambiental operativo para municipios.

## 1. Web Pública y Comunicación (Fase Beta)
**Objetivo:** Comunicar la propuesta de valor y captar usuarios para la Beta.
- [x] **Homepage Premium**: Diseño visual, animaciones y secciones clave (Hero, Problema, Solución).
- [ ] **Páginas Satélite Mínimas**:
  - [x] `Aviso Legal / Privacidad + Términos y Condiciones + Seguridad`: Requerido para un producto "serio".
  - [ ] `Solicitud de Acceso`: Formulario en Home Page para capturar leads. Vinculación correcta a correo electronico (por crear todos los correos de la empresa) y supabase.
  - [ ] `Pagina de Empresa y Gobierno Local`: Una vez avanzada la fase 3, con mayor certeza de que componentes se podrán entregar en el MVP, se agregará la informacion de la empresa y gobierno local. Adicionalmente, la página de indicadores también podría ser diseñada si hay información suficiente en fase 3.
  - [Parcial ] `Blog`: Generar un blog con contenido sobre la empresa, la plataforma y el mercado. Considerar al menos una cierta cantidad de articulos por mes para aumentar SEO y captación de clientes.
- [ ] **Indicadores de Estado Beta**:
  - [ ] Banner o Badge visible "Versión Beta / Acceso Anticipado".
  - [ ] Disclaimer en el footer sobre la fase de desarrollo.

## 2. Core de la Plataforma (Backend & Auth)
**Objetivo:** Cimientos seguros y escalables.
- [ ] **Configuración Supabase**:
  - [ ] Crear proyecto y configurar variables de entorno.
  - [ ] Definir tablas base: Usar docs\architecture\database-schema.md como referencia principal para la base de datos versión 1.0 a implementar.
- [ ] **Autenticación**:
  - [ ] Implementar Login (Email/Password + Magic Link opcional).
  - [ ] Implementar Registro con selección de rol (Funcionario/Empresa).
  - [ ] Recuperación de contraseña.
- [ ] **Layout de Aplicación**:
  - [ ] Estructura de Dashboard (Sidebar colapsable, Header con perfil). Uso de shadcn para componentes.
  - [ ] Protección de rutas (Middleware de Next.js para `/dashboard`).

## 3. Módulo Funcional: "Gestión Territorial" (MVP Municipal)
**Objetivo:** Una herramienta de uso diario para funcionarios municipales.
*Propuesta: Tablero de Indicadores y Reportabilidad Básica.*
- [ ] **Gestión de Datos**:
 - [ ] Definición del catálogo de indicadores que manejará inicialmente la plataforma para el MVP. Usar docs\architecture\database-schema.md como referencia principal para la base de datos versión 1.0 a implementar.
  - [ ] Cargar indicadores históricos asociados a los territorios del país, con el objetivo de ser usados como base para generar indicadores futuros.
  - [ ] Crear formulario de carga de indicadores (ej. Toneladas de residuos, Consumo hídrico, Emisiones) manuales. La periodicidad de carga de los indicadores de un gobierno local es relativo (diario, semanal o mensual).
  - [ ] Definir UX para la selección de indicadores desde el catalogo o la carga de indicadores manualmente (sea formulario o sea excel). 
- [ ] **Dashboard Visual**:
  - [ ] Crear visualización de registros históricos + indicadores cargados manualmente + indicadores futuros. El usuario puede ver el comportamiento individual de cada indicador en su territorio (por ejemplo, como ha variado el crecimiento de los residuos en su territorio, reciclaje, agua consumida, electricidad consumida, entre otros.)
  - [ ] Gráficos de tendencia (Línea/Barras) para los indicadores cargados.
  - [ ] Tarjetas de resumen (KPIs del mes actual vs anterior).
  - [ ] Idealmente, crear breve resumen que describa la situación de la comuna/territorio respecto a cada indicador. Por ejemplo, si el indicador es el consumo de agua, el resumen podría ser "El consumo de agua en la comuna X ha disminuido en el último año en Y%". Su comportamiento muestra un crecimiento negativo los últimos 5 años. Comparativamente, su comuna se encuentra de los municipios con menor consumo de agua."
- [ ] **Funcionalidad Clave**:
  - [ ] Exportación simple de datos (CSV/Excel) o vista de impresión de reporte.
  - [ ] Exportación de reporte en formato PDF (opción 1, opción 2 es Word).
  - [ ] Permitir la creación de reportes personalizados asociados a su territorio (seleccionar indicadores, fechas, sumar gráficos, tablas, resumenes, etc.).

## 4. Infraestructura y Lanzamiento
**Objetivo:** Puesta en producción.
- [ ] **Despliegue**:
  - [ ] Configuración final en Vercel.
  - [ ] Verificación de variables de entorno en producción.
- [ ] **QA Básico**:
  - [ ] Prueba de flujo completo: Registro -> Carga de dato -> Visualización.
- [ ] **Lanzamiento**:
  - [ ] Publicación oficial de la URL.

---
**Estado Actual:** Fase 1 (Homepage) al 90%. Iniciando Fase 2.
