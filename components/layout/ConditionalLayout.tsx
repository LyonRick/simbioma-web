"use client";

import { useEffect, useRef } from "react";
import { usePathname } from "next/navigation";
import { MotionConfig } from "framer-motion";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";

export default function ConditionalLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const pathname = usePathname();
    const isFirstRender = useRef(true);

    // Disable smooth scrolling temporarily on route changes to prevent jarring scroll
    // but keep it enabled for hash navigation
    useEffect(() => {
        // On route change, temporarily disable smooth scrolling
        document.documentElement.style.scrollBehavior = 'auto';

        // Scroll to top only if there's no hash
        if (!window.location.hash) {
            window.scrollTo(0, 0);
        }

        // Re-enable smooth scrolling after a short delay
        const timer = setTimeout(() => {
            document.documentElement.style.scrollBehavior = 'smooth';
        }, 100);

        return () => clearTimeout(timer);
    }, [pathname]);

    // Don't show Header/Footer on dashboard routes
    const isDashboard = pathname?.startsWith("/dashboard");

    if (isDashboard) {
        return (
            <MotionConfig reducedMotion="user">
                {children}
            </MotionConfig>
        );
    }

    return (
        <MotionConfig reducedMotion="user">
            <Header />
            {children}
            <Footer />
        </MotionConfig>
    );
}
