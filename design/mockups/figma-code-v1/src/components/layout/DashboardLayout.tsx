import { useState, ReactNode } from 'react';
import { DashboardSidebar } from './DashboardSidebar';
import { DashboardHeader } from './DashboardHeader';
import { cn } from '../ui/utils';

interface DashboardLayoutProps {
  children: ReactNode;
  isDark: boolean;
  onToggleTheme: () => void;
  onLogout: () => void;
  activeView: string;
  onNavigate: (view: string) => void;
  breadcrumbs: { label: string; href?: string }[];
}

export function DashboardLayout({
  children,
  isDark,
  onToggleTheme,
  onLogout,
  activeView,
  onNavigate,
  breadcrumbs,
}: DashboardLayoutProps) {
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);

  return (
    <div className="min-h-screen bg-background">
      <DashboardSidebar
        collapsed={sidebarCollapsed}
        onToggle={() => setSidebarCollapsed(!sidebarCollapsed)}
        activeView={activeView}
        onNavigate={onNavigate}
      />

      <DashboardHeader
        sidebarCollapsed={sidebarCollapsed}
        onToggleSidebar={() => setSidebarCollapsed(!sidebarCollapsed)}
        isDark={isDark}
        onToggleTheme={onToggleTheme}
        onLogout={onLogout}
        breadcrumbs={breadcrumbs}
      />

      {/* Main Content Area */}
      <main
        className={cn(
          'pt-16 transition-all duration-300',
          sidebarCollapsed ? 'ml-[80px]' : 'ml-[280px]'
        )}
      >
        <div className="p-6 lg:p-8">
          {children}
        </div>
      </main>
    </div>
  );
}
