"use client";

import { useState, useEffect } from 'react';
import { useRouter } from 'next/navigation';
import { DashboardSidebar } from '@/components/layout/DashboardSidebar';
import { DashboardHeader } from '@/components/layout/DashboardHeader';
import { cn } from '@/lib/utils';
import { toast } from 'sonner';
import { createClient } from '@/lib/supabase/client';

interface UserProfile {
    id: string;
    email: string;
    full_name: string;
    role: string;
    organization_id: string;
}

interface Organization {
    id: string;
    name: string;
}

export default function DashboardLayout({
    children,
}: {
    children: React.ReactNode;
}) {
    const [sidebarCollapsed, setSidebarCollapsed] = useState(false);
    const [userProfile, setUserProfile] = useState<UserProfile | null>(null);
    const [organization, setOrganization] = useState<Organization | null>(null);
    const [loading, setLoading] = useState(true);
    const router = useRouter();

    useEffect(() => {
        async function loadUserData() {
            const supabase = createClient();

            // Get current user
            const { data: { user }, error: authError } = await supabase.auth.getUser();

            console.log('[Dashboard] Auth user:', user?.id, user?.email);
            if (authError) {
                console.error('[Dashboard] Auth error:', authError);
            }

            if (!user) {
                router.push('/login');
                return;
            }

            // Get user profile
            const { data: profile, error: profileError } = await supabase
                .from('users')
                .select('*')
                .eq('id', user.id)
                .single();

            console.log('[Dashboard] Profile query result:', profile);
            if (profileError) {
                console.error('[Dashboard] Profile error:', profileError);
            }

            if (profile) {
                setUserProfile(profile);

                // Get organization
                const { data: org, error: orgError } = await supabase
                    .from('organizations')
                    .select('id, name')
                    .eq('id', profile.organization_id)
                    .single();

                console.log('[Dashboard] Organization:', org);
                if (orgError) {
                    console.error('[Dashboard] Org error:', orgError);
                }

                if (org) {
                    setOrganization(org);
                }
            } else {
                console.warn('[Dashboard] No profile found for user:', user.id);
            }

            setLoading(false);
        }

        loadUserData();
    }, [router]);

    const handleLogout = async () => {
        const supabase = createClient();

        // Sign out from Supabase
        const { error } = await supabase.auth.signOut();

        if (error) {
            toast.error('Error al cerrar sesión');
            console.error('Logout error:', error);
            return;
        }

        // Clear local state
        setUserProfile(null);
        setOrganization(null);

        toast.success('Sesión cerrada correctamente');
        router.push('/login');
    };

    return (
        <div className="min-h-screen bg-background">
            {loading ? (
                <div className="flex items-center justify-center min-h-screen">
                    <p className="text-muted-foreground">Cargando...</p>
                </div>
            ) : (
                <>
                    <DashboardSidebar
                        collapsed={sidebarCollapsed}
                        onToggle={() => setSidebarCollapsed(!sidebarCollapsed)}
                        userRole={userProfile?.role || 'member'}
                        organizationName={organization?.name || 'Organización'}
                    />

                    <DashboardHeader
                        sidebarCollapsed={sidebarCollapsed}
                        onToggleSidebar={() => setSidebarCollapsed(!sidebarCollapsed)}
                        onLogout={handleLogout}
                        userProfile={userProfile}
                    />

                    {/* Main Content Area */}
                    <main
                        className={cn(
                            'pt-16 transition-all duration-300',
                            sidebarCollapsed ? 'ml-[80px]' : 'ml-[280px]'
                        )}
                    >
                        <div className="p-4 lg:p-6">
                            {children}
                        </div>
                    </main>
                </>
            )}
        </div>
    );
}
