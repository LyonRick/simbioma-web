# 🌱 SIMBIOMA - HOMEPAGE MVP
## Estructura Completa para Implementación en Claude Code

**Target:** Landing page single-page con scroll sections  
**Stack:** Next.js 14 + Tailwind CSS + Shadcn UI  
**Objetivo:** Captar leads para programa Beta (waitlist)

---

## 🎨 PALETA DE COLORES

```css
:root {
  --verde-bosque: #2D9D78;      /* Primary */
  --azul-oceano: #1E5F8C;       /* Secondary */
  --amarillo-sol: #F5A623;      /* Accent */
  --gris-neutro: #64748B;       /* Text */
  --gris-claro: #F1F5F9;        /* Background */
  --blanco: #FFFFFF;
}
```

---

## 📐 ESTRUCTURA DE SECCIONES

### **NAVBAR (Fixed Top)**

```
┌──────────────────────────────────────────────────────┐
│ Logo Simbioma    Solución  Pricing  FAQ    [Beta]   │
└──────────────────────────────────────────────────────┘

Componentes:
- Logo: Texto "Simbioma" + ícono hoja/territorio
- Links: Smooth scroll a secciones (#solucion, #pricing, #faq)
- CTA: Botón "Solicitar Beta" (verde-bosque, fixed)
- Mobile: Hamburger menu
```

---

### **SECTION 1: HERO**

```html
<section id="hero" class="min-h-screen flex items-center bg-gradient-to-br from-verde-bosque/10 to-azul-oceano/10">
  <div class="container mx-auto px-4">
    
    <!-- Pre-header -->
    <p class="text-gris-neutro text-sm uppercase tracking-wide mb-4">
      Para Gobiernos Locales y Empresas en Chile
    </p>
    
    <!-- H1 Principal -->
    <h1 class="text-5xl md:text-7xl font-bold text-gris-neutro mb-6 leading-tight">
      De reportes manuales fragmentados<br/>
      a <span class="text-verde-bosque">inteligencia territorial</span> unificada
    </h1>
    
    <!-- Subtitle -->
    <p class="text-xl md:text-2xl text-gris-neutro/80 mb-8 max-w-3xl">
      Simbioma consolida datos ambientales de sector público y privado en un solo lugar. 
      Genera reportes ESG automáticos (SINADER, GRI, CDP, SASB) y visualiza el impacto 
      territorial real.
    </p>
    
    <!-- Value Props -->
    <ul class="space-y-3 mb-10 text-lg">
      <li class="flex items-start">
        <svg class="w-6 h-6 text-verde-bosque mr-3 mt-1">✓</svg>
        <span>Consolida múltiples fuentes de datos en un dashboard unificado</span>
      </li>
      <li class="flex items-start">
        <svg class="w-6 h-6 text-verde-bosque mr-3 mt-1">✓</svg>
        <span>Automatiza reportes de compliance ambiental para múltiples frameworks</span>
      </li>
      <li class="flex items-start">
        <svg class="w-6 h-6 text-verde-bosque mr-3 mt-1">✓</svg>
        <span>Mide progreso territorial: de compliance a regeneración ecosistémica</span>
      </li>
    </ul>
    
    <!-- CTAs -->
    <div class="flex flex-col sm:flex-row gap-4">
      <button class="px-8 py-4 bg-verde-bosque text-white rounded-lg text-lg font-semibold hover:bg-verde-bosque/90 transition">
        Solicitar Acceso Beta
      </button>
      <button class="px-8 py-4 border-2 border-verde-bosque text-verde-bosque rounded-lg text-lg font-semibold hover:bg-verde-bosque/5 transition">
        Ver Demo en Video →
      </button>
    </div>
    
    <!-- Scroll Indicator -->
    <div class="mt-16 animate-bounce">
      <p class="text-sm text-gris-neutro/60">Descubre cómo funciona ↓</p>
    </div>
    
  </div>
</section>
```

**Notas de implementación:**
- Gradient background: `bg-gradient-to-br from-verde-bosque/10 to-azul-oceano/10`
- Responsive: texto más pequeño en mobile
- Iconos checkmark: usar Lucide React `<Check className="w-6 h-6" />`
- Animación bounce: Tailwind nativo

