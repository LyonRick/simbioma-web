"use client";

import { motion } from "framer-motion";
import { Building2, Landmark, ArrowRight, Check } from "lucide-react";
import { Button } from "@/components/ui/Button";

export default function Segmentacion() {
  return (
    <section id="segmentacion" className="py-24 bg-gray-50">
      <div className="container mx-auto px-4 md:px-6">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.h2
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            className="text-3xl md:text-4xl font-bold text-gray-900 mb-4"
          >
            Soluciones adaptadas a tu <span className="text-verde-bosque">rol</span>
          </motion.h2>
          <motion.p
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ delay: 0.1 }}
            className="text-lg text-gray-600"
          >
            Simbioma ofrece herramientas específicas para cada actor del ecosistema.
          </motion.p>
        </div>

        <div className="grid md:grid-cols-2 gap-8 max-w-5xl mx-auto">
          {/* Government Card */}
          <motion.div
            initial={{ opacity: 0, x: -20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
            className="bg-white rounded-2xl p-8 shadow-lg border border-gray-100 hover:shadow-xl transition-shadow"
          >
            <div className="w-12 h-12 bg-verde-bosque/10 rounded-xl flex items-center justify-center mb-6">
              <Landmark className="w-6 h-6 text-verde-bosque" />
            </div>
            <h3 className="text-2xl font-bold text-gray-900 mb-2">Gobiernos Locales</h3>
            <p className="text-gray-600 mb-6">
              Para municipalidades y gobiernos regionales que necesitan gestionar su territorio.
            </p>
            <ul className="space-y-3 mb-8">
              {[
                "Reportes SINADER/SCAM automáticos",
                "Dashboard territorial unificado",
                "Transparencia pública garantizada",
                "Comparativa con comunas similares"
              ].map((item, i) => (
                <li key={i} className="flex items-start gap-3">
                  <Check className="w-5 h-5 text-verde-bosque shrink-0" />
                  <span className="text-gray-700 text-sm">{item}</span>
                </li>
              ))}
            </ul>
            <Button className="w-full bg-[#2D9D78] hover:bg-[#247A5F] text-white shadow-lg shadow-[#2D9D78]/20">
              Ver Solución Gobierno
              <ArrowRight className="ml-2 w-4 h-4" />
            </Button>
          </motion.div>

          {/* Enterprise Card */}
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            whileInView={{ opacity: 1, x: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.5 }}
            className="bg-white rounded-2xl p-8 shadow-lg border border-gray-100 hover:shadow-xl transition-shadow"
          >
            <div className="w-12 h-12 bg-[#1E5F8C]/10 rounded-xl flex items-center justify-center mb-6">
              <Building2 className="w-6 h-6 text-[#1E5F8C]" />
            </div>
            <h3 className="text-2xl font-bold text-gray-900 mb-2">Empresas</h3>
            <p className="text-gray-600 mb-6">
              Para organizaciones que buscan liderazgo ESG y eficiencia en reportes.
            </p>
            <ul className="space-y-3 mb-8">
              {[
                "Reportes GRI/SASB/CDP integrados",
                "Benchmarking anónimo por industria",
                "Consolidación multi-sucursal",
                "Gestión de impacto territorial"
              ].map((item, i) => (
                <li key={i} className="flex items-start gap-3">
                  <Check className="w-5 h-5 text-[#1E5F8C] shrink-0" />
                  <span className="text-gray-700 text-sm">{item}</span>
                </li>
              ))}
            </ul>
            <Button className="w-full bg-[#1E5F8C] hover:bg-[#164A6E] text-white shadow-lg shadow-[#1E5F8C]/20">
              Ver Solución Empresas
              <ArrowRight className="ml-2 w-4 h-4" />
            </Button>
          </motion.div>
        </div>
      </div>
    </section>
  );
}
