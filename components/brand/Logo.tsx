interface LogoProps {
  variant?: 'full' | 'symbol-only' | 'white';
  size?: 'sm' | 'md' | 'lg';
  className?: string;
}

export function Logo({ variant = 'full', size = 'md', className = '' }: LogoProps) {
  const sizes = {
    sm: { height: 24, fontSize: '14px', gap: '8px' },
    md: { height: 40, fontSize: '18px', gap: '12px' },
    lg: { height: 56, fontSize: '24px', gap: '16px' },
  };

  const currentSize = sizes[size];
  const textColor = variant === 'white' ? '#FFFFFF' : '#2C3E50';
  const iconColor = variant === 'white' ? '#FFFFFF' : '#2D9D78'; // Using primary color for icon

  const LogoIcon = () => (
    <svg
      width={currentSize.height}
      height={currentSize.height}
      viewBox="0 0 40 40"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
    >
      <rect width="40" height="40" rx="12" fill={iconColor} fillOpacity="0.1" />
      <path
        d="M20 10C14.4772 10 10 14.4772 10 20C10 25.5228 14.4772 30 20 30C25.5228 30 30 25.5228 30 20C30 14.4772 25.5228 10 20 10ZM20 26C16.6863 26 14 23.3137 14 20C14 16.6863 16.6863 14 20 14C23.3137 14 26 16.6863 26 20C26 23.3137 23.3137 26 20 26Z"
        fill={iconColor}
      />
      <path
        d="M20 18C18.8954 18 18 18.8954 18 20C18 21.1046 18.8954 22 20 22C21.1046 22 22 21.1046 22 20C22 18.8954 21.1046 18 20 18Z"
        fill={iconColor}
        fillOpacity="0.5"
      />
    </svg>
  );

  if (variant === 'symbol-only') {
    return (
      <div className={`inline-flex items-center ${className}`}>
        <LogoIcon />
      </div>
    );
  }

  return (
    <div className={`inline-flex items-center ${className}`} style={{ gap: currentSize.gap }}>
      <LogoIcon />
      <div style={{ fontSize: currentSize.fontSize, fontWeight: 700, fontFamily: 'Inter, sans-serif', letterSpacing: '0.02em', color: textColor }}>
        SIMBIOMA
      </div>
    </div>
  );
}