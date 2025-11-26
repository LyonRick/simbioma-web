# 🗄️ MODELO DE DATOS SIMBIOMA v4.0 FINAL
## Arquitectura Híbrida: Subscripciones + Versionado + Transparencia

---

## 🎯 CAMBIOS FUNDAMENTALES vs v3.1

### **ANTES (v3.1): Catálogo Global Único**
```
indicators (tabla única)
  ↓
Todos usan mismo indicador
Conflicto: ¿Quién puede deprecar?
```

### **AHORA (v4.0): Sistema de Subscripciones + Versionado**
```
indicators (catálogo universal inmutable)
  ↓
organization_indicator_subscriptions (cada org decide qué usa)
  ↓
indicator_values (valores apuntan a versión específica)
```

---

## 📊 NUEVA ARQUITECTURA DE INDICADORES

### **TABLA 1: `indicators` (Catálogo Universal)**

**Concepto:** Biblioteca infinita de indicadores. NUNCA se borra nada físicamente.

**Campos clave:**

```
indicators:
  id: UUID PRIMARY KEY
  
  -- Identificación con namespace
  namespace: VARCHAR(100)  -- 'global' | 'gobierno_local:{id}' | 'actor_privado:{id}' | 'industry:mining'
  code_numeric: INTEGER
  code_alpha: VARCHAR(100)
  version: INTEGER DEFAULT 1
  name: VARCHAR(500)
  
  -- Constraint único: namespace + code_alpha + version
  UNIQUE(namespace, code_alpha, version)
  
  -- Propiedad
  creator_type: VARCHAR(50)  -- 'simbioma' | 'gobierno_local' | 'actor_privado'
  creator_id: UUID
  
  -- Clasificación
  category: VARCHAR(100)
  regeneration_level: VARCHAR(50)
  
  -- Versionado
  parent_indicator_id: UUID  -- Apunta a versión anterior
  superseded_by_indicator_id: UUID  -- Apunta a versión siguiente
  version_notes: TEXT  -- Qué cambió en esta versión
  valid_from: DATE  -- Desde cuándo es válida esta versión
  valid_until: DATE  -- Hasta cuándo (NULL = indefinido)
  
  -- Metadata semántica
  calculation_method: TEXT
  unit: VARCHAR(100)
  frameworks: JSONB  -- Mapeo a GRI, CDP, etc.
  threshold_type: VARCHAR(50)
  global_thresholds: JSONB
  
  -- Tags y clasificación
  tags: VARCHAR[] -- ['#mineria', '#ley-rep', '#scope1', '#deprecated-2024']
  industry_sectors: VARCHAR[]  -- A qué industrias aplica
  applicable_to: VARCHAR[]  -- ['gobierno_local', 'actor_privado', 'both']
  
  -- Gobernanza
  approval_status: VARCHAR(50) DEFAULT 'draft'
  /* Estados:
     'draft' = En creación
     'active' = Publicado y usable
     'superseded' = Reemplazado por nueva versión
     'archived' = Ya no se recomienda pero existe
  */
  
  approved_by_simbioma: BOOLEAN DEFAULT FALSE
  reviewed_by: UUID REFERENCES users(id)
  reviewed_at: TIMESTAMP
  
  -- Estadísticas de uso
  subscriptions_count: INTEGER DEFAULT 0  -- Cuántas orgs lo usan
  values_count: INTEGER DEFAULT 0  -- Cuántos valores tiene
  last_used_at: TIMESTAMP
  
  -- Metadata
  description: TEXT
  methodology_url: VARCHAR(500)
  metadata: JSONB
  
  created_at: TIMESTAMP
  updated_at: TIMESTAMP
```

**Ejemplos de registros:**

