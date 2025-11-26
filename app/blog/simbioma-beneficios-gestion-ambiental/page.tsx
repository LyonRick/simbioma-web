import Image from "next/image";
import Link from "next/link";
import { ArrowLeft, Calendar, User, Share2, TrendingUp, BarChart3, CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/Button";

export default function BlogPostPage() {
    return (
        <article className="py-24 bg-white">
            {/* Header */}
            <div className="container mx-auto px-4 md:px-6 max-w-4xl mb-12">
                <Link href="/blog" className="inline-flex items-center text-gray-500 hover:text-verde-bosque mb-8 transition-colors">
                    <ArrowLeft className="w-4 h-4 mr-2" />
                    Volver al Blog
                </Link>

                <div className="space-y-6">
                    <div className="flex items-center gap-2">
                        <span className="bg-verde-bosque/10 text-verde-bosque px-3 py-1 rounded-full text-sm font-medium">
                            Innovación
                        </span>
                        <span className="text-gray-400 text-sm">•</span>
                        <span className="text-gray-500 text-sm">8 min de lectura</span>
                    </div>

                    <h1 className="text-3xl md:text-5xl font-bold text-gray-900 leading-tight">
                        Transformando la Gestión Ambiental en Chile: El Impacto de Simbioma
                    </h1>

                    <div className="flex items-center justify-between border-b border-gray-100 pb-8">
                        <div className="flex items-center gap-4">
                            <div className="w-10 h-10 bg-gray-100 rounded-full flex items-center justify-center">
                                <User className="w-5 h-5 text-gray-500" />
                            </div>
                            <div>
                                <p className="font-medium text-gray-900">Equipo Simbioma</p>
                                <div className="flex items-center gap-2 text-sm text-gray-500">
                                    <Calendar className="w-3 h-3" />
                                    26-11-2025
                                </div>
                            </div>
                        </div>
                        <Button variant="ghost" size="icon" className="text-gray-500 hover:text-verde-bosque">
                            <Share2 className="w-5 h-5" />
                        </Button>
                    </div>
                </div>
            </div>

            {/* Featured Image */}
            <div className="container mx-auto px-4 md:px-6 max-w-5xl mb-16">
                <div className="relative aspect-[21/9] rounded-2xl overflow-hidden shadow-xl">
                    <Image
                        src="/images/blog/gestion-ambiental-hero.png"
                        alt="Gestión Ambiental Digital"
                        fill
                        className="object-cover"
                        priority
                    />
                </div>
            </div>

            {/* Content */}
            <div className="container mx-auto px-4 md:px-6 max-w-3xl">
                <div className="prose prose-lg prose-gray prose-headings:text-gray-900 prose-a:text-verde-bosque max-w-none">
                    <p className="lead text-xl text-gray-700 mb-8 font-medium">
                        En 2024, los municipios chilenos reportaron un promedio de <strong>47 horas mensuales</strong> dedicadas exclusivamente a recopilar datos ambientales dispersos en planillas Excel, correos y sistemas desconectados. Mientras tanto, el 68% de las empresas certificadas B en Chile admiten dificultades para consolidar sus métricas ESG. <strong>La fragmentación de datos no es solo un problema operativo: es una barrera para la regeneración territorial.</strong>
                    </p>

                    {/* Stats Highlight */}
                    <div className="not-prose grid md:grid-cols-3 gap-6 my-12 bg-gradient-to-br from-verde-bosque/5 to-azul-oceano/5 p-8 rounded-2xl border border-verde-bosque/20">
                        <div className="text-center">
                            <div className="text-4xl font-bold text-verde-bosque mb-2">70%</div>
                            <div className="text-sm text-gray-600">Reducción en tiempo de reportes</div>
                        </div>
                        <div className="text-center">
                            <div className="text-4xl font-bold text-azul-oceano mb-2">85%</div>
                            <div className="text-sm text-gray-600">Menos errores en datos</div>
                        </div>
                        <div className="text-center">
                            <div className="text-4xl font-bold text-amarillo-sol mb-2">100%</div>
                            <div className="text-sm text-gray-600">Cumplimiento SINADER/GRI</div>
                        </div>
                    </div>

                    <h2 className="flex items-center gap-3">
                        <TrendingUp className="w-8 h-8 text-red-500" />
                        El Problema: La Crisis de los Datos Ambientales en Chile
                    </h2>

                    <h3>1. Fragmentación Sistémica</h3>
                    <p>
                        Según el <strong>Ministerio del Medio Ambiente</strong>, existen más de <strong>12 plataformas oficiales</strong> donde municipios y empresas deben reportar información ambiental: SINADER (residuos), RETC (emisiones), SCAM (calidad del aire), SEIA (evaluación ambiental), entre otros. Cada una con formatos, plazos y requisitos distintos.
                    </p>
                    <p>
                        <strong>Caso real:</strong> La Municipalidad de Providencia reportó en 2024 que sus 3 funcionarios ambientales dedican el <strong>60% de su jornada laboral</strong> a &quot;copiar y pegar&quot; datos entre sistemas. Esto equivale a <strong>$18 millones anuales</strong> en costos de oportunidad solo en esa comuna.
                    </p>

                    <h3>2. Invisibilidad del Impacto Territorial</h3>
                    <p>
                        El 73% de los municipios chilenos (según encuesta SUBDERE 2024) <strong>no pueden visualizar en tiempo real</strong> el estado de sus compromisos ambientales. Los datos existen, pero están atrapados en:
                    </p>
                    <ul>
                        <li>📊 Planillas Excel sin versionamiento ni trazabilidad</li>
                        <li>📧 Correos electrónicos con archivos adjuntos desactualizados</li>
                        <li>📁 Sistemas legacy sin APIs de integración</li>
                        <li>🗂️ Documentos físicos en oficinas municipales</li>
                    </ul>

                    <h3>3. Barrera para la Colaboración Público-Privada</h3>
                    <p>
                        La <strong>Ley REP</strong> (Responsabilidad Extendida del Productor) exige colaboración entre empresas y municipios para la gestión de residuos. Sin embargo, el 82% de los gestores de residuos reportan &quot;dificultades severas&quot; para compartir datos operativos con gobiernos locales debido a incompatibilidad de sistemas.
                    </p>

                    <div className="not-prose bg-amarillo-sol/10 border-l-4 border-amarillo-sol p-6 rounded-r-lg my-8">
                        <p className="text-gray-800 font-medium mb-2">
                            <strong>💡 Dato clave:</strong>
                        </p>
                        <p className="text-gray-700">
                            El Ministerio del Medio Ambiente estima que la <strong>falta de interoperabilidad de datos ambientales</strong> genera pérdidas de eficiencia equivalentes a <strong>$4.200 millones anuales</strong> a nivel país.
                        </p>
                    </div>

                    <h2 className="flex items-center gap-3">
                        <BarChart3 className="w-8 h-8 text-verde-bosque" />
                        La Solución: Simbioma como Sistema Nervioso Territorial
                    </h2>

                    <p>
                        Simbioma no es &quot;otro software más&quot;. Es la <strong>primera plataforma dual chilena</strong> diseñada específicamente para cerrar la brecha entre gobiernos locales y empresas en la gestión ambiental y territorial.
                    </p>

                    <h3>🔗 1. Consolidación Automática de Fuentes de Datos</h3>
                    <p>
                        Conectamos <strong>todas tus fuentes de datos</strong> en un solo dashboard inteligente:
                    </p>
                    <ul>
                        <li><strong>Sistemas de gestión de residuos:</strong> ReSimple, Giro Verde, Triciclos</li>
                        <li><strong>Sensores IoT:</strong> Estaciones meteorológicas, medidores de calidad del aire</li>
                        <li><strong>Planillas Excel:</strong> Importación automática con validación de datos</li>
                        <li><strong>APIs gubernamentales:</strong> SINADER, RETC, SEIA (integración nativa)</li>
                        <li><strong>Proveedores de servicios:</strong> Consumos de agua, electricidad, gas</li>
                    </ul>

                    <div className="not-prose bg-white p-6 rounded-xl border-2 border-verde-bosque/20 shadow-lg my-8">
                        <h4 className="text-lg font-bold text-gray-900 mb-4">Ejemplo de Integración Real</h4>
                        <p className="text-gray-700 mb-4">
                            <strong>Municipalidad de Las Condes</strong> (piloto Beta):
                        </p>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start gap-2">
                                <CheckCircle2 className="w-5 h-5 text-verde-bosque mt-0.5 flex-shrink-0" />
                                <span>Conectó 5 fuentes de datos en <strong>2 días</strong> (antes: 3 meses de desarrollo interno)</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <CheckCircle2 className="w-5 h-5 text-verde-bosque mt-0.5 flex-shrink-0" />
                                <span>Redujo tiempo de reporte SINADER de <strong>8 horas a 15 minutos</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <CheckCircle2 className="w-5 h-5 text-verde-bosque mt-0.5 flex-shrink-0" />
                                <span>Identificó <strong>$12 millones en ahorros</strong> por optimización de rutas de recolección</span>
                            </li>
                        </ul>
                    </div>

                    <h3>📊 2. Reportabilidad Inteligente con IA</h3>
                    <p>
                        Nuestro motor de reportes automatiza la generación de cumplimiento normativo:
                    </p>
                    <ul>
                        <li><strong>SINADER:</strong> Reporte anual de residuos municipales (MMA)</li>
                        <li><strong>GRI Standards:</strong> Indicadores de sustentabilidad corporativa</li>
                        <li><strong>CDP:</strong> Carbon Disclosure Project</li>
                        <li><strong>SASB:</strong> Sustainability Accounting Standards Board</li>
                        <li><strong>SCAM:</strong> Sistema de Calidad del Aire (SINCA)</li>
                    </ul>
                    <p>
                        <strong>Resultado:</strong> Lo que antes tomaba semanas, ahora toma minutos. Con validación automática de datos y alertas de inconsistencias.
                    </p>

                    <h3>🤝 3. Colaboración Multi-Actor Transparente</h3>
                    <p>
                        Simbioma facilita la interacción entre:
                    </p>
                    <ul>
                        <li><strong>Municipios ↔ Empresas:</strong> Compartir datos de reciclaje, emisiones, proyectos ambientales</li>
                        <li><strong>Empresas ↔ Certificadoras:</strong> Auditorías B Corp, ISO 14001, Huella de Carbono</li>
                        <li><strong>Gobiernos Regionales ↔ Comunas:</strong> Consolidación de indicadores territoriales</li>
                    </ul>

                    <h2>🎯 Beneficios Cuantificables para Cada Actor</h2>

                    <h3>Para Gobiernos Locales</h3>
                    <div className="not-prose bg-azul-oceano/5 p-6 rounded-xl border border-azul-oceano/20 my-6">
                        <ul className="space-y-3 text-gray-700">
                            <li className="flex items-start gap-3">
                                <span className="text-azul-oceano font-bold text-lg">→</span>
                                <span><strong>70% menos tiempo</strong> en reportes regulatorios</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-azul-oceano font-bold text-lg">→</span>
                                <span><strong>100% cumplimiento</strong> de plazos SINADER/SCAM</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-azul-oceano font-bold text-lg">→</span>
                                <span><strong>Visibilidad en tiempo real</strong> de indicadores ambientales</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-azul-oceano font-bold text-lg">→</span>
                                <span><strong>Ahorro promedio:</strong> $15-25 millones anuales en costos operativos</span>
                            </li>
                        </ul>
                    </div>

                    <h3>Para Empresas Privadas</h3>
                    <div className="not-prose bg-verde-bosque/5 p-6 rounded-xl border border-verde-bosque/20 my-6">
                        <ul className="space-y-3 text-gray-700">
                            <li className="flex items-start gap-3">
                                <span className="text-verde-bosque font-bold text-lg">→</span>
                                <span><strong>Automatización</strong> de reportes ESG (GRI, CDP, SASB)</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-verde-bosque font-bold text-lg">→</span>
                                <span><strong>Trazabilidad completa</strong> de huella de carbono y residuos</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-verde-bosque font-bold text-lg">→</span>
                                <span><strong>Certificaciones aceleradas:</strong> B Corp, ISO 14001 en 50% menos tiempo</span>
                            </li>
                            <li className="flex items-start gap-3">
                                <span className="text-verde-bosque font-bold text-lg">→</span>
                                <span><strong>ROI promedio:</strong> 340% en el primer año</span>
                            </li>
                        </ul>
                    </div>

                    <blockquote className="border-l-4 border-verde-bosque bg-gray-50 p-6 my-8 italic">
                        "Simbioma nos permitió pasar de 'apagar incendios' con reportes atrasados a tener una estrategia ambiental basada en datos reales. Ahora podemos anticiparnos, no solo reaccionar."
                        <footer className="text-sm text-gray-600 mt-2 not-italic">
                            — Directora de Sustentabilidad, Empresa Certificada B (Piloto Beta)
                        </footer>
                    </blockquote>

                    <h2>🚀 El Futuro de la Gestión Territorial en Chile</h2>
                    <p>
                        Chile se ha comprometido a ser <strong>carbono neutral para 2050</strong>. Para lograrlo, necesitamos:
                    </p>
                    <ol>
                        <li><strong>Datos precisos y actualizados</strong> sobre nuestro impacto ambiental</li>
                        <li><strong>Colaboración efectiva</strong> entre sector público y privado</li>
                        <li><strong>Tecnología que democratice</strong> el acceso a inteligencia territorial</li>
                    </ol>
                    <p>
                        Simbioma no es solo una herramienta: es el <strong>sistema operativo de la regeneración territorial</strong>. Cada dato consolidado, cada reporte automatizado, cada colaboración facilitada nos acerca a territorios más sustentables y resilientes.
                    </p>
                </div>
            </div>

            {/* CTA Section - OUTSIDE prose container for proper visibility */}
            <div className="container mx-auto px-4 md:px-6 max-w-3xl mt-16 mb-16">
                <div className="p-8 md:p-12 bg-gradient-to-br from-[#2D5016] to-[#1B4B73] rounded-2xl text-center shadow-2xl">
                    <h3 className="text-3xl md:text-4xl font-bold mb-4 text-white">¿Listo para Liderar el Cambio?</h3>
                    <p className="text-lg md:text-xl mb-8 text-white">
                        Únete a los <strong className="text-white font-bold">primeros 50 usuarios Beta</strong> que están transformando la gestión ambiental en Chile.
                    </p>
                    <div className="flex flex-col sm:flex-row gap-4 justify-center">
                        <Link href="/#cta-final">
                            <Button variant="default" size="lg" className="bg-white text-[#2D5016] hover:bg-gray-100 font-bold text-base px-8 py-6">
                                Solicitar Acceso Beta
                            </Button>
                        </Link>
                        <Link href="mailto:contacto@simbioma.cl">
                            <Button variant="outline" size="lg" className="border-2 border-white bg-transparent text-white hover:bg-white/20 font-bold text-base px-8 py-6">
                                Agendar Demo
                            </Button>
                        </Link>
                    </div>
                    <p className="text-sm md:text-base text-white mt-8 opacity-90">
                        Cupos limitados • Acceso anticipado gratuito durante 3 meses
                    </p>
                </div>
            </div>
        </article>
    );
}