---

### **SECTION 2: PROBLEMA (Pain Points)**

```html
<section id="problema" class="py-20 bg-white">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      El desafío actual
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-16 max-w-3xl mx-auto">
      Gobiernos y empresas enfrentan los mismos obstáculos para gestionar 
      su impacto ambiental de forma efectiva.
    </p>
    
    <!-- Grid 2x2 -->
    <div class="grid md:grid-cols-2 gap-8 max-w-5xl mx-auto">
      
      <!-- Pain Point 1 -->
      <div class="p-8 bg-gris-claro rounded-xl">
        <div class="w-12 h-12 bg-amarillo-sol/20 rounded-lg flex items-center justify-center mb-4">
          <svg class="w-6 h-6 text-amarillo-sol">📊</svg>
        </div>
        <h3 class="text-xl font-bold mb-3">Datos Fragmentados</h3>
        <p class="text-gris-neutro/80">
          Información dispersa en múltiples Excel, PDFs y sistemas separados. 
          Imposible tener una visión consolidada del impacto ambiental.
        </p>
      </div>
      
      <!-- Pain Point 2 -->
      <div class="p-8 bg-gris-claro rounded-xl">
        <div class="w-12 h-12 bg-amarillo-sol/20 rounded-lg flex items-center justify-center mb-4">
          <svg class="w-6 h-6 text-amarillo-sol">⏱️</svg>
        </div>
        <h3 class="text-xl font-bold mb-3">Reportes Manuales</h3>
        <p class="text-gris-neutro/80">
          Horas copiando y pegando datos para cumplir con múltiples frameworks 
          (SINADER, GRI, CDP). Tiempo que podría invertirse en estrategia.
        </p>
      </div>
      
      <!-- Pain Point 3 -->
      <div class="p-8 bg-gris-claro rounded-xl">
        <div class="w-12 h-12 bg-amarillo-sol/20 rounded-lg flex items-center justify-center mb-4">
          <svg class="w-6 h-6 text-amarillo-sol">❓</svg>
        </div>
        <h3 class="text-xl font-bold mb-3">Falta de Contexto</h3>
        <p class="text-gris-neutro/80">
          ¿Estamos mejor o peor que el año pasado? ¿Cómo nos comparamos con 
          territorios o sectores similares? Sin respuestas claras.
        </p>
      </div>
      
      <!-- Pain Point 4 -->
      <div class="p-8 bg-gris-claro rounded-xl">
        <div class="w-12 h-12 bg-amarillo-sol/20 rounded-lg flex items-center justify-center mb-4">
          <svg class="w-6 h-6 text-amarillo-sol">🎯</svg>
        </div>
        <h3 class="text-xl font-bold mb-3">Solo Compliance</h3>
        <p class="text-gris-neutro/80">
          Enfoque reactivo en cumplir normativas mínimas, sin visión 
          estratégica hacia restauración y regeneración territorial.
        </p>
      </div>
      
    </div>
  </div>
</section>
```

---

### **SECTION 3: SEGMENTACIÓN (Dual Sector)**

