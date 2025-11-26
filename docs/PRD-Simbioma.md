# 📱 PRODUCT REQUIREMENTS DOCUMENT (PRD) - SIMBIOMA v3.0
## Plataforma SaaS Dual: Regeneración Territorial + Corporativa

**Versión:** 3.0 (B2B + Sistema de Subscripciones + Firma Electrónica)  
**Fecha:** Noviembre 2025  
**Stakeholders:** CEO, CTO, Tech Lead, UX/UI Designer

---

## 🎯 RESUMEN EJECUTIVO

### **Qué es Simbioma v3.0**

Plataforma SaaS que permite a **gobiernos locales** y **empresas privadas** en Chile:
1. Consolidar datos ambientales multi-fuente
2. Generar reportes ESG automáticos (GRI, CDP, SASB, SINADER, etc.)
3. Gestionar indicadores con sistema de subscripciones versionadas
4. Visualizar transición hacia regeneración ecosistémica
5. Firmar electrónicamente documentos estratégicos y reportes

### **Cambios Clave vs v2.0**

| Área | v2.0 (Solo Público) | v3.0 (Público + Privado) |
|------|---------------------|-------------------------|
| **Segmentos** | Solo municipalidades | Gobiernos + Empresas |
| **Indicadores** | Catálogo global único | Subscripciones + versionado |
| **Usuarios** | Sector público | Dual sector |
| **Reportes** | SINADER, SCAM, SINIA | +GRI, SASB, CDP, B Corp |
| **Firma Electrónica** | ❌ | ✅ Integrada |
| **Agregación** | Solo territorial | Territorial + sectorial |

---

## 👥 USUARIOS Y PERSONAS

### **Persona 1: María - Directora Ambiental Municipal (Sector Público)**

**Demografía:**
- 42 años, Ingeniera Ambiental
- Municipalidad Peñalolén (130K habitantes)
- 8 años experiencia gestión pública

**Contexto:**
- Equipo: 4 personas (2 técnicos, 1 administrativo, 1 ella)
- Presupuesto: $120M CLP/año
- Presiones: Alcalde quiere resultados visibles, concejo exige transparencia

**Jobs to be Done:**
1. Reportar SINADER anual en <2 horas (hoy: 20 horas)
2. Dashboard para mostrar progreso al concejo
3. Consolidar datos de 3 fuentes (gestionador residuos, estación meteo, proyectos SbN)

**Pain Points:**
- Excel fragmentados en múltiples carpetas
- Reportes manuales copiando/pegando
- Sin forma de comparar vs. años anteriores

**Qué valora de Simbioma:**
- Integración con ReSimple (gestionador que ya usan)
- Reporte SINADER pre-llenado
- Dashboard público para transparencia

---

### **Persona 2: Carlos - Gerente Sustentabilidad Corporativa (Sector Privado)**

**Demografía:**
- 38 años, MBA + especialización ESG
- Minera Los Pelambres (2,000 empleados)
- 5 años liderando área sustentabilidad

**Contexto:**
- Equipo: 6 personas (analistas ESG, coordinadores territoriales)
- Presupuesto: $500K USD/año (software + consultoría)
- Presiones: Casa matriz exige reporte CDP, inversionistas piden ESG rating

**Jobs to be Done:**
1. Consolidar datos de 3 faenas mineras + oficinas
2. Generar reporte CDP anual con score >B
3. Comparar performance vs. otras mineras chilenas

**Pain Points:**
- Cada faena tiene su propio sistema (SAP, Excel, Access)
- Consultora cobra $50K USD por reporte GRI
- No hay benchmarks públicos de competencia

**Qué valora de Simbioma:**
- Indicadores custom minería (recirculación agua, etc.)
- Benchmarking anónimo por sector
- Pricing 10x más bajo que consultoras

---

## 🏗️ ARQUITECTURA TÉCNICA v3.0

### **Stack Tecnológico**

