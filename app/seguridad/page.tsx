import { Shield, Lock, Server, RefreshCw, Eye, FileCheck, AlertTriangle, Users } from "lucide-react";
import { Metadata } from "next";

export const metadata: Metadata = {
    title: "Seguridad | Simbioma",
    description: "Conoce las medidas de seguridad de Simbioma: encriptación AES-256, infraestructura certificada ISO 27001, cumplimiento GDPR y protección de datos ambientales estratégicos.",
    keywords: ["seguridad", "encriptación", "ISO 27001", "SOC 2", "GDPR", "protección de datos", "Chile", "certificaciones"],
    openGraph: {
        title: "Seguridad | Simbioma",
        description: "La seguridad de tus datos ambientales es nuestra prioridad. Infraestructura certificada y las mejores prácticas de la industria.",
        type: "website",
        locale: "es_CL",
    },
};

export default function SeguridadPage() {
    return (
        <div className="min-h-screen bg-white">
            <div className="container mx-auto px-4 py-24 max-w-6xl">
                {/* Hero Section */}
                <div className="text-center max-w-3xl mx-auto mb-16">
                    <h1 className="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
                        Seguridad en <span className="text-verde-bosque">Simbioma</span>
                    </h1>
                    <p className="text-xl text-gray-600">
                        La seguridad de sus datos ambientales y estratégicos es nuestra máxima prioridad.
                        Utilizamos infraestructura de clase mundial y las mejores prácticas de la industria.
                    </p>
                </div>

                {/* Security Features Grid */}
                <div className="grid md:grid-cols-2 gap-8 mb-20">
                    <div className="bg-white p-8 rounded-2xl border border-gray-200 shadow-lg hover:shadow-xl transition-all">
                        <div className="w-16 h-16 bg-verde-bosque/10 rounded-xl flex items-center justify-center mb-6">
                            <Lock className="w-8 h-8 text-verde-bosque" />
                        </div>
                        <h3 className="text-2xl font-bold text-gray-900 mb-4">Encriptación de Datos</h3>
                        <p className="text-gray-600 leading-relaxed mb-4">
                            Todos los datos son encriptados en tránsito y en reposo utilizando los estándares más avanzados de la industria.
                        </p>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start gap-2">
                                <span className="text-verde-bosque mt-1">✓</span>
                                <span><strong>TLS 1.3</strong> para datos en tránsito</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-verde-bosque mt-1">✓</span>
                                <span><strong>AES-256</strong> para datos en reposo</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-verde-bosque mt-1">✓</span>
                                <span>Credenciales hasheadas con <strong>bcrypt</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-verde-bosque mt-1">✓</span>
                                <span>Tokens JWT con expiración automática</span>
                            </li>
                        </ul>
                    </div>

                    <div className="bg-white p-8 rounded-2xl border border-gray-200 shadow-lg hover:shadow-xl transition-all">
                        <div className="w-16 h-16 bg-azul-oceano/10 rounded-xl flex items-center justify-center mb-6">
                            <Server className="w-8 h-8 text-azul-oceano" />
                        </div>
                        <h3 className="text-2xl font-bold text-gray-900 mb-4">Infraestructura Segura</h3>
                        <p className="text-gray-600 leading-relaxed mb-4">
                            Nuestros servidores están alojados en proveedores de nube certificados con los más altos estándares de seguridad.
                        </p>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start gap-2">
                                <span className="text-azul-oceano mt-1">✓</span>
                                <span><strong>AWS / Google Cloud</strong> con certificación <strong>ISO 27001</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-azul-oceano mt-1">✓</span>
                                <span>Cumplimiento <strong>SOC 2 Type II</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-azul-oceano mt-1">✓</span>
                                <span>Centros de datos en múltiples regiones</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-azul-oceano mt-1">✓</span>
                                <span>Redundancia geográfica automática</span>
                            </li>
                        </ul>
                    </div>

                    <div className="bg-white p-8 rounded-2xl border border-gray-200 shadow-lg hover:shadow-xl transition-all">
                        <div className="w-16 h-16 bg-amarillo-sol/10 rounded-xl flex items-center justify-center mb-6">
                            <Shield className="w-8 h-8 text-amarillo-sol" />
                        </div>
                        <h3 className="text-2xl font-bold text-gray-900 mb-4">Control de Acceso</h3>
                        <p className="text-gray-600 leading-relaxed mb-4">
                            Implementamos estrictos controles de acceso para garantizar que solo usuarios autorizados accedan a los datos.
                        </p>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start gap-2">
                                <span className="text-amarillo-sol mt-1">✓</span>
                                <span><strong>RBAC</strong> (Control de Acceso Basado en Roles)</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-amarillo-sol mt-1">✓</span>
                                <span><strong>MFA</strong> (Autenticación Multifactor) disponible</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-amarillo-sol mt-1">✓</span>
                                <span>Sesiones con expiración automática</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-amarillo-sol mt-1">✓</span>
                                <span>Logs de auditoría de todos los accesos</span>
                            </li>
                        </ul>
                    </div>

                    <div className="bg-white p-8 rounded-2xl border border-gray-200 shadow-lg hover:shadow-xl transition-all">
                        <div className="w-16 h-16 bg-gray-100 rounded-xl flex items-center justify-center mb-6">
                            <RefreshCw className="w-8 h-8 text-gray-600" />
                        </div>
                        <h3 className="text-2xl font-bold text-gray-900 mb-4">Backups y Recuperación</h3>
                        <p className="text-gray-600 leading-relaxed mb-4">
                            Realizamos copias de seguridad automáticas y mantenemos un plan robusto de recuperación ante desastres.
                        </p>
                        <ul className="space-y-2 text-gray-700">
                            <li className="flex items-start gap-2">
                                <span className="text-gray-600 mt-1">✓</span>
                                <span>Backups automáticos <strong>cada 6 horas</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-gray-600 mt-1">✓</span>
                                <span>Retención de backups por <strong>90 días</strong></span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-gray-600 mt-1">✓</span>
                                <span>Backups encriptados en múltiples ubicaciones</span>
                            </li>
                            <li className="flex items-start gap-2">
                                <span className="text-gray-600 mt-1">✓</span>
                                <span><strong>RTO \u003c 4 horas</strong> (Recovery Time Objective)</span>
                            </li>
                        </ul>
                    </div>
                </div>

                {/* Detailed Sections */}
                <div className="space-y-16">
                    {/* Monitoreo */}
                    <section>
                        <div className="flex items-center gap-4 mb-8">
                            <div className="w-12 h-12 bg-verde-bosque/10 rounded-lg flex items-center justify-center">
                                <Eye className="w-6 h-6 text-verde-bosque" />
                            </div>
                            <h2 className="text-3xl font-bold text-gray-900">Monitoreo y Detección de Amenazas</h2>
                        </div>
                        <div className="bg-gray-50 p-8 rounded-xl border border-gray-200">
                            <p className="text-gray-700 leading-relaxed mb-6">
                                Nuestro sistema de monitoreo opera 24/7 para detectar y responder a amenazas de seguridad en tiempo real:
                            </p>
                            <div className="grid md:grid-cols-2 gap-6">
                                <div>
                                    <h4 className="font-bold text-gray-900 mb-3">Monitoreo Continuo</h4>
                                    <ul className="space-y-2 text-gray-700">
                                        <li>• Detección de intrusiones (IDS/IPS)</li>
                                        <li>• Análisis de comportamiento anómalo</li>
                                        <li>• Escaneo de vulnerabilidades semanal</li>
                                        <li>• Monitoreo de logs centralizados</li>
                                    </ul>
                                </div>
                                <div>
                                    <h4 className="font-bold text-gray-900 mb-3">Respuesta a Incidentes</h4>
                                    <ul className="space-y-2 text-gray-700">
                                        <li>• Equipo de respuesta disponible 24/7</li>
                                        <li>• Procedimientos de escalamiento definidos</li>
                                        <li>• Notificación inmediata de incidentes críticos</li>
                                        <li>• Análisis forense post-incidente</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>

                    {/* Cumplimiento */}
                    <section>
                        <div className="flex items-center gap-4 mb-8">
                            <div className="w-12 h-12 bg-azul-oceano/10 rounded-lg flex items-center justify-center">
                                <FileCheck className="w-6 h-6 text-azul-oceano" />
                            </div>
                            <h2 className="text-3xl font-bold text-gray-900">Cumplimiento Normativo</h2>
                        </div>
                        <div className="bg-gray-50 p-8 rounded-xl border border-gray-200">
                            <p className="text-gray-700 leading-relaxed mb-6">
                                Simbioma cumple con los más altos estándares de seguridad y privacidad reconocidos internacionalmente:
                            </p>
                            <div className="grid md:grid-cols-3 gap-6">
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">ISO 27001</h4>
                                    <p className="text-sm text-gray-600">
                                        Gestión de Seguridad de la Información
                                    </p>
                                </div>
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">SOC 2 Type II</h4>
                                    <p className="text-sm text-gray-600">
                                        Controles de Seguridad, Disponibilidad y Confidencialidad
                                    </p>
                                </div>
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">GDPR</h4>
                                    <p className="text-sm text-gray-600">
                                        Reglamento General de Protección de Datos (UE)
                                    </p>
                                </div>
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">Ley 19.628</h4>
                                    <p className="text-sm text-gray-600">
                                        Protección de la Vida Privada (Chile)
                                    </p>
                                </div>
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">PCI DSS</h4>
                                    <p className="text-sm text-gray-600">
                                        Estándar de Seguridad de Datos para Pagos
                                    </p>
                                </div>
                                <div className="bg-white p-6 rounded-lg border border-gray-200">
                                    <h4 className="font-bold text-gray-900 mb-2">OWASP Top 10</h4>
                                    <p className="text-sm text-gray-600">
                                        Protección contra vulnerabilidades web críticas
                                    </p>
                                </div>
                            </div>
                        </div>
                    </section>

                    {/* Auditorías */}
                    <section>
                        <div className="flex items-center gap-4 mb-8">
                            <div className="w-12 h-12 bg-amarillo-sol/10 rounded-lg flex items-center justify-center">
                                <Users className="w-6 h-6 text-amarillo-sol" />
                            </div>
                            <h2 className="text-3xl font-bold text-gray-900">Auditorías y Certificaciones</h2>
                        </div>
                        <div className="bg-gray-50 p-8 rounded-xl border border-gray-200">
                            <p className="text-gray-700 leading-relaxed mb-6">
                                Nos sometemos regularmente a auditorías independientes para garantizar el cumplimiento de nuestros estándares de seguridad:
                            </p>
                            <ul className="space-y-3 text-gray-700">
                                <li className="flex items-start gap-3">
                                    <span className="text-verde-bosque font-bold mt-1">→</span>
                                    <span><strong>Auditorías de Seguridad Anuales</strong> por firmas especializadas reconocidas internacionalmente</span>
                                </li>
                                <li className="flex items-start gap-3">
                                    <span className="text-verde-bosque font-bold mt-1">→</span>
                                    <span><strong>Penetration Testing</strong> (pruebas de penetración) semestrales</span>
                                </li>
                                <li className="flex items-start gap-3">
                                    <span className="text-verde-bosque font-bold mt-1">→</span>
                                    <span><strong>Code Reviews</strong> de seguridad en cada release</span>
                                </li>
                                <li className="flex items-start gap-3">
                                    <span className="text-verde-bosque font-bold mt-1">→</span>
                                    <span><strong>Vulnerability Assessments</strong> automatizados continuos</span>
                                </li>
                            </ul>
                        </div>
                    </section>

                    {/* Programa de Vulnerabilidades */}
                    <section>
                        <div className="flex items-center gap-4 mb-8">
                            <div className="w-12 h-12 bg-red-100 rounded-lg flex items-center justify-center">
                                <AlertTriangle className="w-6 h-6 text-red-600" />
                            </div>
                            <h2 className="text-3xl font-bold text-gray-900">Divulgación Responsable de Vulnerabilidades</h2>
                        </div>
                        <div className="bg-gradient-to-br from-red-50 to-orange-50 p-8 rounded-xl border border-red-200">
                            <p className="text-gray-800 leading-relaxed mb-6">
                                Si cree haber encontrado una vulnerabilidad de seguridad en nuestra plataforma, le agradecemos que nos la reporte de manera responsable.
                            </p>
                            <div className="bg-white p-6 rounded-lg border border-red-200 mb-6">
                                <h4 className="font-bold text-gray-900 mb-3">Cómo Reportar</h4>
                                <ol className="list-decimal pl-6 space-y-2 text-gray-700">
                                    <li>Envíe un correo detallado a <a href="mailto:security@simbioma.cl" className="text-red-600 hover:underline font-medium">security@simbioma.cl</a></li>
                                    <li>Incluya pasos para reproducir la vulnerabilidad</li>
                                    <li>No divulgue públicamente la vulnerabilidad hasta que hayamos tenido oportunidad de solucionarla</li>
                                    <li>Recibirá confirmación de recepción en 24 horas</li>
                                </ol>
                            </div>
                            <div className="bg-white p-6 rounded-lg border border-red-200">
                                <h4 className="font-bold text-gray-900 mb-3">Nuestro Compromiso</h4>
                                <ul className="space-y-2 text-gray-700">
                                    <li>• Responderemos a su reporte en 48 horas</li>
                                    <li>• Mantendremos comunicación durante el proceso de resolución</li>
                                    <li>• Reconoceremos públicamente su contribución (si lo desea)</li>
                                    <li>• No tomaremos acciones legales contra investigadores de buena fe</li>
                                </ul>
                            </div>
                        </div>
                    </section>

                    {/* Capacitación */}
                    <section>
                        <h2 className="text-3xl font-bold text-gray-900 mb-8">Capacitación y Cultura de Seguridad</h2>
                        <div className="bg-gray-50 p-8 rounded-xl border border-gray-200">
                            <p className="text-gray-700 leading-relaxed mb-6">
                                La seguridad es responsabilidad de todo nuestro equipo. Invertimos continuamente en capacitación y concientización:
                            </p>
                            <div className="grid md:grid-cols-2 gap-6">
                                <div>
                                    <h4 className="font-bold text-gray-900 mb-3">Para Nuestro Equipo</h4>
                                    <ul className="space-y-2 text-gray-700">
                                        <li>• Capacitación obligatoria en seguridad al ingresar</li>
                                        <li>• Actualizaciones trimestrales sobre amenazas</li>
                                        <li>• Simulacros de phishing y social engineering</li>
                                        <li>• Certificaciones en seguridad (CISSP, CEH, etc.)</li>
                                    </ul>
                                </div>
                                <div>
                                    <h4 className="font-bold text-gray-900 mb-3">Para Nuestros Usuarios</h4>
                                    <ul className="space-y-2 text-gray-700">
                                        <li>• Guías de mejores prácticas de seguridad</li>
                                        <li>• Webinars sobre protección de datos</li>
                                        <li>• Alertas de seguridad proactivas</li>
                                        <li>• Soporte dedicado para incidentes de seguridad</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </section>

                    {/* Transparencia */}
                    <section className="bg-gradient-to-br from-verde-bosque/5 to-azul-oceano/5 p-12 rounded-2xl border border-verde-bosque/20">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6 text-center">Compromiso de Transparencia</h2>
                        <p className="text-gray-700 leading-relaxed text-center max-w-3xl mx-auto mb-8">
                            Creemos en la transparencia total sobre nuestras prácticas de seguridad. Publicamos regularmente:
                        </p>
                        <div className="grid md:grid-cols-3 gap-6">
                            <div className="bg-white p-6 rounded-lg text-center">
                                <h4 className="font-bold text-gray-900 mb-2">Reportes de Seguridad</h4>
                                <p className="text-sm text-gray-600">Actualizaciones trimestrales sobre el estado de nuestra seguridad</p>
                            </div>
                            <div className="bg-white p-6 rounded-lg text-center">
                                <h4 className="font-bold text-gray-900 mb-2">Estado del Sistema</h4>
                                <p className="text-sm text-gray-600">Disponibilidad y rendimiento en tiempo real</p>
                            </div>
                            <div className="bg-white p-6 rounded-lg text-center">
                                <h4 className="font-bold text-gray-900 mb-2">Changelog de Seguridad</h4>
                                <p className="text-sm text-gray-600">Historial de parches y mejoras de seguridad</p>
                            </div>
                        </div>
                    </section>

                    {/* Contact CTA */}
                    <section className="text-center">
                        <h2 className="text-3xl font-bold text-gray-900 mb-4">¿Preguntas sobre Seguridad?</h2>
                        <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto">
                            Nuestro equipo de seguridad está disponible para responder cualquier consulta sobre nuestras prácticas y controles de seguridad.
                        </p>
                        <a
                            href="mailto:security@simbioma.cl"
                            className="inline-flex items-center gap-2 bg-verde-bosque hover:bg-verde-bosque-dark text-white font-bold px-8 py-4 rounded-xl transition-all hover:shadow-xl"
                        >
                            <Shield className="w-5 h-5" />
                            Contactar al Equipo de Seguridad
                        </a>
                    </section>
                </div>
            </div>
        </div>
    );
}
