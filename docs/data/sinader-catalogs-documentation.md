# 📋 Documentación de Catálogos SINADER

**Versión**: 1.0  
**Fecha**: 2025-12-01  
**Fuente Oficial**: Manual SINADER Chile

---

## 🎯 Resumen Ejecutivo

Este documento describe la estructura, fuentes y proceso de implementación de los catálogos SINADER (Sistema Nacional de Declaración de Residuos) utilizados en la plataforma Simbioma.

### Catálogos Implementados

1. **Códigos LER** (Lista Europea de Residuos): 499 códigos
2. **Tratamientos de Residuos**: 53 operaciones
3. **Planes de Subscripción**: 3 planes

---

## 📚 1. CÓDIGOS LER (Lista Europea de Residuos)

### Descripción

Los códigos LER son la clasificación oficial utilizada en Chile (adaptada de la Unión Europea) para categorizar residuos. Cada código es único y describe un tipo específico de residuo.

### Estructura del Código

**Formato**: `XX YY ZZ` (6 dígitos, espaciados)

- **XX**: Capítulo (2 dígitos) - Actividad que genera el residuo
- **YY**: Subcapítulo (2 dígitos) - Proceso específico
- **ZZ**: Código específico (2 dígitos) - Tipo de residuo

**Ejemplo**:
```
Código: 20 01 01
- 20: Capítulo "Residuos municipales"
- 01: Subcapítulo "Fracciones recogidas selectivamente"
- 01: Código específico "Papel y cartón"
```

### Capítulos Principales

| Capítulo | Descripción | Cantidad de Códigos |
|----------|-------------|---------------------|
| 01 | Residuos de exploración, extracción, transformación física y química de minerales y materiales | 27 |
| 02 | Residuos de la agricultura, horticultura, acuicultura, silvicultura, caza y pesca | 19 |
| 03 | Residuos de la transformación de la madera | 12 |
| 04 | Residuos de las industrias del cuero, pieles y textil | 15 |
| 05 | Residuos del refinado de petróleo | 9 |
| 06 | Residuos de procesos químicos inorgánicos | 13 |
| 07 | Residuos de procesos químicos orgánicos | 25 |
| 08 | Residuos de la fabricación, formulación, distribución y utilización de revestimientos | 22 |
| 09 | Residuos de la industria fotográfica | 5 |
| 10 | Residuos de procesos térmicos | 38 |
| 11 | Residuos del tratamiento químico de superficie de metales | 15 |
| 12 | Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales | 21 |
| 13 | Residuos de aceites y de combustibles líquidos | 14 |
| 14 | Residuos de disolventes, refrigerantes y propelentes orgánicos | 8 |
| 15 | Residuos de envases; absorbentes, trapos, materiales filtrantes | 24 |
| 16 | Residuos no especificados en otro capítulo del catálogo | 35 |
| 17 | Residuos de la construcción y demolición | 16 |
| 18 | Residuos de servicios médicos o veterinarios | 12 |
| 19 | Residuos de las instalaciones para el tratamiento de residuos | 48 |
| 20 | Residuos municipales y residuos asimilables de comercios, industrias e instituciones | 56 |

### Clasificación por Peligrosidad

Cada código LER está marcado con:

- **Peligroso** (`is_hazardous = true`): Requiere tratamiento especial
- **No Peligroso** (`is_hazardous = false`): Residuo común

**Ejemplo de códigos peligrosos**:
- `13 01 01*` - Aceites hidráulicos que contienen PCB
- `16 06 01*` - Baterías de plomo
- `18 01 03*` - Residuos cuya recogida y eliminación es objeto de requisitos especiales

> **Nota**: El asterisco (*) en el código oficial indica peligrosidad, pero en nuestra BD usamos el campo `is_hazardous`.

### Estructura en Base de Datos

**Tabla**: `ler_codes`