```
Frontend:
  - Next.js 14 (App Router, Server Components)
  - TypeScript 5.3+
  - Tailwind CSS + Shadcn UI
  - React Hook Form + Zod
  - Recharts (gráficos)

Backend:
  - Supabase (PostgreSQL 15 + Auth + Storage + Functions)
  - PostgREST (API REST automática)
  - Row Level Security (RLS) policies

Infraestructura:
  - Vercel (hosting frontend)
  - Supabase Cloud (backend managed)
  - GitHub Actions (CI/CD)
  - Sentry (error tracking)
```

### **Base de Datos - Cambios v3.0**

**Tablas nuevas (6):**

1. `actors` → Empresas privadas
2. `organization_indicator_subscriptions` → Sistema de subscripciones
3. `indicator_recommendations` → Recomendaciones por industria
4. `indicator_migration_requests` → Tracking migraciones de versiones
5. `project_financial_breakdown` → Desglose financiero proyectos
6. `billing_history` → Facturación ambos sectores

**Tablas modificadas (3):**

1. `indicators` → +namespace, +version, +tags, +versionado
2. `gobierno_local` → +subscription_plan_id
3. `users` → +electronic_signature_cert

**Total tablas:** 22

---

## 📋 FUNCIONALIDADES DETALLADAS

### **MÓDULO 1: SISTEMA DE INDICADORES (Core Diferenciador)**

#### 1.1 Catálogo de Indicadores con Subscripciones

**User Story:**  
> Como usuario, quiero suscribirme a indicadores relevantes para mi organización/industria, para no tener un catálogo contaminado con métricas que no uso.

**Flujo:**

```
1. Usuario nuevo (Empresa Minera) se registra
   ↓
2. Sistema detecta industry_sector = 'mining'
   ↓
3. Query: "Indicadores recomendados para minería"
   ↓
4. Frontend muestra:
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   📋 INDICADORES RECOMENDADOS PARA MINERÍA
   
   ✅ OBLIGATORIOS (Compliance)
   [✓] Emisiones GEI Total (100% mineras lo usan)
   [✓] Consumo Agua Total (100% mineras lo usan)
   [✓] Residuos Peligrosos (regulado)
   
   ⭐ MUY RECOMENDADOS (78% adopción)
   [ ] Tasa Recirculación Agua
   [ ] Restauración Áreas Post-Extracción
   [ ] Biodiversidad en Relaves
   
   💡 SUGERIDOS (45% adopción)
   [ ] Inversión Comunidades Locales
   [ ] Energía Renovable %
   ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
   
5. Usuario selecciona 15 indicadores
   ↓
6. Backend crea 15 subscripciones:
   INSERT INTO organization_indicator_subscriptions
   (organization_id, indicator_id, subscription_status = 'active')
```

**Validaciones:**

- Cuota por plan: Free (5), Basic (20), Professional (50), Enterprise (ilimitado)
- Si excede cuota → Modal "Upgrade a Professional para más indicadores"

**UI Components:**

- Checklist agrupado por categoría
- Badge con % adopción
- Tooltip con descripción completa
- Botón "Crear Indicador Custom" (si tiene cuota disponible)

---

#### 1.2 Versionado de Indicadores

**User Story:**  
> Como Simbioma admin, quiero publicar una nueva versión de PM2.5 con metodología mejorada, sin romper los datos históricos de organizaciones que usan la versión anterior.

**Flujo:**

