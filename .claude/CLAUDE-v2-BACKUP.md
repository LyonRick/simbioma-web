# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 🎯 Project Overview

**Simbioma** is a SaaS platform that helps Chilean municipalities transition from basic sustainability compliance to territorial regeneration through integrated data consolidation and automated ESG reporting.

**Value Proposition**: Save municipalities 80% of reporting time (from 60 hours to 12 hours annually) while visualizing the transition from compliance to territorial regeneration.

**Target Users**: Municipal Environmental Officers (30-50 years, technical/university background) managing multiple regulatory reports with dispersed data and limited time.

**Market**: 345 Chilean municipalities, driven by REP Law (Extended Producer Responsibility) and Chile's 2040 goals.

### Tech Stack

- **Framework**: Next.js 16 (App Router)
- **React**: v19.2.0
- **Styling**: Tailwind CSS 4 with custom design tokens
- **TypeScript**: Strict mode enabled
- **Font**: Inter (Google Fonts)

---

## 📚 Key Documentation

**Before making strategic decisions, consult:**
- **PRD**: `docs/PRD-Simbioma.md` - Complete product requirements
- **Business Model**: `docs/business-model.md` - Commercial strategy and pricing
- **Research**: `docs/research/` - 4 market research documents
- **Brand Guidelines**: `design/brand/brand-guidelines.md` - Visual identity and design principles
- **Architecture**: `docs/architecture/` - Technical architecture and database schema

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
│   ├── commands/                # Custom slash commands
│   │   ├── code/               # Code optimization commands
│   │   ├── git/                # Git workflow commands
│   │   ├── review/             # Review commands
│   │   └── project/            # Project-specific commands
│   ├── outputs/                 # Generated outputs (screenshots, reports)
│   └── secrets.env              # Environment variables (not committed)
├── app/                         # Next.js App Router
│   ├── layout.tsx              # Root layout with Header/Footer
│   ├── page.tsx                # Landing page (single-page design)
│   └── globals.css             # Global styles
├── components/
│   ├── layout/                 # Layout components
│   │   ├── Header.tsx         # Sticky header with navigation
│   │   └── Footer.tsx         # Footer with site links
│   ├── ui/                     # Reusable UI components
│   │   ├── Button.tsx         # Button with variants
│   │   ├── Card.tsx
│   │   └── Input.tsx
│   ├── forms/                  # Form components
│   └── sections/               # Page sections
├── lib/
│   ├── utils/
│   │   └── cn.ts              # Tailwind class merger utility
│   └── constants/
│       └── siteConfig.ts      # Site configuration & navigation
├── docs/                       # Project documentation
│   ├── PRD-Simbioma.md        # Product Requirements Document
│   ├── business-model.md      # Business model and strategy
│   ├── research/              # Market research documents
│   └── architecture/          # Technical architecture docs
├── design/                     # Design assets
│   ├── brand/                 # Brand guidelines
│   ├── mockups/               # Visual references
│   └── assets/                # Logos, icons, images
├── tests/                      # Test files
│   ├── unit/                  # Unit tests
│   ├── integration/           # Integration tests
│   └── e2e/                   # E2E tests (Playwright)
└── public/                     # Static assets
```

---

## 🎨 Design System

### Custom Color Palette

**Primary Colors** (always use these exact codes):
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

Defined in: `tailwind.config.ts:11-17`

### Button Variants

From `components/ui/Button.tsx:22-27`:
- `primary`: Green primary background (#2D9D78)
- `secondary`: Blue primary background (#1E5F8C)
- `outline`: Green border with transparent background
- `ghost`: Text-only with subtle hover

### Typography

- **Font**: Inter (Google Fonts)
- **Weights**: 400 (Regular), 500 (Medium), 600 (Semi-Bold), 700 (Bold)
- Use Tailwind's type scale: `text-xs` through `text-4xl`

---

## 🔧 Important Patterns

### 1. Path Aliases

Use `@/*` for imports from root (defined in `tsconfig.json:21-23`):
```typescript
import Header from "@/components/layout/Header"
import { cn } from "@/lib/utils/cn"
import { siteConfig } from "@/lib/constants/siteConfig"
```

### 2. Client Components

- Use Server Components by default
- Add `'use client'` only when needed (state, effects, event handlers)
- Example: Header uses `'use client'` for mobile menu state

### 3. Styling Utility

Always use the `cn()` utility from `@/lib/utils/cn` when combining Tailwind classes:
```typescript
import { cn } from "@/lib/utils/cn"

<div className={cn(
  "base-classes",
  condition && "conditional-classes",
  className
)} />
```

### 4. Site Configuration

Navigation items and site metadata are centralized in `lib/constants/siteConfig.ts:1-19`

### 5. Layout Structure

All pages share the same layout with Header/Footer from `app/layout.tsx:18-33`

---

## 🚀 Development Workflows

### For New Features

1. **Browse**: Read relevant docs (PRD, research, brand guidelines)
2. **Think**: Plan the solution considering municipal users and brand
3. **Code**: Implement with TypeScript + Tailwind
4. **Verify**: Test + Playwright screenshots + accessibility validation

### For UI Changes

1. Consult `design/brand/brand-guidelines.md`
2. Use **Playwright MCP** to verify implementation:
   - Navigate to localhost:3000
   - Take screenshots at: 1920x1080 (desktop), 768x1024 (tablet), 375x667 (mobile)
   - Check console logs for errors
   - Verify colors match brand exactly (#2D9D78, #1E5F8C, #F5A623)
3. Validate accessibility (WCAG AA minimum)

### For Features Aligned with PRD

1. Verify alignment with `docs/PRD-Simbioma.md`
2. Validate business model fit in `docs/business-model.md`
3. Check relevant research in `docs/research/`
4. Implement with TDD when possible
5. Update API documentation if applicable

---

## 💻 TypeScript Standards
```typescript
// ✅ GOOD - Explicit types, interface for props
interface DashboardProps {
  municipalityId: string;
  indicators: Indicator[];
}

export default function Dashboard({ municipalityId, indicators }: DashboardProps) {
  // ...
}

// ❌ BAD - Using 'any'
function Dashboard(props: any) { ... }
```

**Rules:**
- Use strict typing; avoid `any` types
- Interfaces for component props
- Types for API data structures
- Enable all TypeScript strict flags

---

## 🎯 Component Organization

### Layout Components
Place in `components/layout/`:
- Header, Footer, Navigation
- Page wrappers and containers

### UI Components
Place in `components/ui/`:
- Buttons, Inputs, Cards
- Reusable, generic components
- Follow existing button variants pattern

### Form Components
Place in `components/forms/`:
- Form fields, validation
- Form-specific logic

### Page Sections
Place in `components/sections/`:
- Hero, Features, Testimonials
- Page-specific sections

---

## 🎨 Styling Guidelines

1. **Tailwind-First**: Use utility classes; avoid custom CSS unless necessary
2. **Brand Colors**: ONLY use defined color variables (green-primary, blue-primary, yellow-accent)
3. **Responsive**: Mobile-first approach using `sm:`, `md:`, `lg:`, `xl:` breakpoints
4. **Spacing**: Use Tailwind's spacing scale (4px increments)
5. **Typography**: Use Inter font with appropriate weights
```tsx
// ✅ GOOD - Brand colors, responsive
<div className="bg-green-primary text-white px-6 py-4 
                rounded-lg shadow-md
                md:px-8 md:py-6
                lg:px-12 lg:py-8">

// ❌ BAD - Custom colors, not responsive
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

1. **Sensitive Municipal Data**: Encrypt at rest
2. **Authentication**: Multi-factor for administrators
3. **Validation**: Input validation on client AND server
4. **Secrets**: NEVER in code, always in environment variables
5. **Row Level Security**: Always implement in Supabase queries

### Never Commit

- API keys or secrets
- Real municipal data
- Sensitive information in logs
- `.env` files with real values

---

## 🤖 Using Playwright MCP

**When installed** (`claude mcp add playwright npx @playwright/mcp@latest`), use for:

1. **Verify Visual Changes**
```
   Navigate to http://localhost:3000
   Take screenshot at 1920x1080
   Take screenshot at 768x1024
   Take screenshot at 375x667
```

2. **Check Responsiveness**
   - Test at multiple breakpoints
   - Verify no horizontal scroll
   - Confirm elements don't overlap

3. **Accessibility Testing**
   - Keyboard navigation
   - Focus states visible
   - Contrast ratios (WCAG AA)

4. **Console Monitoring**
   - Read console logs
   - Report errors and warnings
   - Verify no network failures

---

## 📋 Custom Slash Commands

Once configured in `.claude/commands/`:

### Development
- `/code/optimize` - Optimize code for performance
- `/code/refactor` - Refactor maintaining functionality

### Git
- `/git/pr` - Create pull request with complete description
- `/git/commit` - Analyze changes and create logical commits

### Review
- `/review/full` - Complete review: functionality, security, tests
- `/review/security` - Security-specific audit
- `/review/design` - UI/UX review with Playwright

### Project-Specific
- `/project/sync-docs` - Sync changes with documentation
- `/project/validate-prd` - Validate feature against PRD

---

## 🎯 Design Principles for Simbioma

1. **Data First**: Clear visualizations before decoration
2. **Clear Progression**: Visualize journey from compliance → regeneration
3. **Municipal Simplicity**: Interfaces that work with limited connectivity
4. **Institutional Trust**: Professional design that inspires credibility
5. **Immediate Action**: Every view should have clear next steps

---

## 🧪 Testing Requirements

### Coverage
- Minimum: 80% overall coverage
- Critical business logic: 100% coverage
- E2E tests for main user flows

### Test Structure
```typescript
// Example unit test
describe('IndicatorCalculator', () => {
  it('calculates recycling rate correctly', () => {
    const result = calculateRecyclingRate(100, 30);
    expect(result).toBe(30);
  });
  
  it('handles division by zero', () => {
    const result = calculateRecyclingRate(0, 30);
    expect(result).toBe(0);
  });
});
```

### When to Test
- All utility functions
- Component logic (not just rendering)
- API integrations
- Critical user flows (E2E)

---

## 🌐 Language & Content

- **Language**: Spanish (es)
- **Tone**: Professional but accessible, solution-oriented, data-driven
- **Target**: Municipal officers with technical background
- **Context**: Chilean regulatory environment (REP Law, 2040 goals)

### Writing Style

**Dashboard & Reports**:
- Direct and concise
- Action-focused: "Próximos pasos", "Mejora identificada"
- Concrete data: "Aumentaste 15% vs. trimestre anterior"

**Error Messages**:
- Empathetic: "Algo salió mal. Estamos en ello"
- Clear solution: "Intenta [specific action]"
- Contact if persists: "Contáctanos si continúa"

---

## 💡 Quick Reference

### Starting Development
```bash
npm run dev
# Open http://localhost:3000
# Start Claude Code: claude
```

### Before Committing
- [ ] Run `npm run lint`
- [ ] Test manually in browser
- [ ] Check responsive design
- [ ] Verify brand colors used
- [ ] Run `/review/full` in Claude

### When Stuck
1. Check this CLAUDE.md
2. Consult `docs/PRD-Simbioma.md`
3. Review `design/brand/brand-guidelines.md`
4. Ask in team chat

---

## ⚠️ Important Notes for Claude

**ALWAYS:**
- Use exact brand colors (#2D9D78, #1E5F8C, #F5A623)
- Consult PRD before implementing major features
- Use Playwright MCP to verify UI changes
- Consider municipal users' limited tech resources
- Validate input on both client and server
- Use TypeScript strict mode

**NEVER:**
- Use arbitrary colors outside brand palette
- Make assumptions about business model (consult docs)
- Commit secrets or sensitive data
- Skip accessibility considerations
- Use `any` type in TypeScript

**PRIORITY 1**: Security of municipal data  
**PRIORITY 2**: Simplicity for municipal users  
**PRIORITY 3**: Scalability for 345 municipalities

---

## 📞 Questions?

When in doubt:
1. Review relevant documentation in `docs/`
2. Check brand guidelines in `design/brand/`
3. Use custom slash commands for validation
4. Ask for clarification before proceeding

**Remember**: This platform helps municipalities achieve territorial regeneration. Every feature should reduce their reporting time and provide clear, actionable insights.