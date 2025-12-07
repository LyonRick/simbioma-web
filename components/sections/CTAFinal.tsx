"use client";

import { ContactForm } from "@/components/forms/ContactForm";

export default function CTAFinal() {
  return (
    <section id="cta-final" className="py-24 relative overflow-hidden">
      {/* Background Gradient */}
      <div className="absolute inset-0 bg-gradient-to-br from-[#2D9D78] to-[#1E5F8C] z-0" />

      {/* Decorative Circles */}
      <div className="absolute top-0 left-0 w-full h-full overflow-hidden z-0 opacity-20">
        <div className="absolute top-[-20%] left-[-10%] w-[600px] h-[600px] rounded-full bg-white blur-3xl" />
        <div className="absolute bottom-[-20%] right-[-10%] w-[600px] h-[600px] rounded-full bg-[#F5A623] blur-3xl" />
      </div>

      <div className="container mx-auto px-4 md:px-6 relative z-10">
        <div className="max-w-4xl mx-auto">
          <div className="text-center mb-10">
            <h2 className="text-3xl md:text-5xl font-bold text-white mb-6">
              Lidera la regeneración territorial
            </h2>
            <p className="text-xl text-white/90 max-w-2xl mx-auto">
              Únete al programa Beta y obtén 50% de descuento los primeros 6 meses. Cupos limitados.
            </p>
          </div>

          <div className="bg-white border border-white/20 rounded-3xl p-8 md:p-12 shadow-2xl max-w-2xl mx-auto">
            <ContactForm />
            <p className="text-center text-gray-500 text-sm mt-8">
              Sin compromiso. No requiere tarjeta de crédito.
            </p>
          </div>
        </div>
      </div>
    </section>
  );
}
