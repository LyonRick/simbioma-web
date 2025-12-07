"use client";

import { Bell, Moon, Sun, User, ChevronRight, Menu, Settings } from 'lucide-react';
import { useTheme } from 'next-themes';
import { usePathname } from 'next/navigation';
import { cn } from '@/lib/utils';
import { Avatar, AvatarFallback } from '@/components/ui/avatar';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import {
  Popover,
  PopoverContent,
  PopoverTrigger,
} from '@/components/ui/popover';
import { useRouter } from 'next/navigation';
import {
  Breadcrumb,
  BreadcrumbItem,
  BreadcrumbLink,
  BreadcrumbList,
  BreadcrumbPage,
  BreadcrumbSeparator,
} from '@/components/ui/breadcrumb';

interface UserProfile {
  id: string;
  email: string;
  full_name: string;
  role: string;
}

interface DashboardHeaderProps {
  sidebarCollapsed: boolean;
  onToggleSidebar: () => void;
  onLogout: () => void;
  userProfile: UserProfile | null;
}

export function DashboardHeader({
  sidebarCollapsed,
  onToggleSidebar,
  onLogout,
  userProfile,
}: DashboardHeaderProps) {
  const { theme, setTheme } = useTheme();
  const pathname = usePathname();
  const router = useRouter();

  // Get user initials
  const getInitials = (name: string) => {
    return name
      .split(' ')
      .map(n => n[0])
      .join('')
      .toUpperCase()
      .slice(0, 2);
  };

  // Format role for display
  const getRoleLabel = (role: string) => {
    const roleLabels: Record<string, string> = {
      superadmin: 'Superadmin',
      admin: 'Administrador',
      editor: 'Editor',
      viewer: 'Visualizador',
      member: 'Miembro',
    };
    return roleLabels[role] || role;
  };

  // Generate breadcrumbs from pathname
  const generateBreadcrumbs = () => {
    const paths = pathname.split('/').filter(Boolean);
    const breadcrumbs = paths.map((path, index) => {
      const href = `/${paths.slice(0, index + 1).join('/')}`;
      const label = path.charAt(0).toUpperCase() + path.slice(1);
      return { label, href };
    });
    return breadcrumbs;
  };

  const breadcrumbs = generateBreadcrumbs();

  const toggleTheme = () => {
    setTheme(theme === 'dark' ? 'light' : 'dark');
  };

  return (
    <header
      className={cn(
        'fixed top-0 right-0 h-16 bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60 border-b border-border z-30 transition-all duration-300 flex items-center justify-between px-6',
        sidebarCollapsed ? 'left-[80px]' : 'left-[280px]'
      )}
    >
      {/* Izquierda - Toggle & Breadcrumbs */}
      <div className="flex items-center gap-4">
        <button
          onClick={onToggleSidebar}
          className="lg:hidden p-2 hover:bg-muted rounded-lg transition-colors"
          aria-label="Toggle sidebar"
        >
          <Menu className="w-5 h-5" />
        </button>

        <Breadcrumb>
          <BreadcrumbList>
            {breadcrumbs.map((crumb, index) => (
              <div key={index} className="flex items-center">
                {index > 0 && (
                  <BreadcrumbSeparator>
                    <ChevronRight className="w-4 h-4" />
                  </BreadcrumbSeparator>
                )}
                <BreadcrumbItem>
                  {index === breadcrumbs.length - 1 ? (
                    <BreadcrumbPage>{crumb.label}</BreadcrumbPage>
                  ) : (
                    <BreadcrumbLink href={crumb.href}>
                      {crumb.label}
                    </BreadcrumbLink>
                  )}
                </BreadcrumbItem>
              </div>
            ))}
          </BreadcrumbList>
        </Breadcrumb>
      </div>

      {/* Derecha - Notificaciones, Theme Toggle, User Menu */}
      <div className="flex items-center gap-3">
        {/* Notificaciones */}
        <Popover>
          <PopoverTrigger asChild>
            <button
              className="relative p-2 hover:bg-muted rounded-lg transition-colors cursor-pointer"
              aria-label="Notificaciones"
            >
              <Bell className="w-5 h-5 text-foreground" />
              <span className="absolute top-1.5 right-1.5 w-2 h-2 bg-destructive rounded-full ring-2 ring-card" />
            </button>
          </PopoverTrigger>
          <PopoverContent className="w-80 p-0 bg-white text-popover-foreground border border-border shadow-lg z-50" align="end">
            <div className="p-4 border-b border-border">
              <h4 className="font-semibold leading-none">Notificaciones</h4>
              <p className="text-xs text-muted-foreground mt-1">Tienes 3 mensajes no leídos</p>
            </div>
            <div className="max-h-[300px] overflow-y-auto">
              {[
                { id: 1, title: 'Reporte SINADER aprobado', time: 'Hace 2 horas', unread: true },
                { id: 2, title: 'Nuevo indicador disponible', time: 'Hace 5 horas', unread: true },
                { id: 3, title: 'Mantenimiento programado', time: 'Ayer', unread: false },
              ].map((notif) => (
                <div key={notif.id} className={`p-4 border-b border-border last:border-0 hover:bg-muted/50 cursor-pointer ${notif.unread ? 'bg-muted/20' : ''}`}>
                  <div className="flex items-start gap-2">
                    <div className={`w-2 h-2 mt-1.5 rounded-full ${notif.unread ? 'bg-blue-500' : 'bg-transparent'}`} />
                    <div>
                      <p className="text-sm font-medium">{notif.title}</p>
                      <p className="text-xs text-muted-foreground mt-1">{notif.time}</p>
                    </div>
                  </div>
                </div>
              ))}
            </div>
            <div className="p-2 border-t border-border bg-muted/20">
              <button
                onClick={() => router.push('/dashboard/novedades')}
                className="w-full text-xs text-center py-2 text-primary hover:underline cursor-pointer"
              >
                Ver todas las notificaciones
              </button>
            </div>
          </PopoverContent>
        </Popover>

        {/* Theme Toggle */}
        <button
          onClick={toggleTheme}
          className="relative p-2 hover:bg-muted rounded-lg transition-colors cursor-pointer"
          aria-label="Cambiar tema"
        >
          <Sun className="h-[1.2rem] w-[1.2rem] rotate-0 scale-100 transition-all dark:-rotate-90 dark:scale-0" />
          <Moon className="absolute h-[1.2rem] w-[1.2rem] rotate-90 scale-0 transition-all dark:rotate-0 dark:scale-100 top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2" />
        </button>

        {/* User Menu */}
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <button className="flex items-center gap-3 p-1 hover:bg-muted rounded-lg transition-colors cursor-pointer">
              <Avatar className="w-8 h-8">
                <AvatarFallback className="bg-[#2D9D78] text-white">
                  {userProfile ? getInitials(userProfile.full_name) : 'U'}
                </AvatarFallback>
              </Avatar>
              <div className="hidden md:block text-left">
                <p className="text-sm">{userProfile?.full_name || 'Usuario'}</p>
                <p className="text-xs text-muted-foreground">
                  {userProfile ? getRoleLabel(userProfile.role) : 'Rol'}
                </p>
              </div>
            </button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end" className="w-56 bg-white text-popover-foreground border border-border shadow-lg z-50">
            <DropdownMenuLabel>
              <div>
                <p>{userProfile?.full_name || 'Usuario'}</p>
                <p className="text-xs text-muted-foreground">
                  {userProfile?.email || 'email@example.com'}
                </p>
              </div>
            </DropdownMenuLabel>
            <DropdownMenuSeparator />
            <DropdownMenuItem onClick={() => router.push('/dashboard/configuracion')} className="cursor-pointer">
              <Settings className="w-4 h-4 mr-2" />
              Configuración
            </DropdownMenuItem>
            <DropdownMenuItem className="cursor-pointer">
              <User className="w-4 h-4 mr-2" />
              Mi Perfil
            </DropdownMenuItem>
            <DropdownMenuItem onClick={onLogout} className="cursor-pointer">
              Cerrar Sesión
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </div>
    </header>
  );
}
