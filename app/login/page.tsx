"use client";

import { useState, useEffect, Suspense } from 'react';
import { Eye, EyeOff, Moon, Sun } from 'lucide-react';
import { useTheme } from 'next-themes';
import { useSearchParams } from 'next/navigation';
import { Logo } from '@/components/brand/Logo';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { toast } from 'sonner';
import { login } from './actions';

function LoginForm() {
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
                className="fixed top-6 right-6 z-50 p-3 rounded-lg bg-background/80 backdrop-blur-sm hover:bg-muted transition-colors border border-border shadow-sm"
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
                <div className="relative z-10 flex flex-col justify-between h-full p-16 text-white">
                    <div>
                        <div className="bg-white/10 backdrop-blur-md p-4 rounded-xl w-fit mb-8 border border-white/20">
                            <Logo variant="white" size="lg" />
                        </div>
                        <h1 className="text-4xl mb-6 font-heading font-bold leading-tight">
                            Plataforma de Gestión<br />Ambiental Municipal
                        </h1>
                        <p className="text-lg opacity-90 max-w-md leading-relaxed">
                            Herramientas inteligentes para la sostenibilidad territorial y el cumplimiento normativo en gobiernos locales.
                        </p>
                    </div>
                    <div className="text-sm opacity-70">
                        © 2025 Simbioma. Todos los derechos reservados.
                    </div>
                </div>
            </div>

            {/* Lado Derecho - Formulario de Login */}
            <div className="w-full lg:w-1/2 flex items-center justify-center p-8 bg-background relative">
                {/* Botón Volver al Home */}
                <Button
                    variant="ghost"
                    className="absolute top-6 left-6 text-muted-foreground hover:text-foreground cursor-pointer"
                    onClick={() => window.location.href = '/'}
                >
                    ← Volver al inicio
                </Button>

                <div className="w-full max-w-md space-y-8">
                    {/* Logo en móvil */}
                    <div className="lg:hidden mb-8 flex justify-center">
                        <Logo size="md" />
                    </div>

                    <div className="text-center lg:text-left">
                        <h2 className="text-3xl mb-2 font-heading font-bold tracking-tight">
                            Bienvenido de nuevo
                        </h2>
                        <p className="text-muted-foreground">
                            Ingrese sus credenciales para acceder a su panel
                        </p>
                    </div>

                    <form onSubmit={handleSubmit} className="space-y-5">
                        <div className="space-y-2">
                            <Label htmlFor="email">Correo Electrónico</Label>
                            <Input
                                id="email"
                                name="email"
                                type="email"
                                placeholder="nombre@municipalidad.cl"
                                disabled={isLoading}
                                className="h-12 bg-background"
                                required
                            />
                        </div>

                        <div className="space-y-2">
                            <div className="flex justify-between items-center">
                                <Label htmlFor="password">Contraseña</Label>
                                <button
                                    type="button"
                                    className="text-xs text-primary hover:underline font-medium"
                                    onClick={() => toast.info('Funcionalidad de recuperación de contraseña próximamente')}
                                >
                                    ¿Olvidó su contraseña?
                                </button>
                            </div>
                            <div className="relative">
                                <Input
                                    id="password"
                                    name="password"
                                    type={showPassword ? 'text' : 'password'}
                                    placeholder="••••••••"
                                    disabled={isLoading}
                                    className="h-12 pr-12 bg-background"
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
                            className="w-full h-12 bg-[#2D9D78] hover:bg-[#258566] text-white shadow-lg text-base font-bold transition-all hover:scale-[1.01]"
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
                    </form>

                    <div className="space-y-4 pt-2">
                        <div className="relative flex items-center justify-center mt-4 mb-2">
                            <span className="text-xs uppercase text-muted-foreground">¿Aún no tienes cuenta?</span>
                        </div>

                        <Button
                            variant="outline"
                            className="w-full h-12 border-2 border-[#2D9D78] text-[#2D9D78] hover:bg-[#2D9D78]/10 font-bold"
                            onClick={() => window.location.href = '/demo'}
                        >
                            Solicitar Demo
                        </Button>
                    </div>

                    <div className="pt-6 text-center text-xs text-muted-foreground leading-relaxed">
                        Al iniciar sesión, acepta los <a href="/terminos" target="_blank" rel="noopener noreferrer" className="underline hover:text-primary transition-colors">Términos de Servicio</a> y la <a href="/privacidad" target="_blank" rel="noopener noreferrer" className="underline hover:text-primary transition-colors">Política de Privacidad</a> de Simbioma.
                    </div>
                </div>
            </div>
        </div>
    );
}

export default function LoginPage() {
    return (
        <Suspense fallback={
            <div className="min-h-screen flex items-center justify-center bg-background">
                <div className="w-8 h-8 border-4 border-primary border-t-transparent rounded-full animate-spin" />
            </div>
        }>
            <LoginForm />
        </Suspense>
    );
}
