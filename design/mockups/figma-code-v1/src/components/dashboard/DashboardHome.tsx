import {
  AlertTriangle,
  TrendingUp,
  TrendingDown,
  Cloud,
  Droplets,
  Recycle,
  Wind,
  CheckCircle2,
  Clock,
  Sparkles,
  Zap,
  Calendar,
  ArrowUpRight,
} from 'lucide-react';
import { Alert, AlertDescription, AlertTitle } from '../ui/alert';
import { Button } from '../ui/button';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Badge } from '../ui/badge';
import { Progress } from '../ui/progress';
import {
  AreaChart,
  Area,
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  LineChart,
  Line,
} from 'recharts';
import { CalendarWidget } from './CalendarWidget';
import { ChartContainer } from '../ui/ChartExport';

interface DashboardHomeProps {
  onNavigate: (view: string) => void;
}

// Datos mock para gráficos con más detalle
const recyclingData = [
  { month: 'Ene', value: 1850 },
  { month: 'Feb', value: 1920 },
  { month: 'Mar', value: 2010 },
  { month: 'Abr', value: 1980 },
  { month: 'May', value: 2050 },
  { month: 'Jun', value: 2100 },
  { month: 'Jul', value: 2080 },
  { month: 'Ago', value: 2120 },
  { month: 'Sep', value: 2150 },
  { month: 'Oct', value: 2180 },
  { month: 'Nov', value: 2200 },
  { month: 'Dic', value: 2150 },
];

const rankingData = [
  { municipality: 'Las Condes', value: 8.5, isCurrent: false },
  { municipality: 'Providencia', value: 7.2, isCurrent: false },
  { municipality: 'Vitacura', value: 6.8, isCurrent: false },
  { municipality: 'La Reina', value: 5.9, isCurrent: false },
  { municipality: 'Ñuñoa', value: 5.5, isCurrent: false },
  { municipality: 'Lo Barnechea', value: 5.1, isCurrent: false },
  { municipality: 'La Florida', value: 4.8, isCurrent: false },
  { municipality: 'Peñalolén', value: 4.2, isCurrent: true },
  { municipality: 'Macul', value: 3.8, isCurrent: false },
  { municipality: 'Santiago', value: 3.5, isCurrent: false },
];

const novedades = [
  {
    id: 1,
    tipo: 'nuevo',
    titulo: 'Nueva funcionalidad: Exportación de datos SINADER',
    descripcion: 'Ahora puedes exportar tus reportes en formato PDF y Excel.',
    fecha: '24 Nov 2024',
  },
  {
    id: 2,
    tipo: 'mejora',
    titulo: 'Mejora en indicadores territoriales',
    descripcion: 'Actualización automática de datos climáticos en tiempo real.',
    fecha: '20 Nov 2024',
  },
  {
    id: 3,
    tipo: 'pronto',
    titulo: 'Próximamente: Módulo de Proyectos Ambientales',
    descripcion: 'Gestión completa de proyectos con seguimiento de KPIs.',
    fecha: 'Dic 2024',
  },
];