```
1. Admin Simbioma accede a "Gestión Indicadores Globales"
   ↓
2. Selecciona PM2.5 v1 → Click "Crear Nueva Versión"
   ↓
3. Form:
   - Versión: 2 (auto)
   - Nombre: "PM2.5 (metodología horaria 2023)"
   - Cambios: "Medición horaria vs. diaria, mayor precisión"
   - Vigente desde: 2023-01-01
   - [Guardar]
   ↓
4. Backend:
   - Crea indicators (version=2, parent_indicator_id=[PM2.5 v1])
   - Actualiza v1: superseded_by_indicator_id=[PM2.5 v2], valid_until='2022-12-31'
   ↓
5. Sistema notifica a todas las orgs con subscripción activa a v1:
   
   📧 Email:
   "Nueva versión de PM2.5 disponible
   
   Hemos publicado PM2.5 v2 con metodología mejorada (horaria vs. diaria).
   
   Tus datos históricos con v1 permanecen intactos.
   Puedes migrar cuando quieras:
   [Ver detalles] [Migrar ahora] [Recordar en 30 días]"
   ↓
6. Organización decide migrar:
   - Dashboard → Mis Indicadores → PM2.5 v1 → [Migrar a v2]
   - Modal confirmación → Backend:
     - UPDATE subscripción v1: status='deprecated_for_us', active_until='2022-12-31'
     - INSERT subscripción v2: status='active', active_from='2023-01-01'
```

**Reglas de Negocio:**
- v1 y v2 coexisten indefinidamente
- Valores históricos con v1 permanecen (no se migran automáticamente)
- Queries temporales: "PM2.5 enero 2022" usa v1, "PM2.5 enero 2024" usa v2

---

#### 1.3 Indicadores Custom por Organización

**User Story:**  
> Como empresa minera avanzada, quiero crear un indicador custom "Tasa Recirculación Agua Relaves %" porque no existe en el catálogo global, y eventualmente Simbioma podría aprobarlo para otras mineras.

**Flujo:**

```
1. Usuario (Empresa A) → Dashboard → Indicadores → [Crear Indicador Custom]
   ↓
2. Form:
   - Nombre: "Tasa Recirculación Agua Relaves"
   - Código: "MINING_WATER_RECIRC_TAILINGS" (auto-suggest)
   - Categoría: Agua
   - Unidad: %
   - Metodología: [Editor rich text] "Volumen agua recirculada / volumen agua total × 100"
   - Tags: #mineria, #water, #circular-economy
   - ¿Solicitar aprobación Simbioma para hacerlo global? [✓]
   ↓
3. Backend:
   - INSERT indicators (
       namespace='actor_privado:empresa-A',
       creator_type='actor_privado',
       creator_id=[Empresa A],
       approval_status='draft',
       is_global=FALSE
     )
   - Si solicitó aprobación:
     INSERT indicator_approval_requests (indicator_id, status='pending')
   ↓
4. Indicador aparece en catálogo de Empresa A (solo ella lo ve)
   ↓
5. Simbioma Admin recibe notificación:
   "Empresa A creó indicador custom y solicita aprobación global"
   ↓
6. Admin revisa:
   - Dashboard Admin → Aprobaciones Pendientes
   - [Ver indicador] → Revisa metodología, evita duplicados
   - Decisión:
     a) Aprobar → UPDATE indicators SET is_global=TRUE, approved_by_simbioma=TRUE
     b) Rechazar con feedback
   ↓
7. Si aprobado:
   - Indicador ahora visible en catálogo global
   - Otras mineras reciben sugerencia: "Nuevo indicador minería disponible"
```

---

### **MÓDULO 2: DASHBOARD DUAL (Público vs. Privado)**

#### 2.1 Dashboard Gobierno Local

**Layout:**

