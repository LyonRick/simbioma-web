import { useState } from 'react';
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
  ChevronRight,
  Calendar,
} from 'lucide-react';
import { Logo } from '../brand/Logo';
import { cn } from '../ui/utils';

interface MenuItem {
  id: string;
  label: string;
  icon: React.ReactNode;
  active?: boolean;
  badge?: string;
  onClick?: () => void;
}

interface MenuSection {
  title: string;
  items: MenuItem[];
  secondary?: boolean;
}

interface DashboardSidebarProps {
  collapsed: boolean;
  onToggle: () => void;
  activeView: string;
  onNavigate: (view: string) => void;
}

export function DashboardSidebar({
  collapsed,
  onToggle,
  activeView,
  onNavigate,
}: DashboardSidebarProps) {
  const [orgDropdownOpen, setOrgDropdownOpen] = useState(false);
  const [selectedOrg, setSelectedOrg] = useState('Municipalidad de Peñalolén');

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
          id: 'dashboard',
          label: 'Dashboard',
          icon: <LayoutDashboard className="w-5 h-5" />,
          onClick: () => onNavigate('dashboard'),
        },
        {
          id: 'calendario',
          label: 'Calendario',
          icon: <Calendar className="w-5 h-5" />,
          onClick: () => onNavigate('calendario'),
        },
        {
          id: 'indicadores',
          label: 'Indicadores',
          icon: <TrendingUp className="w-5 h-5" />,
          onClick: () => onNavigate('indicadores'),
        },
      ],
    },
    {
      title: 'CUMPLIMIENTO',
      items: [
        {
          id: 'sinader',
          label: 'Reporte SINADER',
          icon: <AlertTriangle className="w-5 h-5" />,
          badge: '!',
          onClick: () => onNavigate('sinader'),
        },
        {
          id: 'reportes',
          label: 'Mis Reportes',
          icon: <FileText className="w-5 h-5" />,
          onClick: () => onNavigate('reportes'),
        },
      ],
    },
    {
      title: 'GESTIÓN ESTRATÉGICA',
      items: [
        {
          id: 'proyectos',
          label: 'Proyectos',
          icon: <Sprout className="w-5 h-5" />,
          onClick: () => onNavigate('proyectos'),
        },
        {
          id: 'documentos',
          label: 'Documentos',
          icon: <FolderOpen className="w-5 h-5" />,
          onClick: () => onNavigate('documentos'),
        },
      ],
      secondary: true,
    },
    {
      title: 'SISTEMA',
      items: [
        {
          id: 'novedades',
          label: 'Novedades',
          icon: <Bell className="w-5 h-5" />,
          badge: '3',
          onClick: () => onNavigate('novedades'),
        },
        {
          id: 'configuracion',
          label: 'Configuración',
          icon: <Settings className="w-5 h-5" />,
          onClick: () => onNavigate('configuracion'),
        },
      ],
      secondary: true,
    },
  ];

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

      {/* Selector de Organización */}
      {!collapsed && (
        <div className="p-4 border-b border-border">
          <button
            onClick={() => setOrgDropdownOpen(!orgDropdownOpen)}
            className="w-full flex items-center justify-between p-3 rounded-lg hover:bg-muted transition-colors"
          >
            <div className="flex-1 text-left">
              <p className="text-xs text-muted-foreground mb-1">Organización</p>
              <p className="text-sm truncate">{selectedOrg}</p>
            </div>
            <ChevronDown
              className={cn(
                'w-4 h-4 text-muted-foreground transition-transform',
                orgDropdownOpen && 'rotate-180'
              )}
            />
          </button>
          
          {orgDropdownOpen && (
            <div className="mt-2 py-2 bg-muted rounded-lg">
              {organizations.map((org) => (
                <button
                  key={org}
                  onClick={() => {
                    setSelectedOrg(org);
                    setOrgDropdownOpen(false);
                  }}
                  className={cn(
                    'w-full px-3 py-2 text-left text-sm hover:bg-background transition-colors',
                    org === selectedOrg && 'text-primary font-semibold'
                  )}
                >
                  {org}
                </button>
              ))}
            </div>
          )}
        </div>
      )}

      {/* Navegación Principal */}
      <div className="flex-1 overflow-y-auto px-4 py-4">
        {menuSections.map((section, idx) => (
          <div key={idx} className={cn('mb-6', idx > 0 && 'mt-8')}>
            {!collapsed && (
              <p className="px-3 mb-2 label-uppercase text-muted-foreground">
                {section.title}
              </p>
            )}
            <nav className="space-y-1">
              {section.items.map((item) => (
                <button
                  key={item.id}
                  onClick={item.onClick}
                  className={cn(
                    'w-full flex items-center gap-3 px-3 py-2.5 rounded-lg transition-all border-l-4',
                    activeView === item.id
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
                </button>
              ))}
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
