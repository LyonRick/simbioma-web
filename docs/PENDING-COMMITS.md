# 📦 Pending Commits Queue

**Generado**: 2024-12-07 02:46  
**Estado**: Archivos modificados listos para commit

---

## Commit 5: fix(scroll) - Page Scroll Transition

### Mensaje de Commit
```
fix(scroll): Resolve page scroll transition on navigation

Root causes:
- scroll-smooth class on <html> conflicted with scroll restoration
- ConditionalLayout re-enabled smooth scroll after 100ms

Solution:
- Remove scroll-smooth class from app/layout.tsx
- Create ScrollToTop.tsx with useLayoutEffect + behavior: "instant"
- Simplify ConditionalLayout to use <ScrollToTop /> component
```

### Archivos a incluir
```powershell
git add app/layout.tsx
git add components/layout/ScrollToTop.tsx
git add components/layout/ConditionalLayout.tsx
git add ESTADO-PROYECTO.md
git commit -m "fix(scroll): Resolve page scroll transition on navigation"
```

### Descripción técnica
| Archivo | Tipo | Cambio |
|---------|------|--------|
| `app/layout.tsx` | Modified | Removed `className="scroll-smooth"` from `<html>` |
| `components/layout/ScrollToTop.tsx` | **NEW** | Component with `useLayoutEffect` + `behavior: "instant"` |
| `components/layout/ConditionalLayout.tsx` | Modified | Simplified, now uses `<ScrollToTop />` component |
| `app/dashboard/layout.tsx` | Modified | Added console.log debugging for user data flow |
| `ESTADO-PROYECTO.md` | Modified | Updated changelog with P1+P2 fixes |

---

## 🔄 Comando Rápido (Ejecutar en orden)

```powershell
# Commit 5: Scroll Fix
git add app/layout.tsx components/layout/ScrollToTop.tsx components/layout/ConditionalLayout.tsx ESTADO-PROYECTO.md
git commit -m "fix(scroll): Resolve page scroll transition on navigation"

# Push all
git push origin main
```

---

## ⏳ Pendientes para futuro commit

| # | Item | Estado | Nota |
|---|------|--------|------|
| P2 | User data display | ✅ RESUELTO | Fix RLS infinite recursion - ver abajo |

---

## 📋 Fixes Aplicados en Supabase (no requieren commit de código)

### RLS Fix: Users Table Infinite Recursion (2024-12-07)

**Problema**: Error `42P17: infinite recursion detected in policy for relation "users"`

**Causa**: Policies de admin/superadmin hacían `SELECT FROM users` dentro de policies de `users` = loop infinito

**Solución aplicada en SQL Editor**:
```sql
-- Eliminadas 8 policies problemáticas/duplicadas
DROP POLICY IF EXISTS "Admins can read org profiles" ON users;
DROP POLICY IF EXISTS "Superadmins can read all profiles" ON users;
-- ... (6 más)

-- Creadas 2 policies simples
CREATE POLICY "users_select_own" ON users FOR SELECT USING (auth.uid() = id);
CREATE POLICY "users_update_own" ON users FOR UPDATE USING (auth.uid() = id);
```

---

## 🔮 Pendientes de Implementar en Supabase (Futuro)

### Admin/Superadmin RLS Policies

Cuando se necesite que admins vean usuarios de su organización:

```sql
-- 1. Crear función security definer para evitar recursión
CREATE OR REPLACE FUNCTION get_user_role()
RETURNS TEXT AS $$
  SELECT role FROM public.users WHERE id = auth.uid()
$$ LANGUAGE sql SECURITY DEFINER;

-- 2. Policy para admins
CREATE POLICY "admin_view_org_users" ON users
  FOR SELECT
  USING (
    auth.uid() = id 
    OR (
      get_user_role() IN ('admin', 'superadmin')
      AND organization_id = (SELECT organization_id FROM users WHERE id = auth.uid())
    )
  );
```

---

**Última actualización**: 2024-12-07 03:25
