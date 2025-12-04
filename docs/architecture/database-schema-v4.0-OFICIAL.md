# 🗄️ SCHEMA OFICIAL SIMBIOMA v4.0

**Versión**: 4.0 DEFINITIVO  
**Fecha**: 2025-11-30  
**Estado**: PRODUCCIÓN  
**Archivo SQL**: [`schema_final_v4.0.sql`](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_final_v4.0.sql)

---

## 📋 RESUMEN EJECUTIVO

### Total de Tablas: 28

El schema v4.1 combina:
1. ✅ Mejoras estructurales de v3.1 (Organizaciones unificadas, Geografía LATAM, RLS)
2. ✅ Funcionalidades avanzadas restauradas (Versionado, Metas, Fuentes de Datos)
3. ✅ Nuevo módulo Time-Series para Indicadores
4. ✅ Módulo SINADER completo (Gestión de Residuos)
5. ✅ **Geografía estandarizada ISO-3166** (v4.1)

---

## 🗂️ ESTRUCTURA COMPLETA DEL SCHEMA

### **1. GEOGRAFÍA INTERNACIONAL (4 tablas)** ⭐ **ACTUALIZADO v4.1**

#### `countries` ⭐ **ESTANDARIZADO ISO-3166**
- **Propósito**: Países donde opera Simbioma
- **Campos clave**: 
  - `id`: INT (ISO-3166 country-code, ej: 152 para Chile)
  - `alpha_2`: VARCHAR(2) UNIQUE ('CL')
  - `alpha_3`: VARCHAR(3) UNIQUE ('CHL')
  - `region`, `sub_region`: Clasificación geográfica ISO
  - `currency_code`, `tax_id_name`: Metadata fiscal
- **Estado**: Poblado con Chile (152)

#### `division_types` ⭐ **NUEVA - PREPARACIÓN LATAM**
- **Propósito**: Metadata de nomenclatura de divisiones por país
- **Campos clave**:
  - `level`: 1 (Región), 2 (Provincia), 3 (Comuna)
  - `canonical_name`: 'region', 'province', 'commune'
  - `local_name`: 'Región', 'Provincia', 'Comuna'
- **Estado**: Poblado con Chile, listo para Perú/Colombia

#### `geo_regions`
- **Propósito**: Regiones administrativas por país
- **Relación**: N:1 con `countries`
- **Campos clave**: `local_code` (namespacedos por país)
- **Estado**: Poblado con 16 regiones de Chile

#### `geo_communes`
- **Propósito**: Comunas/municipios
- **Relación**: N:1 con `geo_regions`
- **Campos clave**: 
  - `local_code`: Código CUT 2018 (ej: '13101')
  - `province_name`, `province_code`: Metadata (sin FK)
- **Estado**: Poblado con 346 comunas de Chile

---

### **2. SUSCRIPCIONES (1 tabla)**

#### `subscription_plans`
- **Propósito**: Planes de suscripción
- **Campos clave**: 
  - `code`: Identificador único (ej: 'pro_muni_cl')
  - `sector`: 'private' | 'public'
  - `features`: JSONB con características habilitadas
  - `max_custom_indicators`: Límite de indicadores custom

---

### **3. ORGANIZACIONES (2 tablas)**

#### `organizations` ⭐ **TABLA UNIFICADA**
- **Propósito**: Reemplaza `gobierno_local` y `actors` del schema original
- **Campos clave**:
  - `type`: 'municipality' | 'gore' | 'company' | 'ngo' | 'ministry'
  - `tax_id`: RUT u otro identificador fiscal (ÚNICO por país)
  - `geo_commune_id`: Ubicación geográfica
  - `parent_organization_id`: Jerarquía (ej: Municipio → GORE)
- **Índices**: tax_id, type, location, parent

#### `users`
- **Propósito**: Usuarios de la plataforma
- **Relación**: N:1 con `organizations` (FK REAL, no polimórfica)
- **Campos nuevos vs original**:
  - `email`, `full_name`: Evita JOINs con auth.users
  - `role`: RBAC ('admin', 'editor', 'member')

---

### **4. ESTABLECIMIENTOS (1 tabla)**

#### `establishments` ⭐ **NUEVO - CRÍTICO PARA SINADER**
- **Propósito**: Unidades físicas de una organización
- **Ejemplo**: Una empresa puede tener múltiples plantas/instalaciones
- **Campos clave**:
  - `organization_id`: FK a `organizations`
  - `vu_code`: Código Ventanilla Única (SINADER)
  - `geo_commune_id`: Ubicación específica

---

### **5. INDICADORES - MÓDULO TIME-SERIES (7 tablas)**

