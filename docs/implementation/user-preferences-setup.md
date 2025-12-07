# 📋 Instrucciones de Implementación: user_preferences

## ✅ Archivos Creados

He creado los siguientes archivos listos para usar:

1. **`supabase/migrations/20241204_user_preferences.sql`** - Migración SQL completa
2. **`app/dashboard/configuracion/preferences-actions.ts`** - Server Actions para el backend
3. **`app/dashboard/configuracion/page.tsx`** - Actualizado con conexión real a DB

---

## 🚀 Paso a Paso: Qué debes hacer

### Paso 1: Ejecutar Migración SQL en Supabase (5 min)

1. Abre tu **Supabase Dashboard**: [https://app.supabase.com](https://app.supabase.com)
2. Selecciona tu proyecto
3. Ve a **SQL Editor** (menú lateral)
4. Haz clic en **"New Query"**
5. Copia **TODO** el contenido del archivo `supabase/migrations/20241204_user_preferences.sql`
6. Pégalo en el editor SQL
7. Haz clic en **"Run"** (botón verde)

**Resultado esperado**: 
```
Success. 71 rows affected.
```

Esto indica que:
- ✅ Tabla `user_preferences` creada
- ✅ Triggers configurados
- ✅ RLS Policies activadas
- ✅ Preferencias creadas para usuarios existentes

### Paso 2: Verificar que Funcionó (2 min)

Ejecuta esta query en el SQL Editor:

```sql
SELECT * FROM user_preferences LIMIT 5;
```

**Deberías ver**:
- Una fila por cada usuario existente en `auth.users`
- Columnas: `user_id`, `email_digest_frequency`, `notify_document_expiry`, etc.
- Valores por defecto: `email_digest_frequency = 'weekly'`, todos los `notify_*` en `true`

### Paso 3: Probar en el Frontend (5-10 min)

1. **Reinicia el servidor de desarrollo** (si está corriendo):
   ```bash
   # Detén con Ctrl+C y vuelve a ejecutar:
   npm run dev
   ```

2. **Navega a** `http://localhost:3000/dashboard/configuracion`
3. **Haz clic en el tab "Notificaciones"**
4. **Deberías ver**:
   - 3 botones para frecuencia de emails (Diario, Semanal, Nunca)
   - 4 switches para tipos de notificaciones
   - Botones "Descartar Cambios" y "Guardar Preferencias"

5. **Prueba cambiar algo**:
   - Cambia frecuencia de emails a "Nunca"
   - Desactiva "Vencimiento de Documentos"
   - Haz clic en "Guardar Preferencias"

6. **Verifica que se guardó**:
   - Recarga la página
   - Ve al tab "Notificaciones" de nuevo
   - Los cambios deben persistir

### Paso 4: Verificar en la Base de Datos (Opcional)

Ejecuta en SQL Editor:

```sql
SELECT 
    u.email,
    up.email_digest_frequency,
    up.notify_document_expiry,
    up.notify_platform_updates
FROM auth.users u
LEFT JOIN user_preferences up ON u.id = up.user_id
WHERE u.email = 'TU_EMAIL_AQUI';
```

---

## 🎨 Lo que Cambió en el Frontend

### Antes (Estado Local)
```typescript
const [email Notifications, setEmailNotifications] = useState(true);
// No se guardaba en DB
```

### Ahora (Base de Datos Real)
```typescript
const [preferences, setPreferences] = useState<UserPreferences | null>(null);

// Al cargar:
const result = await getUserPreferences();
setPreferences(result.data);

// Al guardar:
await updateUserPreferences(preferences);
```

---

## 🔧 Troubleshooting

### Problema 1: Error al ejecutar SQL
**Error**: `relation "user_preferences" already exists`

**Solución**: La tabla ya existe. Esto es normal si ejecutaste el script dos veces. Ignora el error.

---

### Problema 2: No aparecen las preferencias en el frontend
**Síntomas**: El tab muestra "Cargando preferencias..." indefinidamente

**Solución**:
1. Abre DevTools (F12) → Console
2. Busca errores en rojo
3. Si dice "permission denied", verifica las RLS Policies:
   ```sql
   SELECT * FROM user_preferences WHERE user_id = auth.uid();
   ```
4. Si no devuelve nada, es un problema de permisos. Ejecuta de nuevo la parte de RLS Policies del script.

---

## 📊 Cómo funciona internamente

### Flujo Completo

1. **Usuario carga `/dashboard/configuracion`**
   - `page.tsx` llama a `getUserPreferences()` (Server Action)
   - Server Action query a Supabase: `SELECT * FROM user_preferences WHERE user_id = auth.uid()`
   - Devuelve datos al frontend

2. **Usuario cambia un switch**
   - `updatePreference('notify_document_expiry', false)` actualiza estado local
   - NADA se guarda aún en DB

3. **Usuario hace clic en "Guardar Preferencias"**
   - `handleSavePreferences()` llama a `updateUserPreferences(preferences)`
   - Server Action ejecuta: `UPDATE user_preferences SET ... WHERE user_id = auth.uid()`
   - Toast de confirmación: "Preferencias actualizadas correctamente"

---

## 🧪 Test Manual Completo

Checklist de validación:

- [ ] Migración SQL ejecutada sin errores
- [ ] Tabla `user_preferences` existe con datos
- [ ] Tab "Notificaciones" carga correctamente
- [ ] Puedo cambiar frecuencia de emails (Diario/Semanal/Nunca)
- [ ] Puedo activar/desactivar cada tipo de notificación
- [ ] Al hacer clic en "Guardar", aparece toast de éxito
- [ ] Al recargar página, cambios persisten
- [ ] Al hacer clic en "Descartar Cambios", se restauran valores originales

---

## ✅ Confirmación Final

Una vez completados los pasos, confirma que:

1. ✅ **SQL ejecutado** en Supabase
2. ✅ **Frontend funcional** (preferencias se cargan y guardan)
3. ✅ **No hay errores** en consola del navegador

---

**Tiempo estimado total**: 15-20 minutos

**¿Algún problema?** Avísame y te ayudo a debuguear 🚀
