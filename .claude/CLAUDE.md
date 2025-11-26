# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🎯 Project Overview

**Simbioma v3.0** is a dual-market SaaS platform that enables **governments** AND **businesses** in Chile to transition from basic sustainability compliance to territorial and corporate regeneration through integrated data consolidation and automated ESG reporting.

### Dual Value Proposition

**FOR PUBLIC SECTOR (B2G):**
- Save municipalities 80% of reporting time (from 60 hours per month or more to less than 12 hours monthly)
- Consolidate multi-source data in one dashboard (APIs, Excel, IoT sensors)
- Automated ESG reports (SINADER, SCAM, SINIA, GRI, CDP Cities, TCFD)
- Visualize territorial transition: compliance → restoration → regeneration

**FOR PRIVATE SECTOR (B2B):**
- Corporate ESG reporting (GRI, SASB, CDP, B Corp, ISO 14001)
- Custom indicators by industry (mining, retail, construction, manufacturing)
- Anonymous benchmarking vs. competitors by sector
- Contribute to territorial impact indicators (optional transparency)

### Target Markets

**Public Sector:** 345 Chilean municipalities + 16 regional governments
**Private Sector:** Large corporations (>1,000 employees), Medium enterprises (100-1,000), SMEs (future)

**Key Industries:** Mining, Retail, Manufacturing, Construction, Agribusiness

**Market Drivers:** REP Law (Extended Producer Responsibility), Chile's 2040 goals, Climate Law, ESG investor pressure

### Tech Stack

- **Framework**: Next.js 16 (App Router)
- **React**: v19.2.0
- **Styling**: Tailwind CSS 4 with custom design tokens
- **TypeScript**: Strict mode enabled
- **Backend**: Supabase (PostgreSQL 15 + Auth + Storage)
- **Font**: Inter (Google Fonts)

---

## 📚 Key Documentation

**CRITICAL - Read before strategic decisions:**

1. **Business Model**: `docs/business-model.md` - Dual market strategy (B2G + B2B), pricing tiers, revenue projections
2. **PRD**: `docs/PRD-simbioma.md` - Complete product requirements v3.0 with B2B features
3. **Database Schema**: `docs/architecture/database-schema.md` - 22 tables with Mermaid diagram
4. **Indicators Model v4.0**: `docs/architecture/indicators-modelv4.md` - Subscription + versioning system (CRITICAL)
5. **Research**: `docs/research/` - Market research documents
6. **Brand Guidelines**: `design/brand/brand-guidelines.md` - Visual identity and design principles

---

## 🛠️ Key Commands

```bash
# Development
npm run dev          # Start dev server at http://localhost:3000

# Production
npm run build        # Build for production
npm run start        # Start production server

# Linting
npm run lint         # Run ESLint

# Testing (when implemented)
npm run test         # Run unit tests
npm run test:e2e     # Run E2E tests with Playwright
```

---

## 📁 Architecture & Structure

### Project Structure

```
simbioma-web/
├── .claude/                      # Claude Code configuration
│   ├── CLAUDE.md                # This file
│   └── secrets.env              # Environment variables (not committed)
├── app/                         # Next.js App Router
│   ├── layout.tsx              # Root layout with Header/Footer
│   ├── page.tsx                # Landing page (single-page design)
│   └── globals.css             # Global styles
├── components/
│   ├── layout/                 # Layout components (Header, Footer)
│   ├── ui/                     # Reusable UI components (Button, Card, Input)
│   ├── forms/                  # Form components
│   └── sections/               # Page sections (Hero, Features, etc.)
├── lib/
│   ├── utils/
│   │   └── cn.ts              # Tailwind class merger utility
│   └── constants/
│       └── siteConfig.ts      # Site configuration & navigation
├── docs/                       # Project documentation
│   ├── PRD-simbioma.md        # Product Requirements Document v3.0
│   ├── business-model.md      # Business model (Dual: B2G + B2B)
│   ├── research/              # Market research documents
│   └── architecture/          # Technical architecture docs
│       ├── database-schema.md         # Mermaid diagram (22 tables)
│       └── indicators-modelv4.md      # Indicator subscription system
├── design/                     # Design assets
│   ├── brand/                 # Brand guidelines
│   ├── mockups/               # Visual references
│   └── assets/                # Logos, icons, images
├── tests/                      # Test files (when implemented)
└── public/                     # Static assets
```

---

## 🗄️ Database Architecture v4.0 (CRITICAL)

### Core Entities

