-- ===================================================
-- MÓDULO DE NOVEDADES Y NOTIFICACIONES
-- ===================================================

-- 1. Actualizaciones de Plataforma (Changelog y Hoja de Ruta)
-- Esta tabla alimenta la sección "Novedades" -> Plataforma / Hoja de Ruta
CREATE TABLE platform_updates (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) CHECK (category IN ('platform', 'data', 'roadmap')),
    type VARCHAR(50) CHECK (type IN ('new', 'improvement', 'fix', 'announcement')),
    version VARCHAR(20), -- Ej: v1.2.0
    status VARCHAR(50) DEFAULT 'published' CHECK (status IN ('draft', 'published', 'planned')),
    scheduled_for DATE, -- Para items del Roadmap (ej: Q1 2025)
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    created_by UUID REFERENCES auth.users(id)
);

CREATE INDEX idx_platform_updates_category ON platform_updates(category);
CREATE INDEX idx_platform_updates_date ON platform_updates(created_at DESC);

-- 2. Notificaciones de Usuario (Campana)
-- Alertas específicas para el usuario o su organización
CREATE TABLE notifications (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE,
    organization_id UUID REFERENCES organizations(id),
    title VARCHAR(255) NOT NULL,
    message TEXT,
    type VARCHAR(50) CHECK (type IN ('info', 'success', 'warning', 'error')),
    link VARCHAR(255), -- URL a la que dirige al hacer click
    is_read BOOLEAN DEFAULT false,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_notifications_user ON notifications(user_id);
CREATE INDEX idx_notifications_unread ON notifications(user_id) WHERE is_read = false;

-- (La tabla strategic_documents ya existe en el schema principal y se usará para gestión documental)