```
┌──────────────────────────────────────────────────────┐
│ 🏛️ MUNICIPALIDAD PEÑALOLÉN                          │
├──────────────────────────────────────────────────────┤
│                                                       │
│ 📊 INDICADORES TERRITORIALES AGREGADOS               │
│ ┌────────────────┬────────────────┬────────────────┐│
│ │ Toneladas      │ Árboles        │ PM2.5          ││
│ │ Recicladas     │ Plantados      │ Promedio       ││
│ ├────────────────┼────────────────┼────────────────┤│
│ │ 2,150 ton      │ 15,340 un      │ 20.1 µg/m³ ⚠️ ││
│ │ ↑ 18% vs 2023  │ ↑ 22% vs 2023  │ Meta: <15      ││
│ │                │                │                ││
│ │ 🏛️ Público: 1.5K│ 🏛️ Público: 12K│ Estación DMC   ││
│ │ 🏢 Privado: 650│ 🏢 Privado: 3.3K│ (territorial)  ││
│ │ (8 empresas)   │ (8 empresas)   │                ││
│ └────────────────┴────────────────┴────────────────┘│
│                                                       │
│ ⚠️ TRANSPARENCIA EN DATOS:                           │
│ • 8 de 15 empresas del territorio reportan (53%)    │
│ • Metodologías mixtas: 2 usan v1, 6 usan v2         │
│ • Datos no 100% comparables                         │
│                                                       │
│ [Ver Detalle por Organización] [Invitar No Report.]│
└──────────────────────────────────────────────────────┘
```

**Funcionalidades:**
- Toggle "Solo Sector Público" / "Público + Privado"
- Filtros: Período, Indicador, Categoría
- Export: PDF, Excel con warnings de limitaciones

---

#### 2.2 Dashboard Empresa Privada

**Layout:**

```
┌──────────────────────────────────────────────────────┐
│ 🏢 MINERA LOS PELAMBRES                              │
├──────────────────────────────────────────────────────┤
│                                                       │
│ 📊 MIS INDICADORES ESG                               │
│ ┌────────────────┬────────────────┬────────────────┐│
│ │ Consumo Agua   │ Emisiones GEI  │ Tasa Recirc.   ││
│ │ Total          │ Scope 1+2+3    │ Agua Relaves   ││
│ ├────────────────┼────────────────┼────────────────┤│
│ │ 18.5M m³/año   │ 120K ton CO2eq │ 87.5%          ││
│ │ ↓ 12% vs 2023  │ ↓ 8% vs 2023   │ ↑ 5% vs 2023   ││
│ │ Meta: <17M     │ Meta: <100K    │ Meta: >90%     ││
│ │ ⭐⭐⭐⚪⚪      │ ⭐⭐⭐⭐⚪      │ ⭐⭐⭐⚪⚪      ││
│ └────────────────┴────────────────┴────────────────┘│
│                                                       │
│ 🎯 BENCHMARKING SECTOR MINERÍA                       │
│ Tu performance vs. promedio sector:                  │
│ • Consumo Agua: 23% mejor que promedio ✅            │
│ • Emisiones GEI: 15% peor que promedio ⚠️           │
│ • Recirculación Agua: Top 20% del sector 🏆         │
│                                                       │
│ [Ver Ranking Completo] [Generar Reporte CDP]        │
└──────────────────────────────────────────────────────┘
```

**Funcionalidades:**
- Benchmarking anónimo (solo si >5 empresas del sector reportan)
- Contribución territorial: "Tus datos se agregan a dashboard Salamanca"
- Control privacidad: Toggle "Participar en agregación territorial"

---

### **MÓDULO 3: FIRMA ELECTRÓNICA**

#### 3.1 Configuración Usuario

**User Story:**  
> Como Director Ambiental, quiero configurar mi certificado de firma electrónica para firmar el reporte SINADER antes de enviarlo oficialmente.

**Flujo:**

```
1. Usuario → Configuración → Firma Electrónica
   ↓
2. Form:
   - Proveedor: [Select: SII | Acepta.com | eSign | Otro]
   - Certificado Digital: [Upload .pfx o .p12]
   - Password: [********]
   - Fecha expiración: 2027-12-31
   [Guardar]
   ↓
3. Backend:
   - Valida certificado (API proveedor)
   - Encripta y guarda:
     UPDATE users SET
       electronic_signature_cert = encrypt(cert),
       electronic_signature_provider = 'Acepta.com',
       electronic_signature_expiry = '2027-12-31',
       has_electronic_signature = TRUE
   ↓
4. UI muestra: ✅ "Firma electrónica configurada"
```