```html
<section id="segmentacion" class="py-20 bg-gradient-to-b from-white to-gris-claro">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      ¿Qué necesitas lograr?
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-16">
      Simbioma se adapta a las necesidades específicas de tu sector
    </p>
    
    <!-- Grid 2 columnas -->
    <div class="grid md:grid-cols-2 gap-8 max-w-6xl mx-auto">
      
      <!-- Card Gobiernos -->
      <div class="bg-white p-10 rounded-2xl shadow-lg border-t-4 border-verde-bosque hover:shadow-2xl transition">
        
        <div class="flex items-center gap-4 mb-6">
          <div class="w-16 h-16 bg-verde-bosque/10 rounded-full flex items-center justify-center">
            <svg class="w-8 h-8 text-verde-bosque">🏛️</svg>
          </div>
          <h3 class="text-3xl font-bold">Gobiernos Locales</h3>
        </div>
        
        <p class="text-gris-neutro/80 mb-6">
          Municipalidades y gobiernos regionales que buscan automatizar 
          reportes ambientales y demostrar impacto territorial.
        </p>
        
        <h4 class="font-semibold text-lg mb-3">Necesitas:</h4>
        <ul class="space-y-3 mb-8">
          <li class="flex items-start">
            <span class="text-verde-bosque mr-2">•</span>
            <span>Reportar SINADER, SCAM, SINIA sin esfuerzo manual</span>
          </li>
          <li class="flex items-start">
            <span class="text-verde-bosque mr-2">•</span>
            <span>Dashboard de progreso para concejo y alcalde</span>
          </li>
          <li class="flex items-start">
            <span class="text-verde-bosque mr-2">•</span>
            <span>Transparencia pública automática</span>
          </li>
          <li class="flex items-start">
            <span class="text-verde-bosque mr-2">•</span>
            <span>Comparar vs. otras municipalidades similares</span>
          </li>
        </ul>
        
        <button class="w-full py-3 bg-verde-bosque text-white rounded-lg font-semibold hover:bg-verde-bosque/90 transition">
          Ver Solución para Gobiernos →
        </button>
      </div>
      
      <!-- Card Empresas -->
      <div class="bg-white p-10 rounded-2xl shadow-lg border-t-4 border-azul-oceano hover:shadow-2xl transition">
        
        <div class="flex items-center gap-4 mb-6">
          <div class="w-16 h-16 bg-azul-oceano/10 rounded-full flex items-center justify-center">
            <svg class="w-8 h-8 text-azul-oceano">🏢</svg>
          </div>
          <h3 class="text-3xl font-bold">Empresas</h3>
        </div>
        
        <p class="text-gris-neutro/80 mb-6">
          Organizaciones privadas que necesitan reportar ESG corporativo 
          y compararse con su industria.
        </p>
        
        <h4 class="font-semibold text-lg mb-3">Necesitas:</h4>
        <ul class="space-y-3 mb-8">
          <li class="flex items-start">
            <span class="text-azul-oceano mr-2">•</span>
            <span>Reporte ESG anual (GRI, CDP, SASB, B Corp)</span>
          </li>
          <li class="flex items-start">
            <span class="text-azul-oceano mr-2">•</span>
            <span>Benchmarking anónimo vs. sector/competencia</span>
          </li>
          <li class="flex items-start">
            <span class="text-azul-oceano mr-2">•</span>
            <span>Consolidar 10+ operaciones/sucursales</span>
          </li>
          <li class="flex items-start">
            <span class="text-azul-oceano mr-2">•</span>
            <span>Contribuir al impacto territorial donde operan</span>
          </li>
        </ul>
        
        <button class="w-full py-3 bg-azul-oceano text-white rounded-lg font-semibold hover:bg-azul-oceano/90 transition">
          Ver Solución para Empresas →
        </button>
      </div>
      
    </div>
  </div>
</section>
```

---

### **SECTION 4: SOLUCIÓN (Cómo Funciona - 3 Pasos)**