export function DashboardHome({ onNavigate }: DashboardHomeProps) {
  // Calcular días restantes para SINADER
  const deadline = new Date('2024-12-15');
  const today = new Date();
  const daysRemaining = Math.ceil((deadline.getTime() - today.getTime()) / (1000 * 60 * 60 * 24));

  return (
    <div className="space-y-8">
      {/* === BENTO GRID: Alert + Calendar (2 columns) === */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* SINADER Alert Card - Compact */}
        <Card className="border-l-4 border-l-orange-500 bg-orange-50 dark:bg-orange-950/30">
          <CardHeader className="pb-4">
            <div className="flex items-start justify-between">
              <div className="flex items-center gap-3">
                <div className="p-2 bg-orange-100 dark:bg-orange-900/50 rounded-lg">
                  <AlertTriangle className="h-6 w-6 text-orange-600 dark:text-orange-400" />
                </div>
                <div>
                  <CardTitle className="text-lg">Reporte SINADER 2024</CardTitle>
                  <p className="text-sm text-muted-foreground mt-1">
                    Vence: 15 Diciembre 2024
                  </p>
                </div>
              </div>
              <Badge variant="destructive" className="text-xs">
                {daysRemaining} días
              </Badge>
            </div>
          </CardHeader>
          <CardContent className="space-y-4">
            {/* Progress Bar */}
            <div>
              <div className="flex items-center justify-between mb-2">
                <span className="text-sm font-medium">Progreso General</span>
                <span className="text-sm font-semibold">12 de 20 secciones</span>
              </div>
              <Progress value={60} className="h-2" />
              <p className="text-xs text-muted-foreground mt-1">60% completado</p>
            </div>

            {/* Pending Sections */}
            <div className="bg-card rounded-lg p-3 max-h-32 overflow-y-auto">
              <p className="text-sm font-medium mb-2">Pendientes:</p>
              <ul className="space-y-1 text-sm text-muted-foreground">
                <li>• Anexo C - Residuos Peligrosos</li>
                <li>• Tabla 3.2 - Tasa de Reciclaje</li>
                <li>• Declaración Jurada (firma digital)</li>
                <li>• Informe de Verificación Externa</li>
              </ul>
            </div>

            {/* CTA Button */}
            <Button
              onClick={() => onNavigate('sinader')}
              className="w-full bg-orange-600 hover:bg-orange-700"
            >
              Continuar Reporte
              <ArrowUpRight className="w-4 h-4 ml-2" />
            </Button>
          </CardContent>
        </Card>

        {/* Calendar Widget - Compact */}
        <CalendarWidget compact={true} />
      </div>

      {/* === KPI ROW: 3 Cards === */}
      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {/* KPI 1: Reciclaje */}
        <Card className="hover:shadow-md transition-all duration-200">
          <CardContent className="pt-6">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="label-uppercase text-muted-foreground">Reciclaje</span>
                <Recycle className="w-5 h-5 text-primary" />
              </div>
              <div className="space-y-1">
                <p className="text-4xl font-bold tabular-nums">2,150</p>
                <p className="text-sm text-muted-foreground">toneladas/mes</p>
              </div>
              <div className="flex items-center gap-2">
                <Badge className="bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400">
                  <TrendingUp className="w-3 h-3 mr-1" />
                  +18%
                </Badge>
                <span className="text-xs text-muted-foreground">vs 2023</span>
              </div>
              {/* Mini Sparkline */}
              <ResponsiveContainer width="100%" height={40}>
                <LineChart data={recyclingData.slice(-6)}>
                  <Line
                    type="monotone"
                    dataKey="value"
                    stroke="#059669"
                    strokeWidth={2}
                    dot={false}
                  />
                </LineChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>

        {/* KPI 2: PM2.5 */}
        <Card className="hover:shadow-md transition-all duration-200">
          <CardContent className="pt-6">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="label-uppercase text-muted-foreground">Calidad Aire</span>
                <Wind className="w-5 h-5 text-secondary" />
              </div>
              <div className="space-y-1">
                <p className="text-4xl font-bold tabular-nums">42</p>
                <p className="text-sm text-muted-foreground">µg/m³ PM2.5</p>
              </div>
              <div className="flex items-center gap-2">
                <Badge className="bg-yellow-100 text-yellow-800 dark:bg-yellow-900/30 dark:text-yellow-400">
                  <AlertTriangle className="w-3 h-3 mr-1" />
                  Meta &lt;15
                </Badge>
                <span className="text-xs text-muted-foreground">MINSAL</span>
              </div>
              {/* Mini Sparkline */}
              <ResponsiveContainer width="100%" height={40}>
                <LineChart
                  data={[
                    { v: 45 },
                    { v: 48 },
                    { v: 44 },
                    { v: 46 },
                    { v: 43 },
                    { v: 42 },
                  ]}
                >
                  <Line
                    type="monotone"
                    dataKey="v"
                    stroke="#0E7490"
                    strokeWidth={2}
                    dot={false}
                  />
                </LineChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>

        {/* KPI 3: Temperatura */}
        <Card className="hover:shadow-md transition-all duration-200">
          <CardContent className="pt-6">
            <div className="space-y-3">
              <div className="flex items-center justify-between">
                <span className="label-uppercase text-muted-foreground">Temperatura</span>
                <Cloud className="w-5 h-5 text-accent" />
              </div>
              <div className="space-y-1">
                <p className="text-4xl font-bold tabular-nums">21°C</p>
                <p className="text-sm text-muted-foreground">promedio mensual</p>
              </div>
              <div className="flex items-center gap-2">
                <Badge className="bg-orange-100 text-orange-800 dark:bg-orange-900/30 dark:text-orange-400">
                  <TrendingUp className="w-3 h-3 mr-1" />
                  +2°C
                </Badge>
                <span className="text-xs text-muted-foreground">vs histórico</span>
              </div>
              {/* Mini Sparkline */}
              <ResponsiveContainer width="100%" height={40}>
                <LineChart
                  data={[
                    { v: 18 },
                    { v: 19 },
                    { v: 20 },
                    { v: 19.5 },
                    { v: 20.5 },
                    { v: 21 },
                  ]}
                >
                  <Line
                    type="monotone"
                    dataKey="v"
                    stroke="#EA580C"
                    strokeWidth={2}
                    dot={false}
                  />
                </LineChart>
              </ResponsiveContainer>
            </div>
          </CardContent>
        </Card>
      </div>

      {/* === CHART SECTION: 2/3 + 1/3 Split === */}
      <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {/* Main Chart - 2 columns */}
        <div className="lg:col-span-2">
          <ChartContainer title="Tendencia Anual - Reciclaje" exportable={true}>
            <ResponsiveContainer width="100%" height={280}>
              <AreaChart data={recyclingData}>
                <defs>
                  <linearGradient id="recyclingGradient" x1="0" y1="0" x2="0" y2="1">
                    <stop offset="0%" stopColor="#059669" stopOpacity={0.3} />
                    <stop offset="100%" stopColor="#059669" stopOpacity={0} />
                  </linearGradient>
                </defs>
                <CartesianGrid
                  strokeDasharray="4 4"
                  stroke="rgba(0,0,0,0.1)"
                  vertical={false}
                />
                <XAxis
                  dataKey="month"
                  tick={{ fontSize: 13, fill: '#71717A' }}
                  tickLine={false}
                  axisLine={false}
                />
                <YAxis
                  tick={{ fontSize: 13, fill: '#71717A' }}
                  tickLine={false}
                  axisLine={false}
                />
                <Tooltip
                  contentStyle={{
                    background: 'white',
                    border: '1px solid #E5E7EB',
                    borderRadius: '8px',
                    padding: '12px',
                    boxShadow: '0 4px 6px rgba(0,0,0,0.1)',
                  }}
                />
                <Area
                  type="monotone"
                  dataKey="value"
                  stroke="#059669"
                  strokeWidth={3}
                  fill="url(#recyclingGradient)"
                />
              </AreaChart>
            </ResponsiveContainer>
            {/* Insight Box */}
            <div className="mt-4 p-4 bg-emerald-50 dark:bg-emerald-950/30 border-l-4 border-emerald-500 rounded-lg">
              <div className="flex items-start gap-3">
                <TrendingUp className="w-5 h-5 text-emerald-600 dark:text-emerald-400 flex-shrink-0 mt-0.5" />
                <div>
                  <p className="font-medium text-sm">Insight Clave</p>
                  <p className="text-sm text-muted-foreground mt-1">
                    +18% vs 2023, meta anual superada. Tendencia sostenida desde
                    implementación del programa de reciclaje domiciliario.
                  </p>
                </div>
              </div>
            </div>
          </ChartContainer>
        </div>

        {/* Rankings - 1 column */}
        <Card className="flex flex-col">
          <CardHeader>
            <div className="flex items-center justify-between">
              <CardTitle className="text-base">Top 10 Comunas</CardTitle>
              <Button
                variant="ghost"
                size="sm"
                className="h-8 text-xs"
                onClick={() => onNavigate('indicadores')}
              >
                Ver Ranking →
              </Button>
            </div>
            <CardDescription className="text-xs">
              Áreas verdes por habitante
            </CardDescription>
          </CardHeader>
          <CardContent className="flex-1 overflow-y-auto">
            <div className="space-y-2">
              {rankingData.map((item, idx) => (
                <div
                  key={idx}
                  className={`flex items-center justify-between p-2 rounded-lg transition-colors ${
                    item.isCurrent
                      ? 'bg-emerald-50 dark:bg-emerald-950/30 border-2 border-emerald-500'
                      : 'bg-muted'
                  }`}
                >
                  <div className="flex items-center gap-3 flex-1 min-w-0">
                    <div
                      className={`w-7 h-7 rounded-full flex items-center justify-center text-xs font-semibold flex-shrink-0 ${
                        idx < 3
                          ? 'bg-amber-500 text-white'
                          : item.isCurrent
                          ? 'bg-emerald-500 text-white'
                          : 'bg-background text-foreground'
                      }`}
                    >
                      {idx + 1}
                    </div>
                    <span
                      className={`text-sm truncate ${
                        item.isCurrent ? 'font-semibold' : ''
                      }`}
                    >
                      {item.municipality}
                    </span>
                  </div>
                  <span className="text-sm font-semibold tabular-nums flex-shrink-0">
                    {item.value} m²
                  </span>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>

      {/* === NOVEDADES SECTION === */}
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
        {/* Grid de Calendario y Novedades */}
        {/* Novedades de Simbioma */}
        <Card className="rounded-xl shadow-md">
          <CardHeader>
            <div className="flex items-center gap-2">
              <Sparkles className="w-5 h-5 text-primary" />
              <CardTitle>Novedades de Simbioma</CardTitle>
            </div>
            <CardDescription>Últimas actualizaciones de la plataforma</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {novedades.slice(0, 3).map((novedad) => (
                <div
                  key={novedad.id}
                  className="flex items-start gap-4 p-4 rounded-lg hover:bg-muted/50 transition-colors border border-border"
                >
                  <div className="flex-shrink-0 mt-1">
                    {novedad.tipo === 'nuevo' && (
                      <div className="p-2 bg-primary/10 rounded-lg">
                        <Zap className="w-5 h-5 text-primary" />
                      </div>
                    )}
                    {novedad.tipo === 'mejora' && (
                      <div className="p-2 bg-secondary/10 rounded-lg">
                        <CheckCircle2 className="w-5 h-5 text-secondary" />
                      </div>
                    )}
                    {novedad.tipo === 'pronto' && (
                      <div className="p-2 bg-muted rounded-lg">
                        <Calendar className="w-5 h-5 text-muted-foreground" />
                      </div>
                    )}
                  </div>
                  <div className="flex-1 min-w-0">
                    <div className="flex items-start justify-between gap-2 mb-1">
                      <h4 className="font-medium">{novedad.titulo}</h4>
                      {novedad.tipo === 'nuevo' && (
                        <Badge className="bg-primary text-white flex-shrink-0">
                          Nuevo
                        </Badge>
                      )}
                      {novedad.tipo === 'mejora' && (
                        <Badge className="bg-secondary text-white flex-shrink-0">
                          Mejora
                        </Badge>
                      )}
                      {novedad.tipo === 'pronto' && (
                        <Badge variant="outline" className="flex-shrink-0">
                          Próximamente
                        </Badge>
                      )}
                    </div>
                    <p className="text-sm text-muted-foreground mb-2">
                      {novedad.descripcion}
                    </p>
                    <p className="text-xs text-muted-foreground">{novedad.fecha}</p>
                  </div>
                </div>
              ))}
            </div>
            <div className="mt-4 text-center">
              <Button variant="outline" onClick={() => onNavigate('novedades')}>
                Ver Todas las Novedades
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
