"use client";

import { useState, useEffect } from 'react';
import { User, CreditCard, Shield, Bell, Building2, Save, Loader2, Plus, Trash2 } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Button } from '@/components/ui/button';
import { Switch } from '@/components/ui/switch';
import { Separator } from '@/components/ui/separator';
import { Badge } from '@/components/ui/badge';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from '@/components/ui/dialog';
import { createClient } from '@/lib/supabase/client';
import { toast } from 'sonner';
import { inviteUser, deleteUser } from './actions';
import { getUserPreferences, updateUserPreferences, type UserPreferences } from './preferences-actions';

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
    org_type: string;
    tax_id?: string;
    region?: string;
    commune?: string;
}

interface OrgUser {
    id: string;
    email: string;
    full_name: string;
    role: string;
}

export default function ConfigurationPage() {
    const [userProfile, setUserProfile] = useState<UserProfile | null>(null);
    const [organization, setOrganization] = useState<Organization | null>(null);
    const [loading, setLoading] = useState(true);
    const [saving, setSaving] = useState(false);

    // Notification preferences (loaded from DB)
    const [preferences, setPreferences] = useState<UserPreferences | null>(null);
    const [savingPreferences, setSavingPreferences] = useState(false);

    // Form state
    const [fullName, setFullName] = useState('');

    // User management state
    const [orgUsers, setOrgUsers] = useState<OrgUser[]>([]);
    const [loadingUsers, setLoadingUsers] = useState(false);
    const [showInviteDialog, setShowInviteDialog] = useState(false);
    const [inviting, setInviting] = useState(false);
    const [newUser, setNewUser] = useState({
        name: '',
        email: '',
        role: 'member',
        password: ''
    });

    useEffect(() => {
        loadData();
    }, []);

    const loadData = async () => {
        const supabase = createClient();

        // Get current user
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) return;

        // Get user profile
        const { data: profile } = await supabase
            .from('users')
            .select('*')
            .eq('id', user.id)
            .single();

        if (profile) {
            setUserProfile(profile);
            setFullName(profile.full_name || '');

            // Get organization
            const { data: org } = await supabase
                .from('organizations')
                .select('*')
                .eq('id', profile.organization_id)
                .single();

            if (org) {
                setOrganization(org);

                // Load org users if admin
                if (profile.role === 'admin' || profile.role === 'superadmin') {
                    loadOrgUsers(profile.organization_id);
                }
            }
        }

        // Load user preferences
        const prefsResult = await getUserPreferences();
        if (prefsResult.success && prefsResult.data) {
            setPreferences(prefsResult.data);
        }

        setLoading(false);
    };

    const handleSaveProfile = async () => {
        if (!userProfile) return;

        setSaving(true);
        const supabase = createClient();

        const { error } = await supabase
            .from('users')
            .update({ full_name: fullName })
            .eq('id', userProfile.id);

        if (error) {
            toast.error('Error al guardar los cambios');
            console.error(error);
        } else {
            toast.success('Cambios guardados correctamente');
            setUserProfile({ ...userProfile, full_name: fullName });
        }

        setSaving(false);
    };

    const loadOrgUsers = async (orgId: string) => {
        setLoadingUsers(true);
        const supabase = createClient();

        const { data, error } = await supabase
            .from('users')
            .select('id, email, full_name, role')
            .eq('organization_id', orgId);

        if (error) {
            console.error('Error loading users:', error);
            toast.error('Error al cargar usuarios');
        } else {
            setOrgUsers(data || []);
        }
        setLoadingUsers(false);
    };

    const handleInviteUser = async () => {
        setInviting(true);

        const formData = new FormData();
        formData.append('email', newUser.email);
        formData.append('fullName', newUser.name);
        formData.append('role', newUser.role);
        formData.append('password', newUser.password);

        try {
            // @ts-ignore - prevState is not needed for direct call
            const result = await inviteUser({}, formData);

            if (result.success) {
                toast.success(result.message);
                setShowInviteDialog(false);
                setNewUser({ name: '', email: '', role: 'member', password: '' });
                // Recargar lista de usuarios
                if (userProfile?.organization_id) {
                    loadOrgUsers(userProfile.organization_id);
                }
            } else {
                toast.error(result.message || 'Error al invitar usuario');
                if (result.errors) {
                    const firstError = Object.values(result.errors).flat()[0];
                    if (firstError) toast.error(firstError);
                }
            }
        } catch (error) {
            console.error(error);
            toast.error('Ocurrió un error inesperado');
        }

        setInviting(false);
    };

    const handleChangeRole = async (userId: string, newRole: string) => {
        const supabase = createClient();

        const { error } = await supabase
            .from('users')
            .update({ role: newRole })
            .eq('id', userId);

        if (error) {
            toast.error('Error al actualizar rol');
            console.error(error);
        } else {
            toast.success('Rol actualizado correctamente');
            // Update local state
            setOrgUsers(orgUsers.map(u =>
                u.id === userId ? { ...u, role: newRole } : u
            ));
        }
    };

    const handleDeactivateUser = async (userId: string, userName: string) => {
        if (!confirm(`¿Estás seguro de que deseas eliminar a ${userName}? Esta acción no se puede deshacer.`)) return;

        try {
            const result = await deleteUser(userId);

            if (result.success) {
                toast.success(result.message);
                // Actualizar estado local
                setOrgUsers(orgUsers.filter(u => u.id !== userId));
            } else {
                toast.error(result.message || 'Error al eliminar usuario');
            }
        } catch (error) {
            console.error(error);
            toast.error('Error al eliminar usuario');
        }
    };

    const getRoleLabel = (role: string) => {
        const roleLabels: Record<string, string> = {
            superadmin: 'Superadmin',
            admin: 'Administrador',
            editor: 'Editor',
            viewer: 'Visualizador',
            member: 'Miembro',
        };
        return roleLabels[role] || role;
    };

    const getOrgTypeLabel = (type: string) => {
        const typeLabels: Record<string, string> = {
            municipality: 'Municipalidad',
            company: 'Empresa',
            regional_gov: 'Gobierno Regional',
            national_gov: 'Gobierno Nacional',
        };
        return typeLabels[type] || type;
    };

    const updatePreference = (key: keyof UserPreferences, value: any) => {
        if (!preferences) return;
        setPreferences({ ...preferences, [key]: value });
    };

    const handleSavePreferences = async () => {
        if (!preferences) return;
        setSavingPreferences(true);

        const result = await updateUserPreferences({
            email_digest_frequency: preferences.email_digest_frequency,
            notify_document_expiry: preferences.notify_document_expiry,
            notify_platform_updates: preferences.notify_platform_updates,
            notify_calendar_events: preferences.notify_calendar_events,
            notify_user_actions: preferences.notify_user_actions,
        });

        if (result.success) {
            toast.success(result.message);
        } else {
            toast.error(result.message);
        }

        setSavingPreferences(false);
    };

    if (loading) {
        return (
            <div className="flex items-center justify-center min-h-[400px]">
                <Loader2 className="w-8 h-8 animate-spin text-muted-foreground" />
            </div>
        );
    }

    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-3xl font-bold mb-2">Configuración</h1>
                <p className="text-muted-foreground">
                    Administra tu cuenta, organización y preferencias de la plataforma
                </p>
            </div>

            <Tabs defaultValue="account" className="space-y-6">
                <TabsList className="grid w-full grid-cols-2 lg:grid-cols-4 gap-2">
                    <TabsTrigger value="account" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <User className="w-4 h-4" />
                        <span className="hidden sm:inline">Cuenta</span>
                    </TabsTrigger>
                    <TabsTrigger value="organization" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Building2 className="w-4 h-4" />
                        <span className="hidden sm:inline">Organización</span>
                    </TabsTrigger>
                    <TabsTrigger value="security" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Shield className="w-4 h-4" />
                        <span className="hidden sm:inline">Seguridad</span>
                    </TabsTrigger>
                    <TabsTrigger value="notifications" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Bell className="w-4 h-4" />
                        <span className="hidden sm:inline">Notificaciones</span>
                    </TabsTrigger>
                </TabsList>

                {/* Account Tab */}
                <TabsContent value="account" className="space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Información Personal</CardTitle>
                            <CardDescription>
                                Actualiza tu información de perfil y contacto
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="fullName">Nombre Completo</Label>
                                <Input
                                    id="fullName"
                                    value={fullName}
                                    onChange={(e) => setFullName(e.target.value)}
                                    placeholder="Ej: Juan Pérez"
                                />
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="email">Correo Electrónico</Label>
                                <Input
                                    id="email"
                                    type="email"
                                    value={userProfile?.email || ''}
                                    disabled
                                    className="bg-muted"
                                />
                                <p className="text-xs text-muted-foreground">
                                    El email no puede ser modificado por seguridad
                                </p>
                            </div>

                            <div className="space-y-2">
                                <Label htmlFor="role">Rol en la Organización</Label>
                                <Input
                                    id="role"
                                    value={userProfile ? getRoleLabel(userProfile.role) : ''}
                                    disabled
                                    className="bg-muted"
                                />
                                <p className="text-xs text-muted-foreground">
                                    Contacta a un administrador para cambiar tu rol
                                </p>
                            </div>

                            <Separator />

                            <div className="flex justify-end">
                                <Button
                                    onClick={handleSaveProfile}
                                    disabled={saving || fullName === userProfile?.full_name}
                                    className="bg-[#2D9D78] hover:bg-[#2D9D78]/90 text-white cursor-pointer"
                                >
                                    {saving ? (
                                        <>
                                            <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                                            Guardando...
                                        </>
                                    ) : (
                                        <>
                                            <Save className="w-4 h-4 mr-2" />
                                            Guardar Cambios
                                        </>
                                    )}
                                </Button>
                            </div>
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* Organization Tab */}
                <TabsContent value="organization" className="space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Información de la Organización</CardTitle>
                            <CardDescription>
                                Datos de tu organización en Simbioma
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-4">
                            <div className="space-y-2">
                                <Label htmlFor="orgName">Nombre de la Organización</Label>
                                <Input
                                    id="orgName"
                                    value={organization?.name || ''}
                                    disabled
                                    className="bg-muted"
                                />
                            </div>

                            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                <div className="space-y-2">
                                    <Label htmlFor="orgType">Tipo de Organización</Label>
                                    <Input
                                        id="orgType"
                                        value={organization ? getOrgTypeLabel(organization.org_type) : ''}
                                        disabled
                                        className="bg-muted"
                                    />
                                </div>
                                {organization?.tax_id && (
                                    <div className="space-y-2">
                                        <Label htmlFor="taxId">RUT</Label>
                                        <Input
                                            id="taxId"
                                            value={organization.tax_id}
                                            disabled
                                            className="bg-muted"
                                        />
                                    </div>
                                )}
                            </div>

                            {(organization?.region || organization?.commune) && (
                                <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                                    {organization.region && (
                                        <div className="space-y-2">
                                            <Label htmlFor="region">Región</Label>
                                            <Input
                                                id="region"
                                                value={organization.region}
                                                disabled
                                                className="bg-muted"
                                            />
                                        </div>
                                    )}
                                    {organization.commune && (
                                        <div className="space-y-2">
                                            <Label htmlFor="commune">Comuna</Label>
                                            <Input
                                                id="commune"
                                                value={organization.commune}
                                                disabled
                                                className="bg-muted"
                                            />
                                        </div>
                                    )}
                                </div>
                            )}

                            <Separator />

                            <div className="p-4 bg-muted rounded-lg">
                                <p className="text-sm text-muted-foreground">
                                    Para modificar la información de la organización, contacta a tu administrador
                                    o envía un correo a <strong>soporte@simbioma.com</strong>
                                </p>
                            </div>
                        </CardContent>
                    </Card>

                    {userProfile?.role === 'admin' || userProfile?.role === 'superadmin' ? (
                        <Card>
                            <CardHeader>
                                <CardTitle>Usuarios de la Organización</CardTitle>
                                <CardDescription>
                                    Gestión de usuarios disponible próximamente
                                </CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="p-6 border-2 border-dashed rounded-lg text-center">
                                    <p className="text-muted-foreground">
                                        La gestión de usuarios estará disponible en una próxima actualización
                                    </p>
                                </div>
                            </CardContent>
                        </Card>
                    ) : null}
                </TabsContent>

                {/* Security Tab */}
                <TabsContent value="security" className="space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Cambiar Contraseña</CardTitle>
                            <CardDescription>
                                Actualiza tu contraseña regularmente para mayor seguridad
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="p-6 border-2 border-dashed rounded-lg text-center">
                                <p className="text-muted-foreground mb-4">
                                    El cambio de contraseña estará disponible en una próxima actualización
                                </p>
                                <p className="text-sm text-muted-foreground">
                                    Por ahora, si necesitas cambiar tu contraseña, contacta a soporte@simbioma.com
                                </p>
                            </div>
                        </CardContent>
                    </Card>

                    <Card>
                        <CardHeader>
                            <CardTitle>Autenticación de Dos Factores (2FA)</CardTitle>
                            <CardDescription>
                                Añade una capa extra de seguridad a tu cuenta
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <div className="flex items-center justify-between p-4 rounded-lg border border-border">
                                <div>
                                    <p className="font-medium mb-1">Autenticación de Dos Factores</p>
                                    <p className="text-sm text-muted-foreground">
                                        Próximamente disponible
                                    </p>
                                </div>
                                <Badge variant="outline">Próximamente</Badge>
                            </div>
                        </CardContent>
                    </Card>
                </TabsContent>

                {/* Notifications Tab */}
                <TabsContent value="notifications" className="space-y-6">
                    <Card>
                        <CardHeader>
                            <CardTitle>Preferencias de Notificaciones</CardTitle>
                            <CardDescription>
                                Configura cómo y cuando deseas recibir notificaciones
                            </CardDescription>
                        </CardHeader>
                        <CardContent className="space-y-6">
                            {preferences ? (
                                <>
                                    {/* Frecuencia de Emails */}
                                    <div className="space-y-3">
                                        <p className="font-medium mb-1">Frecuencia de Emails</p>
                                        <p className="text-sm text-muted-foreground mb-3">
                                            Con qué frecuencia deseas recibir resúmenes por email
                                        </p>
                                        <div className="grid grid-cols-3 gap-2">
                                            {(['daily', 'weekly', 'never'] as const).map((freq) => (
                                                <button
                                                    key={freq}
                                                    onClick={() => updatePreference('email_digest_frequency', freq)}
                                                    className={`px-4 py-2 rounded-md border text-sm font-medium transition-colors ${preferences.email_digest_frequency === freq
                                                        ? 'bg-[#2D9D78] text-white border-[#2D9D78]'
                                                        : 'bg-background border-border hover:bg-muted'
                                                        }`}
                                                >
                                                    {freq === 'daily' ? 'Diario' : freq === 'weekly' ? 'Semanal' : 'Nunca'}
                                                </button>
                                            ))}
                                        </div>
                                    </div>

                                    <Separator />

                                    {/* Document Expiry */}
                                    <div className="flex items-center justify-between">
                                        <div className="flex-1">
                                            <p className="font-medium mb-1">Vencimiento de Documentos</p>
                                            <p className="text-sm text-muted-foreground">
                                                Alertas cuando un documento estratégico esté por vencer
                                            </p>
                                        </div>
                                        <Switch
                                            checked={preferences.notify_document_expiry}
                                            onCheckedChange={(checked) => updatePreference('notify_document_expiry', checked)}
                                        />
                                    </div>

                                    <Separator />

                                    {/* Platform Updates */}
                                    <div className="flex items-center justify-between">
                                        <div className="flex-1">
                                            <p className="font-medium mb-1">Actualizaciones de Plataforma</p>
                                            <p className="text-sm text-muted-foreground">
                                                Changelog y nuevas funcionalidades de Simbioma
                                            </p>
                                        </div>
                                        <Switch
                                            checked={preferences.notify_platform_updates}
                                            onCheckedChange={(checked) => updatePreference('notify_platform_updates', checked)}
                                        />
                                    </div>

                                    <Separator />

                                    {/* Calendar Events */}
                                    <div className="flex items-center justify-between">
                                        <div className="flex-1">
                                            <p className="font-medium mb-1">Recordatorios de Calendario</p>
                                            <p className="text-sm text-muted-foreground">
                                                Hitos próximos y fechas importantes del calendario estratégico
                                            </p>
                                        </div>
                                        <Switch
                                            checked={preferences.notify_calendar_events}
                                            onCheckedChange={(checked) => updatePreference('notify_calendar_events', checked)}
                                        />
                                    </div>

                                    <Separator />

                                    {/* User Actions */}
                                    <div className="flex items-center justify-between">
                                        <div className="flex-1">
                                            <p className="font-medium mb-1">Acciones de Usuarios</p>
                                            <p className="text-sm text-muted-foreground">
                                                Cuando te asignen documentos, proyectos o tareas
                                            </p>
                                        </div>
                                        <Switch
                                            checked={preferences.notify_user_actions}
                                            onCheckedChange={(checked) => updatePreference('notify_user_actions', checked)}
                                        />
                                    </div>

                                    <Separator />

                                    <div className="flex justify-end gap-2">
                                        <Button
                                            variant="outline"
                                            onClick={async () => {
                                                const result = await getUserPreferences();
                                                if (result.success && result.data) {
                                                    setPreferences(result.data);
                                                    toast.info('Cambios descartados');
                                                }
                                            }}
                                        >
                                            Descartar Cambios
                                        </Button>
                                        <Button
                                            className="bg-[#2D9D78] hover:bg-[#2D9D78]/90 text-white cursor-pointer"
                                            onClick={handleSavePreferences}
                                            disabled={savingPreferences}
                                        >
                                            {savingPreferences ? (
                                                <>
                                                    <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                                                    Guardando...
                                                </>
                                            ) : (
                                                <>
                                                    <Save className="w-4 h-4 mr-2" />
                                                    Guardar Preferencias
                                                </>
                                            )}
                                        </Button>
                                    </div>
                                </>
                            ) : (
                                <div className="text-center py-8 text-muted-foreground">
                                    Cargando preferencias...
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </TabsContent>
            </Tabs>
        </div>
    );
}