---

#### 3.2 Firmar Reporte

**Flujo:**

```
1. Usuario genera reporte SINADER 2024
   ↓
2. Estado: "draft" → Puede editar
   ↓
3. Usuario → [Generar PDF] → PDF se crea en Supabase Storage
   ↓
4. Usuario → [Firmar Electrónicamente]
   ↓
5. Modal:
   "¿Firmar reporte SINADER 2024?
   
   Certificado: Juan Pérez (Acepta.com)
   Válido hasta: 2027-12-31
   
   ⚠️ Una vez firmado, el reporte no podrá editarse.
   
   [Cancelar] [Firmar]"
   ↓
6. Backend:
   - Descarga PDF de Storage
   - Aplica firma electrónica (lib: node-signpdf)
   - Genera hash SHA-256
   - Sube PDF firmado
   - UPDATE reports SET
       electronic_signature_url = [PDF firmado],
       is_electronically_signed = TRUE,
       status = 'generated'
   ↓
7. UI: ✅ "Reporte firmado electrónicamente"
   - Badge: 🔒 Firmado
   - [Descargar PDF Firmado] [Enviar a SINADER]
```

**Integración Timbre Electrónico SII:**
- Para facturas, documentos oficiales
- API SII: POST /timbrado/v1/
- Respuesta: XML con timbre
- Se adjunta a PDF

---

### **MÓDULO 4: GESTIÓN DE PROYECTOS CON DESGLOSE FINANCIERO**

#### 4.1 Crear Proyecto Público (Con Desglose Obligatorio)

**User Story:**  
> Como municipalidad, quiero crear un proyecto "Reforestación Cerro Manquehue" con presupuesto de 150M CLP, desglosando cómo se gastará el dinero para transparencia pública.

**Flujo:**

```
1. Usuario → Proyectos → [Crear Proyecto]
   ↓
2. Wizard Paso 1/5: Información Básica
   - Nombre: "Reforestación Cerro Manquehue 2025"
   - Tipo: Solución Basada en Naturaleza
   - Ubicación: [Mapa interactivo]
   - Fechas: 2025-03-01 a 2025-12-31
   ↓
3. Paso 2/5: Presupuesto
   - Presupuesto Total: $150,000,000 CLP
   - Fuentes: [✓] FNDR [✓] Municipal
   - Sistema detecta: owner_type='gobierno_local'
     → requires_financial_breakdown = TRUE
   ↓
4. Paso 3/5: Desglose Financiero (Obligatorio)
   
   "Por transparencia pública, desglose el presupuesto:"
   
   ┌─────────────────────────────────────────────────┐
   │ Categoría               Monto         %         │
   ├─────────────────────────────────────────────────┤
   │ Sueldos                $45,000,000   30.0%      │
   │ Materiales             $35,000,000   23.3%      │
   │ Infraestructura        $25,000,000   16.7%      │
   │ Equipamiento           $15,000,000   10.0%      │
   │ Consultoría            $10,000,000   6.7%       │
   │ Servicios              $ 8,000,000   5.3%       │
   │ Operaciones            $ 7,000,000   4.7%       │
   │ Contingencia (5%)      $ 5,000,000   3.3%       │
   ├─────────────────────────────────────────────────┤
   │ TOTAL                  $150,000,000  100.0% ✅  │
   └─────────────────────────────────────────────────┘
   
   ⚠️ La suma debe ser igual al presupuesto total
   
   [+ Agregar Categoría Custom]
   ↓
5. Paso 4/5: Impacto Esperado
   - Línea Base: {TREES_PLANTED: 0, GREEN_AREA_M2: 0}
   - Objetivo: {TREES_PLANTED: 2000, GREEN_AREA_M2: 15000}
   ↓
6. Paso 5/5: Actores (Opcional)
   - Ejecutor: Constructora EcoVerde SpA
   - Contrato: $45M CLP
   - [Upload Contrato PDF]
   ↓
7. Backend:
   - INSERT projects (...)
   - INSERT 8× project_financial_breakdown (una por categoría, is_public=TRUE)
   - INSERT project_actor (...)
   ↓
8. Dashboard Público muestra desglose transparente
```

