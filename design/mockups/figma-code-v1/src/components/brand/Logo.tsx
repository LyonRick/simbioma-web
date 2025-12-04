import logoImage from 'figma:asset/0b4da7658131c39a09b6a78c3977cf479234cd0e.png';

interface LogoProps {
  variant?: 'full' | 'symbol-only';
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

  if (variant === 'symbol-only') {
    return (
      <div className={`inline-flex items-center ${className}`}>
        <img 
          src={logoImage} 
          alt="Simbioma Logo" 
          style={{ height: `${currentSize.height}px`, width: 'auto' }}
        />
      </div>
    );
  }

  return (
    <div className={`inline-flex items-center ${className}`} style={{ gap: currentSize.gap }}>
      {/* Logo Image */}
      <img 
        src={logoImage} 
        alt="Simbioma Logo Symbol" 
        style={{ height: `${currentSize.height}px`, width: 'auto' }}
      />

      {/* Logo Text */}
      <div style={{ fontSize: currentSize.fontSize, fontWeight: 700, fontFamily: 'Inter, sans-serif', letterSpacing: '0.02em', color: '#2C3E50' }}>
        SIMBIOMA
      </div>
    </div>
  );
}