```
-- Indicador global v1 (2020-2023)
{
  namespace: 'global',
  code_alpha: 'PM2.5',
  version: 1,
  name: 'Material Particulado PM2.5',
  calculation_method: 'Promedio mensual de mediciones diarias',
  valid_from: '2020-01-01',
  valid_until: '2022-12-31',
  superseded_by_indicator_id: [uuid PM2.5 v2],
  approval_status: 'superseded',
  tags: ['#air-quality', '#who-standard', '#deprecated']
}

-- Indicador global v2 (2023+)
{
  namespace: 'global',
  code_alpha: 'PM2.5',
  version: 2,
  name: 'Material Particulado PM2.5 (metodología actualizada)',
  calculation_method: 'Promedio diario de mediciones horarias',
  valid_from: '2023-01-01',
  valid_until: NULL,
  parent_indicator_id: [uuid PM2.5 v1],
  approval_status: 'active',
  tags: ['#air-quality', '#who-standard-2023']
}

-- Indicador custom minería
{
  namespace: 'industry:mining',
  code_alpha: 'WATER_RECIRCULATION_RATE',
  version: 1,
  name: 'Tasa Recirculación Agua en Procesos Mineros',
  creator_type: 'actor_privado',
  creator_id: [uuid Minera Los Pelambres],
  approved_by_simbioma: TRUE,
  industry_sectors: ['mining', 'extractive'],
  tags: ['#mineria', '#water', '#circular-economy']
}
```

---

### **TABLA 2: `organization_indicator_subscriptions` (NUEVA - CRÍTICA)**

**Concepto:** Qué indicador usa cada organización y en qué estado está ESA relación.

**Campos:**

```
organization_indicator_subscriptions:
  id: UUID PRIMARY KEY
  
  -- Organización (polimórfico)
  organization_type: VARCHAR(50)  -- 'gobierno_local' | 'actor_privado'
  organization_id: UUID
  
  -- Indicador específico (con versión)
  indicator_id: UUID REFERENCES indicators(id)
  
  -- Estado de la subscripción (POR ORGANIZACIÓN)
  subscription_status: VARCHAR(50) DEFAULT 'active'
  /* Estados:
     'active' = Usando activamente
     'deprecated_for_us' = Ya no usamos, pero valores históricos permanecen
     'pending_migration' = Queremos migrar a otra versión
     'replaced_by' = Reemplazado por otro indicador
  */
  
  -- Si fue reemplazado
  replaced_by_indicator_id: UUID REFERENCES indicators(id)
  replacement_reason: TEXT
  
  -- Vigencia de uso
  subscribed_at: TIMESTAMP DEFAULT NOW()
  active_from: DATE  -- Desde cuándo lo usamos
  active_until: DATE  -- Hasta cuándo (NULL = aún activo)
  
  -- Metadata de uso
  usage_notes: TEXT  -- Por qué usamos este indicador
  custom_calculation_notes: TEXT  -- Si lo calculamos diferente
  internal_code: VARCHAR(100)  -- Código interno de la organización
  
  -- Estadísticas
  values_count: INTEGER DEFAULT 0  -- Cuántos valores tiene esta org para este indicador
  last_value_at: TIMESTAMP
  
  -- Prioridad en dashboard
  is_primary: BOOLEAN DEFAULT TRUE  -- Si es el indicador principal de la org para esta métrica
  display_order: INTEGER
  
  -- Metadata
  metadata: JSONB
  
  created_at: TIMESTAMP
  updated_at: TIMESTAMP
  
  -- Constraints
  UNIQUE(organization_type, organization_id, indicator_id)
```

**Ejemplos de registros:**

```
-- Empresa A usa PM2.5 v2 (migró)
{
  organization_type: 'actor_privado',
  organization_id: [uuid Empresa A],
  indicator_id: [uuid PM2.5 v2],
  subscription_status: 'active',
  active_from: '2023-01-01',
  active_until: NULL,
  values_count: 24  -- 2 años de datos mensuales
}

-- Empresa A deprecó PM2.5 v1 (pero mantiene histórico)
{
  organization_type: 'actor_privado',
  organization_id: [uuid Empresa A],
  indicator_id: [uuid PM2.5 v1],
  subscription_status: 'deprecated_for_us',
  replaced_by_indicator_id: [uuid PM2.5 v2],
  replacement_reason: 'Migración a nueva metodología 2023',
  active_from: '2020-01-01',
  active_until: '2022-12-31',
  values_count: 36  -- 3 años históricos
}

-- Empresa B todavía usa PM2.5 v1 (no ha migrado)
{
  organization_type: 'actor_privado',
  organization_id: [uuid Empresa B],
  indicator_id: [uuid PM2.5 v1],
  subscription_status: 'active',
  active_from: '2020-01-01',
  active_until: NULL,
  values_count: 60  -- 5 años continuos
}
```

---

### **TABLA 3: `indicator_values` (Modificada)**

**Cambio clave:** Ahora referencia a versión ESPECÍFICA del indicador.

