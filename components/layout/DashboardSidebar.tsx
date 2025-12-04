"use client";

import { useState } from 'react';
import Link from 'next/link';
import { usePathname } from 'next/navigation';
import {
  LayoutDashboard,
  TrendingUp,
  AlertTriangle,
  FileText,
  Sprout,
  FolderOpen,
  Bell,
  Settings,
  ChevronLeft,
  ChevronDown,
  Calendar,
} from 'lucide-react';
import { Logo } from '@/components/brand/Logo';
import { cn } from '@/lib/utils';

interface MenuItem {
  href: string;
  label: string;
  icon: React.ReactNode;
  badge?: string;
  roles?: string[]; // Roles permitidos para ver este item (undefined = todos)
}

interface MenuSection {
  title: string;
  items: MenuItem[];
  secondary?: boolean;
}

interface DashboardSidebarProps {
  collapsed: boolean;
  onToggle: () => void;
  userRole: string;
  organizationName: string;
}

export function DashboardSidebar({
  collapsed,
  onToggle,
  userRole,
  organizationName,
}: DashboardSidebarProps) {
  const pathname = usePathname();
  const [orgDropdownOpen, setOrgDropdownOpen] = useState(false);
  const [selectedOrg, setSelectedOrg] = useState(organizationName);

  const organizations = [
    'Municipalidad de Peñalolén',
    'Municipalidad de Providencia',
    'Municipalidad de Las Condes',
  ];

  const menuSections: MenuSection[] = [
    {
      title: 'GESTIÓN TERRITORIAL',
      items: [
        {
          href: '/dashboard',
          label: 'Dashboard',
          icon: <LayoutDashboard className="w-5 h-5" />,
        },
        {
          href: '/dashboard/calendario',
          label: 'Calendario',
          icon: <Calendar className="w-5 h-5" />,
        },
        {
          href: '/dashboard/indicadores',
          label: 'Indicadores',
          icon: <TrendingUp className="w-5 h-5" />,
        },
      ],
    },
    {
      title: 'CUMPLIMIENTO',
      items: [
        {
          href: '/dashboard/sinader',
          label: 'Reporte SINADER',
          icon: <AlertTriangle className="w-5 h-5" />,
          badge: '!',
        },
        {
          href: '/dashboard/reportes',
          label: 'Mis Reportes',
          icon: <FileText className="w-5 h-5" />,
        },
      ],
    },
    {
      title: 'GESTIÓN ESTRATÉGICA',
      items: [
        {
          href: '/dashboard/proyectos',
          label: 'Proyectos',
          icon: <Sprout className="w-5 h-5" />,
          roles: ['superadmin', 'admin', 'editor'], // Viewers no ven proyectos
        },
        {
          href: '/dashboard/documentos',
          label: 'Documentos',
          icon: <FolderOpen className="w-5 h-5" />,
        },
      ],
      secondary: true,
    },
    {
      title: 'SISTEMA',
      items: [
        {
          href: '/dashboard/novedades',
          label: 'Novedades',
          icon: <Bell className="w-5 h-5" />,
          badge: '3',
        },
        {
          href: '/dashboard/configuracion',
          label: 'Configuración',
          icon: <Settings className="w-5 h-5" />,
          roles: ['superadmin', 'admin'], // Solo admins
        },
      ],
      secondary: true,
    },
  ];

  // Helper function to check if user can see a menu item
  const canAccessItem = (item: MenuItem): boolean => {
    // If no roles specified, everyone can access
    if (!item.roles || item.roles.length === 0) return true;
    // Check if user's role is in the allowed roles
    return item.roles.includes(userRole);
  };

  // Filter menu sections based on user role
  const filteredMenuSections = menuSections.map(section => ({
    ...section,
    items: section.items.filter(canAccessItem),
  })).filter(section => section.items.length > 0); // Remove empty sections

  return (
    <aside
      className={cn(
        'fixed left-0 top-0 h-screen bg-card border-r border-border transition-all duration-300 z-40 flex flex-col',
        collapsed ? 'w-[80px]' : 'w-[280px]'
      )}
    >
      {/* Header con Logo */}
      <div className="h-16 border-b border-border flex items-center justify-between px-6">
        {!collapsed && (
          <div className="flex-1">
            <Logo size="sm" />
          </div>
        )}
        <button
          onClick={onToggle}
          className="p-2 hover:bg-muted rounded-lg transition-colors"
          aria-label={collapsed ? 'Expandir sidebar' : 'Colapsar sidebar'}
        >
          <ChevronLeft
            className={cn(
              'w-5 h-5 text-muted-foreground transition-transform',
              collapsed && 'rotate-180'
            )}
          />
        </button>
      </div>

      {/* Organization Header - Compact */}
      {!collapsed && (
        <div className="px-4 py-2 border-b border-border">
          <p className="text-xs text-muted-foreground mb-0.5">Organización</p>
          <p className="text-sm font-medium truncate">{selectedOrg}</p>
        </div>
      )}

      {/* Navegación Principal */}
      <div className="flex-1 overflow-y-auto px-4 py-4">
        {filteredMenuSections.map((section, idx) => (
          <div key={idx} className={cn('mb-6', idx > 0 && 'mt-8')}>
            {!collapsed && (
              <p className="px-3 mb-2 label-uppercase text-muted-foreground">
                {section.title}
              </p>
            )}
            <nav className="space-y-1">
              {section.items.map((item) => {
                const isActive = pathname === item.href;
                return (
                  <Link
                    key={item.href}
                    href={item.href}
                    className={cn(
                      'w-full flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all border-l-4',
                      isActive
                        ? 'bg-emerald-50 dark:bg-emerald-950/50 text-emerald-700 dark:text-emerald-400 border-emerald-500'
                        : 'text-foreground hover:bg-muted border-transparent',
                      collapsed && 'justify-center'
                    )}
                    title={collapsed ? item.label : undefined}
                  >
                    <div className="relative">
                      {item.icon}
                      {item.badge && (
                        <span
                          className={cn(
                            'absolute -top-1 -right-1 w-4 h-4 rounded-full flex items-center justify-center text-[10px]',
                            item.badge === '!'
                              ? 'bg-destructive text-white'
                              : 'bg-[#F5A623] text-white'
                          )}
                        >
                          {item.badge}
                        </span>
                      )}
                    </div>
                    {!collapsed && (
                      <span className="flex-1 text-left">{item.label}</span>
                    )}
                  </Link>
                );
              })}
            </nav>
          </div>
        ))}
      </div>

      {/* Footer con versión */}
      {!collapsed && (
        <div className="p-4 border-t border-border">
          <p className="text-xs text-muted-foreground text-center">
            Simbioma v1.0
          </p>
        </div>
      )}
    </aside>
  );
}