#### `indicators` ⭐ **MEJORADO vs original**
- **Propósito**: Catálogo de indicadores (públicos y custom)
- **Campos clave**:
  - `code`: Identificador único alfanumérico
  - `namespace`: 'global' | 'custom'
  - `system_type`: 'public' | 'private' | 'custom'
  - `dimensions_schema`: JSONB para dimensiones (ej: gases específicos)
  - `frequency`: 'realtime' | 'hourly' | 'daily' | 'monthly' | 'annual'
  - `approval_status`: 'draft' | 'active' | 'deprecated' | 'archived'

#### `indicator_versions` ⭐ **NUEVA - GESTIÓN DE FÓRMULAS**
- **Propósito**: Permite cambiar la fórmula de cálculo sin perder histórico
- **Campos clave**:
  - `indicator_id`: FK a `indicators`
  - `version_number`: Número de versión secuencial
  - `formula_expression`: Fórmula de cálculo
  - `aggregation_method`: 'sum' | 'average' | 'median' | etc.
  - `valid_from` / `valid_until`: Vigencia temporal

#### `indicator_records` ⭐ **NUEVA - DATOS TIME-SERIES**
- **Propósito**: Valores de indicadores con soporte multi-dimensional
- **Reemplaza**: `indicator_values` del schema original (más simple)
- **Mejoras**:
  - `measured_at`: Timestamp exacto
  - `period_start` / `period_end`: Rangos temporales (ej: Q1 2024)
  - `dimensions`: JSONB (ej: `{"gas": "CO2", "fuente": "móvil"}`)
  - `numeric_value` / `text_value` / `json_value`: Valores polimórficos
  - `record_version`: Correcciones históricas
  - `superseded_by_id`: Tracking de versiones

#### `organization_indicator_subscriptions`
- **Propósito**: Qué indicadores usa cada organización
- **Campos clave**:
  - `subscription_status`: 'active' | 'deprecated_for_us' | 'pending_migration'
  - `replaced_by_indicator_id`: Para migraciones

#### `indicator_recommendations` ⭐ **RESTAURADA**
- **Propósito**: Sugerir indicadores según industria/tamaño/región
- **Ejemplo**: Minería → sugiere indicadores de recirculación de agua

#### `indicator_aggregation_rules` ⭐ **RESTAURADA**
- **Propósito**: Cómo agregar datos territorialmente
- **Campos clave**:
  - `aggregation_behavior`: Método de agregación
  - `privacy_threshold`: Mínimo de entidades para no exponer datos individuales

#### `indicator_migration_requests` ⭐ **RESTAURADA**
- **Propósito**: Solicitudes de migración entre versiones de indicadores
- **Workflow**: Organización solicita migrar de v1 a v2

---

### **6. METAS Y OBJETIVOS (1 tabla)**

#### `metas` ⭐ **RESTAURADA**
- **Propósito**: Objetivos cuantificables
- **Ejemplo**: "Reducir residuos 30% para 2025"
- **Campos clave**:
  - `target_value`: Valor objetivo
  - `target_date`: Fecha compromiso

---

### **7. FUENTES DE DATOS (2 tablas)**

#### `data_sources` ⭐ **RESTAURADA**
- **Propósito**: Integraciones con APIs externas
- **Ejemplo**: MinEnergia, MinMedioAmbiente, sensores IoT
- **Campos clave**:
  - `type`: 'api' | 'file' | 'manual' | 'iot'
  - `connection_config`: JSONB con configuración
  - `sync_frequency`: Frecuencia de sincronización

#### `organization_data_sources`
- **Propósito**: Relación N:N entre organizaciones y fuentes de datos
- **Campo clave**: `indicator_mapping` - mapeo entre campos de API e indicadores

---

### **8. SINADER - GESTIÓN DE RESIDUOS (3 tablas)** ⭐ **NUEVO MÓDULO**

#### `ler_codes`
- **Propósito**: Catálogo de clasificación de residuos (Lista Europea de Residuos)
- **Población**: ~800 códigos
- **Campos clave**:
  - `code`: Código de 6 dígitos (ej: "200301")
  - `chapter` / `subchapter` / `specific_code`: Jerarquía
  - `is_hazardous`: Residuo peligroso o no

#### `waste_treatments`
- **Propósito**: Catálogo de tratamientos de residuos
- **Categorías**: 'eliminacion' | 'valorizacion' | 'pretratamiento'
- **Ejemplos**: Relleno sanitario, Reciclaje, Compostaje

