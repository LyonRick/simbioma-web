import Link from "next/link";
import { Home, Search, FileQuestion, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/Button";

export default function NotFound() {
    return (
        <div className="min-h-screen bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center px-4">
            <div className="max-w-2xl w-full text-center">
                {/* 404 Illustration */}
                <div className="mb-8">
                    <div className="relative inline-block">
                        <div className="text-[180px] md:text-[240px] font-bold text-gray-200 leading-none select-none">
                            404
                        </div>
                        <div className="absolute inset-0 flex items-center justify-center">
                            <FileQuestion className="w-24 h-24 md:w-32 md:h-32 text-verde-bosque opacity-80" />
                        </div>
                    </div>
                </div>

                {/* Message */}
                <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                    Página no encontrada
                </h1>
                <p className="text-lg text-gray-600 mb-8 max-w-md mx-auto">
                    Lo sentimos, la página que buscas no existe o fue movida a otra ubicación.
                </p>

                {/* Primary Action */}
                <div className="flex flex-col sm:flex-row gap-4 justify-center mb-12">
                    <Link href="/">
                        <Button variant="premium" size="lg" className="w-full sm:w-auto">
                            <Home className="mr-2 w-5 h-5" />
                            Volver al Inicio
                        </Button>
                    </Link>
                </div>

                {/* Quick Links */}
                <div className="bg-white rounded-2xl p-8 shadow-lg border border-gray-200">
                    <div className="flex items-center justify-center gap-2 mb-6">
                        <Search className="w-5 h-5 text-gray-400" />
                        <h2 className="text-xl font-bold text-gray-900">Páginas Populares</h2>
                    </div>
                    <div className="grid md:grid-cols-2 gap-4">
                        <Link
                            href="/blog"
                            className="group p-4 rounded-lg border border-gray-200 hover:border-verde-bosque hover:bg-verde-bosque/5 transition-all text-left"
                        >
                            <div className="flex items-center justify-between">
                                <div>
                                    <h3 className="font-semibold text-gray-900 group-hover:text-verde-bosque transition-colors">
                                        Blog
                                    </h3>
                                    <p className="text-sm text-gray-500">Noticias y tendencias</p>
                                </div>
                                <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-verde-bosque transition-colors" />
                            </div>
                        </Link>

                        <Link
                            href="/privacidad"
                            className="group p-4 rounded-lg border border-gray-200 hover:border-verde-bosque hover:bg-verde-bosque/5 transition-all text-left"
                        >
                            <div className="flex items-center justify-between">
                                <div>
                                    <h3 className="font-semibold text-gray-900 group-hover:text-verde-bosque transition-colors">
                                        Privacidad
                                    </h3>
                                    <p className="text-sm text-gray-500">Política de privacidad</p>
                                </div>
                                <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-verde-bosque transition-colors" />
                            </div>
                        </Link>

                        <Link
                            href="/terminos"
                            className="group p-4 rounded-lg border border-gray-200 hover:border-verde-bosque hover:bg-verde-bosque/5 transition-all text-left"
                        >
                            <div className="flex items-center justify-between">
                                <div>
                                    <h3 className="font-semibold text-gray-900 group-hover:text-verde-bosque transition-colors">
                                        Términos
                                    </h3>
                                    <p className="text-sm text-gray-500">Términos y condiciones</p>
                                </div>
                                <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-verde-bosque transition-colors" />
                            </div>
                        </Link>

                        <Link
                            href="/seguridad"
                            className="group p-4 rounded-lg border border-gray-200 hover:border-verde-bosque hover:bg-verde-bosque/5 transition-all text-left"
                        >
                            <div className="flex items-center justify-between">
                                <div>
                                    <h3 className="font-semibold text-gray-900 group-hover:text-verde-bosque transition-colors">
                                        Seguridad
                                    </h3>
                                    <p className="text-sm text-gray-500">Prácticas de seguridad</p>
                                </div>
                                <ArrowRight className="w-5 h-5 text-gray-400 group-hover:text-verde-bosque transition-colors" />
                            </div>
                        </Link>
                    </div>
                </div>

                {/* Help Text */}
                <p className="text-sm text-gray-500 mt-8">
                    ¿Necesitas ayuda? Contáctanos en{" "}
                    <a href="mailto:contacto@simbioma.cl" className="text-verde-bosque hover:underline font-medium">
                        contacto@simbioma.cl
                    </a>
                </p>
            </div>
        </div>
    );
}
