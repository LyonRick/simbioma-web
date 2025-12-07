"use client";

import { useEffect, useLayoutEffect } from "react";
import { usePathname } from "next/navigation";

/**
 * ScrollToTop Component for Next.js 16 + React 19
 * 
 * Forces instant scroll to top on every route change.
 * Uses useLayoutEffect to scroll before paint, preventing visual jarring.
 * 
 * @usage Add to your root layout: <ScrollToTop />
 */
export function ScrollToTop() {
    const pathname = usePathname();

    // useLayoutEffect runs synchronously before browser paint
    // This ensures scroll happens before user sees the page
    useLayoutEffect(() => {
        // Skip if navigating to a hash anchor (e.g., /#section)
        if (window.location.hash) {
            return;
        }

        // Force instant scroll to top
        window.scrollTo({
            top: 0,
            left: 0,
            behavior: "instant", // "instant" for no animation
        });
    }, [pathname]);

    // Fallback useEffect for SSR hydration edge cases
    useEffect(() => {
        // Disable any smooth scrolling temporarily
        const originalScrollBehavior = document.documentElement.style.scrollBehavior;
        document.documentElement.style.scrollBehavior = "auto";

        // Ensure we're at top after hydration
        if (!window.location.hash && window.scrollY !== 0) {
            window.scrollTo(0, 0);
        }

        // Restore original behavior after a short delay (for hash navigation)
        const timer = setTimeout(() => {
            document.documentElement.style.scrollBehavior = originalScrollBehavior || "";
        }, 50);

        return () => clearTimeout(timer);
    }, [pathname]);

    return null;
}

export default ScrollToTop;
