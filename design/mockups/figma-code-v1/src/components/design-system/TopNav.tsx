import { ReactNode } from 'react';

interface TopNavProps {
  title?: string;
  actions?: ReactNode;
  userMenu?: ReactNode;
}

export function TopNav({ title, actions, userMenu }: TopNavProps) {
  return (
    <div 
      className="bg-white border-b border-[rgba(0,0,0,0.1)] px-6 flex items-center justify-between"
      style={{ height: '64px' }}
    >
      <div className="flex items-center gap-4">
        {title && (
          <h1 className="text-[#2C3E50]" style={{ fontSize: '20px', fontWeight: 600 }}>
            {title}
          </h1>
        )}
      </div>
      
      <div className="flex items-center gap-4">
        {actions && <div className="flex items-center gap-2">{actions}</div>}
        {userMenu && <div className="ml-4 pl-4 border-l border-[rgba(0,0,0,0.1)]">{userMenu}</div>}
      </div>
    </div>
  );
}