```html
<section id="solucion" class="py-20 bg-white">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      Cómo funciona Simbioma
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-16 max-w-3xl mx-auto">
      Tres pasos simples para transformar tu gestión ambiental
    </p>
    
    <!-- Timeline vertical (mobile) / horizontal (desktop) -->
    <div class="max-w-5xl mx-auto">
      
      <!-- Paso 1 -->
      <div class="flex flex-col md:flex-row items-center gap-8 mb-16">
        <div class="flex-shrink-0 w-20 h-20 bg-verde-bosque text-white rounded-full flex items-center justify-center text-3xl font-bold">
          1
        </div>
        <div class="flex-1">
          <h3 class="text-2xl font-bold mb-3">Conecta tus fuentes de datos</h3>
          <p class="text-lg text-gris-neutro/80 mb-4">
            Integramos con tus sistemas existentes: gestionadores de residuos 
            (ReSimple, etc.), estaciones meteorológicas, sensores IoT, o uploads 
            manuales de Excel. Sin reemplazar lo que ya funciona.
          </p>
          <div class="flex flex-wrap gap-2">
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">API</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">Excel</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">IoT</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">Sensores</span>
          </div>
        </div>
        <div class="flex-shrink-0 w-64 h-48 bg-gris-claro rounded-xl flex items-center justify-center">
          <span class="text-gris-neutro/40">[Mockup: Integraciones]</span>
        </div>
      </div>
      
      <!-- Paso 2 -->
      <div class="flex flex-col md:flex-row-reverse items-center gap-8 mb-16">
        <div class="flex-shrink-0 w-20 h-20 bg-azul-oceano text-white rounded-full flex items-center justify-center text-3xl font-bold">
          2
        </div>
        <div class="flex-1 md:text-right">
          <h3 class="text-2xl font-bold mb-3">Consolida en un dashboard unificado</h3>
          <p class="text-lg text-gris-neutro/80 mb-4">
            Visualiza todos tus indicadores ambientales en tiempo real: residuos, 
            emisiones, agua, biodiversidad, proyectos. Todo en un solo lugar, 
            comparando progreso año tras año.
          </p>
          <div class="flex flex-wrap gap-2 md:justify-end">
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">Indicadores</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">Proyectos</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">Benchmarks</span>
          </div>
        </div>
        <div class="flex-shrink-0 w-64 h-48 bg-gris-claro rounded-xl flex items-center justify-center">
          <span class="text-gris-neutro/40">[Mockup: Dashboard]</span>
        </div>
      </div>
      
      <!-- Paso 3 -->
      <div class="flex flex-col md:flex-row items-center gap-8">
        <div class="flex-shrink-0 w-20 h-20 bg-amarillo-sol text-white rounded-full flex items-center justify-center text-3xl font-bold">
          3
        </div>
        <div class="flex-1">
          <h3 class="text-2xl font-bold mb-3">Genera reportes ESG automáticos</h3>
          <p class="text-lg text-gris-neutro/80 mb-4">
            En minutos, no semanas. Selecciona el framework (SINADER, GRI, CDP, etc.), 
            el sistema pre-llena los datos, tú revisas y firmas electrónicamente. Listo.
          </p>
          <div class="flex flex-wrap gap-2">
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">SINADER</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">GRI</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">CDP</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">SASB</span>
            <span class="px-3 py-1 bg-gris-claro rounded-full text-sm">SCAM</span>
          </div>
        </div>
        <div class="flex-shrink-0 w-64 h-48 bg-gris-claro rounded-xl flex items-center justify-center">
          <span class="text-gris-neutro/40">[Mockup: Reportes]</span>
        </div>
      </div>
      
    </div>
  </div>
</section>
```

---

### **SECTION 5: BENEFICIOS CORE (3 Columnas)**

```html
<section id="beneficios" class="py-20 bg-gradient-to-b from-gris-claro to-white">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      Por qué Simbioma es diferente
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-16">
      No solo automatizamos. Transformamos tu forma de entender y gestionar 
      el impacto ambiental.
    </p>
    
    <!-- Grid 3 columnas -->
    <div class="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
      
      <!-- Beneficio 1 -->
      <div class="text-center">
        <div class="w-20 h-20 bg-verde-bosque/10 rounded-2xl flex items-center justify-center mx-auto mb-6">
          <svg class="w-10 h-10 text-verde-bosque">🎯</svg>
        </div>
        <h3 class="text-2xl font-bold mb-4">Ahorra Tiempo Real</h3>
        <p class="text-gris-neutro/80">
          Reduce drásticamente el tiempo dedicado a reportes manuales. 
          Invierte ese tiempo en estrategia y proyectos de impacto real.
        </p>
      </div>
      
      <!-- Beneficio 2 -->
      <div class="text-center">
        <div class="w-20 h-20 bg-azul-oceano/10 rounded-2xl flex items-center justify-center mx-auto mb-6">
          <svg class="w-10 h-10 text-azul-oceano">📈</svg>
        </div>
        <h3 class="text-2xl font-bold mb-4">Decisiones con Datos</h3>
        <p class="text-gris-neutro/80">
          Benchmarking territorial y sectorial. Aprende de los mejores, 
          identifica brechas, demuestra progreso con evidencia sólida.
        </p>
      </div>
      
      <!-- Beneficio 3 -->
      <div class="text-center">
        <div class="w-20 h-20 bg-amarillo-sol/10 rounded-2xl flex items-center justify-center mx-auto mb-6">
          <svg class="w-10 h-10 text-amarillo-sol">🌱</svg>
        </div>
        <h3 class="text-2xl font-bold mb-4">Visión Regenerativa</h3>
        <p class="text-gris-neutro/80">
          Más allá del compliance básico. Mide tu transición hacia restauración 
          y regeneración ecosistémica con indicadores de servicios ecosistémicos.
        </p>
      </div>
      
    </div>
  </div>
</section>
```

