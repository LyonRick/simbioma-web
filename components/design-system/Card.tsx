import { ReactNode } from 'react';

interface CardProps {
  children: ReactNode;
  variant?: 'standard' | 'with-header' | 'metric';
  title?: string;
  subtitle?: string;
  className?: string;
}

export function SimBiomaCard({ 
  children, 
  variant = 'standard',
  title,
  subtitle,
  className = '' 
}: CardProps) {
  const baseStyles = 'bg-white rounded-[12px] border border-[rgba(0,0,0,0.1)]';
  
  if (variant === 'with-header') {
    return (
      <div className={`${baseStyles} overflow-hidden ${className}`} style={{ boxShadow: '0 4px 6px rgba(0, 0, 0, 0.07)' }}>
        <div className="px-6 py-4 border-b border-[rgba(0,0,0,0.1)] bg-[#F8F9FA]">
          {title && <h3 className="text-[#2C3E50]" style={{ fontSize: '18px', fontWeight: 600 }}>{title}</h3>}
          {subtitle && <p className="text-[#6B7280] mt-1" style={{ fontSize: '14px' }}>{subtitle}</p>}
        </div>
        <div className="p-6">
          {children}
        </div>
      </div>
    );
  }
  
  if (variant === 'metric') {
    return (
      <div className={`${baseStyles} p-6 ${className}`} style={{ boxShadow: '0 4px 6px rgba(0, 0, 0, 0.07)' }}>
        {children}
      </div>
    );
  }
  
  return (
    <div className={`${baseStyles} p-6 ${className}`} style={{ boxShadow: '0 1px 2px rgba(0, 0, 0, 0.05)' }}>
      {children}
    </div>
  );
}

interface MetricCardProps {
  label: string;
  value: string | number;
  change?: string;
  trend?: 'up' | 'down' | 'neutral';
  icon?: ReactNode;
}

export function MetricCard({ label, value, change, trend, icon }: MetricCardProps) {
  const trendColors = {
    up: '#10B981',
    down: '#EF4444',
    neutral: '#6B7280',
  };
  
  return (
    <SimBiomaCard variant="metric">
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <p className="text-[#6B7280]" style={{ fontSize: '14px', fontWeight: 500 }}>
            {label}
          </p>
          <p className="text-[#2C3E50] mt-2" style={{ fontSize: '32px', fontWeight: 700 }}>
            {value}
          </p>
          {change && trend && (
            <p className="mt-2" style={{ fontSize: '14px', fontWeight: 500, color: trendColors[trend] }}>
              {change}
            </p>
          )}
        </div>
        {icon && (
          <div className="text-[#2D9D78]">
            {icon}
          </div>
        )}
      </div>
    </SimBiomaCard>
  );
}
