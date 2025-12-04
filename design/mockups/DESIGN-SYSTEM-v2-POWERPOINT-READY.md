# SIMBIOMA - Design System Refinement
## Context: B2G/B2B Environmental Intelligence Platform

### Target Users
- Primary: Municipal Environmental Directors (35-55 years old)
- Secondary: Corporate Sustainability Managers
- Constraints: WCAG 2.1 AA compliance, older monitors common

---

## 🎯 DESIGN PHILOSOPHY: "Data-Driven Naturalism"

**NOT:** Sci-fi futurism, gaming aesthetics, heavy glassmorph  
**YES:** Professional clarity, subtle organic touches, breathing room

**Mental Model:** "A sophisticated research station in a national park"
- Trustworthy, professional, serious
- Connected to nature through color/texture, not literal images
- Data takes center stage, design supports (never distracts)

---

## 🎨 VISUAL LANGUAGE UPGRADE

### 1. COLOR PALETTE (Refined)

**Light Mode:**
```
Background Canvas: #FAFAF9 (Warm Stone, not pure white)
Surface Cards: #FFFFFF with shadow-emerald-500/5
Primary Action: #059669 (Deep Emerald, WCAG AAA)
Secondary: #0E7490 (Ocean Teal)
Accent/Alert: #EA580C (Terracotta, not harsh red)
Text Primary: #18181B (Near Black)
Text Secondary: #71717A (Warm Grey)
```

**Dark Mode:**
```
Background Canvas: #0A1612 (Forest Night, subtle green tint)
Surface Cards: #1C2624 (Deep Moss)
Primary Action: #10B981 (Bright Emerald, high contrast)
Text Primary: #FAFAF9 (Off-white, not pure white)
Text Secondary: #A1A1AA

CRITICAL: Avoid pure black (#000). Use Forest Night for depth.
```

### 2. TYPOGRAPHY SYSTEM

**Headings:**
- Font: Inter Tight (600-700 weight)
- H1: 2.5rem / 40px (Dashboard titles)
- H2: 2rem / 32px (Section headers)
- H3: 1.5rem / 24px (Card titles)

**Body:**
- Font: Inter (400-500 weight)
- Base: 1rem / 16px
- Small: 0.875rem / 14px
- Micro: 0.75rem / 12px (labels, captions)

**Data Display (KPIs):**
- Font: Inter (700 weight, tabular-nums)
- Size: 3rem / 48px for hero metrics
- Color: Inherit from semantic context

### 3. ELEVATION & DEPTH

**DO NOT use heavy glassmorphism.** Use subtle elevation instead:
```css
/* Level 1: Base cards */
shadow-sm shadow-emerald-500/5
border border-emerald-500/10

/* Level 2: Interactive elements (hover) */
shadow-md shadow-emerald-500/10

/* Level 3: Modals, dropdowns */
shadow-xl shadow-emerald-500/15

/* Active/Focus states */
ring-2 ring-emerald-500 ring-offset-2
```

### 4. SPACING SYSTEM

**Current problem:** Inconsistent padding/gaps  
**Fix:** Use 8px grid strictly
```
xs: 0.5rem / 8px
sm: 1rem / 16px
md: 1.5rem / 24px
lg: 2rem / 32px
xl: 3rem / 48px
2xl: 4rem / 64px
```

**Card Internal Padding:** `p-6` (24px) minimum  
**Between Cards:** `gap-6` (24px)  
**Dashboard Grid:** `gap-8` (32px)

---

## 📐 COMPONENT-SPECIFIC IMPROVEMENTS

### A. DASHBOARD HOME

**Current Issue:** Flat grid, no hierarchy  
**Solution:** Bento Grid with visual weight
```
Layout:
┌─────────────────────────────────────────────┐
│ 🚨 SINADER Alert (2x height, prominent)    │
│ Progress bar + CTA                          │
└─────────────────────────────────────────────┘

┌─────────────┬─────────────┬─────────────┐
│ KPI 1       │ KPI 2       │ KPI 3       │
│ Big Number  │ Big Number  │ Big Number  │
│ +18% 📈     │ PM2.5 ⚠️    │ -12% 📉     │
└─────────────┴─────────────┴─────────────┘

┌────────────────────────┬───────────────────┐
│ Chart (Wider)          │ Rankings (Narrow) │
│ Tendencia Temperatura  │ Top 10 Comunas    │
└────────────────────────┴───────────────────┘
```

