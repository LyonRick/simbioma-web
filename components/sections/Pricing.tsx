'use client'

import { useState } from 'react'
import { Check, X } from 'lucide-react'

type PlanType = 'gobiernos' | 'empresas'

export default function Pricing() {
  const [planType, setPlanType] = useState<PlanType>('gobiernos')

  const planesGobiernos = [
    {
      name: 'Starter',
      subtitle: 'Municipalidades <50K habitantes',
      price: 300,
      priceBeta: 150,
      features: [
        { text: '3 usuarios', included: true },
        { text: 'Reportes: SINADER, SINIA, SCAM', included: true },
        { text: '2 integraciones de datos', included: true },
        { text: 'Dashboard básico', included: true },
        { text: 'Firma electrónica', included: false },
      ],
      cta: 'Solicitar Acceso',
      highlighted: false,
    },
    {
      name: 'Professional',
      subtitle: 'Municipalidades 50K-150K hab.',
      price: 600,
      priceBeta: 300,
      features: [
        { text: '10 usuarios', included: true },
        { text: 'Reportes: +GRI, +CDP Cities', included: true },
        { text: 'Integraciones ilimitadas', included: true },
        { text: 'Firma electrónica (5 docs/mes)', included: true },
        { text: 'Comparación con comunas similares', included: true },
      ],
      cta: 'Solicitar Acceso',
      highlighted: true,
    },
    {
      name: 'Enterprise',
      subtitle: 'Municipalidades >150K + GORE',
      price: 1200,
      priceBeta: 600,
      features: [
        { text: 'Usuarios ilimitados', included: true },
        { text: 'Reportes: +TCFD, +custom', included: true },
        { text: 'Firma electrónica ilimitada', included: true },
        { text: 'White-label (tu logo)', included: true },
        { text: 'Consultoría 10h/año incluidas', included: true },
      ],
      cta: 'Contactar Ventas',
      highlighted: false,
    },
  ]

  const planesEmpresas = [
    {
      name: 'Business',
      subtitle: 'Empresas medianas',
      price: 500,
      priceBeta: 250,
      features: [
        { text: '5 usuarios', included: true },
        { text: 'Reportes: GRI, SASB, ISO 14001', included: true },
        { text: '3 integraciones de datos', included: true },
        { text: 'Benchmarking sectorial básico', included: true },
        { text: 'Firma electrónica', included: false },
      ],
      cta: 'Solicitar Acceso',
      highlighted: false,
    },
    {
      name: 'Professional',
      subtitle: 'Empresas grandes',
      price: 900,
      priceBeta: 450,
      features: [
        { text: '15 usuarios', included: true },
        { text: 'Reportes: +CDP, +B Corp', included: true },
        { text: 'Integraciones ilimitadas', included: true },
        { text: 'Benchmarking avanzado anónimo', included: true },
        { text: 'Firma electrónica (10 docs/mes)', included: true },
      ],
      cta: 'Solicitar Acceso',
      highlighted: true,
    },
    {
      name: 'Enterprise',
      subtitle: 'Corporaciones multi-sitio',
      price: 1800,
      priceBeta: 900,
      features: [
        { text: 'Usuarios ilimitados', included: true },
        { text: 'Todos los frameworks + custom', included: true },
        { text: 'Multi-subsidiaria consolidada', included: true },
        { text: 'White-label + API privada', included: true },
        { text: 'Account Manager dedicado', included: true },
      ],
      cta: 'Contactar Ventas',
      highlighted: false,
    },
  ]

  const planes = planType === 'gobiernos' ? planesGobiernos : planesEmpresas

  return (
    <section id="pricing" className="py-20 bg-white">
      <div className="container mx-auto px-4">

        <h2 className="text-3xl md:text-4xl font-bold text-center mb-4">
          Planes diseñados para tu escala
        </h2>
        <p className="text-lg md:text-xl text-center text-gris-neutro/80 mb-4">
          Inicia con lo esencial, escala cuando necesites más
        </p>
        <p className="text-center text-sm text-gris-neutro/60 mb-16">
          🎁 Programa Beta: 50% descuento primeros 6 meses
        </p>

        {/* Toggle: Gobiernos / Empresas */}
        <div className="flex justify-center mb-12">
          <div className="inline-flex bg-gris-claro rounded-lg p-1">
            <button
              onClick={() => setPlanType('gobiernos')}
              className={`px-6 py-2 rounded-lg font-semibold transition-colors ${
                planType === 'gobiernos'
                  ? 'bg-white shadow-sm text-gris-neutro'
                  : 'text-gris-neutro/60'
              }`}
            >
              Gobiernos Locales
            </button>
            <button
              onClick={() => setPlanType('empresas')}
              className={`px-6 py-2 rounded-lg font-semibold transition-colors ${
                planType === 'empresas'
                  ? 'bg-white shadow-sm text-gris-neutro'
                  : 'text-gris-neutro/60'
              }`}
            >
              Empresas
            </button>
          </div>
        </div>

        {/* Grid Pricing */}
        <div className="grid md:grid-cols-3 gap-8 max-w-6xl mx-auto">
          {planes.map((plan, index) => (
            <div
              key={index}
              className={`p-8 rounded-2xl transition-all ${
                plan.highlighted
                  ? 'bg-verde-bosque text-white shadow-2xl transform scale-105 relative'
                  : 'bg-white border-2 border-gris-claro hover:border-verde-bosque'
              }`}
            >
              {plan.highlighted && (
                <div className="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-amarillo-sol text-white px-4 py-1 rounded-full text-sm font-bold">
                  MÁS POPULAR
                </div>
              )}

              <h3 className="text-2xl font-bold mb-2">{plan.name}</h3>
              <p
                className={`text-sm mb-6 ${
                  plan.highlighted ? 'text-white/80' : 'text-gris-neutro/60'
                }`}
              >
                {plan.subtitle}
              </p>

              <div className="mb-6">
                <span className="text-4xl font-bold">${plan.price}</span>
                <span className={plan.highlighted ? 'text-white/80' : 'text-gris-neutro/60'}>
                  /mes
                </span>
                <p
                  className={`text-sm font-semibold mt-1 ${
                    plan.highlighted ? 'text-amarillo-sol' : 'text-amarillo-sol'
                  }`}
                >
                  🎁 Beta: ${plan.priceBeta}/mes (primeros 6 meses)
                </p>
              </div>

              <ul className="space-y-3 mb-8">
                {plan.features.map((feature, i) => (
                  <li key={i} className="flex items-start">
                    {feature.included ? (
                      <Check
                        className={`w-5 h-5 mr-2 mt-0.5 flex-shrink-0 ${
                          plan.highlighted ? 'text-white' : 'text-verde-bosque'
                        }`}
                      />
                    ) : (
                      <X
                        className={`w-5 h-5 mr-2 mt-0.5 flex-shrink-0 ${
                          plan.highlighted ? 'text-white/30' : 'text-gris-neutro/30'
                        }`}
                      />
                    )}
                    <span
                      className={`text-sm ${
                        feature.included
                          ? ''
                          : plan.highlighted
                          ? 'text-white/50'
                          : 'text-gris-neutro/50'
                      }`}
                    >
                      {feature.text}
                    </span>
                  </li>
                ))}
              </ul>

              <button
                className={`w-full py-3 font-semibold rounded-lg transition-colors ${
                  plan.highlighted
                    ? 'bg-white text-verde-bosque hover:bg-white/90'
                    : index === 2
                    ? 'bg-azul-oceano text-white hover:bg-azul-oceano-dark'
                    : 'bg-gris-claro text-gris-neutro hover:bg-gris-claro/80'
                }`}
              >
                {plan.cta}
              </button>
            </div>
          ))}
        </div>

        <p className="text-center text-sm text-gris-neutro/60 mt-12">
          💡 Todos los planes incluyen soporte email. Professional y Enterprise incluyen soporte
          prioritario.
        </p>
      </div>
    </section>
  )
}