```sql
CREATE TABLE ler_codes (
    id SERIAL PRIMARY KEY,
    code VARCHAR(8) UNIQUE NOT NULL,  -- '20 01 01'
    chapter_code VARCHAR(2) NOT NULL,  -- '20'
    chapter_description TEXT,
    subchapter_code VARCHAR(5) NOT NULL,  -- '20 01'
    subchapter_description TEXT,
    specific_code VARCHAR(8) NOT NULL,  -- '20 01 01'
    description TEXT NOT NULL,
    is_hazardous BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Estadísticas

- **Total códigos**: 499
- **Códigos peligrosos**: ~87 (17.4%) (base oficial sinader no los contiene)
- **Códigos no peligrosos**: ~412 (82.6%)

---

## ♻️ 2. TRATAMIENTOS DE RESIDUOS

### Descripción

Los tratamientos de residuos son las operaciones que se realizan con los residuos después de su generación. Se dividen en dos categorías principales según el Manual SINADER oficial.

### Categorías Oficiales

#### **Eliminación** (12 operaciones)

Operaciones que NO recuperan materiales ni energía. El residuo pierde su utilidad.

| Código | Descripción | Estado en SINADER |
|--------|-------------|-------------------|
| D1 | Depósito sobre el suelo o en su interior (vertedero controlado o no) | Activo |
| D2 | Tratamiento en medio terrestre que produzca beneficio a la agricultura o mejore las condiciones ecológicas | Activo |
| D3 | Inyección en profundidad | No común en Chile |
| D4 | Embalse superficial | No común en Chile |
| D5 | Vertedero especialmente diseñado | Activo |
| D6 | Vertido en medio acuático excepto en el mar | Prohibido en Chile |
| D7 | Vertido en el mar incluida la inserción en el lecho marino | Prohibido en Chile |
| D8 | Tratamiento biológico no especificado en otra parte de este anexo que dé lugar a compuestos o mezclas que se eliminen mediante alguno de los procedimientos enumerados entre las operaciones D1 a D12 | Activo |
| D9 | Tratamiento fisicoquímico no especificado en otra parte que dé lugar a compuestos o mezclas que se eliminen mediante alguna de las operaciones de eliminación D1 a D12 | Activo |
| D10 | Incineración en tierra | Activo |
| D11 | Incineración en el mar | Prohibido en Chile |
| D12 | Depósito permanente | Activo |

**Total eliminación**: 12 operaciones (5 activas en Chile)

#### **Valorización** (41 operaciones)

Operaciones que recuperan materiales, energía o regeneran el producto. El residuo mantiene o gana utilidad.

**Sub-categorías**:

1. **Reciclaje** (R2-R11): 10 operaciones
   - Ejemplos: Reciclaje de metales (R4), plásticos (R3), vidrio (R5)

2. **Recuperación de Energía** (R1): 1 operación
   - Incineración con recuperación energética

3. **Valorización de Materiales Orgánicos** (R10): 1 operación
   - Compostaje, digestión anaeróbica

4. **Otras Valorizaciones** (R12-R13): 2 operaciones
   - Intercambio de residuos, acumulación temporal

5. **Pre-tratamientos**: ~27 operaciones
   - Preparación para valorización posterior

| Código Común | Descripción | Frecuencia de Uso |
|--------------|-------------|-------------------|
| R1 | Utilización principal como combustible u otro modo de producir energía | Alta (empresas) |
| R3 | Reciclado o recuperación de sustancias orgánicas que no se utilizan como disolventes | Alta |
| R4 | Reciclado o recuperación de metales y de compuestos metálicos | Alta |
| R5 | Reciclado o recuperación de otras materias inorgánicas (vidrio) | Alta |
| R10 | Tratamiento de suelos, que produzca un beneficio a la agricultura o una mejora ecológica | Media |
| R12 | Intercambio de residuos para someterlos a alguna de las operaciones de valorización R1 a R11 | Alta |
| R13 | Acumulación de residuos para someterlos a alguna de las operaciones R1 a R12 | Alta |

**Total valorización**: 41 operaciones

### Estructura en Base de Datos

**Tabla**: `waste_treatments`

```sql
CREATE TABLE waste_treatments (
    id SERIAL PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,  -- 'D1', 'R3', etc.
    description TEXT NOT NULL,
    category VARCHAR(50) NOT NULL,  -- 'eliminacion' | 'valorizacion'
    subcategory VARCHAR(100),  -- 'reciclaje' | 'recuperacion-energia' | 'pre-tratamiento'
    is_active BOOLEAN DEFAULT TRUE,
    notes TEXT,  -- Notas sobre aplicabilidad en Chile
    created_at TIMESTAMP DEFAULT NOW()
);
```

### Distribución de Tratamientos

```
Total: 53 operaciones
├── Eliminación: 12 (22.6%)
│   ├── Activas en Chile: 5
│   └── Prohibidas/No comunes: 7
└── Valorización: 41 (77.4%)
    ├── Reciclaje: 10
    ├── Recuperación Energía: 1
    ├── Valorización Orgánica: 1
    ├── Otras: 2
    └── Pre-tratamientos: 27