**Organizations (Polymorphic):**
- `gobierno_local` - Municipalities + Regional Governments (345 + 16)
- `actors` - Private companies (mining, retail, construction, etc.)

**Indicator System v4.0 (Unique Differentiator):**
- `indicators` - Universal catalog with namespace + versioning
  - Namespace: `global/PM2.5`, `mining/water-recirculation`, `empresa-X/custom-metric`
  - Versioning: v1, v2, v3 coexist (orgs migrate at their own pace)
- `organization_indicator_subscriptions` - Each org subscribes to specific indicators (status: active/deprecated_for_us)
- `indicator_recommendations` - Intelligent suggestions by industry/sector
- `indicator_migration_requests` - Tracking version migrations
- `indicator_values` - Data points (validates active subscription)

**Key Features:**
- `projects` + `project_financial_breakdown` - Public projects require financial transparency, private = optional
- `reports` - ESG reports with electronic signature support
- `subscription_plans` - Tiered pricing (Free, Basic, Professional, Enterprise, Government)
- `billing_history` - Revenue tracking

**Total Tables:** 22 (6 new in v4.0)

**Read full schema:** `docs/architecture/database-schema.md`
**Read indicator model:** `docs/architecture/indicators-modelv4.md`

---

## 🎨 Design System

### Custom Color Palette (EXACT CODES REQUIRED)

```css
/* Brand Colors */
--green-primary: #2D9D78;    /* Verde Bosque - Primary brand */
--blue-primary: #1E5F8C;     /* Azul Océano - Secondary brand */
--yellow-accent: #F5A623;    /* Amarillo Sol - Accent */

/* Neutrals */
--gray-dark: #2C3E50;
--gray-medium: #6B7280;
--gray-light: #F8F9FA;
```

Defined in: `tailwind.config.ts`

### Button Variants (components/ui/Button.tsx)

