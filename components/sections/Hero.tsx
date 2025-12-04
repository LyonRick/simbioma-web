"use client";

import Link from "next/link";
import { motion } from "framer-motion";
import { Button } from "@/components/ui/button";
import { ArrowRight, CheckCircle2, PlayCircle, Leaf, BarChart3, PieChart, Activity } from "lucide-react";

export default function Hero() {
  return (
    <section className="relative min-h-screen flex items-center pt-20 overflow-hidden bg-white">
      {/* Network Background Pattern */}
      <div className="absolute inset-0 z-0 opacity-[0.03] pointer-events-none">
        <svg className="w-full h-full" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <pattern id="grid-pattern" width="40" height="40" patternUnits="userSpaceOnUse">
              <circle cx="2" cy="2" r="1" fill="currentColor" className="text-verde-bosque" />
            </pattern>
          </defs>
          <rect width="100%" height="100%" fill="url(#grid-pattern)" />
        </svg>
      </div>

      {/* Gradient Blobs */}
      <div className="absolute top-20 right-0 -z-10 opacity-20">
        <div className="w-[600px] h-[600px] bg-gradient-to-br from-verde-bosque/30 to-azul-oceano/30 rounded-full blur-3xl" />
      </div>
      <div className="absolute bottom-0 left-0 -z-10 opacity-20">
        <div className="w-[400px] h-[400px] bg-amarillo-sol/20 rounded-full blur-3xl" />
      </div>

      <div className="container mx-auto px-4 md:px-6 relative z-10">
        <div className="grid lg:grid-cols-2 gap-12 items-center">

          {/* Text Content */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
          >
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-bold text-gray-900 leading-[1.1] mb-6 tracking-tight">
              Inteligencia Territorial para <span className="text-transparent bg-clip-text bg-gradient-to-r from-verde-bosque to-azul-oceano">Regenerar Chile</span>
            </h1>

            <p className="text-lg md:text-xl text-gray-600 mb-8 leading-relaxed max-w-xl">
              La primera plataforma dual que conecta gobiernos locales y empresas para consolidar datos, automatizar reportes ESG y visualizar el impacto real.
            </p>

            <div className="flex flex-col sm:flex-row gap-4 mb-10">
              <Link href="/#cta-final">
                <Button variant="default" size="lg" className="h-14 px-8 text-lg shadow-verde-bosque/25">
                  Solicitar Acceso Beta
                  <ArrowRight className="ml-2 w-5 h-5" />
                </Button>
              </Link>
              <Button variant="outline" size="lg" className="h-14 px-8 text-lg border-2 hover:bg-gray-50 text-gray-700">
                <PlayCircle className="mr-2 w-5 h-5 text-gray-600" />
                Ver Video Demo
              </Button>
            </div>

            <div className="flex flex-col sm:flex-row gap-6 text-sm text-gray-600 font-medium">
              <div className="flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-verde-bosque" />
                <span>Cumplimiento SINADER/GRI</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-verde-bosque" />
                <span>Firma Electrónica Integrada</span>
              </div>
              <div className="flex items-center gap-2">
                <CheckCircle2 className="w-5 h-5 text-verde-bosque" />
                <span>Gestión Multi-Actor</span>
              </div>
            </div>
          </motion.div>

          {/* Visual Content (Mockup) */}
          <motion.div
            initial={{ opacity: 0, x: 20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ duration: 0.8, delay: 0.2 }}
            className="relative"
          >
            <div className="relative rounded-2xl overflow-hidden shadow-2xl border border-gray-200 bg-white/50 backdrop-blur-sm p-2">
              <div className="rounded-xl overflow-hidden bg-gray-50 border border-gray-100 aspect-[4/3] relative group">
                {/* Abstract UI Representation */}
                <div className="absolute inset-0 flex flex-col">
                  {/* Mock Header */}
                  <div className="h-14 border-b border-gray-200 flex items-center px-6 gap-4 bg-white justify-between">
                    <div className="flex gap-2">
                      <div className="w-3 h-3 rounded-full bg-red-400/80"></div>
                      <div className="w-3 h-3 rounded-full bg-yellow-400/80"></div>
                      <div className="w-3 h-3 rounded-full bg-green-400/80"></div>
                    </div>
                    <div className="w-32 h-2 bg-gray-100 rounded-full"></div>
                  </div>

                  {/* Mock Dashboard Content */}
                  <div className="p-6 grid grid-cols-12 gap-4 h-full">
                    {/* Sidebar */}
                    <div className="hidden md:block col-span-2 space-y-3 pt-2">
                      <div className="h-2 w-16 bg-gray-200 rounded mb-6"></div>
                      <div className="h-8 w-full bg-verde-bosque/10 rounded-lg border border-verde-bosque/20"></div>
                      <div className="h-8 w-full bg-transparent rounded-lg"></div>
                      <div className="h-8 w-full bg-transparent rounded-lg"></div>
                    </div>

                    {/* Main Area */}
                    <div className="col-span-12 md:col-span-10 grid grid-cols-2 gap-4 content-start">
                      {/* Stats Cards */}
                      <div className="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                        <div className="flex justify-between items-start mb-2">
                          <div className="w-8 h-8 rounded-lg bg-verde-bosque/10 flex items-center justify-center">
                            <Leaf className="w-4 h-4 text-verde-bosque" />
                          </div>
                          <span className="text-xs text-green-600 font-bold">+12%</span>
                        </div>
                        <p className="text-[10px] text-gray-500 uppercase font-medium mb-1">Reciclaje</p>
                        <p className="text-lg font-bold text-gray-900">2.4 ton</p>
                      </div>
                      <div className="bg-white p-4 rounded-xl border border-gray-100 shadow-sm">
                        <div className="flex justify-between items-start mb-2">
                          <div className="w-8 h-8 rounded-lg bg-azul-oceano/10 flex items-center justify-center">
                            <Activity className="w-4 h-4 text-azul-oceano" />
                          </div>
                          <span className="text-xs text-blue-600 font-bold">-18%</span>
                        </div>
                        <p className="text-[10px] text-gray-500 uppercase font-medium mb-1">Electricidad</p>
                        <p className="text-lg font-bold text-gray-900">8.2 MWh</p>
                      </div>

                      {/* Chart Area */}
                      <div className="col-span-2 bg-white p-4 rounded-xl border border-gray-100 shadow-sm h-32 flex items-end justify-between gap-2 pb-2 px-2">
                        {[40, 65, 45, 80, 55, 70, 90].map((h, i) => (
                          <div key={i} className="w-full bg-gradient-to-t from-verde-bosque to-verde-bosque-light rounded-t-sm opacity-80" style={{ height: `${h}%` }}></div>
                        ))}
                      </div>
                    </div>
                  </div>
                </div>

                {/* Floating Elements */}
                <motion.div
                  animate={{ y: [0, -10, 0] }}
                  transition={{ duration: 4, repeat: Infinity, ease: "easeInOut" }}
                  className="absolute top-16 right-8 bg-white p-3 rounded-lg shadow-lg border border-gray-100 z-10 flex items-center gap-3"
                >
                  <div className="w-8 h-8 rounded-full bg-green-100 flex items-center justify-center text-green-600">
                    <PieChart className="w-4 h-4" />
                  </div>
                  <div>
                    <p className="text-[10px] text-gray-500 uppercase font-bold">Huella</p>
                    <p className="text-xs font-bold text-gray-900">-240 tCO2e</p>
                  </div>
                </motion.div>

                <motion.div
                  animate={{ y: [0, 10, 0] }}
                  transition={{ duration: 5, repeat: Infinity, ease: "easeInOut", delay: 1 }}
                  className="absolute bottom-12 left-8 bg-white p-3 rounded-lg shadow-lg border border-gray-100 z-10 flex items-center gap-3"
                >
                  <div className="w-8 h-8 rounded-full bg-blue-100 flex items-center justify-center text-blue-600">
                    <CheckCircle2 className="w-4 h-4" />
                  </div>
                  <div>
                    <p className="text-[10px] text-gray-500 uppercase font-bold">Reporte</p>
                    <p className="text-xs font-bold text-gray-900">Enviado</p>
                  </div>
                </motion.div>
              </div>
            </div>
          </motion.div>

        </div>
      </div>
    </section>
  );
}