#### `waste_declarations` ⭐ **TABLA TRANSACCIONAL CRÍTICA**
- **Propósito**: Declaraciones mensuales/anuales de residuos (SINADER)
- **Escalabilidad**: Millones de registros (considerar partitioning por año)
- **Campos clave**:
  - `establishment_id`: Dónde se generó el residuo
  - `ler_code_id` / `treatment_id`: Qué y cómo se trató
  - `period_date`: Periodo de la declaración
  - `quantity_kg`: Cantidad en kilogramos
  - `recipient_tax_id` / `transporter_tax_id`: Cadena de custodia
  - `foreign_recipient_data`: JSONB para exportaciones
  - `status`: 'draft' | 'submitted' | 'rectified'

---

### **9. PROYECTOS (3 tablas)**

#### `projects` ⭐ **MEJORADO**
- **Propósito**: Proyectos de organizaciones
- **Restaurado**: `parent_project_id` (jerarquía de fases)
- **Restaurado**: `electronic_signature_url` (requerimiento legal Chile)

#### `project_financial_breakdown` ⭐ **RESTAURADA**
- **Propósito**: Desglose presupuestario (transparencia municipal)
- **Campos clave**:
  - `expense_category`: Categoría del gasto
  - `amount_allocated` / `amount_executed`: Presupuestado vs Ejecutado
  - `is_public`: Visibilidad pública

#### `project_partners` ⭐ **UNIFICADA**
- **Propósito**: Socios de proyectos (reemplaza `project_gobierno_local` + `project_actor`)
- **Relación**: N:N entre `projects` y `organizations`

---

### **10. DOCUMENTOS Y REPORTES (2 tablas)**

#### `strategic_documents` ⭐ **RESTAURADA**
- **Propósito**: Documentos estratégicos (planes, normativas)
- **Campos clave**: `parent_document_id` (jerarquía), `electronic_signature_url`

#### `reports` ⭐ **RESTAURADA**
- **Propósito**: Reportes periódicos
- **Campos clave**: `parent_report_id`, `period_start/end`

---

### **11. AUDITORÍA Y FACTURACIÓN (3 tablas)**

#### `audit_logs` ⭐ **MEJORADO**
- **Propósito**: Trazabilidad completa de cambios
- **Nuevo**: `old_data` / `new_data` (JSONB) - snapshot completo antes/después

#### `billing_history` ⭐ **RESTAURADA**
- **Propósito**: Historial de facturación
- **Campos clave**: `payment_status`, `electronic_invoice_url`

#### `waitlist` ⭐ **ACTUALIZADO v2.0**
- **Propósito**: Lista de espera pre-lanzamiento (Beta) con tracking completo
- **Campos principales**:
  - `email`: Identificador único (NOT NULL)
  - `full_name`: Nombre del contacto
  - `organization_name`: Nombre de la organización
  - `organization_type`: 'municipality' | 'gore' | 'company' | 'ngo' | 'other' (CHECK constraint)
  - `country_id`: FK a countries (default Chile)
  - `country_code`: Código ISO alpha-2 (ej: 'CL', 'PE')
- **Campos adicionales**:
  - `phone`: Teléfono opcional para contacto
  - `notes`: Contexto adicional del lead
  - `status`: Estado del pipeline ('pending' | 'contacted' | 'demo_scheduled' | 'onboarded' | 'rejected')
  - `created_at`: Timestamp de registro
  - `updated_at`: Timestamp de última actualización (auto-update vía trigger)
  - `source`, `utm_campaign`, `utm_source`, `utm_medium`: Marketing attribution
- **Índices**: organization_type, country_id, status, source, created_at
- **Triggers**: Auto-update de updated_at en modificaciones


---

### **12. CATÁLOGOS SINADER Y SUSCRIPCIONES (3 tablas)**

#### `ler_codes` ⭐ **NUEVA**
- **Propósito**: Catálogo Europeo de Residuos (LER)
- **Campos clave**:
  - `id`: Código LER (ej: '01 01 01')
  - `description`: Descripción del residuo
  - `chapter_code/desc`: Jerarquía superior

#### `waste_treatments` ⭐ **NUEVA**
- **Propósito**: Operaciones de Eliminación (D) y Valorización (R)
- **Campos clave**:
  - `code`: Código interno (ej: '11', 'R1')
  - `category`: 'Eliminación' | 'Valorización'
  - `subcategory`: 'Disposición final', 'Reciclaje', etc.

#### `subscription_plans` ⭐ **NUEVA**
- **Propósito**: Planes de servicio SaaS
- **Campos clave**:
  - `code`: 'free', 'pro', 'enterprise'
  - `features`: JSONB con límites y capacidades
  - `price_clp`: Precio en pesos chilenos

---

## 🔑 CAMBIOS CRÍTICOS vs SCHEMA ORIGINAL

