# Sistema de Notificaciones Simbioma - Arquitectura v1.0

## 1. Visión General
El sistema de notificaciones tiene como objetivo mantener informados a los usuarios sobre eventos críticos, tareas pendientes y actualizaciones de la plataforma, sin saturar su atención. Se utiliza un enfoque híbrido de notificaciones **In-App (Campana)** para operatividad diaria y **Email** para eventos críticos o de seguridad.

## 2. Matriz de Eventos y Canales
Basado en los módulos actualmente instalados (Gestión de Usuarios, Documentos, Calendario, Plataforma).

| Módulo | Evento / Acción | Disparador | Canal: In-App 🔔 | Canal: Email 📧 | Nivel de Prioridad | Configurable? |
| :--- | :--- | :--- | :---: | :---: | :---: | :---: |
| **Auth & Usuarios** | Invitación a Organización | Admin invita usuario | ✅ | ✅ | Alta | No |
| | Cambio de Rol | Admin cambia rol | ✅ | ❌ | Media | Sí |
| | Nuevo inicio de sesión | Login en dispositivo nuevo | ❌ | ✅ | Alta (Seguridad) | Sí |
| **Documentos** | Documento por vencer (30 días) | Cron Job diario | ✅ | ✅ | Media | Sí |
| | Documento por vencer (7 días) | Cron Job diario | ✅ | ✅ | Alta | Sí |
| | Documento Vencido | Cron Job diario | ✅ | ✅ | Crítica | No |
| | Nuevo documento asignado | Usuario sube doc | ✅ | ❌ | Baja | Sí |
| **Calendario** | Hito próximo (24h) | Cron Job diario | ✅ | ❌ | Media | Sí |
| | Hito Nacional (Efeméride) | Fecha del sistema | ✅ | ❌ | Baja | Sí |
| **Plataforma** | Nueva Funcionalidad (Changelog) | Admin publica update | ✅ | ❌ | Baja | Sí |
| | Mantenimiento Programado | Admin sistema | ✅ | ✅ | Alta | No |

## 3. Flujos de Trabajo (Workflows)

### 3.1. Flujo de Notificación In-App (Campana)
1.  **Evento**: Ocurre una acción (ej. Admin publica novedad).
2.  **Generación**: Se crea registro en tabla `notifications`.
    *   `user_id`: ID del usuario destino (o NULL si es broadcast a organización).
    *   `type`: 'info', 'warning', 'success'.
    *   `is_read`: false.
3.  **Entrega**:
    *   El cliente (Frontend) consulta `notifications` donde `is_read = false`.
    *   Se actualiza el contador en el icono de campana.
    *   (Futuro) Supabase Realtime empuja la notificación al instante.

### 3.2. Flujo de Notificación por Email
1.  **Evento**: Ocurre evento crítico (ej. Vencimiento de permiso).
2.  **Verificación de Preferencias**: Se consulta tabla `user_preferences` (pendiente de crear) para ver si el usuario tiene activo ese tipo de notificación.
3.  **Envío**:
    *   Se llama a Supabase Edge Function o API Route.
    *   Se usa proveedor (Resend/SendGrid) para enviar template HTML.
4.  **Log**: Se registra el envío para auditoría.

## 4. Estructura de Datos

### Tabla `notifications` (Ya creada)
Almacena el historial y estado de lectura.
```sql
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id),
    organization_id UUID REFERENCES organizations(id),
    title VARCHAR(255) NOT NULL,
    message TEXT,
    type VARCHAR(50), -- info, success, warning, error
    link VARCHAR(255), -- Deep link al recurso
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

### Tabla `user_preferences` (**RECOMENDADA** - Prioridad Alta)
Controla qué notificaciones desea recibir el usuario.

> 📖 **Análisis Técnico Completo**: Ver `docs/architecture/user-preferences-analysis.md`
> - ✅ Reduce costos de email en ~60%
> - ✅ Mejora UX y compliance legal
> - ✅ Overhead mínimo (~50ms por query)

```sql
CREATE TABLE user_preferences (
    user_id UUID PRIMARY KEY REFERENCES auth.users(id),
    email_digest_frequency VARCHAR(20) DEFAULT 'weekly', -- daily, weekly, never
    notify_document_expiry BOOLEAN DEFAULT true,
    notify_platform_updates BOOLEAN DEFAULT true,
    notify_calendar_events BOOLEAN DEFAULT true,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);
```

## 5. Integración con Frontend

### Componente `DashboardHeader` (Campana)
*   **Polling**: Consulta `count(*)` de notificaciones no leídas cada X minutos (o al cargar página).
*   **Interacción**:
    *   Click en campana -> Abre Popover.
    *   Click en notificación -> Marca como leída (`is_read = true`) y redirige al `link`.
    *   "Marcar todas como leídas" -> Update masivo.

### Página `/dashboard/configuracion` (Tab Notificaciones)
*   Debe leer y escribir en la tabla `user_preferences`.
*   Switches actuales en UI deben conectarse a las columnas booleanas propuestas.

## 6. Próximos Pasos de Implementación
1.  Crear tabla `user_preferences`.
2.  Implementar triggers o Cron Jobs (pg_cron en Supabase) para chequear vencimientos de `strategic_documents`.
3.  Conectar switches de configuración a la DB.
