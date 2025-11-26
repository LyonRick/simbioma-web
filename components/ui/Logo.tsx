import { cn } from "@/lib/utils";

export default function Logo({ className, classNameText }: { className?: string, classNameText?: string }) {
    return (
        <div className={cn("flex items-center gap-2", className)}>
            <div className="relative w-8 h-8 md:w-10 md:h-10 flex items-center justify-center">
                {/* Base Leaf Shape */}
                <svg
                    viewBox="0 0 24 24"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                    className="w-full h-full text-verde-bosque drop-shadow-sm"
                >
                    <path
                        d="M12 22C12 22 20 18 20 12V5L12 2L4 5V12C4 18 12 22 12 22Z"
                        fill="currentColor"
                        className="opacity-20"
                    />
                    <path
                        d="M12 22V2"
                        stroke="currentColor"
                        strokeWidth="2"
                        strokeLinecap="round"
                        className="opacity-40"
                    />
                    {/* Nodes/Network Overlay */}
                    <circle cx="12" cy="12" r="2" fill="#1E5F8C" />
                    <circle cx="12" cy="6" r="1.5" fill="#1E5F8C" className="animate-pulse" />
                    <circle cx="17" cy="10" r="1.5" fill="#1E5F8C" className="animate-pulse delay-75" />
                    <circle cx="7" cy="10" r="1.5" fill="#1E5F8C" className="animate-pulse delay-150" />

                    {/* Connecting Lines */}
                    <path d="M12 12L12 6" stroke="#1E5F8C" strokeWidth="1" className="opacity-60" />
                    <path d="M12 12L17 10" stroke="#1E5F8C" strokeWidth="1" className="opacity-60" />
                    <path d="M12 12L7 10" stroke="#1E5F8C" strokeWidth="1" className="opacity-60" />
                </svg>
            </div>
            <span className={cn("text-xl md:text-2xl font-bold tracking-tight text-gray-900", classNameText)}>
                Simbioma
            </span>
        </div>
    );
}
