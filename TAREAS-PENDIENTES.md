# 📋 Tareas Pendientes Priorizadas

**Fecha**: 03-12-2024
**Estado**: En progreso

## 🔴 Alta Prioridad (Para Mañana)

### 1. Gestión de Usuarios (Backend)
- [x] **Implementar Server Action para Invitar Usuarios**:
  - Usar `supabase.auth.admin.inviteUserByEmail` (requiere `SUPABASE_SERVICE_ROLE_KEY`).
  - Crear perfil en `public.users` vinculado a la organización del admin.
  - Enviar email de invitación (o link manual si no hay SMTP configurado).
- [x] **Implementar Desactivación de Usuarios**:
  - Agregar campo `status` ('active', 'inactive') a tabla `users` (si no existe) o usar soft delete.
  - Actualizar UI para reflejar estado inactivo.

### 2. Módulo de Indicadores (Frontend)
- [x] **Crear página `/dashboard/indicadores`**:
  - Reutilizar `IndicadoresView.tsx` de Figma.
  - Adaptar a datos reales (o mock inicial estructurado).
  - Implementar filtros por categoría (Agua, Aire, Residuos).

### 3. Módulo Calendar (Frontend)
- [x] **Crear página `/dashboard/calendario`**:
  - Reutilizar `CalendarWidget.tsx`.
  - Integrar hitos ambientales nacionales (hardcoded o DB).
  - Permitir CRUD de hitos personales.

### 4. Nuevos Módulos (Completados)
- [x] **Centro de Novedades (`/dashboard/novedades`)**:
  - Tabs: Plataforma, Datos, Hoja de Ruta.
  - Paginación reutilizable.
  - Schema SQL definido (`platform_updates`).
- [x] **Gestión Documental (`/dashboard/documentos`)**:
  - UI de explorador de archivos.
  - Schema SQL definido (`documents`).
- [x] **Notificaciones**:
  - Popover en Header.
  - Schema SQL definido (`notifications`).

### 5. Integración Backend (NUEVA PRIORIDAD ALTA)
- [ ] **Conectar Centro de Novedades a Base de Datos**:
  - Reemplazar mocks con query a `platform_updates`.
  - Implementar Server Action para crear/editar actualizaciones (solo admin).
  - Filtrado dinámico por categoría desde DB.
  
- [ ] **Conectar Calendario a Base de Datos**:
  - Query a `calendar_events` para eventos globales (`organization_id IS NULL`) y propios.
  - Server Action para CRUD de eventos personales.
  - Poblar DB con dataset maestro 2025 (script SQL).

- [ ] **Conectar Notificaciones**:
  - Server Action para marcar como leída (`UPDATE notifications SET is_read = true`).
  - Query real en DashboardHeader (reemplazar mock).
  - Link dinámico desde notificación al recurso (`link` column).

- [ ] **Biblioteca Documental + Supabase Storage**:
  - Crear bucket `documents` en Supabase Storage.
  - Server Action para upload de archivos.
  - Query a `strategic_documents` con filtro por `visibility`.
  - Implementar descarga de archivos desde Storage.

## 🟡 Media Prioridad

### 4. Refinamiento UI/UX
- [ ] **Dark Mode**: Revisar contraste en tablas y tarjetas de configuración.
- [ ] **Mobile**: Verificar responsividad de tabs en Configuración.

### 5. Persistencia de Preferencias (Notificaciones)
- [ ] **Crear tabla `user_preferences`**:
  - Campos: `notify_document_expiry`, `notify_platform_updates`, `notify_calendar_events`.
  - Vincular con ID de usuario (1:1).
- [ ] **Conectar Frontend**:
  - Actualizar `/dashboard/configuracion` (Tab Notificaciones) para leer/escribir en esta tabla.
  - Implementar lógica de guardado (Server Action).

## 🟢 Baja Prioridad

- [ ] **Facturación**: Implementar vista de historial de pagos (solo mock por ahora).
- [ ] **2FA**: Investigar implementación con Supabase Auth.

---

## 📝 Notas Técnicas
- Para la invitación de usuarios, recordar que `auth.admin` solo está disponible en el servidor. Crear un archivo `app/actions/users.ts` con `use server`.
- Revisar si la tabla `users` tiene restricciones de FK que impidan borrar usuarios fácilmente (mejor usar `status` column).
