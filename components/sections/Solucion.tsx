"use client";

import { motion } from "framer-motion";
import Image from "next/image";
import { Database, LayoutDashboard, FileText } from "lucide-react";

export default function Solucion() {
  const steps = [
    {
      id: 1,
      title: "Elige la fuente de datos",
      description: "Disponemos de decenas de fuentes de datos consolidadas o sube los tuyos (archivos Excel). Podemos integrarnos con tus sistemas existentes.",
      icon: Database,
      color: "#2D9D78",
      tags: ["API", "Excel", "IoT", "Sensores"],
      image: "/images/solutions/dashboard-integration.jpg",
      altText: "Dashboard mostrando gráficos de análisis de datos ambientales con múltiples fuentes de información integradas en tiempo real"
    },
    {
      id: 2,
      title: "Consolida en un dashboard unificado",
      description: "Visualiza todos tus indicadores ambientales en tiempo real. Compara progreso año tras año y detecta anomalías al instante.",
      icon: LayoutDashboard,
      color: "#1E5F8C",
      tags: ["KPIs", "Proyectos", "Benchmarks"],
      image: "/images/solutions/dashboard-analytics.jpg",
      altText: "Pantalla de computador mostrando dashboard con indicadores ambientales, gráficos de tendencias y KPIs de sostenibilidad en tiempo real"
    },
    {
      id: 3,
      title: "Genera reportes automáticos",
      description: "En minutos, no semanas. Selecciona el framework (SINADER, GRI, CDP), el sistema pre-llena los datos, tú revisas y firmas.",
      icon: FileText,
      color: "#F5A623",
      tags: ["SINADER", "GRI", "CDP", "SASB"],
      image: "/images/solutions/report-signing.jpg",
      altText: "Persona revisando documentos de reportes ambientales en tablet, mostrando informes ESG listos para firma electrónica"
    }
  ];

  return (
    <section id="solucion" className="py-24 bg-white overflow-hidden">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-20">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-4xl font-bold text-gray-900 mb-4"
          >
            Cómo funciona <span className="text-verde-bosque">Simbioma</span>
          </motion.h2>
          <p className="text-lg text-gray-600">
            Tres pasos simples para transformar tu gestión ambiental de reactiva a estratégica.
          </p>
        </div>

        <div className="space-y-24">
          {steps.map((step, index) => (
            <motion.div
              key={step.id}
              initial={{ opacity: 0, y: 40 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.7 }}
              className={`flex flex-col ${index % 2 === 1 ? 'lg:flex-row-reverse' : 'lg:flex-row'} items-center gap-12 lg:gap-20`}
            >
              {/* Content */}
              <div className="flex-1 space-y-6">
                <div
                  className="w-16 h-16 rounded-2xl flex items-center justify-center text-white shadow-lg mb-6"
                  style={{ backgroundColor: step.color }}
                >
                  <step.icon className="w-8 h-8" />
                </div>

                <h3 className="text-2xl md:text-3xl font-bold text-gray-900">
                  {step.title}
                </h3>

                <p className="text-lg text-gray-600 leading-relaxed">
                  {step.description}
                </p>

                <div className="flex flex-wrap gap-2 pt-2">
                  {step.tags.map(tag => (
                    <span key={tag} className="px-3 py-1 bg-gray-100 text-gray-600 rounded-full text-sm font-medium">
                      {tag}
                    </span>
                  ))}
                </div>
              </div>

              {/* Image */}
              <div className="flex-1 w-full">
                <div className="relative aspect-[4/3] rounded-2xl overflow-hidden shadow-2xl group">
                  <div
                    className="absolute inset-0 opacity-0 group-hover:opacity-10 transition-opacity duration-500 z-10"
                    style={{ backgroundColor: step.color }}
                  />
                  <Image
                    src={step.image}
                    alt={step.altText}
                    fill
                    className="object-cover transition-transform duration-700 group-hover:scale-105"
                  />
                </div>
              </div>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
