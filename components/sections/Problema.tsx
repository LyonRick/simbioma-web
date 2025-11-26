"use client";

import { motion } from "framer-motion";
import { AlertTriangle, FileX, Clock, BarChart4 } from "lucide-react";

const problems = [
  {
    icon: FileX,
    title: "Datos Fragmentados",
    description: "Información dispersa en Excels, correos y sistemas legacy que no conversan entre sí.",
    color: "text-red-500",
    bg: "bg-red-50",
  },
  {
    icon: Clock,
    title: "Reportes Manuales",
    description: "Cientos de horas hombre perdidas copiando y pegando datos para cumplir con SINADER y GRI.",
    color: "text-orange-500",
    bg: "bg-orange-50",
  },
  {
    icon: BarChart4,
    title: "Sin Visibilidad Real",
    description: "Imposible tomar decisiones estratégicas cuando los datos tienen meses de desfase.",
    color: "text-yellow-600",
    bg: "bg-yellow-50",
  },
];

export default function Problema() {
  return (
    <section className="py-24 bg-white">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
          >
            <h2 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
              La gestión ambiental actual es <span className="text-destructive">insostenible</span>
            </h2>
            <p className="text-lg text-gray-600">
              Tanto municipios como empresas enfrentan el mismo desafío: la desconexión de datos impide la verdadera regeneración.
            </p>
          </motion.div>
        </div>

        <div className="grid md:grid-cols-3 gap-8">
          {problems.map((item, index) => (
            <motion.div
              key={index}
              initial={{ opacity: 0, y: 20 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: index * 0.1 }}
              className={`group p-8 rounded-2xl border border-gray-100 hover:shadow-xl transition-all duration-300 ${index === 0 ? 'bg-red-50 hover:bg-red-100 hover:border-red-200' : index === 1 ? 'bg-orange-50 hover:bg-orange-100 hover:border-orange-200' : 'bg-yellow-50 hover:bg-yellow-100 hover:border-yellow-200'}`}
            >
              <div className={`w-14 h-14 rounded-xl ${item.bg} flex items-center justify-center mb-6 group-hover:scale-110 transition-transform duration-300 shadow-sm`}>
                <item.icon className={`w-7 h-7 ${item.color}`} />
              </div>
              <h3 className="text-xl font-bold text-gray-900 mb-3">{item.title}</h3>
              <p className="text-gray-600 leading-relaxed">
                {item.description}
              </p>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
}
