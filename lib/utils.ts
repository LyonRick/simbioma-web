import { type ClassValue, clsx } from "clsx";
import { extendTailwindMerge } from "tailwind-merge";

const customTwMerge = extendTailwindMerge({
    extend: {
        classGroups: {
            'bg-color': ['bg-verde-bosque', 'bg-azul-oceano', 'bg-amarillo-sol', 'bg-gris-neutro', 'bg-gris-claro'],
            'text-color': ['text-verde-bosque', 'text-azul-oceano', 'text-amarillo-sol', 'text-gris-neutro', 'text-gris-claro'],
            'border-color': ['border-verde-bosque', 'border-azul-oceano', 'border-amarillo-sol', 'border-gris-neutro', 'border-gris-claro'],
        },
    },
});

export function cn(...inputs: ClassValue[]) {
    return customTwMerge(clsx(inputs));
}
