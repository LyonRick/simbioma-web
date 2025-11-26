export default function TerminosPage() {
    return (
        <div className="min-h-screen bg-white">
            <div className="container mx-auto px-4 py-24 max-w-5xl">
                <h1 className="text-4xl md:text-5xl font-bold text-gray-900 mb-4">Términos y Condiciones</h1>
                <p className="text-gray-500 mb-12">Última actualización: {new Date().toLocaleDateString('es-CL', { year: 'numeric', month: 'long', day: 'numeric' })}</p>

                <div className="prose prose-lg max-w-none">
                    {/* Introducción */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">1. Aceptación de los Términos</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Bienvenido a Simbioma. Estos Términos y Condiciones (en adelante, los &quot;Términos&quot;) constituyen un acuerdo legal vinculante entre usted (en adelante, el &quot;Usuario&quot;, &quot;usted&quot; o &quot;su&quot;) y Simbioma SpA (en adelante, &quot;Simbioma&quot;, &quot;nosotros&quot;, &quot;nuestro&quot; o &quot;nuestra&quot;), con domicilio en Av. Providencia 1234, Of. 601, Santiago, Chile, RUT 77.123.456-7.
                        </p>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Al acceder, registrarse o utilizar la plataforma Simbioma (el &quot;Servicio&quot;), usted acepta estar legalmente vinculado por estos Términos, nuestra Política de Privacidad y cualquier política adicional referenciada en este documento.
                        </p>
                        <div className="bg-amarillo-sol/10 border-l-4 border-amarillo-sol p-6 rounded-r-lg">
                            <p className="text-gray-800 font-medium">
                                <strong>Importante:</strong> Si no está de acuerdo con alguno de estos términos, no debe acceder ni utilizar el Servicio.
                            </p>
                        </div>
                    </section>

                    {/* Descripción del Servicio */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">2. Descripción del Servicio</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma es una plataforma SaaS (Software as a Service) de inteligencia territorial y corporativa diseñada para:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Consolidar datos ambientales y de gestión territorial de múltiples fuentes</li>
                            <li>Generar reportes automatizados de cumplimiento normativo (SINADER, GRI, CDP, SASB)</li>
                            <li>Facilitar la colaboración entre gobiernos locales y empresas privadas</li>
                            <li>Visualizar indicadores de sustentabilidad y regeneración ecosistémica</li>
                            <li>Gestionar proyectos ambientales y territoriales</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed">
                            El Servicio se proporciona &quot;tal cual&quot; y &quot;según disponibilidad&quot;. Simbioma se reserva el derecho de modificar, suspender o descontinuar cualquier aspecto del Servicio en cualquier momento, con o sin previo aviso.
                        </p>
                    </section>

                    {/* Registro y Cuentas */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">3. Registro y Cuentas de Usuario</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.1. Elegibilidad</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Para utilizar el Servicio, usted debe:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Ser mayor de 18 años</li>
                            <li>Tener capacidad legal para celebrar contratos vinculantes</li>
                            <li>Representar a una organización legalmente constituida (municipio, gobierno regional o empresa privada)</li>
                            <li>Proporcionar información veraz, precisa y completa durante el registro</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.2. Responsabilidad de la Cuenta</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Usted es responsable de:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Mantener la confidencialidad de sus credenciales de acceso</li>
                            <li>Todas las actividades realizadas bajo su cuenta</li>
                            <li>Notificar inmediatamente a Simbioma sobre cualquier uso no autorizado de su cuenta</li>
                            <li>Asegurar que la información de su cuenta esté actualizada</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">3.3. Cuentas Organizacionales</h3>
                        <p className="text-gray-700 leading-relaxed">
                            Las cuentas son organizacionales, no personales. La organización que usted representa es el titular de la cuenta y es responsable de todas las acciones realizadas por sus usuarios autorizados.
                        </p>
                    </section>

                    {/* Obligaciones del Usuario */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">4. Obligaciones del Usuario</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Al utilizar el Servicio, usted se compromete a:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Cumplir con todas las leyes y regulaciones aplicables</li>
                            <li>No utilizar el Servicio para fines ilegales o no autorizados</li>
                            <li>No intentar acceder a áreas restringidas del sistema</li>
                            <li>No realizar ingeniería inversa, descompilar o desensamblar el software</li>
                            <li>No transmitir virus, malware o código malicioso</li>
                            <li>No sobrecargar intencionalmente la infraestructura del Servicio</li>
                            <li>No revender o redistribuir el Servicio sin autorización expresa</li>
                            <li>Proporcionar datos precisos y actualizados</li>
                        </ul>
                    </section>

                    {/* Propiedad Intelectual */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">5. Propiedad Intelectual</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">5.1. Propiedad de Simbioma</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Todos los derechos de propiedad intelectual sobre el Servicio, incluyendo pero no limitado a:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Software, código fuente y algoritmos</li>
                            <li>Diseño, interfaz de usuario y experiencia de usuario</li>
                            <li>Marca &quot;Simbioma&quot;, logotipos y elementos visuales</li>
                            <li>Documentación, tutoriales y materiales de capacitación</li>
                            <li>Bases de datos y estructuras de datos</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed">
                            Son propiedad exclusiva de Simbioma SpA y están protegidos por las leyes de propiedad intelectual de Chile y tratados internacionales.
                        </p>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">5.2. Propiedad de sus Datos</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Usted conserva todos los derechos de propiedad sobre los datos que carga en la plataforma, incluyendo:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Datos ambientales y territoriales</li>
                            <li>Indicadores de gestión</li>
                            <li>Reportes generados</li>
                            <li>Documentos y archivos adjuntos</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed">
                            Al cargar datos en la plataforma, usted otorga a Simbioma una licencia limitada, no exclusiva y revocable para procesar, almacenar y utilizar dichos datos exclusivamente para proveer el Servicio.
                        </p>
                    </section>

                    {/* Licencia de Uso */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">6. Licencia de Uso</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Sujeto al cumplimiento de estos Términos y al pago de las tarifas aplicables, Simbioma le otorga una licencia limitada, no exclusiva, no transferible y revocable para:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Acceder y utilizar el Servicio para los fines comerciales de su organización</li>
                            <li>Permitir que sus empleados y colaboradores autorizados accedan al Servicio</li>
                            <li>Descargar y utilizar los reportes generados por la plataforma</li>
                        </ul>
                        <p className="text-gray-700 leading-relaxed">
                            Esta licencia no incluye el derecho a: (a) sublicenciar, vender o revender el Servicio; (b) copiar, modificar o crear obras derivadas; (c) realizar ingeniería inversa; o (d) utilizar el Servicio para desarrollar productos competidores.
                        </p>
                    </section>

                    {/* Planes y Facturación */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">7. Planes, Facturación y Pagos</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">7.1. Planes de Suscripción</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma ofrece diferentes planes de suscripción con características y precios variables. Los detalles de cada plan están disponibles en nuestra página de precios.
                        </p>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">7.2. Facturación</h3>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Las suscripciones se facturan mensual o anualmente según el plan seleccionado</li>
                            <li>Los pagos se procesan automáticamente al inicio de cada período de facturación</li>
                            <li>Todos los precios están expresados en pesos chilenos (CLP) e incluyen IVA</li>
                            <li>Las facturas se envían por correo electrónico</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">7.3. Renovación Automática</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Las suscripciones se renuevan automáticamente al final de cada período de facturación, a menos que usted cancele su suscripción antes de la fecha de renovación.
                        </p>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">7.4. Cambios de Precio</h3>
                        <p className="text-gray-700 leading-relaxed">
                            Simbioma se reserva el derecho de modificar los precios con un aviso previo de 30 días. Los cambios de precio no afectarán el período de facturación actual.
                        </p>
                    </section>

                    {/* Política de Reembolsos */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">8. Política de Reembolsos</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Ofrecemos una garantía de satisfacción de 30 días para nuevos clientes:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Si cancela dentro de los primeros 30 días, recibirá un reembolso completo</li>
                            <li>Después de 30 días, no se realizan reembolsos por períodos de facturación ya iniciados</li>
                            <li>Los reembolsos se procesan dentro de 10 días hábiles</li>
                        </ul>
                        <div className="bg-azul-oceano/10 border-l-4 border-azul-oceano p-6 rounded-r-lg">
                            <p className="text-gray-800">
                                <strong>Nota:</strong> Los servicios personalizados, integraciones a medida y capacitaciones no son reembolsables.
                            </p>
                        </div>
                    </section>

                    {/* Suspensión y Terminación */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">9. Suspensión y Terminación</h2>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">9.1. Terminación por el Usuario</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Usted puede cancelar su suscripción en cualquier momento desde la configuración de su cuenta. La cancelación será efectiva al final del período de facturación actual.
                        </p>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">9.2. Suspensión por Simbioma</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma puede suspender o terminar su acceso al Servicio inmediatamente, sin previo aviso, si:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Incumple estos Términos</li>
                            <li>No paga las tarifas adeudadas dentro de 15 días de vencimiento</li>
                            <li>Utiliza el Servicio de manera fraudulenta o ilegal</li>
                            <li>Pone en riesgo la seguridad o integridad de la plataforma</li>
                        </ul>

                        <h3 className="text-2xl font-bold text-gray-900 mb-4 mt-8">9.3. Efectos de la Terminación</h3>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Al terminar su cuenta:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li>Perderá acceso inmediato al Servicio</li>
                            <li>Sus datos serán retenidos por 90 días para permitir exportación</li>
                            <li>Después de 90 días, sus datos serán eliminados permanentemente</li>
                            <li>Puede solicitar una exportación de sus datos antes de la eliminación</li>
                        </ul>
                    </section>

                    {/* Limitación de Responsabilidad */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">10. Limitación de Responsabilidad</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            En la máxima medida permitida por la ley:
                        </p>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700 mb-6">
                            <li>Simbioma no será responsable por daños indirectos, incidentales, especiales, consecuentes o punitivos</li>
                            <li>Nuestra responsabilidad total no excederá el monto pagado por usted en los últimos 12 meses</li>
                            <li>No garantizamos que el Servicio será ininterrumpido, seguro o libre de errores</li>
                            <li>No somos responsables por la precisión de los datos que usted carga en la plataforma</li>
                            <li>No somos responsables por decisiones tomadas basándose en los reportes generados</li>
                        </ul>
                        <div className="bg-red-50 border-l-4 border-red-500 p-6 rounded-r-lg">
                            <p className="text-gray-800 font-medium">
                                <strong>Importante:</strong> Los reportes generados por Simbioma son herramientas de apoyo. La responsabilidad final sobre el cumplimiento normativo recae en su organización.
                            </p>
                        </div>
                    </section>

                    {/* Indemnización */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">11. Indemnización</h2>
                        <p className="text-gray-700 leading-relaxed">
                            Usted acepta indemnizar, defender y mantener indemne a Simbioma, sus directores, empleados, agentes y afiliados de cualquier reclamo, demanda, pérdida, responsabilidad, costo o gasto (incluyendo honorarios legales razonables) que surjan de: (a) su uso del Servicio; (b) violación de estos Términos; (c) violación de derechos de terceros; o (d) datos que usted cargue en la plataforma.
                        </p>
                    </section>

                    {/* Ley Aplicable */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">12. Ley Aplicable y Jurisdicción</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Estos Términos se regirán e interpretarán de acuerdo con las leyes de la República de Chile, sin dar efecto a ningún principio de conflictos de leyes.
                        </p>
                        <p className="text-gray-700 leading-relaxed">
                            Cualquier disputa que surja de o en relación con estos Términos será sometida a la jurisdicción exclusiva de los tribunales ordinarios de justicia de Santiago, Chile.
                        </p>
                    </section>

                    {/* Modificaciones */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">13. Modificaciones a los Términos</h2>
                        <p className="text-gray-700 leading-relaxed mb-4">
                            Simbioma se reserva el derecho de modificar estos Términos en cualquier momento. Los cambios significativos serán notificados por correo electrónico con al menos 30 días de anticipación.
                        </p>
                        <p className="text-gray-700 leading-relaxed">
                            El uso continuado del Servicio después de la entrada en vigor de los cambios constituye su aceptación de los nuevos Términos.
                        </p>
                    </section>

                    {/* Disposiciones Generales */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">14. Disposiciones Generales</h2>
                        <ul className="list-disc pl-6 space-y-2 text-gray-700">
                            <li><strong>Acuerdo Completo:</strong> Estos Términos constituyen el acuerdo completo entre usted y Simbioma</li>
                            <li><strong>Divisibilidad:</strong> Si alguna disposición es inválida, las demás permanecerán en vigor</li>
                            <li><strong>Renuncia:</strong> La falta de ejercicio de un derecho no constituye renuncia al mismo</li>
                            <li><strong>Cesión:</strong> Usted no puede ceder estos Términos sin nuestro consentimiento previo por escrito</li>
                            <li><strong>Fuerza Mayor:</strong> No seremos responsables por incumplimientos debido a causas fuera de nuestro control</li>
                        </ul>
                    </section>

                    {/* Contacto */}
                    <section className="mb-12">
                        <h2 className="text-3xl font-bold text-gray-900 mb-6">15. Contacto</h2>
                        <div className="bg-verde-bosque/5 p-8 rounded-xl border border-verde-bosque/20">
                            <p className="text-gray-700 mb-4">
                                Si tiene preguntas sobre estos Términos y Condiciones, puede contactarnos en:
                            </p>
                            <div className="space-y-2 text-gray-700">
                                <p><strong>Email:</strong> <a href="mailto:legal@simbioma.cl" className="text-verde-bosque hover:underline">legal@simbioma.cl</a></p>
                                <p><strong>Teléfono:</strong> +56 2 1234 5678</p>
                                <p><strong>Dirección:</strong> Av. Providencia 1234, Of. 601, Santiago, Chile</p>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    );
}