```
indicator_values:
  id: UUID PRIMARY KEY
  
  -- Organización (polimórfico)
  owner_type: VARCHAR(50)
  owner_id: UUID
  
  -- Indicador específico (con versión implícita)
  indicator_id: UUID REFERENCES indicators(id)
  
  -- NUEVO: Verificación de subscripción
  -- Backend valida que exists(
  --   SELECT 1 FROM organization_indicator_subscriptions
  --   WHERE organization_id = owner_id
  --   AND indicator_id = indicator_id
  --   AND subscription_status = 'active'
  -- )
  
  -- Resto de campos igual
  value: DECIMAL(15,4)
  period_start: DATE
  period_end: DATE
  is_official: BOOLEAN DEFAULT TRUE
  measurement_method: VARCHAR(500)
  data_quality: VARCHAR(50)
  version: INTEGER DEFAULT 1
  is_current: BOOLEAN DEFAULT TRUE
  superseded_by_id: UUID
  ...
```

---

### **TABLA 4: `indicator_recommendations` (NUEVA)**

**Concepto:** Sistema de recomendaciones inteligentes por industria/tipo.

```
indicator_recommendations:
  id: UUID PRIMARY KEY
  
  -- Para quién es la recomendación
  target_type: VARCHAR(50)  -- 'industry_sector' | 'organization_size' | 'region' | 'all'
  target_value: VARCHAR(100)  -- 'mining' | 'large' | 'metropolitana' | 'all'
  
  -- Qué indicador recomienda
  indicator_id: UUID REFERENCES indicators(id)
  
  -- Prioridad
  recommendation_level: VARCHAR(50)  -- 'required' | 'highly_recommended' | 'suggested' | 'optional'
  display_order: INTEGER
  
  -- Contexto
  reason: TEXT  -- Por qué se recomienda
  applies_from: DATE
  applies_until: DATE
  
  -- Estadísticas
  adoption_rate: DECIMAL(5,2)  -- % de orgs del target que lo usan
  
  created_at: TIMESTAMP
  updated_at: TIMESTAMP
  
  UNIQUE(target_type, target_value, indicator_id)
```

**Ejemplos:**

```
-- Recomendación para minería
{
  target_type: 'industry_sector',
  target_value: 'mining',
  indicator_id: [uuid WATER_RECIRCULATION_RATE],
  recommendation_level: 'highly_recommended',
  reason: 'Obligatorio según normativa minera chilena',
  adoption_rate: 78.5  -- 78.5% de mineras lo usan
}

-- Recomendación para todos (global)
{
  target_type: 'all',
  target_value: 'all',
  indicator_id: [uuid GHG_EMISSIONS_TOTAL],
  recommendation_level: 'required',
  reason: 'Reporte obligatorio Ley Marco Cambio Climático',
  adoption_rate: 92.3
}
```

---

### **TABLA 5: `indicator_migration_requests` (NUEVA)**

**Concepto:** Tracking de migraciones de versiones.

```
indicator_migration_requests:
  id: UUID PRIMARY KEY
  
  -- Quién solicita
  organization_type: VARCHAR(50)
  organization_id: UUID
  
  -- Migración
  from_indicator_id: UUID REFERENCES indicators(id)
  to_indicator_id: UUID REFERENCES indicators(id)
  
  -- Estado
  status: VARCHAR(50)  -- 'pending' | 'in_progress' | 'completed' | 'cancelled'
  
  -- Datos
  values_to_migrate_count: INTEGER
  values_migrated_count: INTEGER
  migration_strategy: VARCHAR(50)  -- 'recompute' | 'convert' | 'keep_as_is'
  
  -- Fechas
  requested_at: TIMESTAMP
  completed_at: TIMESTAMP
  
  -- Metadata
  notes: TEXT
  metadata: JSONB
```

---

## 🔄 FLUJOS OPERACIONALES

### **FLUJO 1: Empresa nueva se registra**

