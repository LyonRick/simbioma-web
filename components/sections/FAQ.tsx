"use client";

import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import { ChevronDown } from "lucide-react";

export default function FAQ() {
  const [openIndex, setOpenIndex] = useState<number | null>(0);

  const faqs = [
    {
      question: "¿Qué es el programa Beta y cómo accedo?",
      answer: "El programa Beta es nuestra fase de validación con early adopters. Incluye 50% descuento los primeros 6 meses, soporte prioritario, y oportunidad de influir en el roadmap del producto. Cupos limitados a 30 organizaciones (15 gobiernos + 15 empresas)."
    },
    {
      question: "¿Cómo se integra con mis sistemas actuales?",
      answer: "Simbioma se conecta vía API con gestionadores de residuos (ReSimple, etc.), estaciones meteorológicas, sensores IoT. También soporta uploads manuales de Excel/CSV. No reemplazamos tus sistemas, los integramos."
    },
    {
      question: "¿Qué frameworks de reporte ESG soportan?",
      answer: "Gobiernos: SINADER, SINIA, SCAM, GRI, CDP Cities, TCFD. Empresas: GRI, SASB, CDP, B Corp Assessment, ISO 14001. Agregamos nuevos frameworks basados en demanda de usuarios."
    },
    {
      question: "¿Mis datos están seguros? ¿Quién los ve?",
      answer: "Tus datos están encriptados (AES-256) y aislados por organización (Row Level Security). Solo tu equipo ve tus datos privados. Puedes optar por contribuir datos agregados y anónimos al dashboard territorial público, pero SIEMPRE es opcional."
    },
    {
      question: "¿Cuánto tiempo toma la implementación?",
      answer: "Onboarding típico: 2-4 semanas. Incluye: (1) Setup cuentas, (2) Integración fuentes de datos, (3) Carga datos históricos (opcional), (4) Capacitación equipo. En Beta incluimos acompañamiento dedicado."
    },
    {
      question: "¿Puedo crear indicadores custom para mi industria?",
      answer: "Sí, planes Professional y Enterprise permiten indicadores custom. Si el indicador es relevante para tu sector, podemos aprobarlo como 'global' para que otras organizaciones similares también lo usen."
    }
  ];

  return (
    <section id="faq" className="py-24 bg-white">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
            Preguntas Frecuentes
          </h2>
          <p className="text-lg text-gray-600">
            Resolvemos tus dudas sobre la plataforma y el proceso de implementación.
          </p>
        </div>

        <div className="max-w-3xl mx-auto space-y-4">
          {faqs.map((faq, index) => (
            <div
              key={index}
              className={`border rounded-xl overflow-hidden transition-all duration-300 ${openIndex === index ? 'border-verde-bosque shadow-md bg-verde-bosque/5' : 'border-gray-200 hover:border-gray-300'}`}
            >
              <button
                onClick={() => setOpenIndex(openIndex === index ? null : index)}
                className="w-full flex justify-between items-center p-6 text-left"
              >
                <span className={`font-semibold text-lg ${openIndex === index ? 'text-verde-bosque' : 'text-gray-900'}`}>
                  {faq.question}
                </span>
                <ChevronDown
                  className={`w-5 h-5 transition-transform duration-300 ${openIndex === index ? "rotate-180 text-verde-bosque" : "text-gray-400"
                    }`}
                />
              </button>
              <AnimatePresence>
                {openIndex === index && (
                  <motion.div
                    initial={{ height: 0, opacity: 0 }}
                    animate={{ height: "auto", opacity: 1 }}
                    exit={{ height: 0, opacity: 0 }}
                    transition={{ duration: 0.3 }}
                  >
                    <div className="px-6 pb-6 text-gray-600 leading-relaxed">
                      {faq.answer}
                    </div>
                  </motion.div>
                )}
              </AnimatePresence>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
}
