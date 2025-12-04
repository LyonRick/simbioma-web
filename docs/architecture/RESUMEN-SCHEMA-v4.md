# ✅ RESUMEN: Schema v4.0 vs Supabase Actual

**Fecha**: 2025-11-30

---

## 🎯 CONCLUSIÓN

El schema v4.0 oficial **SÍ está aplicado en Supabase**, pero quedan **6 tablas legacy** del modelo anterior que deben eliminarse.

---

## 📊 NÚMEROS

- **Schema v4.0 oficial**: 27 tablas
- **Supabase actual**: 33 tablas  
- **Tablas legacy a eliminar**: 6

---

## ❌ TABLAS A ELIMINAR (6)

| # | Tabla | Razón |
|---|-------|-------|
| 1 | `gobierno_local` | Reemplazada por `organizations` (type='municipality'\|'gore') |
| 2 | `actors` | Reemplazada por `organizations` (type='company'\|'ngo') |
| 3 | `project_gobierno_local` | Reemplazada por `project_partners` |
| 4 | `project_actor` | Reemplazada por `project_partners` |
| 5 | `indicator_values` | Reemplazada por `indicator_records` (Time-Series) |
| 6 | `organization_data_source` | Renombrar a `organization_data_sources` (plural) |

---

## ✅ MÓDULOS CORE DEL SCHEMA v4.0

### 1. **Geografía (3 tablas)** ✅
- countries, geo_regions, geo_communes

### 2. **Organizaciones Unificadas (2 tablas)** ✅
- `organizations` ⭐ (reemplaza gobierno_local + actors)
- users

### 3. **SINADER - Gestión de Residuos (3 tablas)** ✅ **CRÍTICO MVP**
- ler_codes
- waste_treatments  
- waste_declarations

### 4. **Indicadores Time-Series (7 tablas)** ✅
- indicators
- `indicator_versions` ⭐ (nueva - fórmulas)
- `indicator_records` ⭐ (nueva - reemplaza indicator_values)
- organization_indicator_subscriptions
- indicator_recommendations
- indicator_aggregation_rules
- indicator_migration_requests

### 5. **Establecimientos (1 tabla)** ✅
- establishments (crítico para SINADER)

### 6. **Otras (11 tablas)** ✅
- metas, data_sources, projects, audit_logs, etc.

---

## 🔧 ACCIÓN REQUERIDA

1. **Verificar que no hay datos** en las 6 tablas legacy
2. **Ejecutar script de limpieza**: Ver [tablas-legacy-eliminar.md](file:///c:/coding/simbioma-web/docs/architecture/tablas-legacy-eliminar.md)
3. **Validar** que quedan 27 tablas
4. **Poblar catálogos**:
   - geo_regions (16 regiones)
   - geo_communes (346 comunas)
   - ler_codes (~800 códigos)
   - subscription_plans (al menos 3)

---

## 📚 DOCUMENTACIÓN OFICIAL

**Schema SQL**: [schema_final_v4.0.sql](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_final_v4.0.sql)

**Documentación completa**: [database-schema-v4.0-OFICIAL.md](file:///c:/coding/simbioma-web/docs/architecture/database-schema-v4.0-OFICIAL.md)

**Plan de limpieza**: [tablas-legacy-eliminar.md](file:///c:/coding/simbioma-web/docs/architecture/tablas-legacy-eliminar.md)

---

_Última actualización: 2025-11-30_