---

### **SECTION 6: PRICING (3 Tiers)**

```html
<section id="pricing" class="py-20 bg-white">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      Planes diseñados para tu escala
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-4">
      Inicia con lo esencial, escala cuando necesites más
    </p>
    <p class="text-center text-sm text-gris-neutro/60 mb-16">
      🎁 Programa Beta: 50% descuento primeros 6 meses
    </p>
    
    <!-- Toggle: Gobiernos / Empresas -->
    <div class="flex justify-center mb-12">
      <div class="inline-flex bg-gris-claro rounded-lg p-1">
        <button class="px-6 py-2 rounded-lg bg-white shadow-sm font-semibold">
          Gobiernos Locales
        </button>
        <button class="px-6 py-2 rounded-lg font-semibold text-gris-neutro/60">
          Empresas
        </button>
      </div>
    </div>
    
    <!-- Grid Pricing -->
    <div class="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
      
      <!-- Plan Starter -->
      <div class="bg-white p-8 rounded-2xl border-2 border-gris-claro hover:border-verde-bosque transition">
        <h3 class="text-2xl font-bold mb-2">Starter</h3>
        <p class="text-sm text-gris-neutro/60 mb-6">Municipalidades <50K habitantes</p>
        
        <div class="mb-6">
          <span class="text-4xl font-bold">$300</span>
          <span class="text-gris-neutro/60">/mes</span>
          <p class="text-sm text-amarillo-sol font-semibold mt-1">
            🎁 Beta: $150/mes (primeros 6 meses)
          </p>
        </div>
        
        <ul class="space-y-3 mb-8">
          <li class="flex items-start">
            <svg class="w-5 h-5 text-verde-bosque mr-2 mt-0.5">✓</svg>
            <span class="text-sm">3 usuarios</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-verde-bosque mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Reportes: SINADER, SINIA, SCAM</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-verde-bosque mr-2 mt-0.5">✓</svg>
            <span class="text-sm">2 integraciones de datos</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-verde-bosque mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Dashboard básico</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-gris-neutro/30 mr-2 mt-0.5">✗</svg>
            <span class="text-sm text-gris-neutro/50">Firma electrónica</span>
          </li>
        </ul>
        
        <button class="w-full py-3 bg-gris-claro text-gris-neutro font-semibold rounded-lg hover:bg-gris-claro/80 transition">
          Solicitar Acceso
        </button>
      </div>
      
      <!-- Plan Professional (Destacado) -->
      <div class="bg-verde-bosque text-white p-8 rounded-2xl shadow-2xl transform scale-105 relative">
        <div class="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-amarillo-sol text-white px-4 py-1 rounded-full text-sm font-bold">
          MÁS POPULAR
        </div>
        
        <h3 class="text-2xl font-bold mb-2">Professional</h3>
        <p class="text-sm text-white/80 mb-6">Municipalidades 50K-150K hab.</p>
        
        <div class="mb-6">
          <span class="text-4xl font-bold">$600</span>
          <span class="text-white/80">/mes</span>
          <p class="text-sm text-amarillo-sol font-semibold mt-1">
            🎁 Beta: $300/mes (primeros 6 meses)
          </p>
        </div>
        
        <ul class="space-y-3 mb-8">
          <li class="flex items-start">
            <svg class="w-5 h-5 text-white mr-2 mt-0.5">✓</svg>
            <span class="text-sm">10 usuarios</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-white mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Reportes: +GRI, +CDP Cities</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-white mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Integraciones ilimitadas</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-white mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Firma electrónica (5 docs/mes)</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-white mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Comparación con comunas similares</span>
          </li>
        </ul>
        
        <button class="w-full py-3 bg-white text-verde-bosque font-semibold rounded-lg hover:bg-white/90 transition">
          Solicitar Acceso
        </button>
      </div>
      
      <!-- Plan Enterprise -->
      <div class="bg-white p-8 rounded-2xl border-2 border-gris-claro hover:border-azul-oceano transition">
        <h3 class="text-2xl font-bold mb-2">Enterprise</h3>
        <p class="text-sm text-gris-neutro/60 mb-6">Municipalidades >150K + GORE</p>
        
        <div class="mb-6">
          <span class="text-4xl font-bold">$1,200</span>
          <span class="text-gris-neutro/60">/mes</span>
          <p class="text-sm text-amarillo-sol font-semibold mt-1">
            🎁 Beta: $600/mes (primeros 6 meses)
          </p>
        </div>
        
        <ul class="space-y-3 mb-8">
          <li class="flex items-start">
            <svg class="w-5 h-5 text-azul-oceano mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Usuarios ilimitados</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-azul-oceano mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Reportes: +TCFD, +custom</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-azul-oceano mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Firma electrónica ilimitada</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-azul-oceano mr-2 mt-0.5">✓</svg>
            <span class="text-sm">White-label (tu logo)</span>
          </li>
          <li class="flex items-start">
            <svg class="w-5 h-5 text-azul-oceano mr-2 mt-0.5">✓</svg>
            <span class="text-sm">Consultoría 10h/año incluidas</span>
          </li>
        </ul>
        
        <button class="w-full py-3 bg-azul-oceano text-white font-semibold rounded-lg hover:bg-azul-oceano/90 transition">
          Contactar Ventas
        </button>
      </div>
      
    </div>
    
    <p class="text-center text-sm text-gris-neutro/60 mt-12">
      💡 Todos los planes incluyen soporte email. Professional y Enterprise incluyen soporte prioritario.
    </p>
  </div>
</section>
```