```
1. Sistema detecta: organization_type = 'actor_privado', industry_sector = 'mining'

2. Query recomendaciones:
   SELECT i.*, ir.recommendation_level, ir.reason
   FROM indicators i
   JOIN indicator_recommendations ir ON i.id = ir.indicator_id
   WHERE ir.target_type = 'industry_sector' 
     AND ir.target_value = 'mining'
     AND i.approval_status = 'active'
   ORDER BY ir.display_order;

3. Frontend muestra:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   📋 INDICADORES RECOMENDADOS PARA MINERÍA
   
   ✅ OBLIGATORIOS (3)
   [✓] Emisiones GEI Total
   [✓] Consumo Agua Total
   [✓] Residuos Peligrosos
   
   ⭐ MUY RECOMENDADOS (5)
   [ ] Tasa Recirculación Agua (78% de mineras lo usan)
   [ ] Restauración Áreas Post-Extracción
   [ ] Biodiversidad en Relaves
   ...
   
   💡 SUGERIDOS (8)
   [ ] Inversión en Comunidades Locales
   ...
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

4. Empresa selecciona indicadores

5. Sistema crea subscripciones:
   INSERT INTO organization_indicator_subscriptions
   (organization_id, indicator_id, subscription_status, active_from)
   VALUES ([empresa], [indicador], 'active', NOW());
```

---

### **FLUJO 2: Simbioma publica PM2.5 v2 (nueva metodología)**

```
1. Simbioma crea nueva versión:
   INSERT INTO indicators (
     namespace = 'global',
     code_alpha = 'PM2.5',
     version = 2,
     parent_indicator_id = [PM2.5 v1],
     version_notes = 'Cambio metodología: horaria vs diaria',
     valid_from = '2023-01-01'
   );

2. Sistema marca v1 como superseded:
   UPDATE indicators SET
     approval_status = 'superseded',
     superseded_by_indicator_id = [PM2.5 v2],
     valid_until = '2022-12-31'
   WHERE id = [PM2.5 v1];

3. Sistema notifica a todas las orgs que usan v1:
   SELECT DISTINCT organization_id, organization_type
   FROM organization_indicator_subscriptions
   WHERE indicator_id = [PM2.5 v1]
     AND subscription_status = 'active';
   
   Email: "Nueva versión de PM2.5 disponible. Migra cuando puedas."

4. Cada organización decide CUÁNDO migrar (no obligatorio)

5. Empresa A decide migrar inmediatamente:
   -- Depreca subscripción antigua
   UPDATE organization_indicator_subscriptions SET
     subscription_status = 'deprecated_for_us',
     replaced_by_indicator_id = [PM2.5 v2],
     active_until = '2022-12-31'
   WHERE organization_id = [Empresa A]
     AND indicator_id = [PM2.5 v1];
   
   -- Crea subscripción nueva
   INSERT INTO organization_indicator_subscriptions
   (organization_id, indicator_id, active_from)
   VALUES ([Empresa A], [PM2.5 v2], '2023-01-01');

6. Empresa B decide NO migrar (sigue con v1)
   -- No hace nada, mantiene subscripción activa en v1
```

---

### **FLUJO 3: Dashboard territorial agregado (con transparencia)**

```
Query: "Total PM2.5 promedio Peñalolén enero 2024"

1. Identificar qué organizaciones operan en Peñalolén:
   - Municipalidad Peñalolén
   - 15 empresas (operates_in_gobierno_local_ids contiene Peñalolén)

2. Obtener subscripciones activas en enero 2024:
   SELECT 
     ois.organization_id,
     ois.organization_type,
     i.namespace,
     i.code_alpha,
     i.version,
     i.name,
     iv.value
   FROM organization_indicator_subscriptions ois
   JOIN indicators i ON ois.indicator_id = i.id
   LEFT JOIN indicator_values iv ON 
     iv.indicator_id = i.id 
     AND iv.owner_id = ois.organization_id
     AND iv.period_start = '2024-01-01'
   WHERE 
     i.code_alpha = 'PM2.5'
     AND ois.subscription_status = 'active'
     AND '2024-01-01' BETWEEN ois.active_from AND COALESCE(ois.active_until, '9999-12-31')
     AND (
       (ois.organization_type = 'gobierno_local' AND ois.organization_id = [Peñalolén])
       OR
       (ois.organization_type = 'actor_privado' AND [Peñalolén] = ANY(
         SELECT operates_in_gobierno_local_ids FROM actors WHERE id = ois.organization_id
       ))
     );

3. Resultado:
   - Municipalidad: PM2.5 v2 = 18.5 µg/m³
   - Empresa A: PM2.5 v2 = 22.1 µg/m³
   - Empresa B: PM2.5 v1 = 19.8 µg/m³ ⚠️
   - 12 empresas: No reportan

4. Dashboard muestra:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   CALIDAD DEL AIRE - PEÑALOLÉN - ENERO 2024
   
   PM2.5 Promedio: 20.1 µg/m³ ⚠️
   
   ⚠️ LIMITACIONES DE DATOS:
   • 3 de 16 organizaciones reportan (19% cobertura)
   • Metodologías mixtas:
     - 2 entidades usan metodología 2023 (horaria)
     - 1 entidad usa metodología 2020 (diaria) [deprecated]
   • Datos no completamente comparables
   
   [Ver detalle por organización] [Invitar no reportantes]
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

### **FLUJO 4: Empresa quiere deprecar indicador (sin afectar a nadie)**

```
1. Empresa A decide: "Ya no usamos CUSTOM_METRIC_X"

