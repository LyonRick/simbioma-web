import { useState } from 'react';
import { User, CreditCard, Shield, Bell, Globe, Building2, Save } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs';
import { Input } from '../ui/input';
import { Label } from '../ui/label';
import { Button } from '../ui/button';
import { Switch } from '../ui/switch';
import { Separator } from '../ui/separator';
import { Badge } from '../ui/badge';

export function ConfigurationView() {
  const [emailNotifications, setEmailNotifications] = useState(true);
  const [dataUpdates, setDataUpdates] = useState(true);
  const [platformUpdates, setPlatformUpdates] = useState(true);
  const [weeklyReports, setWeeklyReports] = useState(false);

  const payments = [
    {
      id: 1,
      date: '01 Nov 2024',
      amount: '$49.000',
      status: 'Pagado',
      plan: 'Plan Municipal Pro',
      invoice: 'INV-2024-11',
    },
    {
      id: 2,
      date: '01 Oct 2024',
      amount: '$49.000',
      status: 'Pagado',
      plan: 'Plan Municipal Pro',
      invoice: 'INV-2024-10',
    },
    {
      id: 3,
      date: '01 Sep 2024',
      amount: '$49.000',
      status: 'Pagado',
      plan: 'Plan Municipal Pro',
      invoice: 'INV-2024-09',
    },
  ];

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl mb-2">Configuración</h1>
        <p className="text-muted-foreground">
          Administra tu cuenta, organización y preferencias de la plataforma
        </p>
      </div>

      <Tabs defaultValue="account" className="space-y-6">
        <TabsList className="grid w-full grid-cols-2 lg:grid-cols-5 gap-2">
          <TabsTrigger value="account" className="flex items-center gap-2">
            <User className="w-4 h-4" />
            <span className="hidden sm:inline">Cuenta</span>
          </TabsTrigger>
          <TabsTrigger value="organization" className="flex items-center gap-2">
            <Building2 className="w-4 h-4" />
            <span className="hidden sm:inline">Organización</span>
          </TabsTrigger>
          <TabsTrigger value="billing" className="flex items-center gap-2">
            <CreditCard className="w-4 h-4" />
            <span className="hidden sm:inline">Facturación</span>
          </TabsTrigger>
          <TabsTrigger value="security" className="flex items-center gap-2">
            <Shield className="w-4 h-4" />
            <span className="hidden sm:inline">Seguridad</span>
          </TabsTrigger>
          <TabsTrigger value="notifications" className="flex items-center gap-2">
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
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="firstName">Nombre</Label>
                  <Input id="firstName" defaultValue="Juan" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="lastName">Apellido</Label>
                  <Input id="lastName" defaultValue="Martínez" />
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="email">Correo Electrónico</Label>
                <Input id="email" type="email" defaultValue="j.martinez@penalolen.cl" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="phone">Teléfono</Label>
                <Input id="phone" type="tel" defaultValue="+56 9 8765 4321" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="role">Cargo</Label>
                <Input id="role" defaultValue="Director de Medio Ambiente" />
              </div>

              <Separator />

              <div className="flex justify-end">
                <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
                  <Save className="w-4 h-4 mr-2" />
                  Guardar Cambios
                </Button>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Preferencias de Idioma</CardTitle>
              <CardDescription>Selecciona tu idioma preferido</CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-2">
                <Label htmlFor="language">Idioma de la Plataforma</Label>
                <select
                  id="language"
                  className="w-full h-10 px-3 rounded-lg border border-border bg-background"
                >
                  <option value="es">Español (Chile)</option>
                  <option value="en">English</option>
                  <option value="pt">Português</option>
                </select>
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
                Datos de la municipalidad y configuración multi-tenant
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="orgName">Nombre de la Organización</Label>
                <Input id="orgName" defaultValue="Municipalidad de Peñalolén" />
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="rut">RUT</Label>
                  <Input id="rut" defaultValue="69.200.200-7" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="region">Región</Label>
                  <select
                    id="region"
                    className="w-full h-10 px-3 rounded-lg border border-border bg-background"
                  >
                    <option>Región Metropolitana</option>
                    <option>Región de Valparaíso</option>
                    <option>Región del Biobío</option>
                  </select>
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="address">Dirección</Label>
                <Input
                  id="address"
                  defaultValue="Av. Grecia 8735, Peñalolén, Santiago"
                />
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="population">Población</Label>
                  <Input id="population" defaultValue="266.798 habitantes" />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="area">Superficie</Label>
                  <Input id="area" defaultValue="54,2 km²" />
                </div>
              </div>

              <Separator />

              <div className="flex justify-end">
                <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
                  <Save className="w-4 h-4 mr-2" />
                  Guardar Cambios
                </Button>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Usuarios de la Organización</CardTitle>
              <CardDescription>
                Gestiona los miembros con acceso a la plataforma
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-4">
                {[
                  {
                    name: 'Juan Martínez',
                    email: 'j.martinez@penalolen.cl',
                    role: 'Administrador',
                  },
                  {
                    name: 'María González',
                    email: 'm.gonzalez@penalolen.cl',
                    role: 'Editor',
                  },
                  {
                    name: 'Carlos Silva',
                    email: 'c.silva@penalolen.cl',
                    role: 'Visualizador',
                  },
                ].map((user, idx) => (
                  <div
                    key={idx}
                    className="flex items-center justify-between p-4 rounded-lg border border-border"
                  >
                    <div>
                      <p className="font-medium">{user.name}</p>
                      <p className="text-sm text-muted-foreground">{user.email}</p>
                    </div>
                    <Badge variant="outline">{user.role}</Badge>
                  </div>
                ))}
                <Button variant="outline" className="w-full">
                  + Invitar Usuario
                </Button>
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        {/* Billing Tab */}
        <TabsContent value="billing" className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Plan Actual</CardTitle>
              <CardDescription>
                Detalles de tu suscripción y facturación
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="p-6 rounded-xl bg-gradient-to-br from-[#2D9D78]/10 to-[#1E5F8C]/10 border-2 border-[#2D9D78]">
                <div className="flex items-start justify-between mb-4">
                  <div>
                    <h3 className="text-2xl mb-2">Plan Municipal Pro</h3>
                    <p className="text-muted-foreground">
                      Acceso completo a todos los módulos y 10 usuarios
                    </p>
                  </div>
                  <Badge className="bg-[#2D9D78] text-white">Activo</Badge>
                </div>
                <div className="flex items-baseline gap-2">
                  <span className="text-4xl">$49.000</span>
                  <span className="text-muted-foreground">/ mes</span>
                </div>
                <Button variant="outline" className="mt-4">
                  Cambiar Plan
                </Button>
              </div>

              <Separator />

              <div>
                <h4 className="mb-2">Método de Pago</h4>
                <div className="p-4 rounded-lg border border-border flex items-center justify-between">
                  <div className="flex items-center gap-4">
                    <CreditCard className="w-8 h-8 text-muted-foreground" />
                    <div>
                      <p className="font-medium">Tarjeta terminada en 4242</p>
                      <p className="text-sm text-muted-foreground">
                        Vence 12/2025
                      </p>
                    </div>
                  </div>
                  <Button variant="outline" size="sm">
                    Editar
                  </Button>
                </div>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Historial de Pagos</CardTitle>
              <CardDescription>
                Revisa tus facturas y pagos anteriores
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {payments.map((payment) => (
                  <div
                    key={payment.id}
                    className="flex items-center justify-between p-4 rounded-lg border border-border hover:bg-muted/50 transition-colors"
                  >
                    <div className="flex-1">
                      <div className="flex items-center gap-3 mb-1">
                        <p className="font-medium">{payment.plan}</p>
                        <Badge className="bg-[#10B981] text-white">
                          {payment.status}
                        </Badge>
                      </div>
                      <p className="text-sm text-muted-foreground">
                        {payment.date} • {payment.invoice}
                      </p>
                    </div>
                    <div className="text-right flex items-center gap-4">
                      <p className="font-medium">{payment.amount}</p>
                      <Button variant="outline" size="sm">
                        Descargar
                      </Button>
                    </div>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
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
            <CardContent className="space-y-4">
              <div className="space-y-2">
                <Label htmlFor="currentPassword">Contraseña Actual</Label>
                <Input id="currentPassword" type="password" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="newPassword">Nueva Contraseña</Label>
                <Input id="newPassword" type="password" />
              </div>
              <div className="space-y-2">
                <Label htmlFor="confirmPassword">Confirmar Nueva Contraseña</Label>
                <Input id="confirmPassword" type="password" />
              </div>
              <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
                Actualizar Contraseña
              </Button>
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
                    Actualmente desactivada
                  </p>
                </div>
                <Button variant="outline">Activar 2FA</Button>
              </div>
            </CardContent>
          </Card>

          <Card>
            <CardHeader>
              <CardTitle>Sesiones Activas</CardTitle>
              <CardDescription>
                Dispositivos con sesión activa en tu cuenta
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-3">
              {[
                {
                  device: 'Chrome en Windows',
                  location: 'Santiago, Chile',
                  lastActive: 'Ahora',
                  current: true,
                },
                {
                  device: 'Safari en iPhone',
                  location: 'Santiago, Chile',
                  lastActive: 'Hace 2 horas',
                  current: false,
                },
              ].map((session, idx) => (
                <div
                  key={idx}
                  className="flex items-center justify-between p-4 rounded-lg border border-border"
                >
                  <div>
                    <div className="flex items-center gap-2 mb-1">
                      <p className="font-medium">{session.device}</p>
                      {session.current && (
                        <Badge className="bg-[#2D9D78] text-white">Actual</Badge>
                      )}
                    </div>
                    <p className="text-sm text-muted-foreground">
                      {session.location} • {session.lastActive}
                    </p>
                  </div>
                  {!session.current && (
                    <Button variant="outline" size="sm">
                      Cerrar Sesión
                    </Button>
                  )}
                </div>
              ))}
            </CardContent>
          </Card>
        </TabsContent>

        {/* Notifications Tab */}
        <TabsContent value="notifications" className="space-y-6">
          <Card>
            <CardHeader>
              <CardTitle>Preferencias de Notificaciones</CardTitle>
              <CardDescription>
                Configura cómo y cuándo deseas recibir notificaciones
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-6">
              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <p className="font-medium mb-1">Notificaciones por Email</p>
                  <p className="text-sm text-muted-foreground">
                    Recibe actualizaciones importantes en tu correo
                  </p>
                </div>
                <Switch
                  checked={emailNotifications}
                  onCheckedChange={setEmailNotifications}
                />
              </div>

              <Separator />

              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <p className="font-medium mb-1">Actualizaciones de Datos</p>
                  <p className="text-sm text-muted-foreground">
                    Notificaciones cuando se añaden nuevos datos territoriales
                  </p>
                </div>
                <Switch
                  checked={dataUpdates}
                  onCheckedChange={setDataUpdates}
                />
              </div>

              <Separator />

              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <p className="font-medium mb-1">Actualizaciones de Plataforma</p>
                  <p className="text-sm text-muted-foreground">
                    Changelog y nuevas funcionalidades de Simbioma
                  </p>
                </div>
                <Switch
                  checked={platformUpdates}
                  onCheckedChange={setPlatformUpdates}
                />
              </div>

              <Separator />

              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <p className="font-medium mb-1">Reportes Semanales</p>
                  <p className="text-sm text-muted-foreground">
                    Resumen semanal de indicadores y actividad
                  </p>
                </div>
                <Switch
                  checked={weeklyReports}
                  onCheckedChange={setWeeklyReports}
                />
              </div>

              <Separator />

              <div className="flex justify-end">
                <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
                  <Save className="w-4 h-4 mr-2" />
                  Guardar Preferencias
                </Button>
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  );
}