```

### Validación Oficial

**Fuente**: Manual SINADER, Ministerio del Medio Ambiente, Chile

**Última actualización del manual**: 2023

**Verificación realizada**: 2025-12-01
- ✅ 12 operaciones de eliminación confirmadas
- ✅ 41 operaciones de valorización confirmadas
- ✅ Total: 53 operaciones

---

## 📦 3. PLANES DE SUBSCRIPCIÓN

### Descripción

Simbioma ofrece 3 planes de subscripción con nomenclatura inspirada en la naturaleza.

### Planes Disponibles

| Plan | Código | Precio (CLP) | Precio (USD) | Sector | Features |
|------|--------|--------------|--------------|--------|----------|
| **Semilla** | `semilla_free_cl` | $0 | $0 | Ambos | Básico, 5 indicadores custom |
| **Brote** | `brote_pro_cl` | $199,000 | $250 | Ambos | Profesional, 20 indicadores, reportes automáticos |
| **Bosque** | `bosque_enterprise_cl` | Personalizado | Personalizado | Ambos | Enterprise, indicadores ilimitados, white-label |

### Features por Plan (JSONB)

**Semilla (Free)**:
```json
{
  "max_users": 3,
  "max_custom_indicators": 5,
  "data_retention_months": 12,
  "reports_per_month": 2,
  "api_access": false,
  "support_level": "community",
  "white_label": false
}
```

**Brote (Professional)**:
```json
{
  "max_users": 10,
  "max_custom_indicators": 20,
  "data_retention_months": 36,
  "reports_per_month": 10,
  "api_access": true,
  "support_level": "email",
  "white_label": false,
  "benchmarking": true
}
```

**Bosque (Enterprise)**:
```json
{
  "max_users": "unlimited",
  "max_custom_indicators": "unlimited",
  "data_retention_months": "unlimited",
  "reports_per_month": "unlimited",
  "api_access": true,
  "support_level": "dedicated",
  "white_label": true,
  "benchmarking": true,
  "custom_integrations": true
}
```

---

## 🔄 PROCESO DE GENERACIÓN Y MIGRACIÓN

### Scripts Desarrollados

1. **`generate-sinader-seeds-final.py`**
   - Genera SQL de inserción para los 3 catálogos
   - Input: Datos manuales estructurados
   - Output: `seed-sinader-final.sql`

2. **`migration-sinader-catalogs.sql`**
   - Script completo de migración (209 KB)
   - Incluye:
     - Creación de tablas
     - Inserción de datos
     - Índices y constraints
     - Validaciones

### Proceso de Actualización

Si se requiere actualizar los catálogos en el futuro:

1. **Obtener datos actualizados** del Manual SINADER oficial
2. **Modificar** `generate-sinader-seeds-final.py` con nuevos datos
3. **Ejecutar** el script para generar nuevo SQL
4. **Revisar** el diff de cambios
5. **Aplicar** la migración en Supabase
6. **Documentar** cambios en este archivo

### Validación de Datos

**Checklist de validación**:
- [ ] Total de códigos LER coincide con manual oficial
- [ ] Categorías de tratamientos correctamente asignadas
- [ ] 12 eliminación, 41 valorización
- [ ] Descripciones sin errores ortográficos
- [ ] Códigos únicos (sin duplicados)

---

## 📊 ESTADÍSTICAS DE USO (Futuro)

Una vez en producción, se recomienda trackear:

- **Códigos LER más usados** por sector
- **Tratamientos más comunes** por región
- **Planes de subscripción** más populares
- **Tasa de upgrade** Semilla → Brote → Bosque

---

## 🔗 REFERENCIAS

### Fuentes Oficiales

1. **Manual SINADER Chile**
   - URL: [sinader.mma.gob.cl](https://sinader.mma.gob.cl)
   - Última consulta: 2025-12-01

2. **Lista Europea de Residuos (LER)**
   - Decisión 2014/955/UE
   - Adaptación chilena: Decreto Supremo N° 1/2013 MMA

3. **Operaciones de Eliminación y Valorización**
   - Anexos I y II del Convenio de Basilea
   - Incorporado en legislación chilena

### Documentación Interna

- [`docs/architecture/database-schema-v4.0-OFICIAL.md`](../architecture/database-schema-v4.0-OFICIAL.md)
- `scripts/generate-sinader-seeds-final.py`
- `scripts/migration-sinader-catalogs.sql`

---

## 🛠️ MANTENIMIENTO

### Responsables

- **Actualización de catálogos**: Tech Lead
- **Validación vs fuentes oficiales**: Producto
- **Migración en producción**: DevOps

### Frecuencia de Revisión

- **Trimestral**: Revisar cambios en Manual SINADER oficial
- **Anual**: Auditoría completa de datos
- **On-demand**: Si hay actualización oficial del ministerio

---

**Última actualización**: 2025-12-01  
**Próxima revisión**: 2025-03-01