2. Frontend:
   [Deprecar Indicador]
   
   ⚠️ ¿Qué significa deprecar?
   • Este indicador dejará de aparecer en tu catálogo activo
   • Tus datos históricos se preservarán
   • Otras empresas NO se verán afectadas si usan el mismo indicador
   • Podrás reactivarlo en el futuro si es necesario
   
   [Confirmar Deprecación]

3. Backend:
   UPDATE organization_indicator_subscriptions SET
     subscription_status = 'deprecated_for_us',
     active_until = CURRENT_DATE
   WHERE organization_id = [Empresa A]
     AND indicator_id = [CUSTOM_METRIC_X];

4. Resultado:
   - Empresa A: Ya no ve el indicador en su catálogo
   - Empresa B: Sigue viéndolo normalmente (su subscripción sigue 'active')
   - Indicador: Permanece en tabla indicators (approval_status = 'active')
   - Valores históricos Empresa A: Preservados, solo lectura
```

---

## 🎯 VENTAJAS DEL MODELO v4.0

### **1. Conflicto de deprecación RESUELTO**
✅ Empresa 1 depreca su subscripción, Empresa 2 no afectada
✅ Indicador permanece en catálogo universal
✅ Histórico de ambas empresas preservado

### **2. Versionado sin rupturas**
✅ v1 y v2 coexisten indefinidamente
✅ Organizaciones migran a su ritmo
✅ Queries temporales usan versión correcta automáticamente

### **3. Transparencia total en agregación**
✅ Dashboard muestra limitaciones explícitamente
✅ "2 de 15 empresas reportan, metodologías mixtas"
✅ No finge homogeneidad que no existe

### **4. Flexibilidad por industria**
✅ Namespace permite `mining/PM2.5` vs `global/PM2.5`
✅ Recomendaciones inteligentes por sector
✅ Tags facilitan búsqueda y clasificación

### **5. Gobernanza escalable**
✅ Simbioma aprueba globales
✅ Organizaciones crean custom sin fricción
✅ Sistema detecta duplicados y sugiere merge (opcional)

---

## 📋 TABLAS MODIFICADAS/NUEVAS - RESUMEN

### **Modificadas:**
1. ✅ `indicators` → Agregado: namespace, version, versionado, tags
2. ✅ `indicator_values` → Validación de subscripción activa
3. ✅ `indicator_aggregation_rules` → Considera versiones

### **Nuevas:**
4. ✅ `organization_indicator_subscriptions` → CRÍTICA, corazón del sistema
5. ✅ `indicator_recommendations` → Recomendaciones por industria
6. ✅ `indicator_migration_requests` → Tracking migraciones

### **Eliminadas:**
- ❌ `indicator_merge_suggestions` → Ya no necesaria (deprecación es por subscripción)

---

## 🔗 RELACIONES ACTUALIZADAS

```
indicators (catálogo universal)
  ↓
  ├─ parent_indicator_id (versionado)
  ├─ superseded_by_indicator_id (versionado)
  └─ organization_indicator_subscriptions (N:N con orgs)
       ↓
       ├─ replaced_by_indicator_id (migración)
       └─ indicator_values (valores usan versión específica)

indicator_recommendations
  ↓
  └─ indicators (qué recomendar)
```

---

## ✅ PRÓXIMO PASO

**¿Apruebas este modelo v4.0?**

Si sí, genero:
1. Diagrama Mermaid completo v4.0
2. Modelo narrativo completo (60+ páginas)
3. Esquema SQL DDL completo (~3,000 líneas)
4. PRD actualizado con sistema de subscripciones

🚀