### ✅ TABLAS ELIMINADAS (Unificación)
- ❌ `gobierno_local` → ✅ `organizations` (type='municipality'|'gore')
- ❌ `actors` → ✅ `organizations` (type='company'|'ngo')

### ✅ TABLAS NUEVAS
- ➕ `indicator_versions` (Gestión de fórmulas)
- ➕ `indicator_records` (Reemplaza `indicator_values`, más poderoso)
- ➕ `establishments` (Crítico para SINADER)
- ➕ `ler_codes`, `waste_treatments`, `waste_declarations` (Módulo SINADER)

### ✅ TABLAS RESTAURADAS (Estaban en original, eliminadas en v3.1)
- ➕ `metas`
- ➕ `data_sources` / `organization_data_sources`
- ➕ `project_financial_breakdown`
- ➕ `strategic_documents`
- ➕ `reports`
- ➕ `billing_history`
- ➕ `indicator_recommendations`
- ➕ `indicator_aggregation_rules`
- ➕ `indicator_migration_requests`

---

## 🎯 DECISIONES ARQUITECTÓNICAS CLAVE

### 1. Unificación de Organizaciones
**Antes**: `gobierno_local` + `actors` (polimorfismo)  
**Ahora**: `organizations` (tabla única con campo `type`)  
**Beneficio**: FK reales, mejor integridad referencial, queries más simples

### 2. Módulo Indicadores Time-Series
**Antes**: `indicators` + `indicator_values` (simple)  
**Ahora**: `indicators` + `indicator_versions` + `indicator_records`  
**Beneficio**: Soporte multi-dimensional, versionado de fórmulas, correcciones históricas

### 3. Geografía Estricta
**Nuevo**: Catálogos `countries` → `geo_regions` → `geo_communes`  
**Beneficio**: Datos limpios, expansión LATAM, reportes territoriales precisos

### 4. Módulo SINADER
**Nuevo**: Sistema completo de gestión de residuos  
**Core Business**: Crítico para MVP

---

## 📊 MÉTRICAS DEL SCHEMA

| Métrica | Valor |
|---------|-------|
| **Total Tablas** | 27 |
| **Tablas con RLS** | 12 |
| **Índices** | ~40 |
| **Functions** | 2 (handle_new_user, audit_trigger) |
| **Triggers** | 4 (auth, audit) |
| **Foreign Keys** | ~35 |
| **Check Constraints** | ~20 |

---

## 🔒 SEGURIDAD (ROW LEVEL SECURITY)

### Tablas Protegidas con RLS
1. `organizations` - Ver solo tu organización + hijas (si GORE)
2. `users` - Ver/editar solo tu perfil
3. `establishments` - Ver solo de tu organización
4. `indicator_records` - Ver solo tus datos
5. `waste_declarations` - Ver solo tus declaraciones
6. `projects`, `metas` - Aislamiento por organización

### Catálogos Públicos (Read-Only)
- `countries`, `geo_regions`, `geo_communes`
- `ler_codes`, `waste_treatments`
- `indicators` (solo si status='active' o eres creador)

---

## 📁 ARCHIVOS DE REFERENCIA

1. **Schema SQL**: [schema_final_v4.0.sql](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_final_v4.0.sql)
2. **Auditoría Exhaustiva**: [schema_exhaustive_audit.md](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_exhaustive_audit.md.resolved)
3. **Análisis SINADER**: [sql_architect_sinader.md](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/sql_architect_sinader.md.resolved)

---

## ✅ ESTADO DE IMPLEMENTACIÓN

- [x] Schema SQL v4.0 completo
- [x] Drop/Create idempotente (se puede re-ejecutar)
- [x] RLS policies implementadas
- [x] Triggers de auditoría activos
- [x] **Migración geográfica v4.1 completada** ✅
  - [x] Countries estandarizado ISO-3166 (Chile: 152)
  - [x] Division_types creado (preparación LATAM)
  - [x] geo_regions poblado (16 regiones)
  - [x] geo_communes poblado (346 comunas)
- [x] **Catálogos SINADER poblados** ✅
  - [x] ler_codes (499 códigos LER)
  - [x] waste_treatments (53 operaciones)
  - [x] subscription_plans (3 planes: Semilla, Brote, Bosque)
  - [x] Script Python generador: `scripts/generate-sinader-seeds.py`
  - [x] Migración completa: `scripts/migration-sinader-catalogs.sql`

---

**Versión**: 4.2 (Catálogos SINADER completos)  
**Última actualización**: 2025-12-01  
**Migración**: [walkthrough.md](file:///C:/Users/rleon/.gemini/antigravity/brain/5f3ad5be-1639-4961-926b-e581bd5c5ccd/walkthrough.md)