**Alert Card Specs:**
- Background: `bg-orange-50` (light) / `bg-orange-950/30` (dark)
- Border: `border-l-4 border-orange-500`
- Icon: Large (32px), left-aligned
- Typography: Title bold, subtitle normal, CTA button prominent

**KPI Cards:**
- Big number: 48px, tabular-nums, bold
- Label: 14px, uppercase, tracking-wide, text-secondary
- Trend indicator: Icon + percentage, color-coded (green/red)
- Mini sparkline below number (optional, subtle)

### B. SIDEBAR NAVIGATION

**Current Issue:** Visually heavy, too solid  
**Solution:** Breathing sidebar with better hierarchy

**Specs:**
- Width: 280px (not 240px, give it air)
- Background: Slightly different from canvas
  - Light: `bg-white` with `border-r border-grey-200`
  - Dark: `bg-zinc-900` with `border-r border-zinc-800`
- Padding: `p-6` (not p-4)

**Active State:**
```css
bg-emerald-50 text-emerald-700 (light)
bg-emerald-950/50 text-emerald-400 (dark)
border-l-3 border-emerald-500
```

**Hover State:**
```css
bg-grey-50 (light)
bg-zinc-800 (dark)
```

**Section Headers (GESTIÓN TERRITORIAL, etc.):**
- Font: 12px, uppercase, tracking-widest, font-semibold
- Color: text-secondary
- Margin-top: 2rem (32px spacing between sections)

### C. DATA VISUALIZATION (Charts)

**Current Issue:** Default Recharts styling  
**Solution:** Minimal, elegant charts

**General Rules:**
- Remove grid lines OR make them very subtle (`stroke-opacity: 0.1`)
- Use gradients for area charts:
```
  fill: url(#gradient)
  gradient: emerald-500 → emerald-500/0 (fade to transparent)
```
- Rounded corners on bars (`radius={8}`)
- Tooltip: White card with shadow, not default box
- Legend: Icons before labels, not just colored squares

**KPI Mini-Charts (Sparklines):**
- Height: 40px
- No axes, no labels, pure shape
- Single color, semi-transparent fill
- Embedded in KPI card below number

### D. TABLES & LISTS

**Current Issue:** Cramped, hard to scan  
**Solution:** Generous spacing, clear hierarchy

**Row Specs:**
- Height: `h-16` (64px) minimum
- Padding: `px-6 py-4`
- Hover: `bg-grey-50` (light) / `bg-zinc-800` (dark)
- Border: Only bottom border, very subtle

**Badges (Status indicators):**
- Style: Soft backgrounds, not borders
```css
  bg-green-100 text-green-800 (light)
  bg-green-900/30 text-green-400 (dark)
```
- Size: `px-3 py-1`, `text-xs`, `rounded-full`
- Icon before text (optional, adds context)

### E. FORMS & INPUTS

**Current Issue:** Standard Shadcn, no customization  
**Solution:** Add subtle environmental touches

**Input Fields:**
- Border: `border-2` (not 1px) for better visibility
- Focus state: `ring-4 ring-emerald-500/20` (subtle glow)
- Label: Above input, `font-medium text-sm`
- Helper text: Below, `text-xs text-secondary`

**Buttons:**
- Primary: `bg-emerald-600 hover:bg-emerald-700`
- Height: `h-11` (44px) for better touch targets
- Padding: `px-6` (generous horizontal space)
- Icon + Text: Icon 20px, gap-2

### F. EMPTY STATES

**Current Issue:** Boring icon + text  
**Solution:** Illustrative, encouraging

**Layout:**
```
[Icon/Illustration 120px]
    ↓
[Title: bold, 20px]
    ↓
[Description: 16px, text-secondary]
    ↓
[CTA Button]
```

**Illustrations:**
- Use soft, abstract environmental graphics (not literal photos)
- SVG, single color (emerald-500 with opacity)
- Examples: Abstract tree, flowing water, data grid with leaves

