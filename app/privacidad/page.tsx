export default function PrivacidadPage() {
    return (
        <div className="min-h-screen bg-white">
            <div className="container mx-auto px-4 py-24 max-w-5xl">
                <h1 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Política de Privacidad</h1>
                <p className="text-gray-500 mb-12">Última actualización: {new Date().toLocaleDateString('es-CL', { year: 'numeric', month: 'long', day: 'numeric' })}</p>

                <div className="prose prose-lg max-w-none">
                    {/* Introducción */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">Introducción</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma SpA (en adelante &quot;Simbioma&quot;, &quot;nosotros&quot;, &quot;nuestro&quot; o &quot;nuestra&quot;) valora su privacidad y se compromete a proteger sus datos personales. Esta Política de Privacidad describe cómo recopilamos, usamos, almacenamos y protegemos su información personal cuando utiliza nuestra plataforma de gestión ambiental y territorial.
                        </p>
                        <p className="text-gray-700 leading-relaxed">
                            Si tiene preguntas o inquietudes sobre nuestra política o prácticas de privacidad, no dude en ponerse en contacto con nuestro Oficial de Privacidad en{' '}
                            <a href="mailto:privacidad@simbioma.cl" className="text-verde-bosque hover:underline font-medium">
                                privacidad@simbioma.cl
                            </a>
                        </p>
                    </section>

                    {/* Cumplimiento Normativo */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">Cumplimiento Normativo</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma cumple con la normativa chilena e internacional respecto a la recopilación, uso y retención de información personal, incluyendo:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li><strong>Ley N° 19.628</strong> sobre Protección de la Vida Privada (Chile)</li>
                            <li><strong>Reglamento General de Protección de Datos (GDPR)</strong> de la Unión Europea</li>
                            <li><strong>Ley N° 20.575</strong> sobre Principio de Finalidad en el Tratamiento de Datos Personales</li>
                            <li><strong>Estándares ISO 27001</strong> y <strong>SOC 2</strong> para seguridad de la información</li>
                        </ul>
                    </section>

                    {/* Definiciones */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">Definiciones</h2>
                        <div className="space-y-4">
                            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                                <h3 className="text-xl font-bold text-gray-900 mb-2">Datos Personales</h3>
                                <p className="text-gray-700">
                                    Cualquier información relativa a una persona natural identificada o identificable. Se considera identificable toda persona cuya identidad pueda determinarse, directa o indirectamente, mediante un identificador (nombre, RUT, email, dirección IP, etc.).
                                </p>
                            </div>
                            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                                <h3 className="text-xl font-bold text-gray-900 mb-2">Datos Sensibles</h3>
                                <p className="text-gray-700">
                                    Aquellos datos personales que se refieren a las características físicas o morales de las personas o a hechos o circunstancias de su vida privada o intimidad, tales como hábitos personales, origen racial, ideologías y opiniones políticas, creencias o convicciones religiosas, estados de salud físicos o psíquicos.
                                </p>
                            </div>
                            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                                <h3 className="text-xl font-bold text-gray-900 mb-2">Responsable del Tratamiento</h3>
                                <p className="text-gray-700">
                                    Simbioma SpA, persona jurídica que determina los fines y medios del tratamiento de datos de carácter personal.
                                </p>
                            </div>
                            <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                                <h3 className="text-xl font-bold text-gray-900 mb-2">Encargado del Tratamiento</h3>
                                <p className="text-gray-700">
                                    Persona física o jurídica que realiza el tratamiento de datos por cuenta del responsable (ej: proveedores de infraestructura cloud).
                                </p>
                            </div>
                        </div>
                    </section>

                    {/* Consentimiento */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">1. Consentimiento del Usuario</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Al registrarse, acceder o utilizar la plataforma Simbioma, usted acepta los términos de esta Política de Privacidad y consiente expresamente el tratamiento de sus Datos Personales de acuerdo con esta política.
                        </p>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Sus datos personales pueden ser procesados en Chile o en otros países donde operan nuestros proveedores de servicios. Al utilizar nuestros servicios, usted consiente la transferencia internacional de sus datos bajo las garantías de seguridad establecidas en esta política.
                        </p>
                        <div className="bg-amarillo-sol/10 border-l-4 border-amarillo-sol p-6 rounded-r-lg">
                            <p className="text-gray-800 font-medium">
                                <strong>Importante:</strong> Usted puede retirar su consentimiento en cualquier momento contactando a nuestro Oficial de Privacidad. Sin embargo, esto puede limitar su capacidad de utilizar ciertos servicios de la plataforma.
                            </p>
                        </div>
                    </section>

                    {/* Menores de Edad */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">2. Menores de Edad</h2>
                        <p className="text-gray-700 leading-relaxed">
                            No recopilamos intencionalmente información personal de menores de 18 años de edad. Si usted es padre o tutor y cree que su hijo nos ha proporcionado datos personales, contáctenos inmediatamente para que podamos eliminar dicha información de nuestros sistemas.
                        </p>
                    </section>

                    {/* Tipos de Datos Recopilados */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">3. Tipos de Datos que Recopilamos</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.1. Datos Personales que Usted nos Proporciona</h3>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li><strong>Información de registro:</strong> Nombre completo, RUT, email corporativo, teléfono, cargo, organización</li>
                            <li><strong>Información de la organización:</strong> Razón social, RUT de la empresa, dirección, comuna, región, tipo de organización (municipio/empresa)</li>
                            <li><strong>Información de facturación:</strong> Datos de pago, dirección de facturación</li>
                            <li><strong>Datos ambientales:</strong> Indicadores de gestión territorial, consumos, emisiones, residuos, proyectos ambientales</li>
                            <li><strong>Comunicaciones:</strong> Mensajes, consultas, solicitudes de soporte</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.2. Datos Recopilados Automáticamente</h3>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li><strong>Datos de uso:</strong> Páginas visitadas, funciones utilizadas, tiempo de sesión, clics</li>
                            <li><strong>Datos técnicos:</strong> Dirección IP, tipo de navegador, sistema operativo, dispositivo, resolución de pantalla</li>
                            <li><strong>Datos de ubicación:</strong> Ubicación aproximada basada en dirección IP</li>
                            <li><strong>Cookies y tecnologías similares:</strong> Ver sección 7 para más detalles</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.3. Datos de Terceros</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Podemos recibir datos de fuentes públicas o de terceros autorizados:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li>Sistemas de gestión de residuos (ej: ReSimple)</li>
                            <li>Estaciones meteorológicas y sensores IoT</li>
                            <li>Bases de datos públicas (SINADER, RETC, SCAM)</li>
                            <li>Proveedores de autenticación (Google, Microsoft)</li>
                        </ul>
                    </section>

                    {/* Finalidad del Tratamiento */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">4. Finalidad del Tratamiento de Datos</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">4.1. Finalidades Primarias (Necesarias para el Servicio)</h3>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Proveer y mantener la plataforma SaaS</li>
                            <li>Crear y gestionar su cuenta de usuario</li>
                            <li>Procesar y almacenar datos ambientales y territoriales</li>
                            <li>Generar reportes automatizados (SINADER, GRI, CDP, SASB)</li>
                            <li>Facilitar la colaboración entre gobiernos locales y empresas</li>
                            <li>Procesar pagos y facturación</li>
                            <li>Proporcionar soporte técnico</li>
                            <li>Cumplir con obligaciones legales y regulatorias</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">4.2. Finalidades Secundarias (Mejora del Servicio)</h3>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li>Mejorar y personalizar la experiencia del usuario</li>
                            <li>Desarrollar nuevas funcionalidades</li>
                            <li>Realizar análisis estadísticos y de tendencias</li>
                            <li>Enviar comunicaciones sobre actualizaciones del servicio</li>
                            <li>Enviar contenido educativo y mejores prácticas (con su consentimiento)</li>
                            <li>Detectar y prevenir fraudes o uso indebido</li>
                        </ul>
                    </section>

                    {/* Derechos ARCO */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">5. Derechos de los Titulares (Derechos ARCO)</h2>
                        <p className="text-gray-700 leading-relaxed mb-6">
                            De acuerdo con la Ley N° 19.628 y el GDPR, usted tiene los siguientes derechos sobre sus datos personales:
                        </p>

                        <div className="grid md:grid-cols-2 gap-6">
                            <div className="bg-verde-bosque/5 p-6 rounded-lg border border-verde-bosque/20">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Acceso</h3>
                                <p className="text-gray-700">
                                    Solicitar una copia de los datos personales que tenemos sobre usted.
                                </p>
                            </div>
                            <div className="bg-azul-oceano/5 p-6 rounded-lg border border-azul-oceano/20">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Rectificación</h3>
                                <p className="text-gray-700">
                                    Corregir datos personales inexactos o incompletos.
                                </p>
                            </div>
                            <div className="bg-amarillo-sol/5 p-6 rounded-lg border border-amarillo-sol/20">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Cancelación</h3>
                                <p className="text-gray-700">
                                    Solicitar la eliminación de sus datos personales cuando ya no sean necesarios.
                                </p>
                            </div>
                            <div className="bg-gray-100 p-6 rounded-lg border border-gray-300">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Oposición</h3>
                                <p className="text-gray-700">
                                    Oponerse al tratamiento de sus datos para fines específicos.
                                </p>
                            </div>
                            <div className="bg-verde-bosque/5 p-6 rounded-lg border border-verde-bosque/20">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Portabilidad</h3>
                                <p className="text-gray-700">
                                    Recibir sus datos en un formato estructurado y de uso común.
                                </p>
                            </div>
                            <div className="bg-azul-oceano/5 p-6 rounded-lg border border-azul-oceano/20">
                                <h3 className="text-xl font-bold text-gray-900 mb-3">Derecho de Limitación</h3>
                                <p className="text-gray-700">
                                    Solicitar la limitación del tratamiento de sus datos en ciertos casos.
                                </p>
                            </div>
                        </div>

                        <div className="mt-8 bg-gray-50 p-6 rounded-lg border border-gray-200">
                            <h3 className="text-xl font-bold text-gray-900 mb-3">Cómo Ejercer sus Derechos</h3>
                            <p className="text-gray-700 mb-4">
                                Para ejercer cualquiera de estos derechos, puede:
                            </p>
                            <ul className="list-disc pl-6 space-y-2 text-gray-700">
                                <li>Enviar un correo a <a href="mailto:privacidad@simbioma.cl" className="text-verde-bosque hover:underline font-medium">privacidad@simbioma.cl</a></li>
                                <li>Acceder a la configuración de su cuenta en la plataforma</li>
                                <li>Enviar una carta certificada a: Av. Providencia 1234, Of. 601, Santiago, Chile</li>
                            </ul>
                            <p className="text-gray-700 mt-4">
                                <strong>Plazo de respuesta:</strong> Responderemos a su solicitud dentro de 15 días hábiles.
                            </p>
                        </div>
                    </section>

                    {/* Seguridad */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">6. Seguridad de Datos</h2>
                        <p className="text-gray-700 leading-relaxed mb-6">
                            Implementamos medidas de seguridad técnicas, organizativas y físicas para proteger sus datos personales contra acceso no autorizado, alteración, divulgación o destrucción:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li><strong>Encriptación:</strong> TLS 1.3 para datos en tránsito y AES-256 para datos en reposo</li>
                            <li><strong>Control de acceso:</strong> Autenticación multifactor (MFA) y control de acceso basado en roles (RBAC)</li>
                            <li><strong>Infraestructura:</strong> Servidores en AWS/Google Cloud con certificaciones ISO 27001 y SOC 2</li>
                            <li><strong>Monitoreo:</strong> Detección de amenazas 24/7 y logs de auditoría</li>
                            <li><strong>Backups:</strong> Copias de seguridad automáticas diarias con encriptación</li>
                            <li><strong>Capacitación:</strong> Personal capacitado en protección de datos y seguridad</li>
                            <li><strong>Auditorías:</strong> Auditorías de seguridad periódicas por terceros independientes</li>
                        </ul>
                    </section>

                    {/* Cookies */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">7. Cookies y Tecnologías de Rastreo</h2>
                        <p className="text-gray-700 leading-relaxed mb-6">
                            Utilizamos cookies y tecnologías similares para mejorar su experiencia en la plataforma:
                        </p>

                        <div className="space-y-4 mb-6">
                            <div className="border-l-4 border-verde-bosque pl-4">
                                <h3 className="text-lg font-bold text-gray-900 mb-2">Cookies Esenciales</h3>
                                <p className="text-gray-700">Necesarias para el funcionamiento básico de la plataforma (sesión, autenticación).</p>
                            </div>
                            <div className="border-l-4 border-azul-oceano pl-4">
                                <h3 className="text-lg font-bold text-gray-900 mb-2">Cookies de Rendimiento</h3>
                                <p className="text-gray-700">Recopilan información sobre cómo utiliza la plataforma para mejorar su funcionamiento.</p>
                            </div>
                            <div className="border-l-4 border-amarillo-sol pl-4">
                                <h3 className="text-lg font-bold text-gray-900 mb-2">Cookies de Funcionalidad</h3>
                                <p className="text-gray-700">Recuerdan sus preferencias y configuraciones personalizadas.</p>
                            </div>
                        </div>

                        <p className="text-gray-700 leading-relaxed">
                            Puede gestionar las cookies desde la configuración de su navegador. Sin embargo, desactivar ciertas cookies puede afectar la funcionalidad de la plataforma.
                        </p>
                    </section>

                    {/* Transferencias Internacionales */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">8. Transferencias Internacionales de Datos</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Sus datos pueden ser transferidos y almacenados en servidores ubicados fuera de Chile, específicamente en:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Estados Unidos (AWS, Google Cloud)</li>
                            <li>Unión Europea (centros de datos certificados)</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed">
                            Estas transferencias se realizan bajo garantías adecuadas, incluyendo Cláusulas Contractuales Estándar aprobadas por la Comisión Europea y certificaciones de privacidad reconocidas internacionalmente.
                        </p>
                    </section>

                    {/* Retención */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">9. Retención de Datos</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Conservamos sus datos personales durante el tiempo necesario para cumplir con las finalidades descritas en esta política:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li><strong>Datos de cuenta activa:</strong> Mientras su cuenta esté activa</li>
                            <li><strong>Datos de facturación:</strong> 10 años (requisito legal tributario)</li>
                            <li><strong>Datos de soporte:</strong> 3 años desde la última interacción</li>
                            <li><strong>Datos ambientales:</strong> Según acuerdo contractual o requisitos regulatorios</li>
                            <li><strong>Logs de auditoría:</strong> 2 años</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed mt-4">
                            Después de estos períodos, los datos serán eliminados de forma segura o anonimizados para fines estadísticos.
                        </p>
                    </section>

                    {/* Divulgación a Terceros */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">10. Divulgación a Terceros</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            No vendemos ni alquilamos sus datos personales. Podemos compartir sus datos con:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li><strong>Proveedores de servicios:</strong> AWS, Google Cloud, procesadores de pago (bajo acuerdos de confidencialidad)</li>
                            <li><strong>Autoridades gubernamentales:</strong> Cuando sea requerido por ley (SINADER, MMA, SMA)</li>
                            <li><strong>Organizaciones colaboradoras:</strong> Con su consentimiento explícito (ej: compartir datos con su municipio)</li>
                            <li><strong>Asesores profesionales:</strong> Abogados, auditores (bajo obligación de confidencialidad)</li>
                        </ul>
                    </section>

                    {/* Cambios a la Política */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">11. Cambios a esta Política de Privacidad</h2>
                        <p className="text-gray-700 leading-relaxed">
                            Nos reservamos el derecho de modificar esta Política de Privacidad en cualquier momento. Los cambios significativos serán notificados por correo electrónico y mediante un aviso destacado en la plataforma con al menos 30 días de anticipación. La versión actualizada entrará en vigor en la fecha indicada en la parte superior de este documento.
                        </p>
                    </section>

                    {/* Contacto */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">12. Contacto</h2>
                        <div className="bg-verde-bosque/5 p-8 rounded-xl border border-verde-bosque/20">
                            <h3 className="text-xl font-bold text-gray-900 mb-4">Oficial de Privacidad</h3>
                            <div className="space-y-2 text-gray-700">
                                <p><strong>Email:</strong> <a href="mailto:privacidad@simbioma.cl" className="text-verde-bosque hover:underline">privacidad@simbioma.cl</a></p>
                                <p><strong>Teléfono:</strong> +56 2 1234 5678</p>
                                <p><strong>Dirección:</strong> Av. Providencia 1234, Of. 601, Santiago, Chile</p>
                                <p><strong>Horario de atención:</strong> Lunes a Viernes, 9:00 - 18:00 hrs</p>
                            </div>
                        </div>
                    </section>

                    {/* Autoridad de Control */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">13. Autoridad de Control</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Si considera que el tratamiento de sus datos personales infringe la normativa vigente, tiene derecho a presentar una reclamación ante:
                        </p>
                        <div className="bg-gray-50 p-6 rounded-lg border border-gray-200">
                            <p className="text-gray-700 mb-2"><strong>Consejo para la Transparencia</strong></p>
                            <p className="text-gray-700">Sitio web: <a href="https://www.consejotransparencia.cl" target="_blank" rel="noopener noreferrer" className="text-verde-bosque hover:underline">www.consejotransparencia.cl</a></p>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    );
}
