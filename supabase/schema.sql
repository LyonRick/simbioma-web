-- ===================================================
-- SCHEMA SIMBIOMA v4.0 - SINCRONIZADO CON SUPABASE
-- Fecha: 2025-12-02
-- Estado: PRODUCCIÓN
-- ===================================================

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ===================================================
-- 1. GEOGRAFÍA (Países, Regiones, Comunas)
-- ===================================================

-- Nota: Tablas countries, geo_regions, geo_communes ya pobladas
-- Ver scripts/migration-chile-geography.sql

-- ===================================================
-- 2. SUBSCRIPTION PLANS
-- ===================================================

CREATE TABLE subscription_plans (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(50) UNIQUE NOT NULL,
    name TEXT NOT NULL,
    description TEXT,
    price_clp NUMERIC(10, 2),
    price_usd NUMERIC(10, 2),
    features JSONB,
    sector VARCHAR(50) CHECK (sector IN ('private', 'public')),
    max_custom_indicators INTEGER,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================
-- 3. ORGANIZATIONS (Unificada - v4.0)
-- ===================================================

CREATE TABLE organizations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tax_id VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    fantasy_name VARCHAR(255),
    type VARCHAR(50) NOT NULL 
        CHECK (type IN ('municipality', 'gore', 'company', 'ngo', 'ministry')),
    industry_sector VARCHAR(100),
    parent_organization_id UUID REFERENCES organizations(id),
    geo_region_id UUID REFERENCES geo_regions(id),
    geo_commune_id UUID REFERENCES geo_communes(id),
    address TEXT,
    country_id INTEGER REFERENCES countries(id),
    subscription_plan_id UUID REFERENCES subscription_plans(id),
    is_active BOOLEAN DEFAULT true,
    settings JSONB DEFAULT '{}'::jsonb,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_org_type ON organizations(type);
CREATE INDEX idx_org_location ON organizations(geo_region_id, geo_commune_id);
CREATE INDEX idx_org_parent ON organizations(parent_organization_id);
CREATE INDEX idx_org_tax_id ON organizations(tax_id);

-- ===================================================
-- 4. USERS (v4.0 - FK directa a organizations)
-- ===================================================

CREATE TABLE users (
    id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
    email VARCHAR(255),
    full_name VARCHAR(255),
    organization_id UUID REFERENCES organizations(id),
    role VARCHAR(50) DEFAULT 'member'
        CHECK (role IN ('superadmin', 'admin', 'editor', 'viewer', 'member')),
    electronic_signature_cert VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_users_org ON users(organization_id);
CREATE INDEX idx_users_role ON users(role);

-- ===================================================
-- 5. ESTABLISHMENTS (SINADER - Instalaciones físicas)
-- ===================================================

CREATE TABLE establishments (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    name VARCHAR(255) NOT NULL,
    vu_code VARCHAR(50),
    geo_commune_id UUID REFERENCES geo_communes(id),
    address TEXT,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_establishments_org ON establishments(organization_id);
CREATE INDEX idx_establishments_commune ON establishments(geo_commune_id);

-- ===================================================
-- 6. INDICATORS (Catálogo de indicadores)
-- ===================================================

CREATE TABLE indicators (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    code VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    unit VARCHAR(50),
    namespace VARCHAR(100) DEFAULT 'global',
    system_type VARCHAR(50) CHECK (system_type IN ('public', 'private', 'custom')),
    dimensions_schema JSONB,
    frequency VARCHAR(50),
    approval_status VARCHAR(50) DEFAULT 'draft'
        CHECK (approval_status IN ('draft', 'active', 'deprecated', 'archived')),
    creator_type VARCHAR(50),
    creator_id UUID,
    parent_indicator_id UUID REFERENCES indicators(id),
    superseded_by_indicator_id UUID REFERENCES indicators(id),
    version_notes TEXT,
    valid_from DATE,
    valid_until DATE,
    tags TEXT[],
    industry_sectors TEXT[],
    subscriptions_count INTEGER DEFAULT 0,
    values_count INTEGER DEFAULT 0,
    last_used_at TIMESTAMP WITH TIME ZONE,
    metadata JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_indicators_code ON indicators(code);
CREATE INDEX idx_indicators_status ON indicators(approval_status);

-- ===================================================
-- 7. INDICATOR VERSIONS (Versionado de fórmulas)
-- ===================================================

CREATE TABLE indicator_versions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    indicator_id UUID REFERENCES indicators(id) ON DELETE CASCADE,
    version_number INTEGER NOT NULL,
    formula_expression TEXT,
    aggregation_method VARCHAR(50),
    valid_from DATE NOT NULL,
    valid_until DATE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    UNIQUE (indicator_id, version_number)
);

CREATE INDEX idx_indicator_versions_indicator ON indicator_versions(indicator_id);

-- ===================================================
-- 8. INDICATOR RECORDS (Time-Series - v4.0)
-- ===================================================

CREATE TABLE indicator_records (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    indicator_id UUID REFERENCES indicators(id) ON DELETE CASCADE,
    indicator_version_id UUID REFERENCES indicator_versions(id),
    organization_id UUID REFERENCES organizations(id) ON DELETE CASCADE,
    measured_at TIMESTAMP WITH TIME ZONE NOT NULL,
    period_start DATE,
    period_end DATE,
    numeric_value NUMERIC(20, 5),
    text_value TEXT,
    boolean_value BOOLEAN,
    json_value JSONB,
    dimensions JSONB,
    record_version INTEGER DEFAULT 1,
    is_current BOOLEAN DEFAULT true,
    superseded_by_id UUID REFERENCES indicator_records(id),
    created_by UUID REFERENCES users(id),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_indicator_records_indicator ON indicator_records(indicator_id);
CREATE INDEX idx_indicator_records_org ON indicator_records(organization_id);
CREATE INDEX idx_indicator_records_time ON indicator_records(measured_at);
CREATE INDEX idx_indicator_records_period ON indicator_records(period_start, period_end);
CREATE INDEX idx_indicator_records_dims ON indicator_records USING gin(dimensions);
CREATE INDEX idx_indicator_records_current ON indicator_records(indicator_id, organization_id) WHERE is_current = true;

-- ===================================================
-- 9. ORGANIZATION INDICATOR SUBSCRIPTIONS
-- ===================================================

CREATE TABLE organization_indicator_subscriptions (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    indicator_id UUID REFERENCES indicators(id),
    subscription_status VARCHAR(50) DEFAULT 'active'
        CHECK (subscription_status IN ('active', 'deprecated_for_us', 'pending_migration', 'replaced_by')),
    replaced_by_indicator_id UUID REFERENCES indicators(id),
    active_from DATE,
    active_until DATE,
    values_count INTEGER DEFAULT 0,
    is_primary BOOLEAN DEFAULT false,
    usage_notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_org_ind_subs_org ON organization_indicator_subscriptions(organization_id);
CREATE INDEX idx_org_ind_subs_indicator ON organization_indicator_subscriptions(indicator_id);

-- ===================================================
-- 10. INDICATOR RECOMMENDATIONS
-- ===================================================

CREATE TABLE indicator_recommendations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    target_type VARCHAR(50) CHECK (target_type IN ('industry_sector', 'organization_size', 'region', 'all')),
    target_value VARCHAR(100),
    indicator_id UUID REFERENCES indicators(id),
    recommendation_level VARCHAR(50) CHECK (recommendation_level IN ('required', 'highly_recommended', 'suggested', 'optional')),
    adoption_rate DECIMAL,
    reason TEXT
);

-- ===================================================
-- 11. INDICATOR AGGREGATION RULES
-- ===================================================

CREATE TABLE indicator_aggregation_rules (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    indicator_id UUID REFERENCES indicators(id),
    aggregation_behavior VARCHAR(100),
    min_entities_for_aggregation INTEGER,
    privacy_threshold INTEGER
);

-- ===================================================
-- 12. INDICATOR MIGRATION REQUESTS
-- ===================================================

CREATE TABLE indicator_migration_requests (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    from_indicator_id UUID REFERENCES indicators(id),
    to_indicator_id UUID REFERENCES indicators(id),
    status VARCHAR(50) DEFAULT 'pending'
        CHECK (status IN ('pending', 'in_progress', 'completed', 'rejected')),
    values_migrated_count INTEGER DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================
-- 13. METAS (Objetivos)
-- ===================================================

CREATE TABLE metas (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    indicator_id UUID REFERENCES indicators(id),
    target_value DECIMAL,
    target_date DATE,
    description TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_metas_org ON metas(organization_id);

-- ===================================================
-- 14. DATA SOURCES (Fuentes de datos externas)
-- ===================================================

CREATE TABLE data_sources (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    type VARCHAR(50) CHECK (type IN ('api', 'file', 'manual', 'iot')),
    scope VARCHAR(100),
    connection_config JSONB,
    sync_frequency VARCHAR(50),
    api_key_encrypted TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE organization_data_sources (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    data_source_id UUID REFERENCES data_sources(id),
    indicator_mapping JSONB,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================
-- 15. PROJECTS
-- ===================================================

CREATE TABLE projects (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    parent_project_id UUID REFERENCES projects(id),
    requires_financial_breakdown BOOLEAN DEFAULT false,
    electronic_signature_url VARCHAR(255),
    status VARCHAR(50),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_projects_org ON projects(organization_id);

CREATE TABLE project_financial_breakdown (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id),
    expense_category VARCHAR(100),
    amount_allocated_clp DECIMAL,
    amount_executed_clp DECIMAL,
    is_public BOOLEAN DEFAULT false
);

CREATE TABLE project_partners (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    project_id UUID REFERENCES projects(id),
    organization_id UUID REFERENCES organizations(id),
    role VARCHAR(100),
    contract_signature_url VARCHAR(255)
);

-- ===================================================
-- 16. DOCUMENTS & REPORTS
-- ===================================================

CREATE TABLE strategic_documents (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    title VARCHAR(255),
    parent_document_id UUID REFERENCES strategic_documents(id),
    electronic_signature_url VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_strategic_docs_org ON strategic_documents(organization_id);

CREATE TABLE reports (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    title VARCHAR(255),
    parent_report_id UUID REFERENCES reports(id),
    period_start DATE,
    period_end DATE,
    electronic_signature_url VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_reports_org ON reports(organization_id);

-- ===================================================
-- 17. SINADER - CATÁLOGOS
-- ===================================================

CREATE TABLE ler_codes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(8) UNIQUE NOT NULL,
    chapter_code VARCHAR(2) NOT NULL,
    chapter_description TEXT,
    subchapter_code VARCHAR(5) NOT NULL,
    subchapter_description TEXT,
    specific_code VARCHAR(8) NOT NULL,
    description TEXT NOT NULL,
    is_hazardous BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_ler_codes_code ON ler_codes(code);

CREATE TABLE waste_treatments (
    id SERIAL PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,
    subcategory VARCHAR(100),
    is_active BOOLEAN DEFAULT TRUE,
    notes TEXT,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_waste_treatments_category ON waste_treatments(category);

-- ===================================================
-- 18. SINADER - DECLARACIONES DE RESIDUOS
-- ===================================================

CREATE TABLE waste_declarations (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    establishment_id UUID REFERENCES establishments(id),
    ler_code_id INTEGER REFERENCES ler_codes(id),
    treatment_id INTEGER REFERENCES waste_treatments(id),
    period_date DATE NOT NULL,
    quantity_kg NUMERIC(15, 3) NOT NULL,
    recipient_tax_id VARCHAR(20),
    transporter_tax_id VARCHAR(20),
    foreign_recipient_data JSONB,
    status VARCHAR(50) DEFAULT 'draft'
        CHECK (status IN ('draft', 'submitted', 'rectified')),
    submitted_at TIMESTAMP WITH TIME ZONE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_waste_decl_establishment ON waste_declarations(establishment_id);
CREATE INDEX idx_waste_decl_period ON waste_declarations(period_date);
CREATE INDEX idx_waste_decl_status ON waste_declarations(status);

-- ===================================================
-- 19. AUDIT & BILLING
-- ===================================================

CREATE TABLE audit_logs (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    user_id UUID REFERENCES users(id),
    action VARCHAR(100),
    table_name VARCHAR(100),
    record_id UUID,
    old_values JSONB,
    new_values JSONB,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_audit_logs_org ON audit_logs(organization_id);
CREATE INDEX idx_audit_logs_user ON audit_logs(user_id);
CREATE INDEX idx_audit_logs_created ON audit_logs(created_at);

CREATE TABLE billing_history (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    organization_id UUID REFERENCES organizations(id),
    subscription_plan_id UUID REFERENCES subscription_plans(id),
    period_start DATE,
    period_end DATE,
    amount_clp NUMERIC(10, 2),
    payment_status VARCHAR(50),
    electronic_invoice_url VARCHAR(255),
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- ===================================================
-- 20. WAITLIST (Lista de espera Beta) - ACTUALIZADA
-- ===================================================

CREATE TABLE waitlist (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    
    -- Información de contacto
    email VARCHAR(255) UNIQUE NOT NULL,
    full_name VARCHAR(255),
    phone VARCHAR(50),
    
    -- Información de organización
    organization_name VARCHAR(255),
    organization_type VARCHAR(50) 
        CHECK (organization_type IN ('municipality', 'gore', 'company', 'ngo', 'other')),
    
    -- Geografía
    country_id INTEGER REFERENCES countries(id),
    country_code VARCHAR(2),
    
    -- Contexto
    notes TEXT,
    
    -- Tracking
    status VARCHAR(50) DEFAULT 'pending'
        CHECK (status IN ('pending', 'contacted', 'demo_scheduled', 'onboarded', 'rejected')),
    
    -- Timestamps
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    
    -- Marketing attribution
    source VARCHAR(50),
    utm_campaign VARCHAR(100),
    utm_source VARCHAR(100),
    utm_medium VARCHAR(100)
);

CREATE INDEX idx_waitlist_org_type ON waitlist(organization_type);
CREATE INDEX idx_waitlist_country ON waitlist(country_id);
CREATE INDEX idx_waitlist_status ON waitlist(status);
CREATE INDEX idx_waitlist_source ON waitlist(source);
CREATE INDEX idx_waitlist_created_at ON waitlist(created_at DESC);

-- ===================================================
-- TRIGGERS
-- ===================================================

-- Trigger para auto-crear perfil de usuario
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS trigger AS $$
BEGIN
  INSERT INTO public.users (id, email)
  VALUES (new.id, new.email);
  RETURN new;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

CREATE OR REPLACE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE PROCEDURE public.handle_new_user();

-- Trigger para updated_at en waitlist
CREATE OR REPLACE FUNCTION update_waitlist_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER waitlist_updated_at
  BEFORE UPDATE ON waitlist
  FOR EACH ROW
  EXECUTE FUNCTION update_waitlist_timestamp();

-- ===================================================
-- COMENTARIOS
-- ===================================================

COMMENT ON TABLE organizations IS 'Tabla unificada de organizaciones (gobiernos + empresas)';
COMMENT ON TABLE users IS 'Perfiles de usuario con FK directa a organizations';
COMMENT ON TABLE indicator_records IS 'Modelo time-series para valores de indicadores (v4.0)';
COMMENT ON TABLE establishments IS 'Instalaciones físicas para SINADER';
COMMENT ON TABLE waste_declarations IS 'Declaraciones de residuos SINADER';
COMMENT ON TABLE waitlist IS 'Lista de espera pre-lanzamiento Beta';
