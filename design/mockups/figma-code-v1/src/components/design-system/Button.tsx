import { ButtonHTMLAttributes, ReactNode } from 'react';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: 'primary' | 'secondary' | 'tertiary';
  size?: 'sm' | 'md' | 'lg';
  children: ReactNode;
}

export function SimbiomaButton({ 
  variant = 'primary', 
  size = 'md', 
  className = '',
  children,
  ...props 
}: ButtonProps) {
  const baseStyles = 'inline-flex items-center justify-center gap-2 transition-all duration-200 disabled:opacity-50 disabled:cursor-not-allowed';
  
  const variantStyles = {
    primary: 'bg-[#2D9D78] text-white hover:bg-[#26866a] active:bg-[#1f6d55] focus:ring-2 focus:ring-[#2D9D78] focus:ring-offset-2',
    secondary: 'bg-[#1E5F8C] text-white hover:bg-[#194f74] active:bg-[#14405d] focus:ring-2 focus:ring-[#1E5F8C] focus:ring-offset-2',
    tertiary: 'bg-white text-[#2C3E50] border border-[rgba(0,0,0,0.1)] hover:bg-[#F8F9FA] active:bg-[#ececf0] focus:ring-2 focus:ring-[#2D9D78] focus:ring-offset-2',
  };
  
  const sizeStyles = {
    sm: 'px-3 py-1.5 rounded-[6px]',
    md: 'px-4 py-2 rounded-[8px]',
    lg: 'px-6 py-3 rounded-[8px]',
  };
  
  return (
    <button 
      className={`${baseStyles} ${variantStyles[variant]} ${sizeStyles[size]} ${className}`}
      {...props}
    >
      {children}
    </button>
  );
}
