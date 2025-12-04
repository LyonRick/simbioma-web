import { useState } from 'react';
import { Eye, EyeOff, Moon, Sun } from 'lucide-react';
import { Logo } from '../brand/Logo';
import { Button } from '../ui/button';
import { Input } from '../ui/input';
import { Label } from '../ui/label';

interface LoginPageProps {
  onLogin: () => void;
  isDark: boolean;
  onToggleTheme: () => void;
}

export function LoginPage({ onLogin, isDark, onToggleTheme }: LoginPageProps) {
  const [showPassword, setShowPassword] = useState(false);
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');
    setIsLoading(true);

    // Simulación de validación
    setTimeout(() => {
      if (email && password) {
        onLogin();
      } else {
        setError('Por favor, complete todos los campos');
        setIsLoading(false);
      }
    }, 1000);
  };

  return (
    <div className="min-h-screen flex">
      {/* Theme Toggle - Fixed en esquina superior derecha */}
      <button
        onClick={onToggleTheme}
        className="fixed top-6 right-6 z-50 p-3 rounded-lg bg-card hover:bg-muted transition-colors border border-border"
        aria-label="Cambiar tema"
      >
        {isDark ? (
          <Sun className="w-5 h-5 text-foreground" />
        ) : (
          <Moon className="w-5 h-5 text-foreground" />
        )}
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
          <h1 className="text-4xl mb-4">
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
            <h2 className="text-3xl mb-2">
              Iniciar Sesión
            </h2>
            <p className="text-muted-foreground">
              Ingrese sus credenciales para acceder a la plataforma
            </p>
          </div>

          <form onSubmit={handleSubmit} className="space-y-6">
            {error && (
              <div className="p-4 rounded-lg bg-destructive/10 border border-destructive text-destructive">
                <p className="text-sm">{error}</p>
              </div>
            )}

            <div className="space-y-2">
              <Label htmlFor="email">Correo Electrónico</Label>
              <Input
                id="email"
                type="email"
                placeholder="usuario@municipalidad.cl"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                disabled={isLoading}
                className="h-12"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="password">Contraseña</Label>
              <div className="relative">
                <Input
                  id="password"
                  type={showPassword ? 'text' : 'password'}
                  placeholder="••••••••"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  disabled={isLoading}
                  className="h-12 pr-12"
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
              className="w-full h-12 bg-[#2D9D78] hover:bg-[#2D9D78]/90 text-white"
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
                className="text-sm text-[#2D9D78] hover:underline"
                onClick={() => alert('Funcionalidad de recuperación de contraseña')}
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
