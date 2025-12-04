import { ReactNode } from 'react';
import { Logo } from '../brand/Logo';

interface SidebarProps {
  children?: ReactNode;
}

interface SidebarItemProps {
  icon?: ReactNode;
  label: string;
  active?: boolean;
  onClick?: () => void;
}

export function Sidebar({ children }: SidebarProps) {
  return (
    <div 
      className="h-screen bg-white border-r border-[rgba(0,0,0,0.1)] flex flex-col"
      style={{ width: '280px' }}
    >
      <div className="p-6 border-b border-[rgba(0,0,0,0.1)]">
        <Logo variant="full" size="md" />
      </div>
      <nav className="flex-1 p-4">
        {children}
      </nav>
    </div>
  );
}

export function SidebarItem({ icon, label, active = false, onClick }: SidebarItemProps) {
  return (
    <button
      onClick={onClick}
      className={`
        w-full flex items-center gap-3 px-4 py-3 rounded-[8px]
        transition-all duration-200
        ${active 
          ? 'bg-[#2D9D78] text-white' 
          : 'text-[#2C3E50] hover:bg-[#F8F9FA]'
        }
      `}
      style={{ fontSize: '14px', fontWeight: 500 }}
    >
      {icon && <span className="w-5 h-5 flex items-center justify-center">{icon}</span>}
      <span>{label}</span>
    </button>
  );
}
