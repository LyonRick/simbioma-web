import { ReactNode, HTMLAttributes } from 'react'
import { cn } from '@/lib/utils/cn'

interface CardProps extends HTMLAttributes<HTMLDivElement> {
  children: ReactNode
  variant?: 'default' | 'featured' | 'stat' | 'hover'
}

export default function Card({
  children,
  variant = 'default',
  className,
  ...props
}: CardProps) {
  const baseStyles = 'bg-white rounded-lg transition-all duration-200'
  
  const variants = {
    default: 'shadow-sm hover:shadow-md p-6',
    featured: 'border-2 border-yellow-accent shadow-md hover:shadow-lg p-6',
    stat: 'shadow-sm hover:shadow-md p-8 text-center',
    hover: 'shadow-sm hover:shadow-lg hover:scale-[1.02] p-6 cursor-pointer'
  }
  
  return (
    <div
      className={cn(
        baseStyles,
        variants[variant],
        className
      )}
      {...props}
    >
      {children}
    </div>
  )
}