- `primary`: Green primary background (#2D9D78)
- `secondary`: Blue primary background (#1E5F8C)
- `outline`: Green border with transparent background
- `ghost`: Text-only with subtle hover

### Typography

- **Font**: Inter (Google Fonts)
- **Weights**: 300, 400, 500, 600, 700, 800
- Use Tailwind's type scale: `text-xs` through `text-4xl`

---

## 🔧 Important Patterns

### 1. Path Aliases

Use `@/*` for imports from root:

```typescript
import Header from "@/components/layout/Header"
import { cn } from "@/lib/utils/cn"
import { siteConfig } from "@/lib/constants/siteConfig"
```

### 2. Client vs Server Components

- Use Server Components by default (Next.js 16)
- Add `'use client'` only when needed (state, effects, event handlers)
- Example: Header uses `'use client'` for mobile menu state

### 3. Styling Utility

Always use the `cn()` utility when combining Tailwind classes:

```typescript
import { cn } from "@/lib/utils/cn"

<div className={cn(
  "base-classes",
  condition && "conditional-classes",
  className
)} />
```

### 4. Polymorphic Relationships

Organizations are either `gobierno_local` or `actor_privado`. Use polymorphic fields:

```typescript
{
  owner_type: 'gobierno_local' | 'actor_privado',
  owner_id: uuid
}
```

### 5. Indicator Subscriptions (v4.0 Critical Pattern)

Organizations don't use all indicators. They subscribe to specific ones:

```typescript
// Check active subscription before creating values
const subscription = await checkActiveSubscription(
  organizationId,
  indicatorId
);

if (!subscription || subscription.status !== 'active') {
  throw new Error('Must subscribe to indicator first');
}
```

---

## 🚀 Development Workflows

### For New Features

1. **Browse**: Read relevant docs (PRD, business-model.md, indicators-modelv4.md)
2. **Identify Sector**: Is this B2G (government) or B2B (business) feature?
3. **Check Polymorphism**: Does it apply to both sectors or just one?
4. **Plan**: Consider subscription tiers and limits (Free vs Enterprise)
5. **Code**: Implement with TypeScript + Tailwind + Supabase RLS
6. **Verify**: Test responsive design + accessibility (WCAG AA)

### For Indicator-Related Features

**CRITICAL:** Always consult `docs/architecture/indicators-modelv4.md` first.

Key concepts:
- **Namespace**: `global/`, `mining/`, `empresa-X/`
- **Versioning**: v1 and v2 coexist, orgs migrate independently
- **Subscriptions**: Orgs choose which indicators to use
- **Recommendations**: Industry-specific suggestions
- **Transparency**: Show data limitations explicitly

### For Dual-Sector Features

When building features that apply to BOTH governments and businesses:

1. Use polymorphic owner_type/owner_id pattern
2. Check subscription_plan_id for feature availability
3. Consider different UX for each sector:
   - Governments: Focus on territorial aggregation, transparency
   - Businesses: Focus on benchmarking, privacy controls

### For UI/Front-End Changes (Playwright MCP)

**Cuando hagas cambios visuales en el front-end:**

  1. Usa el servidor MCP de Playwright para verificar tu trabajo
  2. Toma screenshots antes y después de los cambios
  3. Verifica la responsividad en diferentes tamaños
  4. Confirma que no hay errores en la consola

**Workflow sugerido después de cambios UI:**

  ```bash
  # 1. Inicia el servidor de desarrollo (si no está corriendo)
  npm run dev

  # 2. Usa Playwright MCP para:
  # - Navegar a http://localhost:3000
  # - Tomar screenshot del componente modificado
  # - Revisar los logs de consola
  # - Verificar accesibilidad básica
  ```

**Checklist de verificación:**
- [ ] Screenshot desktop (1920x1080)
- [ ] Screenshot tablet (768x1024)
- [ ] Screenshot mobile (375x667)
- [ ] Sin errores en consola
- [ ] Colores de marca correctos (#2D9D78, #1E5F8C, #F5A623)
- [ ] Sin scroll horizontal en mobile
- [ ] Accesibilidad básica (contraste, navegación por teclado)

---

## 💻 TypeScript Standards

```typescript
// ✅ GOOD - Explicit types, polymorphic support
interface IndicatorValueProps {
  ownerType: 'gobierno_local' | 'actor_privado';
  ownerId: string;
  indicatorId: string;
  value: number;
}

// ✅ GOOD - Subscription tier validation
type SubscriptionTier = 'free' | 'basic' | 'professional' | 'enterprise' | 'government_starter' | 'government_professional' | 'government_enterprise';

// ❌ BAD - Using 'any'
function processDashboard(data: any) { ... }
```

**Rules:**
- Use strict typing; avoid `any` types
- Interfaces for component props
- Types for API data structures
- Use discriminated unions for polymorphic data
- Enable all TypeScript strict flags

---

## 🎯 Component Organization

### Layout Components (`components/layout/`)
- Header, Footer, Navigation
- Page wrappers and containers

### UI Components (`components/ui/`)
- Buttons, Inputs, Cards, Badges
- Reusable, generic components
- Follow existing button variants pattern

### Form Components (`components/forms/`)
- Form fields, validation
- React Hook Form + Zod integration

### Page Sections (`components/sections/`)
- Hero, Features, Testimonials
- Page-specific sections

---

## 🎨 Styling Guidelines

1. **Tailwind-First**: Use utility classes; avoid custom CSS unless necessary
2. **Brand Colors ONLY**: Use defined color variables (green-primary, blue-primary, yellow-accent)
3. **Responsive**: Mobile-first using `sm:`, `md:`, `lg:`, `xl:` breakpoints
4. **Spacing**: Use Tailwind's spacing scale (4px increments)
5. **Typography**: Use Inter font with appropriate weights

```tsx
// ✅ GOOD - Brand colors, responsive
<div className="bg-green-primary text-white px-6 py-4
                rounded-lg shadow-md
                md:px-8 md:py-6
                lg:px-12 lg:py-8">

// ❌ BAD - Arbitrary colors, not responsive
<div className="bg-green-500" style={{ padding: '25px' }}>
```

---

## 🔒 Security Guidelines

### Environment Variables

Store in `.claude/secrets.env` (add to .gitignore):

```bash
NEXT_PUBLIC_SUPABASE_URL=your_url_here
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_key_here
SUPABASE_SERVICE_ROLE_KEY=your_service_key_here
DATABASE_URL=your_db_url_here
```

### Security Priorities

1. **Sensitive Data**: Municipal + corporate data encrypted at rest
2. **Authentication**: Supabase Auth with JWT, MFA for Enterprise
3. **Row Level Security**: Always implement RLS policies
4. **Electronic Signatures**: AES-256 + salt for certificates
5. **Privacy**: Businesses control what data is public/territorial

### Supabase RLS Pattern

```sql
-- Org isolation: users only see their organization's data
CREATE POLICY "org_isolation"
ON indicator_values FOR SELECT
USING (
  owner_id IN (
    SELECT organization_id FROM users WHERE id = auth.uid()
  )
);

-- Superadmins see everything
CREATE POLICY "superadmin_override"
ON indicator_values FOR ALL
USING (
  (SELECT role FROM users WHERE id = auth.uid()) = 'superadmin'
);
```

---

## 🌐 Language & Content

### Language

- **Primary**: Spanish (es)
- **Tone**: Professional but accessible, solution-oriented, data-driven
- **Context**: Chilean regulatory environment (REP Law, Climate Law, 2040 goals)

### Target Users

**Sector Público:**
- Municipal Environmental Officers (30-50 years, technical background)
- Limited time, dispersed data, multiple regulatory reports

**Sector Privado:**
- ESG/Sustainability Managers (35-45 years, MBA/specialized)
- Managing multiple operations, need consolidated ESG reporting
- Pressure from investors, customers, headquarters

### Writing Style

**Dashboard & Reports:**
- Direct and concise
- Action-focused: "Próximos pasos", "Mejora identificada"
- Concrete data: "Aumentaste 15% vs. trimestre anterior"

**Transparency in Limitations:**
- ALWAYS show when data is incomplete
- Example: "8 de 15 empresas reportan (53%), metodologías mixtas"
- Never pretend homogeneity that doesn't exist

**Error Messages:**
- Empathetic: "Algo salió mal. Estamos en ello"
- Clear solution: "Intenta [specific action]"
- Contact if persists: "Contáctanos si continúa"

---

## 🎯 Design Principles for Simbioma

1. **Transparency Radical**: Always show data limitations explicitly
2. **Dual Sector UX**: Government = territorial focus, Business = benchmarking focus
3. **Progressive Disclosure**: Simple dashboard by default, details in modals
4. **Municipal Simplicity**: Interfaces that work with limited connectivity
5. **Corporate Professionalism**: Enterprise-grade for ESG managers
6. **Immediate Action**: Every view should have clear next steps

---

## ⚠️ Important Notes for Claude

### ALWAYS:
- Use exact brand colors (#2D9D78, #1E5F8C, #F5A623)
- Consult PRD + business-model.md before implementing features
- Check if feature applies to B2G, B2B, or both
- Use polymorphic patterns (owner_type/owner_id)
- Validate subscription tier before enabling features
- Read indicators-modelv4.md for indicator-related work
- Show data limitations transparently (never fake homogeneity)
- Consider both municipal users AND corporate ESG managers
- Validate input on both client and server
- Use TypeScript strict mode
- Implement Supabase RLS policies

### NEVER:
- Use arbitrary colors outside brand palette
- Make assumptions about which sector a feature serves (check docs)
- Commit secrets or sensitive data
- Skip accessibility considerations (WCAG AA minimum)
- Use `any` type in TypeScript
- Allow indicator values without active subscription
- Pretend data is complete when it's not (transparency!)
- Assume only municipalities use the platform (it's dual-sector!)

### PRIORITIES:
1. **Security**: Municipal + corporate sensitive data
2. **Transparency**: Explicit limitations in data aggregation
3. **Flexibility**: Subscription model allows org-specific indicators
4. **Scalability**: 345 municipalities + hundreds of corporations

---

## 💡 Quick Reference

### Starting Development

```bash
npm run dev
# Open http://localhost:3000
```

### Before Committing

- [ ] Run `npm run lint`
- [ ] Test manually in browser (desktop + mobile)
- [ ] Check responsive design (375px, 768px, 1920px)
- [ ] Verify brand colors used (#2D9D78, #1E5F8C, #F5A623)
- [ ] Confirm TypeScript strict mode passes
- [ ] Test both government AND business user scenarios (if applicable)

### When Stuck

1. Check this CLAUDE.md
2. Consult `docs/PRD-simbioma.md` for feature specs
3. Review `docs/business-model.md` for business logic
4. Read `docs/architecture/indicators-modelv4.md` for indicator system
5. Check `design/brand/brand-guidelines.md` for visual guidelines

---

## 🔑 Key Differentiators (Unique to Simbioma)

### 1. Dual Sector (No Competitor Has This)
- Public + Private in one platform = complete territorial picture
- Network effects: more orgs = better benchmarks

### 2. Indicator Subscription System v4.0 (Patent-Worthy)
- Namespace hierarchy (global/industry/org-specific)
- Versioning with independent migration (no breaking changes)
- Transparent aggregation with limitation warnings
- Intelligent recommendations by industry

### 3. Chilean Regulatory Expertise
- SINADER, SCAM, SINIA, REP Law integration
- SII electronic signature/invoicing
- Not replicable by international SaaS

### 4. Radical Transparency
- Explicitly shows incomplete data
- "2 of 15 organizations report, mixed methodologies"
- Builds trust vs. faking homogeneity

### 5. Accessible Pricing
- 10x cheaper than consultancies (EY charges $50K USD for GRI report)
- Small municipalities can afford ($3,600 USD/year)

---

## 📞 Questions?

When in doubt:
1. Review relevant documentation in `docs/`
2. Check if feature is B2G, B2B, or both
3. Validate against subscription tier limits
4. Consider indicator subscription model v4.0
5. Ask for clarification before proceeding

**Remember**: This platform helps BOTH municipalities AND corporations achieve regeneration. Every feature should:
- Reduce reporting time (governments) OR provide benchmarking insights (businesses)
- Respect subscription tier limits
- Show data limitations transparently
- Work for both sectors (when applicable)

---

## 📝 Changelog

### v3.0 - 2025-11-24 (Major Update)

**Breaking Conceptual Changes:**
- 🔄 **Platform Scope Expanded**: From municipal-only to dual-sector (B2G + B2B)
- 🔄 **Target Market Redefined**: Now serves 345 municipalities + 16 GORE + hundreds of corporations
- 🔄 **Indicator Model**: Upgraded from static catalog to subscription-based v4.0 system

**Major Additions:**

1. **Dual-Market Model (B2G + B2B)**
   - Added complete B2B value proposition (corporate ESG reporting, benchmarking)
   - Added private sector target users (ESG/Sustainability Managers)
   - Added industry verticals (mining, retail, construction, manufacturing)
   - Added subscription tiers for both sectors (6 tiers total)

2. **Database Architecture v4.0**
   - Added `actors` table (private companies)
   - Added `organization_indicator_subscriptions` (subscription model)
   - Added `indicator_recommendations` (intelligent suggestions)
   - Added `indicator_migration_requests` (version tracking)
   - Added `project_financial_breakdown` (public = mandatory, private = optional)
   - Added `subscription_plans` and `billing_history`
   - Total: 22 tables (6 new in v4.0)

3. **Indicator Subscription System**
   - Added namespace hierarchy documentation (`global/`, `industry:mining/`, `org-specific/`)
   - Added versioning with independent migration (v1, v2 coexist)
   - Added subscription status per organization (active/deprecated_for_us)
   - Added transparent aggregation with limitation warnings
   - Added reference to critical document: `indicators-modelv4.md`

4. **Development Workflows**
   - Added "For Dual-Sector Features" workflow
   - Added "For Indicator-Related Features" workflow (with CRITICAL label)
   - Added polymorphic relationship patterns
   - Added subscription tier validation guidelines
   - Added B2G vs B2B feature identification checklist

5. **TypeScript Standards**
   - Added polymorphic types (`owner_type` discriminated unions)
   - Added subscription tier types
   - Added indicator subscription validation patterns

6. **Security Guidelines**
   - Added corporate data sensitivity considerations
   - Added business privacy controls
   - Added electronic signature encryption (AES-256)
   - Added Supabase RLS pattern examples

7. **Documentation References**
   - Added `docs/business-model.md` as critical document
   - Added `docs/architecture/indicators-modelv4.md` as critical document
   - Added database schema reference: `database-schema.md`

8. **Key Differentiators Section**
   - Added competitive advantages documentation
   - Added dual-sector unique value proposition
   - Added indicator subscription system as patent-worthy
   - Added Chilean regulatory expertise as moat
   - Added radical transparency as trust builder

**Corrections:**
- ✅ Removed fragile line number references (e.g., "tailwind.config.ts:11-17")
- ✅ Removed documentation of future features as if they exist (slash commands, test infrastructure)
- ✅ Removed references to "4 market research documents" (now says "Market research documents")

**Structural Improvements:**
- Added CRITICAL labels to indicator-related documentation
- Added emoji indicators for better scanability
- Reorganized sections for logical flow (Overview → Docs → Commands → Architecture)
- Added cross-references between related sections
- Added inline code examples for key patterns

**Philosophy Changes:**
- **Before**: Municipal sustainability platform
- **After**: Dual-sector territorial regeneration ecosystem with industry-leading indicator flexibility

**Documentation Impact:**
- Lines added: ~320
- Sections added: 4 (Database Architecture, Key Differentiators, Dual-Sector Workflows, Enhanced TypeScript Standards)
- Critical references added: 2 (business-model.md, indicators-modelv4.md)

---

**CLAUDE.md v3.0**
**Last Updated:** 2025-11-24
**Revision:** Reflects dual-sector model (B2G + B2B) + Indicator Subscription System v4.0