---

### **SECTION 7: FAQ**

```html
<section id="faq" class="py-20 bg-gris-claro">
  <div class="container mx-auto px-4">
    
    <h2 class="text-4xl font-bold text-center mb-4">
      Preguntas Frecuentes
    </h2>
    <p class="text-xl text-center text-gris-neutro/80 mb-16">
      Todo lo que necesitas saber sobre Simbioma
    </p>
    
    <!-- Accordion FAQ -->
    <div class="max-w-3xl mx-auto space-y-4">
      
      <!-- FAQ 1 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Qué es el programa Beta y cómo accedo?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          El programa Beta es nuestra fase de validación con early adopters. 
          Incluye 50% descuento los primeros 6 meses, soporte prioritario, 
          y oportunidad de influir en el roadmap del producto. Cupos limitados 
          a 30 organizaciones (15 gobiernos + 15 empresas).
        </p>
      </details>
      
      <!-- FAQ 2 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Cómo se integra con mis sistemas actuales?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          Simbioma se conecta vía API con gestionadores de residuos (ReSimple, etc.), 
          estaciones meteorológicas, sensores IoT. También soporta uploads manuales 
          de Excel/CSV. No reemplazamos tus sistemas, los integramos.
        </p>
      </details>
      
      <!-- FAQ 3 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Qué frameworks de reporte ESG soportan?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          <strong>Gobiernos:</strong> SINADER, SINIA, SCAM, GRI, CDP Cities, TCFD.<br/>
          <strong>Empresas:</strong> GRI, SASB, CDP, B Corp Assessment, ISO 14001.<br/>
          Agregamos nuevos frameworks basados en demanda de usuarios.
        </p>
      </details>
      
      <!-- FAQ 4 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Mis datos están seguros? ¿Quién los ve?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          Tus datos están encriptados (AES-256) y aislados por organización (Row Level Security). 
          Solo tu equipo ve tus datos privados. Puedes optar por contribuir datos agregados 
          y anónimos al dashboard territorial público, pero SIEMPRE es opcional.
        </p>
      </details>
      
      <!-- FAQ 5 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Cuánto tiempo toma la implementación?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          Onboarding típico: 2-4 semanas. Incluye: (1) Setup cuentas, (2) Integración 
          fuentes de datos, (3) Carga datos históricos (opcional), (4) Capacitación equipo. 
          En Beta incluimos acompañamiento dedicado.
        </p>
      </details>
      
      <!-- FAQ 6 -->
      <details class="bg-white p-6 rounded-xl shadow-sm">
        <summary class="font-semibold text-lg cursor-pointer flex justify-between items-center">
          ¿Puedo crear indicadores custom para mi industria?
          <svg class="w-5 h-5 text-gris-neutro">▼</svg>
        </summary>
        <p class="mt-4 text-gris-neutro/80">
          Sí, planes Professional y Enterprise permiten indicadores custom. 
          Si el indicador es relevante para tu sector, podemos aprobarlo como 
          "global" para que otras organizaciones similares también lo usen.
        </p>
      </details>
      
    </div>
  </div>
</section>
```