---

## 🎬 MICROINTERACTIONS & MOTION

**DO:**
- Smooth transitions: `transition-all duration-200 ease-out`
- Hover scale on cards: `hover:scale-[1.02]`
- Loading states: Skeleton screens (grey pulse), not spinners
- Toast notifications: Slide from top-right, 4sec auto-dismiss

**DON'T:**
- Excessive animations (no bounces, no flips)
- Parallax scrolling
- Particle effects

---

## 📱 MOBILE ADAPTATIONS

**Sidebar:**
- Becomes Sheet/Drawer (slide from left)
- Hamburger menu (top-left, 44x44px touch target)

**Dashboard:**
- Stack KPIs vertically (1 column)
- Charts: Full-width, reduce height to 200px
- Tables: Convert to Card View (not horizontal scroll)

**Bottom Nav:** NO. Use Sheet for navigation.

---

## ♿ ACCESSIBILITY CHECKLIST

- [ ] All colors pass WCAG AA (4.5:1 for text, 3:1 for UI)
- [ ] Focus indicators visible (ring-2 ring-emerald-500)
- [ ] Touch targets minimum 44x44px
- [ ] Screen reader labels on icons
- [ ] Keyboard navigation works (Tab, Enter, Esc)
- [ ] Dark mode has EQUAL contrast (not worse)

---

## 🚫 ANTI-PATTERNS TO AVOID

