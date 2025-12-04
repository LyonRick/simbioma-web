-- ===================================================
-- MEJORA MÓDULO CALENDARIO (Sistema de Inteligencia Temporal)
-- ===================================================

-- Tabla unificada para eventos globales (Simbioma) y privados (Organización)
CREATE TABLE calendar_events (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE, -- NULL = Evento Global (Simbioma)
  
  title TEXT NOT NULL,
  description TEXT,
  event_date DATE NOT NULL,
  
  -- Clasificación Estratégica
  category VARCHAR(50) CHECK (category IN ('normativo', 'efemeride', 'regenerativo', 'gestion', 'personal')),
  priority_level VARCHAR(20) CHECK (priority_level IN ('high', 'medium', 'low')) DEFAULT 'medium',
  
  -- Metadatos UI/UX
  icon_name VARCHAR(50), -- Nombre del icono Lucide (ej: "leaf", "alert-triangle")
  color_code VARCHAR(20), -- Hex code para renderizado custom
  
  -- Funcionalidad
  action_link TEXT, -- Deep link a la acción sugerida (ej: /dashboard/reportes/sinader)
  is_recurring BOOLEAN DEFAULT FALSE,
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  created_by UUID REFERENCES auth.users(id)
);

-- Índices para búsqueda rápida por fecha y organización
CREATE INDEX idx_calendar_date ON calendar_events(event_date);
CREATE INDEX idx_calendar_org ON calendar_events(organization_id);

-- RLS Policies (Conceptuales)
-- 1. Eventos Globales (organization_id IS NULL): Visibles para todos via SELECT.
-- 2. Eventos Privados: Visibles solo para usuarios de la misma organization_id.

-- ===================================================
-- MEJORA MÓDULO DOCUMENTOS (Biblioteca Colaborativa)
-- ===================================================

-- Modificamos la tabla existente para soportar el concepto de Biblioteca
ALTER TABLE strategic_documents 
ADD COLUMN visibility VARCHAR(20) DEFAULT 'private' CHECK (visibility IN ('private', 'public', 'official')),
ADD COLUMN tags TEXT[], -- Array de etiquetas para búsqueda facetada
ADD COLUMN download_count INT DEFAULT 0,
ADD COLUMN is_verified BOOLEAN DEFAULT FALSE; -- Para documentos públicos subidos por usuarios, verificados por Simbioma

-- Comentarios de Arquitectura
COMMENT ON COLUMN calendar_events.organization_id IS 'Si es NULL, es un evento maestro de Simbioma visible para todos';
COMMENT ON COLUMN strategic_documents.visibility IS 'official: Subido por Simbioma (Leyes), public: Compartido por comunidad, private: Interno';