---

#### 4.2 Crear Proyecto Privado (Desglose Opcional/Confidencial)

**Flujo similar, pero:**

```
3. Paso 2/5: Presupuesto
   - Sistema detecta: owner_type='actor_privado'
     → requires_financial_breakdown = FALSE
   
   "¿Deseas agregar desglose financiero?
   
   ℹ️ Opcional para empresas privadas.
   Si lo agregas, puedes marcarlo como confidencial.
   
   [Agregar Desglose] [Omitir]"
   
   Si agrega:
   → Puede marcar cada categoría: is_public = FALSE
   → Solo visible para usuarios de esa empresa
```

---

### **MÓDULO 5: REPORTES ESG AUTOMATIZADOS**

#### 5.1 Generar Reporte SINADER (Municipalidad)

**Wizard:**

```
1. Seleccionar Framework
   [○] SINADER  [○] SCAM  [○] SINIA  [○] GRI  [○] CDP

2. Período
   Año: [2024▼]  Tipo: [Anual▼]

3. Validación Datos
   ✅ Residuos Reciclados: 1,500 ton (ReSimple API)
   ✅ Residuos Relleno: 48,000 ton (ReSimple API)
   ⚠️ Áreas Verdes Recuperadas: Sin datos
   
   [Completar Datos Faltantes]

4. Preview
   [Vista previa HTML del reporte]
   Secciones: 12/15 completas (80%)
   
5. Generar
   [Generar PDF] → Progress bar
   → PDF listo
   [Descargar] [Firmar Electrónicamente] [Enviar a SINADER]
```

---

## 🎨 DISEÑO UX/UI

### **Principios de Diseño**

1. **Transparencia Radical**
   - Siempre mostrar limitaciones de datos
   - Warnings explícitos cuando datos son incompletos
   - No fingir homogeneidad que no existe

2. **Progresive Disclosure**
   - Dashboard simple por defecto
   - Detalles técnicos en modals/accordions
   - Usuarios avanzados pueden profundizar

3. **Mobile-First (Dashboard Ejecutivo)**
   - Alcaldes/CEOs ven métricas clave en móvil
   - Funciones de edición en desktop

4. **Accesibilidad (WCAG 2.1 AA)**
   - Contraste de color adecuado
   - Navegación por teclado
   - Screen readers compatibles

### **Sistema de Diseño (Actualizado)**

**Colores:**
- Verde Bosque: #2D9D78 (primary)
- Azul Océano: #1E5F8C (secondary)
- Amarillo Sol: #F5A623 (accent)
- Gris Neutro: #64748B (text)
- Rojo Alerta: #EF4444 (warnings)

**Tipografía:**
- Inter (sans-serif)
- Títulos: 600-700 weight
- Body: 400-500 weight

**Componentes Shadcn:**
- Button, Card, Badge, Avatar
- Table (sorting, pagination)
- Dialog, Sheet (modals)
- Form (inputs con validación)
- Toast (notificaciones)
- Progress (migraciones, uploads)

---

## 🔐 SEGURIDAD Y COMPLIANCE

### **Autenticación**
- Supabase Auth (JWT)
- OAuth: Google Workspace
- MFA opcional (Enterprise)

### **Autorización (RLS)**
```sql
-- Usuarios solo ven datos de su organización
CREATE POLICY "org_isolation"
ON indicator_values FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM users WHERE id = auth.uid()
  )
);

-- Superadmins ven todo
CREATE POLICY "superadmin_override"
ON indicator_values FOR ALL
USING (
  (SELECT role FROM users WHERE id = auth.uid()) = 'superadmin'
);
```

