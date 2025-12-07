-- ===================================================
-- TABLA USER_PREFERENCES - Sistema de Notificaciones
-- ===================================================
-- Fecha: 2024-12-04
-- Propósito: Permitir a los usuarios controlar sus preferencias de notificaciones
-- y frecuencia de emails digest

-- 1. Crear tabla principal
CREATE TABLE user_preferences (
    user_id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    
    -- Frecuencia de emails digest
    email_digest_frequency VARCHAR(20) DEFAULT 'weekly' 
        CHECK (email_digest_frequency IN ('daily', 'weekly', 'never')),
    
    -- Tipos de notificaciones (activadas por defecto para buena UX)
    notify_document_expiry BOOLEAN DEFAULT true,
    notify_platform_updates BOOLEAN DEFAULT true,
    notify_calendar_events BOOLEAN DEFAULT true,
    notify_user_actions BOOLEAN DEFAULT true,
    
    -- Metadata
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- 2. Índice para queries rápidas
CREATE INDEX idx_user_preferences_user_id ON user_preferences(user_id);

-- 3. Trigger para auto-actualizar updated_at
CREATE OR REPLACE FUNCTION update_user_preferences_updated_at()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_update_user_preferences_updated_at
    BEFORE UPDATE ON user_preferences
    FOR EACH ROW
    EXECUTE FUNCTION update_user_preferences_updated_at();

-- 4. Trigger para crear preferencias automáticamente cuando se crea un usuario
CREATE OR REPLACE FUNCTION create_default_user_preferences()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO public.user_preferences (user_id)
    VALUES (NEW.id)
    ON CONFLICT (user_id) DO NOTHING;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Drop trigger if exists to allow re-running this migration
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;

CREATE TRIGGER on_auth_user_created
    AFTER INSERT ON auth.users
    FOR EACH ROW
    EXECUTE FUNCTION create_default_user_preferences();

-- 5. Crear preferencias para usuarios existentes (migración de datos)
INSERT INTO user_preferences (user_id)
SELECT id FROM auth.users
ON CONFLICT (user_id) DO NOTHING;

-- 6. RLS (Row Level Security) Policies
ALTER TABLE user_preferences ENABLE ROW LEVEL SECURITY;

-- Policy: Los usuarios solo pueden ver sus propias preferencias
CREATE POLICY "Users can view their own preferences"
    ON user_preferences
    FOR SELECT
    USING (auth.uid() = user_id);

-- Policy: Los usuarios solo pueden actualizar sus propias preferencias
CREATE POLICY "Users can update their own preferences"
    ON user_preferences
    FOR UPDATE
    USING (auth.uid() = user_id);

-- Policy: Permitir INSERT para el trigger (SECURITY DEFINER ya lo maneja, pero por si acaso)
CREATE POLICY "Allow insert for authenticated users"
    ON user_preferences
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- 7. Comentarios descriptivos
COMMENT ON TABLE user_preferences IS 'Preferencias de notificación y configuración de usuario';
COMMENT ON COLUMN user_preferences.email_digest_frequency IS 'Frecuencia de envío de emails: daily, weekly, never';
COMMENT ON COLUMN user_preferences.notify_document_expiry IS 'Recibir alertas de documentos por vencer';
COMMENT ON COLUMN user_preferences.notify_platform_updates IS 'Recibir novedades de la plataforma (changelog)';
COMMENT ON COLUMN user_preferences.notify_calendar_events IS 'Recibir recordatorios de hitos del calendario';
COMMENT ON COLUMN user_preferences.notify_user_actions IS 'Recibir notificaciones de acciones de otros usuarios (ej: te asignaron un documento)';

-- ===================================================
-- VERIFICACIÓN POST-MIGRACIÓN
-- ===================================================

-- Query de verificación (ejecutar después de aplicar migración):
-- SELECT COUNT(*) as total_preferences FROM user_preferences;
-- Debe ser igual al número de usuarios en auth.users

-- Query de test:
-- SELECT * FROM user_preferences WHERE user_id = auth.uid();
