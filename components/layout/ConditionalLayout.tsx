"use client";

import { usePathname } from "next/navigation";
import { MotionConfig } from "framer-motion";
import Header from "@/components/layout/Header";
import Footer from "@/components/layout/Footer";
import ScrollToTop from "@/components/layout/ScrollToTop";

export default function ConditionalLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const pathname = usePathname();

    // Don't show Header/Footer on dashboard routes or login page
    const isDashboard = pathname?.startsWith("/dashboard");
    const isLogin = pathname === "/login";

    if (isDashboard || isLogin) {
        return (
            <MotionConfig reducedMotion="user">
                <ScrollToTop />
                {children}
            </MotionConfig>
        );
    }

    return (
        <MotionConfig reducedMotion="user">
            <ScrollToTop />
            <Header />
            {children}
            <Footer />
        </MotionConfig>
    );
}

