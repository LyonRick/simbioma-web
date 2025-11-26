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

    // Scroll to top ONLY on first render, but respect hash navigation
    useEffect(() => {
        if (isFirstRender.current) {
            // Only scroll to top if there's no hash in the URL
            if (!window.location.hash) {
                window.scrollTo(0, 0);
            }
            isFirstRender.current = false;
        }
    }, []);

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
