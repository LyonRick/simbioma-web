# Brand Guidelines - Simbioma

## 🎨 Paleta de Colores

### Colores Primarios
```css
/* Verde Bosque - Color principal de marca */
--verde-bosque: #2D9D78;
--verde-bosque-light: #3DB591;
--verde-bosque-dark: #247A5F;

/* Azul Océano - Confiabilidad institucional */
--azul-oceano: #1E5F8C;
--azul-oceano-light: #2879B0;
--azul-oceano-dark: #164A6E;

/* Amarillo Sol - Energía y acción */
--amarillo-sol: #F5A623;
--amarillo-sol-light: #F7B851;
--amarillo-sol-dark: #DB941F;
```

### Colores de Sistema
```css
/* Neutrales */
--gris-900: #1A1A1A;
--gris-800: #2D2D2D;
--gris-700: #404040;
--gris-600: #666666;
--gris-500: #808080;
--gris-400: #ADADAD;
--gris-300: #CCCCCC;
--gris-200: #E6E6E6;
--gris-100: #F5F5F5;
--blanco: #FFFFFF;

/* Estados */
--success: #10B981;
--warning: #F59E0B;
--error: #EF4444;
--info: #3B82F6;
```

## 📝 Tipografía

**Familia Principal**: Inter
- Weights: 400 (Regular), 500 (Medium), 600 (Semi-Bold), 700 (Bold)
- Fuente: Google Fonts

**Escala Tipográfica**:
```css
--text-xs: 0.75rem;    /* 12px */
--text-sm: 0.875rem;   /* 14px */
--text-base: 1rem;     /* 16px */
--text-lg: 1.125rem;   /* 18px */
--text-xl: 1.25rem;    /* 20px */
--text-2xl: 1.5rem;    /* 24px */
--text-3xl: 1.875rem;  /* 30px */
--text-4xl: 2.25rem;   /* 36px */
```

## 🗣️ Voz y Tono

### Voz de Marca (consistente)
- **Profesional** sin ser corporativo frío
- **Orientada a soluciones** no a problemas
- **Basada en datos** pero accesible
- **Positiva** sobre la transición ecológica

### Tono (contextual)

**Dashboard y Reportes**:
- Directo y conciso
- Enfoque en acción: "Próximos pasos", "Mejora identificada"
- Uso de datos concretos: "Aumentaste 15% vs. trimestre anterior"

**Onboarding**:
- Amigable y guiado
- Pasos claros y numerados
- Celebración de logros: "¡Perfecto! Ya estás listo..."

**Mensajes de Error**:
- Empático: "Algo salió mal. Estamos en ello"
- Solución clara: "Intenta [acción específica]"
- Contacto si persiste: "Contáctanos si continúa"

## 🎯 Principios de UI

1. **Jerarquía Clara**
   - Información más importante primero
   - Uso de tamaño, color y espaciado para crear jerarquía
   - Máximo 3 niveles de jerarquía visual

2. **Espaciado Generoso**
   - Usar escala 4px: 4, 8, 12, 16, 24, 32, 48, 64
   - Respiración entre secciones
   - Densidad reducida para mejor legibilidad

3. **Accesibilidad**
   - Contraste mínimo WCAG AA (4.5:1 para texto normal)
   - Elementos interactivos mínimo 44x44px
   - Focus states visibles
   - Textos alternativos en imágenes

4. **Responsividad**
   - Mobile-first
   - Breakpoints: 640px (sm), 768px (md), 1024px (lg), 1280px (xl)
   - Layout flexible que se adapta

## 📊 Componentes Visuales

### Gráficos y Visualizaciones
- **Colores**: Usar paleta primaria ordenada
- **Grosor de línea**: 2-3px
- **Puntos de datos**: Claros y clickables
- **Tooltips**: Informativos con datos exactos

### Iconografía
- **Estilo**: Lucide Icons (outline, 24px por defecto)
- **Colores**: Neutros o primarios según contexto
- **Tamaño**: 16px (sm), 24px (md), 32px (lg)

### Botones
```css
/* Primario - Acciones principales */
background: var(--verde-bosque);
hover: var(--verde-bosque-dark);
padding: 12px 24px;
border-radius: 8px;

/* Secundario - Acciones secundarias */
background: transparent;
border: 2px solid var(--azul-oceano);
color: var(--azul-oceano);

/* Terciario - Acciones sutiles */
background: transparent;
color: var(--verde-bosque);
text-decoration: underline on hover;
```

### Cards
```css
background: white;
border: 1px solid var(--gris-200);
border-radius: 12px;
padding: 24px;
box-shadow: 0 1px 3px rgba(0,0,0,0.1);
```

## 🚀 Estados de Progreso

**Cumplimiento Básico**:
- Color: Azul Océano
- Icon: CheckCircle
- Mensaje: "Cumpliendo normativa"

**Sostenibilidad Avanzada**:
- Color: Verde Bosque
- Icon: TrendingUp
- Mensaje: "Avanzando hacia sostenibilidad"

**Regeneración Territorial**:
- Color: Amarillo Sol
- Icon: Sparkles
- Mensaje: "¡Regenerando el territorio!"

## 📸 Imágenes y Assets

### Fotografía
- Imágenes reales de municipios chilenos
- Naturaleza y espacios urbanos verdes
- Personas diversas trabajando en sustentabilidad
- Evitar stock photos genéricas

### Ilustraciones
- Estilo: Line art con colores de marca
- Temática: Naturaleza, reciclaje, comunidad
- Formato: SVG para escalabilidad

## ✅ Checklist de Uso

Antes de implementar nuevo UI, verificar:
- [ ] Colores exactos de paleta (usar variables CSS)
- [ ] Tipografía Inter con weights correctos
- [ ] Espaciado en escala 4px
- [ ] Contraste WCAG AA mínimo
- [ ] Responsive en 3+ breakpoints
- [ ] Estados hover/focus/active definidos
- [ ] Tono de mensajes alineado con voz de marca
- [ ] Iconografía consistente (Lucide Icons)
```

### **Paso 8: Actualizar .gitignore**

Añade al `.gitignore`:
```
# Claude Code outputs y secrets
.claude/outputs/
.claude/secrets.env
.claude/*.log

# VS Code
.vscode/

# Environment variables
.env.local
.env.development.local
.env.test.local
.env.production.local