1. ❌ Pure black backgrounds (#000 → use #0A1612)
2. ❌ Neon colors (too saturated, eye strain)
3. ❌ Heavy blur effects (performance + legibility)
4. ❌ Literal nature photos as backgrounds (distracting)
5. ❌ Bottom navigation on complex apps
6. ❌ Animations longer than 300ms
7. ❌ Overly rounded corners (>16px looks toy-like)

---

## ✅ IMPLEMENTATION PRIORITY

**Phase 1 (MVP Urgent):**
1. Fix color palette (Forest Night dark mode)
2. Spacing audit (consistent 8px grid)
3. Typography weights (bold headers, tabular KPIs)
4. Dashboard hierarchy (Bento Grid)

**Phase 2 (Post-MVP):**
5. Custom iconography (environmental data icons)
6. Chart styling (gradients, tooltips)
7. Microinteractions (hover states, transitions)

**Phase 3 (Polish):**
8. Empty state illustrations
9. Loading skeletons
10. Advanced responsive

---

## 📸 REFERENCE EXAMPLES (Show Figma Designer)

**DO NOT copy exactly, but study the balance:**

1. **Linear** → Clean, professional, subtle depth
2. **Airbnb Dashboard** → Generous spacing, clear hierarchy
3. **Stripe Dashboard** → Data clarity, sophisticated colors
4. **NOT:** Cyberpunk UI kits, Gaming dashboards, Heavy glassmorphism templates

---

## 🎯 SUCCESS CRITERIA

**Before:**
- Generic admin template
- Flat hierarchy
- Pure black dark mode

**After:**
- Recognizable Simbioma brand
- Clear visual hierarchy (alert > KPIs > detail)
- Forest Night dark mode with warmth
- Professional yet fresh
- Accessible (WCAG AA)
- Fast (no performance issues)

---

**Note to Designer:** This is a B2G/B2B tool used 8 hours/day by professionals. Prioritize clarity and efficiency over "wow factor". Every design decision should serve data comprehension, not distraction.

📊 COMPARACIÓN FINAL DE LAS 3 PROPUESTAS
AspectoAntigravityEquilibradoMi PropuestaDiagnóstico✅ Correcto✅ Correcto✅ Correcto + concretoAccesibilidad❌ Ignora WCAG✅ Prioriza✅ Checklist obligatorioRendimiento❌ Heavy blur✅ Optimizado✅ + Mobile priorityIdentidad marca⚠️ Exagerada✅ Equilibrada✅ + Guidelines concretasImplementabilidad❌ Vago⚠️ Buena✅ Specs exactas (CSS, medidas)Mobile UX❌ Bottom nav error✅ Drawer correcto✅ + Card view tables

✅ RESUMEN EJECUTIVO PARA TI, RICARDO
Usa MI PROMPT porque:

✅ Equilibrio perfecto: Modernidad SIN sacrificar usabilidad B2G
✅ Especificaciones concretas: CSS exacto, medidas, no conceptos vagos
✅ Accesibilidad mandatoria: WCAG checklist integrado
✅ Fases de implementación: Priorizado (MVP → Polish)
✅ Anti-patterns explícitos: Qué NO hacer (evita errores)

Ignora las partes peligrosas de Antigravity:

❌ Glassmorphism
❌ Neon colors
❌ "HUD futurista"
❌ Bottom navigation

Toma lo bueno de Equilibrado y expándelo:

✅ "Eco-Modernism" concept
✅ WCAG awareness
✅ Professional tone

Adicionalmente, se ha requerido hacer una mejora visual a ciertos elementos del dashboard e indicadores:

Excelente análisis estratégico, Ricardo. Has identificado 2 problemas fundamentales de jerarquía de información y utilidad práctica. Voy a darte una crítica constructiva y propuesta de rediseño:

🎯 ANÁLISIS DE TUS 2 OBSERVACIONES CRÍTICAS
PROBLEMA 1: Alerta SINADER Monopoliza el Dashboard
Tu diagnóstico: ✅ CORRECTO
Análisis UX:
Estado actual:
┌─────────────────────────────────────────────────┐
│ 🚨 ALERTA SINADER (80% ancho pantalla)         │
│ Progress 45% | 18 días restantes               │
└─────────────────────────────────────────────────┘
     ↓ PROBLEMA:
- Empuja calendario "below the fold"
- Usuario debe scroll para ver próximos hitos
- Desperdicia espacio en monitor wide (1920px+)
Por qué falla:

❌ Falsa jerarquía: La alerta es importante, pero NO es la única tarea del día
❌ Layout rígido: No aprovecha espacio horizontal disponible
❌ Métrica incompleta: "45% progreso" es vaga si el reporte es manual/variable


PROBLEMA 2: Tarjetas Gigantes + Scroll Forzado
Tu diagnóstico: ✅ ABSOLUTAMENTE CORRECTO
Análisis UX:
Indicadores Territoriales (sidebar abierto):
┌──────────────────────────────────────┐
│ Categorías: 7 cards × 280px ancho   │
│ = Solo caben 3-4 en pantalla        │
│ = Scroll horizontal necesario       │
└──────────────────────────────────────┘

KPIs (445 mm, 423 mm, etc.):
- Cards de 250px altura
- Solo 3 KPIs visibles
- Gráfico grande (400px) empuja análisis fuera de vista

RESULTADO: Usuario hace 2-3 scrolls para entender 1 indicador
Por qué falla:

❌ Pensamiento "mobile-first" mal aplicado: Cards gigantes para desktop
❌ Gráfico demasiado prominente: El número (445 mm) es lo crítico, no la curva
❌ Análisis textual escondido: El insight "+5.2% tendencia creciente" queda invisible


🚀 SOLUCIÓN: "PowerPoint-Ready Design"
PRINCIPIO RECTOR:

"Cada vista debe ser screenshot-ready para presentación"
Si el usuario debe hacer scroll para entender el insight completo, el diseño FALLÓ.


📐 REDISEÑO PROPUESTO
A. DASHBOARD HOME - Bento Grid Equilibrado
┌─────────────────────────────────────────────────────────────────┐
│ DASHBOARD - Municipalidad Peñalolén                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                  │
│ ┌──────────────────────────┬──────────────────────────────────┐ │
│ │ 🚨 ALERTA SINADER        │ 📅 PRÓXIMOS HITOS (3)            │ │
│ │                          │                                  │ │
│ │ Progreso: 45% ━━━━━⚪⚪⚪  │ 🔴 15 Dic - SINADER (18 días)   │ │
│ │ 12/20 secciones OK       │ 🔵 22 Mar - Día del Agua        │ │
│ │ [Continuar Reporte →]    │ 🟢 22 Abr - Día de la Tierra    │ │
│ │                          │                                  │ │
│ │ Falta:                   │ [Ver Calendario Completo →]      │ │
│ │ • Anexo C (Residuos)     │                                  │ │
│ │ • Tabla 3.2 (Reciclaje)  │                                  │ │
│ └──────────────────────────┴──────────────────────────────────┘ │
│                                                                  │
│ ┌────────────────┬────────────────┬────────────────────────────┐ │
│ │ KPI 1          │ KPI 2          │ KPI 3                      │ │
│ │ Reciclaje      │ PM2.5          │ Temperatura                │ │
│ │                │                │                            │ │
│ │ 2,150 ton      │ 42 µg/m³ ⚠️    │ 21°C                      │ │
│ │ +18% vs 2023   │ Meta: <15      │ +2°C vs ayer              │ │
│ │ [Mini spark]   │ [Mini spark]   │ [Mini spark]              │ │
│ └────────────────┴────────────────┴────────────────────────────┘ │
│                                                                  │
│ ┌─────────────────────────────────────────┬───────────────────┐ │
│ │ TENDENCIA ANUAL - Reciclaje             │ TOP 5 COMUNAS     │ │
│ │ [Gráfico línea 600px × 300px]           │ 1. Las Condes     │ │
│ │                                         │ 2. Providencia    │ │
│ │ Insight: +18% vs 2023, superando meta  │ 3. Vitacura       │ │
│ │ [Descargar PNG] [Copiar a PPT]         │ 8. Peñalolén (tú) │ │
│ └─────────────────────────────────────────┴───────────────────┘ │
└─────────────────────────────────────────────────────────────────┘

TODO visible sin scroll en pantalla 1920×1080
Cambios clave:

✅ Alerta + Calendario lado a lado (50/50 o 60/40)
✅ KPIs compactos con mini-sparklines (no gráficos gigantes)
✅ Insights textuales visibles (no escondidos abajo)
✅ CTAs de export en cada gráfico


B. INDICADORES TERRITORIALES - Grid Compacto
┌─────────────────────────────────────────────────────────────────┐
│ INDICADORES TERRITORIALES                                        │
│ Visualiza y analiza datos ambientales históricos                │
│                                                                  │
│ [Vista Local] [Visor Nacional]                                  │
│                                                                  │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ SELECCIONA CATEGORÍA                                             │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                                  │
│ ┌──────┬──────┬──────┬──────┬──────┬──────┬──────┐             │
│ │ 🌡️   │ 💧   │ ⚡   │ ♻️   │ 🌫️   │ 🌲   │ 🌳   │             │
│ │Clima │ Agua │Energ.│Resid.│Aire  │Biodiv│Áreas │             │
│ └──────┴──────┴──────┴──────┴──────┴──────┴──────┘             │
│                                                                  │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│ INDICADORES DE CLIMA (5 disponibles)                            │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
│                                                                  │
│ ▶ Precipitación Anual ······························· [Ver →] │
│   445 mm (2024) | +5.2% vs promedio 10 años                     │
│   Comparar con: [Nacional] [Regional] [Comunas similares]       │
│                                                                  │
│ ▶ Temperatura Media Anual ·························· [Ver →] │
│   18.5°C (2024) | +1.2°C vs promedio histórico                  │
│                                                                  │
│ ▶ Días con Lluvia ·································· [Ver →] │
│   87 días (2024) | -12 días vs promedio                         │
│                                                                  │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │
└─────────────────────────────────────────────────────────────────┘

Cards → Accordion List (escaneable, compacto)
Al hacer click en "Precipitación Anual → [Ver]":
┌─────────────────────────────────────────────────────────────────┐
│ ← Volver a Indicadores                                          │
│                                                                  │
│ PRECIPITACIÓN ANUAL - PEÑALOLÉN                                  │
│ [📥 Descargar datos] [📊 Exportar gráfico] [📋 Copiar tabla]   │
│                                                                  │
│ ┌──────────────────────────────────────────────────────────────┐ │
│ │ SNAPSHOT EJECUTIVO (Listo para screenshot)                   │ │
│ │                                                               │ │
│ │ ┌─────────┬──────────┬─────────────┬──────────────┐         │ │
│ │ │ ACTUAL  │ PROMEDIO │ MÁXIMO HIST │ MÍNIMO HIST  │         │ │
│ │ │ (2024)  │ 10 años  │ (2016)      │ (2019)       │         │ │
│ │ ├─────────┼──────────┼─────────────┼──────────────┤         │ │
│ │ │ 445 mm  │ 423 mm   │ 612 mm      │ 287 mm       │         │ │
│ │ │ ↗️ +5.2%│          │             │              │         │ │
│ │ └─────────┴──────────┴─────────────┴──────────────┘         │ │
│ │                                                               │ │
│ │ [Gráfico tendencia 2015-2024: 800px × 300px]                 │ │
│ │                                                               │ │
│ │ 💡 INSIGHT CLAVE:                                            │ │
│ │ "Precipitación 2024 está 5.2% sobre promedio histórico.     │ │
│ │  Tendencia creciente sostenida desde 2019."                  │ │
│ └───────────────────────────────────────────────────────────────┘ │
│                                                                  │
│ ┌──────────────────────────────────────────────────────────────┐ │
│ │ COMPARACIÓN NACIONAL (Ranking 346 comunas)                   │ │
│ │                                                               │ │
│ │ Tu posición: #8 de 346 (Top 2.3%)                           │ │
│ │                                                               │ │
│ │ 1. Las Condes   ████████████████████ 8.5 m²/hab             │ │
│ │ 2. Providencia  ██████████████████ 7.2 m²/hab               │ │
│ │ ...                                                           │ │
│ │ 8. Peñalolén    ████████████ 4.2 m²/hab (TÚ) 🟢             │ │
│ │ ...                                                           │ │
│ │ Promedio: 3.2 m²/hab | Mediana: 2.8 m²/hab                  │ │
│ └───────────────────────────────────────────────────────────────┘ │
│                                                                  │
│ TODO ESTO cabe en 1 pantalla sin scroll                         │
└─────────────────────────────────────────────────────────────────┘

📋 NUEVA ESTRUCTURA PROPUESTA
Archivo actualizado para Figma Designer:Crear prompt actualizado para Figma con observaciones de Ricardo sobre jerarquía y utilidadDESIGN-SYSTEM-v2-POWERPOINT-READY.mdPerfecto! He creado el Design System v2.0 actualizado.
📥 DESCARGAR: Design System v2.0 "PowerPoint-Ready"

🎯 RESUMEN DE CAMBIOS CRÍTICOS
TU OBSERVACIÓN #1: Alerta SINADER monopoliza dashboard
❌ ANTES:
┌─────────────────────────────────────────┐
│ ALERTA SINADER (80% pantalla)          │ ← Empuja todo abajo
└─────────────────────────────────────────┘
     [scroll necesario para calendario]
✅ AHORA:
┌────────────────────┬───────────────────┐
│ ALERTA SINADER     │ PRÓXIMOS HITOS    │ ← 50/50 split
│ • Progress 45%     │ • SINADER (18d)   │
│ • 3 pendientes     │ • 4 más hitos     │
│ • CTA continuar    │ • Ver calendario  │
└────────────────────┴───────────────────┘
Ganancia: Calendario visible sin scroll, mismo espacio para alerta + contexto

TU OBSERVACIÓN #2: Cards gigantes + scroll forzado
❌ ANTES:
Categorías: 7 cards × 280px × 200px = 1,400px altura
Indicador detail: KPIs gigantes (250px) + chart (400px) = 650px
Total: Solo 2-3 elementos visibles en 1080px screen
✅ AHORA:
Categorías: 7 buttons × 96px horizontal = Caben todos
Indicador detail: 4 KPIs (140px) + Chart+Insight (320px) = 460px
Total: Todo visible en 850px (sobra espacio en 1080px)
Ganancia: Vista completa sin scroll, más información en menos espacio

🎨 PRINCIPIO RECTOR NUEVO
"PowerPoint-Ready Design"

Cada vista debe ser screenshot-ready para presentación.
Si el usuario debe scrollear para entender el insight completo, el diseño FALLÓ.

Test de éxito:

Director ambiental tiene 5 minutos para crear presentación 3 slides
Debe poder hacerlo solo con screenshots + botones export
Sin frustración
