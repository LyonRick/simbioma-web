# 🗄️ DIAGRAMA MODELO DE DATOS SIMBIOMA v4.0 OFICIAL

> ⚠️ **ADVERTENCIA**: Este diagrama muestra el modelo ANTERIOR (polimórfico).  
> **Ver documentación actualizada**: [database-schema-v4.0-OFICIAL.md](file:///c:/coding/simbioma-web/docs/architecture/database-schema-v4.0-OFICIAL.md)

---

## ⚠️ MODELO DESACTUALIZADO - SOLO REFERENCIA HISTÓRICA

Este archivo contiene el diagrama del schema v3.1 (modelo polimórfico con `gobierno_local` y `actors`).

**El schema v4.0 REAL implementa**:
- ✅ `organizations` (reemplaza gobierno_local + actors)
- ✅ `indicator_records` (reemplaza indicator_values)
- ✅ `indicator_versions` (nueva tabla para fórmulas)
- ✅ Módulo SINADER completo
- ✅ Time-Series avanzado

---

## 📚 DOCUMENTACIÓN OFICIAL v4.0

**Schema SQL completo**: [schema_final_v4.0.sql](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_final_v4.0.sql)

**Documentación detallada**: [database-schema-v4.0-OFICIAL.md](file:///c:/coding/simbioma-web/docs/architecture/database-schema-v4.0-OFICIAL.md)

**Tablas legacy a eliminar**: [tablas-legacy-eliminar.md](file:///c:/coding/simbioma-web/docs/architecture/tablas-legacy-eliminar.md)

**Análisis exhaustivo**: [schema_exhaustive_audit.md](file:///C:/Users/rleon/.gemini/antigravity/brain/994ccd08-65ac-4202-91f9-c0cd71e33943/schema_exhaustive_audit.md.resolved)

---

## 🚨 NO USAR ESTE DIAGRAMA PARA DESARROLLO

Este archivo se mantiene solo como referencia histórica del modelo v3.1.

Para el desarrollo actual, consultar **ÚNICAMENTE** los archivos oficiales v4.0 listados arriba.

---

_Última actualización: 2025-11-30_
