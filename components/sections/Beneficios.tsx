"use client";

import { motion } from "framer-motion";
import { Target, TrendingUp, Sprout, Zap, ShieldCheck, Users } from "lucide-react";

const benefits = [
  {
    icon: Target,
    title: "Eficiencia Operativa",
    description: "Reduce en un 80% el tiempo dedicado a reportes manuales. Automatiza la recolección y validación de datos.",
    color: "text-verde-bosque",
    bg: "bg-verde-bosque/10"
  },
  {
    icon: TrendingUp,
    title: "Inteligencia de Datos",
    description: "Toma decisiones basadas en evidencia. Benchmarking sectorial y territorial en tiempo real.",
    color: "text-azul-oceano",
    bg: "bg-azul-oceano/10"
  },
  {
    icon: Sprout,
    title: "Impacto Regenerativo",
    description: "Transita del compliance básico a la regeneración ecosistémica con indicadores avanzados.",
    color: "text-amarillo-sol",
    bg: "bg-amarillo-sol/10"
  },
  {
    icon: ShieldCheck,
    title: "Seguridad y Compliance",
    description: "Datos encriptados, firma electrónica integrada y cumplimiento normativo garantizado.",
    color: "text-purple-600",
    bg: "bg-purple-100"
  },
  {
    icon: Users,
    title: "Colaboración Multi-Actor",
    description: "Conecta con otros actores del territorio para proyectos de impacto compartido.",
    color: "text-pink-600",
    bg: "bg-pink-100"
  },
  {
    icon: Zap,
    title: "Implementación Rápida",
    description: "Onboarding en días, no meses. Integraciones plug-and-play con sistemas existentes.",
    color: "text-orange-600",
    bg: "bg-orange-100"
  }
];

export default function Beneficios() {
  return (
    <section id="beneficios" className="py-24 bg-gray-50">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-4xl font-bold text-gray-900 mb-4"
          >
            Por qué elegir <span className="text-verde-bosque">Simbioma</span>
          </motion.h2>
          <p className="text-lg text-gray-600">
            Una plataforma diseñada para escalar el impacto de tu organización.
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
          {benefits.map((benefit, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ delay: index * 0.1 }}
              className="bg-white p-8 rounded-2xl shadow-sm border border-gray-100 hover:shadow-xl transition-all hover:-translate-y-1 group"
            >
              <div className={`w-14 h-14 ${benefit.bg} rounded-xl flex items-center justify-center mb-6 group-hover:scale-110 transition-transform`}>
                <benefit.icon className={`w-7 h-7 ${benefit.color}`} />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">
                {benefit.title}
              </h3>
              <p className="text-gray-600 leading-relaxed">
                {benefit.description}
              </p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
