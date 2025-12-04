"use client";

import { useState, useEffect } from 'react';
import { Eye, EyeOff, Moon, Sun } from 'lucide-react';
import { useTheme } from 'next-themes';
import { useSearchParams } from 'next/navigation';
import { Logo } from '@/components/brand/Logo';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { toast } from 'sonner';
import { login } from './actions';

export default function LoginPage() {
    const { theme, setTheme } = useTheme();
    const searchParams = useSearchParams();
    const [showPassword, setShowPassword] = useState(false);
    const [isLoading, setIsLoading] = useState(false);

    // Read errors and messages from URL
    const error = searchParams.get('error');
    const message = searchParams.get('message');

    useEffect(() => {
        if (error) {
            toast.error(error);
        }
        if (message) {
            toast.success(message);
        }
    }, [error, message]);

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        setIsLoading(true);

        const formData = new FormData(e.currentTarget);

        try {
            await login(formData);
        } catch (err) {
            // Error is handled in server action via redirect
            console.error('Login failed:', err);
        } finally {
            setIsLoading(false);
        }
    };

    const toggleTheme = () => {
        setTheme(theme === 'dark' ? 'light' : 'dark');
    };

    return (
        <div className="min-h-screen flex">
            {/* Theme Toggle - Fixed en esquina superior derecha */}
            <button
                onClick={toggleTheme}
                className="fixed top-6 right-6 z-50 p-3 rounded-lg bg-card hover:bg-muted transition-colors border border-border"
                aria-label="Cambiar tema"
            >
                <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
                <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100 top-3 left-3" />
            </button>

            {/* Lado Izquierdo - Imagen Inspiradora */}
            <div className="hidden lg:flex lg:w-1/2 relative overflow-hidden bg-[#2D9D78]">
                <img
                    src="https://images.unsplash.com/photo-1740624895505-56a3dbda32ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w3Nzg4Nzd8MHwxfHNlYXJjaHwxfHxjaGlsZSUyMGxhbmRzY2FwZSUyMG1vdW50YWlucyUyMG5hdHVyZXxlbnwxfHx8fDE3NjQyMTYyOTd8MA&ixlib=rb-4.1.0&q=80&w=1080"
                    alt="Paisaje natural de Chile"
                    className="absolute inset-0 w-full h-full object-cover opacity-80"
                />
                <div className="absolute inset-0 bg-gradient-to-br from-[#2D9D78]/90 to-[#1E5F8C]/90" />

                {/* Contenido sobre la imagen */}
                <div className="relative z-10 flex flex-col justify-center px-16 text-white">
                    <div className="mb-8">
                        <Logo variant="white" size="lg" />
                    </div>
                    <h1 className="text-4xl mb-4 font-heading font-semibold">
                        Plataforma de Gestión Ambiental Municipal
                    </h1>
                    <p className="text-lg opacity-90 max-w-md">
                        Herramientas inteligentes para la sostenibilidad territorial y el cumplimiento normativo en gobiernos locales.
                    </p>
                </div>
            </div>

            {/* Lado Derecho - Formulario de Login */}
            <div className="w-full lg:w-1/2 flex items-center justify-center p-8 bg-background">
                <div className="w-full max-w-md space-y-8">
                    {/* Logo en móvil */}
                    <div className="lg:hidden mb-8">
                        <Logo size="md" />
                    </div>

                    <div>
                        <h2 className="text-3xl mb-2 font-heading font-semibold">
                            Iniciar Sesión
                        </h2>
                        <p className="text-muted-foreground">
                            Ingrese sus credenciales para acceder a la plataforma
                        </p>
                    </div>

                    <form onSubmit={handleSubmit} className="space-y-6">
                        <div className="space-y-2">
                            <Label htmlFor="email">Correo Electrónico</Label>
                            <Input
                                id="email"
                                name="email"
                                type="email"
                                placeholder="usuario@municipalidad.cl"
                                disabled={isLoading}
                                className="h-12"
                                required
                            />
                        </div>

                        <div className="space-y-2">
                            <Label htmlFor="password">Contraseña</Label>
                            <div className="relative">
                                <Input
                                    id="password"
                                    name="password"
                                    type={showPassword ? 'text' : 'password'}
                                    placeholder="••••••••"
                                    disabled={isLoading}
                                    className="h-12 pr-12"
                                    required
                                />
                                <button
                                    type="button"
                                    onClick={() => setShowPassword(!showPassword)}
                                    className="absolute right-3 top-1/2 -translate-y-1/2 text-muted-foreground hover:text-foreground transition-colors"
                                    aria-label={showPassword ? 'Ocultar contraseña' : 'Mostrar contraseña'}
                                >
                                    {showPassword ? (
                                        <EyeOff className="w-5 h-5" />
                                    ) : (
                                        <Eye className="w-5 h-5" />
                                    )}
                                </button>
                            </div>
                        </div>

                        <Button
                            type="submit"
                            className="w-full h-12 bg-primary hover:bg-primary/90 text-primary-foreground"
                            disabled={isLoading}
                        >
                            {isLoading ? (
                                <span className="flex items-center gap-2">
                                    <span className="w-4 h-4 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                                    Ingresando...
                                </span>
                            ) : (
                                'Iniciar Sesión'
                            )}
                        </Button>

                        <div className="text-center">
                            <button
                                type="button"
                                className="text-sm text-primary hover:underline"
                                onClick={() => toast.info('Funcionalidad de recuperación de contraseña próximamente')}
                            >
                                ¿Olvidó su contraseña?
                            </button>
                        </div>
                    </form>

                    <div className="pt-6 border-t border-border">
                        <p className="text-xs text-muted-foreground text-center">
                            Al iniciar sesión, acepta los Términos de Servicio y la Política de Privacidad de Simbioma.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
}
