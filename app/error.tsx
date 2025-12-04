"use client";

import { useEffect } from "react";
import { Button } from "@/components/ui/button";
import { AlertTriangle, RefreshCw, Home } from "lucide-react";
import Link from "next/link";

export default function Error({
    error,
    reset,
}: {
    error: Error & { digest?: string };
    reset: () => void;
}) {
    useEffect(() => {
        // Log the error to an error reporting service
        console.error("Error boundary caught:", error);
    }, [error]);

    return (
        <div className="min-h-screen bg-gray-50 flex items-center justify-center px-4">
            <div className="max-w-2xl w-full bg-white rounded-2xl shadow-xl p-8 md:p-12 text-center">
                <div className="w-20 h-20 bg-red-100 rounded-full flex items-center justify-center mx-auto mb-6">
                    <AlertTriangle className="w-10 h-10 text-red-600" />
                </div>

                <h1 className="text-3xl md:text-4xl font-bold text-gray-900 mb-4">
                    Algo salió mal
                </h1>

                <p className="text-lg text-gray-600 mb-8 max-w-md mx-auto">
                    Hemos encontrado un error inesperado. Nuestro equipo ha sido notificado y estamos trabajando en solucionarlo.
                </p>

                {process.env.NODE_ENV === "development" && error.message && (
                    <div className="bg-red-50 border border-red-200 rounded-lg p-4 mb-8 text-left">
                        <p className="text-sm font-mono text-red-800 break-words">
                            {error.message}
                        </p>
                        {error.digest && (
                            <p className="text-xs text-red-600 mt-2">
                                Error ID: {error.digest}
                            </p>
                        )}
                    </div>
                )}

                <div className="flex flex-col sm:flex-row gap-4 justify-center">
                    <Button
                        onClick={reset}
                        variant="default"
                        size="lg"
                        className="bg-verde-bosque hover:bg-verde-bosque-dark text-white"
                    >
                        <RefreshCw className="mr-2 w-5 h-5" />
                        Intentar nuevamente
                    </Button>

                    <Link href="/">
                        <Button variant="outline" size="lg" className="border-2">
                            <Home className="mr-2 w-5 h-5" />
                            Volver al inicio
                        </Button>
                    </Link>
                </div>

                <p className="text-sm text-gray-500 mt-8">
                    Si el problema persiste, contáctanos en{" "}
                    <a
                        href="mailto:soporte@simbioma.cl"
                        className="text-verde-bosque hover:underline font-medium"
                    >
                        soporte@simbioma.cl
                    </a>
                </p>
            </div>
        </div>
    );
}
