import { InputHTMLAttributes } from 'react';

interface InputProps extends InputHTMLAttributes<HTMLInputElement> {
  label?: string;
  error?: string;
  helperText?: string;
}

export function SimBiomaInput({ 
  label, 
  error, 
  helperText,
  className = '',
  ...props 
}: InputProps) {
  return (
    <div className="flex flex-col gap-1.5">
      {label && (
        <label 
          htmlFor={props.id} 
          className="text-[#2C3E50]"
          style={{ fontSize: '14px', fontWeight: 500 }}
        >
          {label}
        </label>
      )}
      <input
        className={`
          px-4 py-2 
          bg-white 
          border 
          ${error ? 'border-[#EF4444]' : 'border-[rgba(0,0,0,0.1)]'}
          rounded-[8px]
          text-[#2C3E50]
          placeholder:text-[#6B7280]
          focus:outline-none 
          focus:ring-2 
          ${error ? 'focus:ring-[#EF4444]' : 'focus:ring-[#2D9D78]'}
          focus:border-transparent
          disabled:bg-[#F8F9FA]
          disabled:cursor-not-allowed
          transition-all duration-200
          ${className}
        `}
        {...props}
      />
      {error && (
        <span className="text-[#EF4444]" style={{ fontSize: '14px' }}>
          {error}
        </span>
      )}
      {!error && helperText && (
        <span className="text-[#6B7280]" style={{ fontSize: '14px' }}>
          {helperText}
        </span>
      )}
    </div>
  );
}
