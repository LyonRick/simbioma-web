# 🧹 TABLAS LEGACY A ELIMINAR - SUPABASE

**Fecha**: 2025-11-30  
**Basado en**: Schema v4.0 Oficial  
**Estado**: ACCIÓN REQUERIDA

---

## 📊 ESTADO ACTUAL EN SUPABASE

Según la imagen proporcionada, Supabase tiene **33 tablas**, pero el schema v4.0 oficial define **27 tablas**.

**Diferencia**: 6 tablas legacy que deben eliminarse.

---

## ❌ TABLAS LEGACY A ELIMINAR (6)

### 1. `gobierno_local` ❌ ELIMINAR
**Estado**: REEMPLAZADA  
**Reemplazada por**: `organizations` (type='municipality' | 'gore')

**Justificación**: 
- El schema v4.0 unificó gobierno_local y actors en una sola tabla `organizations`
- Ya no existe polimorfismo
- FK ahora son reales

**Acción SQL**:
```sql
-- Verificar que no tenga datos
SELECT COUNT(*) FROM gobierno_local;

-- Si tiene datos, migrar primero a organizations
-- Luego eliminar
DROP TABLE IF EXISTS gobierno_local CASCADE;
```

---

### 2. `actors` ❌ ELIMINAR
**Estado**: REEMPLAZADA  
**Reemplazada por**: `organizations` (type='company' | 'ngo')

**Justificación**: 
- Mismo rationale que gobierno_local
- Unificación arquitectónica

**Acción SQL**:
```sql
DROP TABLE IF EXISTS actors CASCADE;
```

---

### 3. `project_gobierno_local` ❌ ELIMINAR
**Estado**: REEMPLAZADA  
**Reemplazada por**: `project_partners`

**Justificación**:
- El schema v4.0 unificó `project_gobierno_local` + `project_actor` en una sola tabla `project_partners`
- Relación polimórfica eliminada

**Acción SQL**:
```sql
DROP TABLE IF EXISTS project_gobierno_local CASCADE;
```

---

### 4. `project_actor` ❌ ELIMINAR  
**Estado**: REEMPLAZADA  
**Reemplazada por**: `project_partners`

**Justificación**: 
- Unificación con project_gobierno_local

**Acción SQL**:
```sql
DROP TABLE IF EXISTS project_actor CASCADE;
```

---

### 5. `indicator_values` ❌ ELIMINAR
**Estado**: REEMPLAZADA  
**Reemplazada por**: `indicator_records`

**Justificación**:
- El schema v4.0 implementó un módulo Time-Series avanzado
- `indicator_records` tiene capacidades superiores:
  - Soporte multi-dimensional (JSONB dimensions)
  - Valores polimórficos (numeric/text/boolean/json)
  - Versionado de datos
  - Rangos temporales (period_start/end)
- `indicator_values` es demasiado simple para los requerimientos

**Acción SQL**:
```sql
-- CRÍTICO: Migrar datos primero si existen
DROP TABLE IF EXISTS indicator_values CASCADE;
```

---

### 6. `organization_data_source` ❌ ELIMINAR (NAMING INCORRECTO)
**Estado**: EXISTE PERO CON NOMBRE INCORRECTO  
**Debe ser**: `organization_data_sources` (plural)

**Justificación**:
- El schema v4.0 define `organization_data_sources` (con 's')
- En Supabase existe `organization_data_source` (sin 's')
- Inconsistencia de nomenclatura

**Acción SQL**:
```sql
-- Si existe con nombre incorrecto
ALTER TABLE organization_data_source RENAME TO organization_data_sources;
```

---

## ✅ TABLAS QUE DEBEN EXISTIR (27 - Schema v4.0)

### **Geografía (3)**
1. ✅ countries
2. ✅ geo_regions
3. ✅ geo_communes

### **Organizaciones (2)**
4. ✅ organizations *(reemplaza gobierno_local + actors)*
5. ✅ users

### **Establecimientos (1)**
6. ✅ establishments

### **Suscripciones (1)**
7. ✅ subscription_plans

### **Indicadores (7)**
8. ✅ indicators
9. ✅ indicator_versions *(nueva)*
10. ✅ indicator_records *(reemplaza indicator_values)*
11. ✅ organization_indicator_subscriptions
12. ✅ indicator_recommendations
13. ✅ indicator_aggregation_rules
14. ✅ indicator_migration_requests

### **Metas (1)**
15. ✅ metas

