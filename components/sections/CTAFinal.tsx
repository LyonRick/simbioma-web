"use client";

import { useState } from "react";
import { motion } from "framer-motion";
import { ArrowRight, Loader2, CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

export default function CTAFinal() {
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    organization: "",
    type: ""
  });
  const [status, setStatus] = useState<"idle" | "loading" | "success">("idle");

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setStatus("loading");
    // Simulate API call
    await new Promise(resolve => setTimeout(resolve, 1500));
    setStatus("success");
  };

  return (
    <section id="cta-final" className="py-24 relative overflow-hidden">
      {/* Background Gradient */}
      <div className="absolute inset-0 bg-gradient-to-br from-[#2D9D78] to-[#1E5F8C] z-0" />

      {/* Decorative Circles */}
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden z-0 opacity-20">
        <div className="absolute top-[-20%] left-[-10%] w-[600px] h-[600px] rounded-full bg-white blur-3xl" />
        <div className="absolute bottom-[-20%] right-[-10%] w-[600px] h-[600px] rounded-full bg-amarillo-sol blur-3xl" />
      </div>

      <div className="container mx-auto px-4 md:px-6 relative z-10">
        <div className="max-w-4xl mx-auto bg-white/10 backdrop-blur-lg rounded-3xl p-8 md:p-12 border border-white/20 shadow-2xl">
          <div className="text-center mb-10">
            <h2 className="text-3xl md:text-5xl font-bold text-white mb-6">
              Lidera la regeneración territorial
            </h2>
            <p className="text-xl text-white/90 max-w-2xl mx-auto">
              Únete al programa Beta y obtén 50% de descuento los primeros 6 meses. Cupos limitados.
            </p>
          </div>

          {status === "success" ? (
            <motion.div
              initial={{ opacity: 0, scale: 0.9 }}
              animate={{ opacity: 1, scale: 1 }}
              className="text-center py-12"
            >
              <div className="w-20 h-20 bg-white rounded-full flex items-center justify-center mx-auto mb-6 shadow-lg">
                <CheckCircle2 className="w-10 h-10 text-verde-bosque" />
              </div>
              <h3 className="text-2xl font-bold text-white mb-2">¡Solicitud Recibida!</h3>
              <p className="text-white/80">Te contactaremos en breve para agendar tu demo.</p>
              <Button
                variant="ghost"
                className="mt-6 text-white hover:bg-white/20"
                onClick={() => setStatus("idle")}
              >
                Enviar otra solicitud
              </Button>
            </motion.div>
          ) : (
            <form onSubmit={handleSubmit} className="space-y-4 max-w-lg mx-auto">
              <div className="grid md:grid-cols-2 gap-4">
                <div>
                  <label htmlFor="beta-name" className="sr-only">Nombre completo</label>
                  <input
                    id="beta-name"
                    required
                    placeholder="Nombre completo"
                    aria-label="Nombre completo"
                    className="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 transition-all backdrop-blur-sm hover:bg-white/20"
                    value={formData.name}
                    onChange={e => setFormData({ ...formData, name: e.target.value })}
                  />
                </div>
                <div>
                  <label htmlFor="beta-email" className="sr-only">Email corporativo</label>
                  <input
                    id="beta-email"
                    required
                    type="email"
                    placeholder="Email corporativo"
                    aria-label="Email corporativo"
                    className="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 transition-all backdrop-blur-sm hover:bg-white/20"
                    value={formData.email}
                    onChange={e => setFormData({ ...formData, email: e.target.value })}
                  />
                </div>
              </div>
              <div>
                <label htmlFor="beta-org" className="sr-only">Organización</label>
                <input
                  id="beta-org"
                  required
                  placeholder="Organización"
                  aria-label="Organización"
                  className="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 transition-all backdrop-blur-sm hover:bg-white/20"
                  value={formData.organization}
                  onChange={e => setFormData({ ...formData, organization: e.target.value })}
                />
              </div>
              <div>
                <label htmlFor="beta-type" className="sr-only">Tipo de organización</label>
                <select
                  id="beta-type"
                  required
                  aria-label="Tipo de organización"
                  className="w-full px-4 py-3 rounded-xl bg-white/10 border border-white/20 text-white placeholder:text-white/70 focus:outline-none focus:ring-2 focus:ring-white/50 transition-all backdrop-blur-sm hover:bg-white/20 [&>option]:text-gray-900"
                  value={formData.type}
                  onChange={e => setFormData({ ...formData, type: e.target.value })}
                >
                  <option value="" disabled>Tipo de Organización</option>
                  <option value="gobierno">Gobierno Local / Regional</option>
                  <option value="empresa">Empresa Privada</option>
                  <option value="otro">Otro</option>
                </select>
              </div>

              <Button
                type="submit"
                disabled={status === "loading"}
                className="w-full h-14 text-lg font-bold bg-amarillo-sol hover:bg-amarillo-sol-dark text-white border-0 shadow-xl hover:shadow-2xl hover:scale-[1.02] transition-all"
              >
                {status === "loading" ? (
                  <div className="flex items-center justify-center gap-2">
                    <Loader2 className="w-6 h-6 animate-spin" />
                    <span>Enviando...</span>
                  </div>
                ) : (
                  <>
                    Solicitar Acceso Beta
                    <ArrowRight className="ml-2 w-5 h-5" />
                  </>
                )}
              </Button>
            </form>
          )}

          <p className="text-center text-white/60 text-sm mt-8">
            Sin compromiso. No requiere tarjeta de crédito.
          </p>
        </div>
      </div>
    </section>
  );
}