### **Encriptación**
- At-rest: PostgreSQL nativo (AES-256)
- In-transit: TLS 1.3
- Certificados firma electrónica: AES-256 + salt
- Contratos PDF: Supabase Storage privado

### **Compliance**
- **Ley 21.719 (Protección Datos Chile):**
  - Consentimiento explícito
  - Derecho de portabilidad
  - Derecho al olvido (soft delete)
  
- **GDPR (Expansión EU):**
  - Data residency configurable
  - DPO designado

---

## 📊 MÉTRICAS DE ÉXITO (KPIs)

### **Producto**
- Time to First Value: <7 días
- Uptime: >99.5%
- Time to Generate Report: <30 segundos
- User Error Rate: <2%

### **Negocio**
- MRR Growth: +20% mensual (Año 1)
- Churn: <5% anual
- NPS: >40
- CAC Payback: <12 meses

### **Engagement**
- DAU/MAU: >40%
- Weekly Active Subscriptions: >80%
- Reportes Generados/Mes: >100

---

## 🚀 ROADMAP DE DESARROLLO

### **v3.0 MVP (Q1 2025) - 12 semanas**

**Semanas 1-3: Setup + Infraestructura**
- Next.js 14 + Supabase setup
- Schema BD v4.0 (22 tablas)
- RLS policies
- CI/CD pipeline

**Semanas 4-6: Sistema Indicadores**
- Catálogo con namespace/version
- Subscripciones CRUD
- Recomendaciones por industria
- Migración de versiones (wizard)

**Semanas 7-9: Dashboards Duales**
- Dashboard Gobierno Local (agregación territorial)
- Dashboard Empresa (benchmarking)
- Transparencia en limitaciones de datos
- Gráficos con Recharts

**Semanas 10-12: Reportes + Firma**
- Wizard generación reportes (SINADER, GRI)
- Templates PDF
- Firma electrónica (Acepta.com integration)
- Testing + Deploy

### **v3.1 (Q2 2025) - Funcionalidades Avanzadas**
- Multi-tenant (GORE ve todas sus comunas)
- Desglose financiero proyectos
- API pública (webhooks)
- Onboarding interactivo

### **v3.2 (Q3 2025) - B2B Scaling**
- White-label (Enterprise)
- Benchmarking sectorial avanzado
- Indicadores custom con IA (sugerencias)
- Integraciones: SAP, Oracle, etc.

---

## 📝 CRITERIOS DE ACEPTACIÓN

### **Módulo Indicadores**
- ✅ Usuario puede suscribirse a ≥15 indicadores
- ✅ Cuotas por plan funcionan (Free: 5, Basic: 20, etc.)
- ✅ Versionado: v1 y v2 coexisten sin conflictos
- ✅ Recomendaciones muestran % adopción correcto
- ✅ Migración wizard funciona (depreca v1, activa v2)

### **Módulo Dashboards**
- ✅ Agregación territorial muestra warnings de limitaciones
- ✅ Toggle público/privado funciona
- ✅ Benchmarking solo si >5 empresas reportan
- ✅ Performance: Dashboard carga <1.5s

### **Módulo Firma Electrónica**
- ✅ Upload certificado .pfx funciona
- ✅ Firma PDF genera hash SHA-256 válido
- ✅ PDF firmado descargable e inmutable
- ✅ Badge "Firmado" visible en UI

### **Módulo Proyectos**
- ✅ Desglose financiero suma 100% presupuesto
- ✅ Validación: no permite guardar si suma ≠ 100%
- ✅ Proyectos públicos: is_public=TRUE por defecto
- ✅ Proyectos privados: desglose opcional

---

**PRD v3.0 - Fin**  
**Próxima revisión:** Q4 2025