---

### **SECTION 8: CTA FINAL (Beta Waitlist)**

```html
<section id="cta-final" class="py-20 bg-gradient-to-br from-verde-bosque to-azul-oceano text-white">
  <div class="container mx-auto px-4 text-center">
    
    <h2 class="text-4xl md:text-5xl font-bold mb-6">
      Lidera la regeneración territorial desde tu rol
    </h2>
    
    <p class="text-xl md:text-2xl mb-4 max-w-3xl mx-auto opacity-90">
      Únete al programa Beta y transforma tu gestión ambiental
    </p>
    
    <p class="text-lg mb-12 opacity-80">
      🎁 50% descuento primeros 6 meses | ⏰ Cupos limitados: 30 organizaciones
    </p>
    
    <!-- Form Waitlist -->
    <div class="max-w-2xl mx-auto bg-white/10 backdrop-blur-lg p-8 rounded-2xl">
      
      <form class="space-y-4">
        
        <div class="grid md:grid-cols-2 gap-4">
          <input 
            type="text" 
            placeholder="Nombre completo" 
            class="px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-white/60 text-white focus:outline-none focus:ring-2 focus:ring-white"
            required
          />
          <input 
            type="email" 
            placeholder="Email corporativo" 
            class="px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-white/60 text-white focus:outline-none focus:ring-2 focus:ring-white"
            required
          />
        </div>
        
        <div class="grid md:grid-cols-2 gap-4">
          <input 
            type="text" 
            placeholder="Organización" 
            class="px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-white/60 text-white focus:outline-none focus:ring-2 focus:ring-white"
            required
          />
          <select 
            class="px-4 py-3 rounded-lg bg-white/20 border border-white/30 text-white focus:outline-none focus:ring-2 focus:ring-white"
            required
          >
            <option value="">Tipo de organización</option>
            <option value="municipalidad">Municipalidad</option>
            <option value="gore">Gobierno Regional</option>
            <option value="empresa">Empresa Privada</option>
          </select>
        </div>
        
        <input 
          type="tel" 
          placeholder="Teléfono (opcional)" 
          class="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-white/60 text-white focus:outline-none focus:ring-2 focus:ring-white"
        />
        
        <textarea 
          placeholder="¿Qué te gustaría lograr con Simbioma? (opcional)" 
          rows="3"
          class="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 placeholder-white/60 text-white focus:outline-none focus:ring-2 focus:ring-white"
        ></textarea>
        
        <button 
          type="submit"
          class="w-full py-4 bg-amarillo-sol text-white font-bold text-lg rounded-lg hover:bg-amarillo-sol/90 transition shadow-lg"
        >
          Solicitar Acceso Beta →
        </button>
        
      </form>
      
      <p class="text-sm mt-6 opacity-80">
        Al solicitar acceso, aceptas que contactemos para agendar una demo personalizada. 
        No spam, prometido.
      </p>
      
    </div>
  </div>
</section>
```

---

