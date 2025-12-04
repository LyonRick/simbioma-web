import { useState, useEffect } from 'react';
import { LoginPage } from './components/auth/LoginPage';
import { DashboardLayout } from './components/layout/DashboardLayout';
import { DashboardHome } from './components/dashboard/DashboardHome';
import { PlaceholderView } from './components/dashboard/PlaceholderView';
import { ConfigurationView } from './components/dashboard/ConfigurationView';
import { NotificationsView } from './components/dashboard/NotificationsView';
import { IndicadoresView } from './components/dashboard/IndicadoresView';
import { CalendarWidget } from './components/dashboard/CalendarWidget';
import { DocumentsView } from './components/dashboard/DocumentsView';
import {
  TrendingUp,
  AlertTriangle,
  FileText,
  Sprout,
  FolderOpen,
  Bell,
  Settings,
  Calendar,
} from 'lucide-react';

export default function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isDark, setIsDark] = useState(false);
  const [activeView, setActiveView] = useState('dashboard');

  // Theme management
  useEffect(() => {
    if (isDark) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }, [isDark]);

  // Breadcrumbs configuration
  const getBreadcrumbs = () => {
    const breadcrumbsMap: Record<string, { label: string; href?: string }[]> = {
      dashboard: [{ label: 'Dashboard' }],
      indicadores: [
        { label: 'Dashboard', href: '#' },
        { label: 'Indicadores Territoriales' },
      ],
      sinader: [
        { label: 'Dashboard', href: '#' },
        { label: 'Cumplimiento', href: '#' },
        { label: 'Reporte SINADER' },
      ],
      reportes: [
        { label: 'Dashboard', href: '#' },
        { label: 'Cumplimiento', href: '#' },
        { label: 'Mis Reportes' },
      ],
      proyectos: [
        { label: 'Dashboard', href: '#' },
        { label: 'Gestión Estratégica', href: '#' },
        { label: 'Proyectos' },
      ],
      documentos: [
        { label: 'Dashboard', href: '#' },
        { label: 'Gestión Estratégica', href: '#' },
        { label: 'Documentos' },
      ],
      calendario: [
        { label: 'Dashboard', href: '#' },
        { label: 'Calendario de Hitos' },
      ],
      novedades: [
        { label: 'Dashboard', href: '#' },
        { label: 'Sistema', href: '#' },
        { label: 'Novedades' },
      ],
      configuracion: [
        { label: 'Dashboard', href: '#' },
        { label: 'Sistema', href: '#' },
        { label: 'Configuración' },
      ],
    };

    return breadcrumbsMap[activeView] || [{ label: 'Dashboard' }];
  };

  // View rendering
  const renderView = () => {
    switch (activeView) {
      case 'dashboard':
        return <DashboardHome onNavigate={setActiveView} />;
      case 'indicadores':
        return <IndicadoresView />;
      case 'sinader':
        return (
          <PlaceholderView
            title="Reporte SINADER"
            description="Formulario de reporte del Sistema Nacional de Declaración de Residuos"
            icon={AlertTriangle}
            status="desarrollo"
          />
        );
      case 'reportes':
        return (
          <PlaceholderView
            title="Mis Reportes"
            description="Historial y gestión de reportes de cumplimiento normativo"
            icon={FileText}
            status="desarrollo"
          />
        );
      case 'proyectos':
        return (
          <PlaceholderView
            title="Proyectos Ambientales"
            description="Gestión completa de proyectos con seguimiento de KPIs y objetivos"
            icon={Sprout}
            status="pronto"
          />
        );
      case 'documentos':
        return <DocumentsView />;
      case 'calendario':
        return <CalendarWidget compact={false} />;
      case 'novedades':
        return <NotificationsView />;
      case 'configuracion':
        return <ConfigurationView />;
      default:
        return <DashboardHome onNavigate={setActiveView} />;
    }
  };

  // Login screen
  if (!isAuthenticated) {
    return (
      <LoginPage
        onLogin={() => setIsAuthenticated(true)}
        isDark={isDark}
        onToggleTheme={() => setIsDark(!isDark)}
      />
    );
  }

  // Dashboard screens
  return (
    <DashboardLayout
      isDark={isDark}
      onToggleTheme={() => setIsDark(!isDark)}
      onLogout={() => {
        setIsAuthenticated(false);
        setActiveView('dashboard');
      }}
      activeView={activeView}
      onNavigate={setActiveView}
      breadcrumbs={getBreadcrumbs()}
    >
      {renderView()}
    </DashboardLayout>
  );
}