### **Fuentes de Datos (2)**
16. ✅ data_sources
17. ✅ organization_data_sources *(plural)*

### **SINADER - Residuos (3)**
18. ✅ ler_codes
19. ✅ waste_treatments
20. ✅ waste_declarations

### **Proyectos (3)**
21. ✅ projects
22. ✅ project_financial_breakdown
23. ✅ project_partners *(reemplaza project_gobierno_local + project_actor)*

### **Documentos (2)**
24. ✅ strategic_documents
25. ✅ reports

### **Auditoría y Facturación (3)**
26. ✅ audit_logs
27. ✅ billing_history
28. ✅ waitlist

---

## 🎯 SCRIPT DE LIMPIEZA

```sql
-- ===================================================
-- LIMPIEZA DE TABLAS LEGACY - SUPABASE
-- ===================================================
-- IMPORTANTE: Ejecutar DESPUÉS de migrar datos si existen
-- ===================================================

-- 1. Eliminar tablas polimórficas antiguas
DROP TABLE IF EXISTS proyecto_actor CASCADE;
DROP TABLE IF EXISTS project_gobierno_local CASCADE;
DROP TABLE IF EXISTS actors CASCADE;
DROP TABLE IF EXISTS gobierno_local CASCADE;

-- 2. Eliminar tabla de indicadores antigua
DROP TABLE IF EXISTS indicator_values CASCADE;

-- 3. Renombrar tabla con nombre incorrecto (si existe)
DO $$ 
BEGIN
    IF EXISTS (
        SELECT 1 FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'organization_data_source'
    ) THEN
        ALTER TABLE organization_data_source RENAME TO organization_data_sources;
    END IF;
END $$;

-- 4. Verificar tablas existentes
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public' 
  AND table_type = 'BASE TABLE'
ORDER BY table_name;
```

---

## ⚠️ ADVERTENCIAS CRÍTICAS

1. **NO EJECUTAR** este script si hay datos en producción sin antes:
   - Hacer backup completo de la base de datos
   - Migrar datos de tablas antiguas a nuevas
   - Verificar que aplicaciones no dependan de tablas legacy

2. **VERIFICAR** que el schema v4.0 completo fue aplicado ANTES de eliminar tablas legacy

3. **COORDINACIÓN**: Si hay un equipo frontend/backend, asegurar que no haya referencias a tablas antiguas en código

---

## 📋 CHECKLIST DE EJECUCIÓN

- [ ] Backup completo de Supabase
- [ ] Verificar conteo de filas en tablas legacy
  ```sql
  SELECT 
    'gobierno_local' as table, COUNT(*) as rows FROM gobierno_local
    UNION ALL
  SELECT 'actors', COUNT(*) FROM actors
    UNION ALL
  SELECT 'project_gobierno_local', COUNT(*) FROM project_gobierno_local
    UNION ALL
  SELECT 'project_actor', COUNT(*) FROM project_actor
    UNION ALL
  SELECT 'indicator_values', COUNT(*) FROM indicator_values;
  ```
- [ ] Si hay datos, crear scripts de migración
- [ ] Ejecutar script de limpieza
- [ ] Verificar que quedan exactamente 27 tablas
- [ ] Testing de integridad referencial
- [ ] Update de documentación

---

## 🔄 MIGRACIÓN DE DATOS (Si necesaria)

### Ejemplo: Migrar `gobierno_local` → `organizations`

```sql
INSERT INTO organizations (
    id, 
    type, 
    tax_id, 
    name, 
    parent_organization_id,
    subscription_plan_id,
    is_active,
    created_at
)
SELECT 
    id,
    CASE 
        WHEN tipo = 'municipio' THEN 'municipality'
        WHEN tipo = 'gore' THEN 'gore'
        ELSE 'municipality'
    END,
    'PENDING-RUT-' || id::text, -- ⚠️ RUT debe ser completado manualmente
    'Municipio ' || id::text,   -- ⚠️ Nombre debe ser completado
    gobierno_regional_id,
    subscription_plan_id,
    is_active,
    NOW()
FROM gobierno_local;
```

**NOTA**: Esta migración es solo un ejemplo. Ajustar según estructura real de datos.

---

## 📞 SIGUIENTE PASO

1. **Confirmar** que el schema v4.0 completo fue aplicado en Supabase
2. **Verificar** si las tablas legacy tienen datos
3. **Decidir** estrategia de migración si hay datos
4. **Ejecutar** script de limpieza

---

**Versión**: 1.0  
**Autor**: Análisis basado en schema v4.0 oficial
