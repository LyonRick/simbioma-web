"use client";

import { useEffect, useRef } from "react";
import { usePathname } from "next/navigation";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";

export default function ConditionalLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const pathname = usePathname();
    const isFirstRender = useRef(true);

    // Scroll to top ONLY on first render, not on navigation
    useEffect(() => {
        if (isFirstRender.current) {
            window.scrollTo(0, 0);
            isFirstRender.current = false;
        }
    }, []);

    // Don't show Header/Footer on dashboard routes
    const isDashboard = pathname?.startsWith("/dashboard");

    if (isDashboard) {
        return <>{children}</>;
    }

    return (
        <>
            <Header />
            {children}
            <Footer />
        </>
    );
}