### **FOOTER**

```html
<footer class="bg-gris-neutro text-white py-12">
  <div class="container mx-auto px-4">
    
    <div class="grid md:grid-cols-4 gap-8 mb-8">
      
      <!-- Col 1: Logo + Descripción -->
      <div>
        <h3 class="text-2xl font-bold mb-3">Simbioma</h3>
        <p class="text-white/70 text-sm">
          El sistema operativo de regeneración territorial para Chile.
        </p>
      </div>
      
      <!-- Col 2: Producto -->
      <div>
        <h4 class="font-semibold mb-3">Producto</h4>
        <ul class="space-y-2 text-sm text-white/70">
          <li><a href="#solucion" class="hover:text-white">Cómo funciona</a></li>
          <li><a href="#pricing" class="hover:text-white">Pricing</a></li>
          <li><a href="#" class="hover:text-white">Roadmap</a></li>
        </ul>
      </div>
      
      <!-- Col 3: Recursos -->
      <div>
        <h4 class="font-semibold mb-3">Recursos</h4>
        <ul class="space-y-2 text-sm text-white/70">
          <li><a href="#faq" class="hover:text-white">FAQ</a></li>
          <li><a href="#" class="hover:text-white">Blog</a></li>
          <li><a href="#" class="hover:text-white">Documentación</a></li>
        </ul>
      </div>
      
      <!-- Col 4: Contacto -->
      <div>
        <h4 class="font-semibold mb-3">Contacto</h4>
        <ul class="space-y-2 text-sm text-white/70">
          <li>contacto@simbioma.cl</li>
          <li>+56 9 XXXX XXXX</li>
          <li>Santiago, Chile</li>
        </ul>
      </div>
      
    </div>
    
    <!-- Divider -->
    <div class="border-t border-white/20 pt-8">
      <div class="flex flex-col md:flex-row justify-between items-center text-sm text-white/60">
        <p>© 2025 Simbioma. Todos los derechos reservados.</p>
        <div class="flex gap-6 mt-4 md:mt-0">
          <a href="#" class="hover:text-white">Términos</a>
          <a href="#" class="hover:text-white">Privacidad</a>
          <a href="#" class="hover:text-white">LinkedIn</a>
        </div>
      </div>
    </div>
    
  </div>
</footer>
```

---

## 📝 NOTAS DE IMPLEMENTACIÓN

### **Tecnologías**
- Framework: Next.js 14 (App Router)
- Styling: Tailwind CSS
- Components: Shadcn UI
- Icons: Lucide React
- Forms: React Hook Form + Zod
- Analytics: Vercel Analytics

### **Componentes Shadcn Requeridos**
```bash
npx shadcn-ui@latest add button
npx shadcn-ui@latest add card
npx shadcn-ui@latest add badge
npx shadcn-ui@latest add accordion
npx shadcn-ui@latest add form
npx shadcn-ui@latest add input
npx shadcn-ui@latest add textarea
npx shadcn-ui@latest add select
```

### **Mockups (Placeholders)**
Reemplazar `[Mockup: XXX]` con:
- Screenshot Dashboard (Figma o screenshot placeholder)
- GIF/Video demo integraciones
- Iconos de frameworks (GRI, CDP, SINADER logos)

### **Form Waitlist Backend**
- Supabase table: `waitlist`
- Campos: email, name, organization_name, organization_type, phone, notes
- Email notification: Resend o SendGrid
- Auto-response: "Gracias, te contactaremos en 48h"

---

## ✅ CHECKLIST PRE-LAUNCH

- [ ] Configurar dominio: simbioma.cl
- [ ] SSL certificate
- [ ] Google Analytics / Vercel Analytics
- [ ] Form waitlist funcional
- [ ] Email notifications setup
- [ ] SEO meta tags (title, description, OG image)
- [ ] Favicon
- [ ] Mobile responsive testing (iPhone, Android)
- [ ] Performance: Lighthouse score >90
- [ ] Accessibility: WCAG 2.1 AA
- [ ] Legal: Términos, Privacidad (básicos)

---

**Estructura completa lista para implementar en Claude Code** 🚀
