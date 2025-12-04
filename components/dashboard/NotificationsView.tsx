import { useState } from 'react';
import {
  Sparkles,
  Database,
  CheckCircle2,
  Zap,
  Calendar,
  Droplets,
  Wind,
  Leaf,
  Recycle,
  TreePine,
  Lightbulb,
  TrendingUp,
  Filter,
} from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs';
import { Badge } from '../ui/badge';
import { Button } from '../ui/button';

const platformUpdates = [
  {
    id: 1,
    type: 'nuevo',
    category: 'Módulo',
    title: 'Nueva funcionalidad: Exportación de datos SINADER',
    description:
      'Ahora puedes exportar tus reportes del Sistema Nacional de Declaración de Residuos en formato PDF y Excel para facilitar su envío y respaldo.',
    date: '24 Nov 2024',
    version: 'v1.2.0',
  },
  {
    id: 2,
    type: 'mejora',
    category: 'Mejora',
    title: 'Optimización en indicadores territoriales',
    description:
      'Actualización automática de datos climáticos en tiempo real. Los gráficos ahora se actualizan cada 15 minutos con información de estaciones meteorológicas.',
    date: '20 Nov 2024',
    version: 'v1.1.5',
  },
  {
    id: 3,
    type: 'nuevo',
    category: 'Módulo',
    title: 'Visor Nacional de Indicadores',
    description:
      'Compara tu municipio con otras comunas del país. Incluye ranking nacional, promedio y mediana, y visualización de tendencias comparativas.',
    date: '15 Nov 2024',
    version: 'v1.1.0',
  },
  {
    id: 4,
    type: 'pronto',
    category: 'Próximamente',
    title: 'Módulo de Proyectos Ambientales',
    description:
      'Gestión completa de proyectos con seguimiento de KPIs, cronogramas y objetivos de sostenibilidad. Incluye integración con calendario de hitos.',
    date: 'Dic 2024',
    version: 'v1.3.0',
  },
  {
    id: 5,
    type: 'mejora',
    category: 'Mejora',
    title: 'Mejoras en calendario de hitos',
    description:
      'Añadido el calendario ambiental de Chile con fechas clave automáticas: Día Mundial del Agua, Día de la Tierra, plazos SINADER, entre otros.',
    date: '10 Nov 2024',
    version: 'v1.0.8',
  },
  {
    id: 6,
    type: 'pronto',
    category: 'Próximamente',
    title: 'Integración con API de Ministerio del Medio Ambiente',
    description:
      'Sincronización automática con datos oficiales de calidad del aire, emisiones y residuos directamente desde fuentes gubernamentales.',
    date: 'Ene 2025',
    version: 'v1.4.0',
  },
];

const dataUpdates = [
  {
    id: 1,
    category: 'Clima',
    icon: <Wind className="w-5 h-5" />,
    color: '#1E5F8C',
    title: 'Datos de precipitaciones actualizados',
    description:
      'Se han añadido datos de precipitaciones de Noviembre 2024 para la Región Metropolitana. Total acumulado: 12.5 mm.',
    date: '26 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 2,
    category: 'Calidad del Aire',
    icon: <Wind className="w-5 h-5" />,
    color: '#2D9D78',
    title: 'Actualización semanal de PM2.5 y PM10',
    description:
      'Datos de calidad del aire actualizados con promedios semanales. Calidad: Buena (ICA: 42).',
    date: '25 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 3,
    category: 'Residuos',
    icon: <Recycle className="w-5 h-5" />,
    color: '#F5A623',
    title: 'Reporte mensual de residuos municipales',
    description:
      'Total de residuos recolectados en Octubre 2024: 4,250 toneladas. Reciclaje: 18% (+3% vs mes anterior).',
    date: '23 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 4,
    category: 'Agua',
    icon: <Droplets className="w-5 h-5" />,
    color: '#1E5F8C',
    title: 'Consumo de agua potable - Datos Octubre 2024',
    description:
      'Consumo promedio residencial: 15.8 m³/vivienda/mes. Reducción del 5% respecto al mismo período 2023.',
    date: '20 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 5,
    category: 'Energía',
    icon: <Zap className="w-5 h-5" />,
    color: '#F59E0B',
    title: 'Datos de consumo eléctrico residencial',
    description:
      'Consumo promedio: 285 kWh/vivienda/mes. Se observa incremento estacional (+8%) por uso de calefacción.',
    date: '18 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 6,
    category: 'Biodiversidad',
    icon: <TreePine className="w-5 h-5" />,
    color: '#10B981',
    title: 'Actualización del inventario de áreas verdes',
    description:
      'Nuevos datos: 125 hectáreas de áreas verdes urbanas. Ratio: 4.2 m²/habitante (+0.3 m² vs 2023).',
    date: '15 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 7,
    category: 'Clima',
    icon: <Wind className="w-5 h-5" />,
    color: '#1E5F8C',
    title: 'Temperaturas promedio - Primavera 2024',
    description:
      'Temperatura media de Primavera: 18.5°C. Máximas: 28°C, Mínimas: 8°C. +1.2°C sobre promedio histórico.',
    date: '12 Nov 2024',
    municipality: 'Peñalolén',
  },
  {
    id: 8,
    category: 'Áreas Verdes',
    icon: <Leaf className="w-5 h-5" />,
    color: '#2D9D78',
    title: 'Reforestación urbana - Nuevos árboles plantados',
    description:
      'Campaña de forestación: 350 árboles nativos plantados en espacios públicos durante Noviembre 2024.',
    date: '10 Nov 2024',
    municipality: 'Peñalolén',
  },
];

export function NotificationsView() {
  const [selectedCategory, setSelectedCategory] = useState<string>('all');

  const categories = [
    { id: 'all', label: 'Todas', count: dataUpdates.length },
    { id: 'Clima', label: 'Clima', count: 3 },
    { id: 'Residuos', label: 'Residuos', count: 1 },
    { id: 'Agua', label: 'Agua', count: 1 },
    { id: 'Energía', label: 'Energía', count: 1 },
    { id: 'Biodiversidad', label: 'Biodiversidad', count: 1 },
    { id: 'Áreas Verdes', label: 'Áreas Verdes', count: 1 },
  ];

  const filteredDataUpdates =
    selectedCategory === 'all'
      ? dataUpdates
      : dataUpdates.filter((update) => update.category === selectedCategory);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl mb-2">Centro de Notificaciones</h1>
        <p className="text-muted-foreground">
          Mantente informado sobre actualizaciones de la plataforma y nuevos datos territoriales
        </p>
      </div>

      <Tabs defaultValue="platform" className="space-y-6">
        <TabsList className="grid w-full grid-cols-2 max-w-md">
          <TabsTrigger value="platform" className="flex items-center gap-2">
            <Sparkles className="w-4 h-4" />
            Plataforma
          </TabsTrigger>
          <TabsTrigger value="data" className="flex items-center gap-2">
            <Database className="w-4 h-4" />
            Datos
          </TabsTrigger>
        </TabsList>

        {/* Platform Updates Tab */}
        <TabsContent value="platform" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Changelog y Hoja de Ruta</CardTitle>
              <CardDescription>
                Nuevas funcionalidades, mejoras y próximas actualizaciones de Simbioma
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              {platformUpdates.map((update) => (
                <div
                  key={update.id}
                  className="flex items-start gap-4 p-5 rounded-lg border border-border hover:bg-muted/50 transition-colors"
                >
                  <div className="flex-shrink-0 mt-1">
                    {update.type === 'nuevo' && (
                      <div className="p-3 bg-[#2D9D78]/10 rounded-lg">
                        <Zap className="w-6 h-6 text-[#2D9D78]" />
                      </div>
                    )}
                    {update.type === 'mejora' && (
                      <div className="p-3 bg-[#1E5F8C]/10 rounded-lg">
                        <CheckCircle2 className="w-6 h-6 text-[#1E5F8C]" />
                      </div>
                    )}
                    {update.type === 'pronto' && (
                      <div className="p-3 bg-muted rounded-lg">
                        <Calendar className="w-6 h-6 text-muted-foreground" />
                      </div>
                    )}
                  </div>

                  <div className="flex-1 min-w-0">
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <h3 className="font-medium text-lg">{update.title}</h3>
                      {update.type === 'nuevo' && (
                        <Badge className="bg-[#2D9D78] text-white flex-shrink-0">
                          Nuevo
                        </Badge>
                      )}
                      {update.type === 'mejora' && (
                        <Badge className="bg-[#1E5F8C] text-white flex-shrink-0">
                          Mejora
                        </Badge>
                      )}
                      {update.type === 'pronto' && (
                        <Badge variant="outline" className="flex-shrink-0">
                          Próximamente
                        </Badge>
                      )}
                    </div>
                    <p className="text-sm text-muted-foreground mb-3">
                      {update.description}
                    </p>
                    <div className="flex items-center gap-4 text-xs text-muted-foreground">
                      <span>{update.date}</span>
                      <span>•</span>
                      <span className="font-mono">{update.version}</span>
                    </div>
                  </div>
                </div>
              ))}
            </CardContent>
          </Card>

          {/* Roadmap Preview */}
          <Card className="bg-gradient-to-br from-[#2D9D78]/5 to-[#1E5F8C]/5 border-[#2D9D78]">
            <CardHeader>
              <div className="flex items-center gap-2">
                <Lightbulb className="w-5 h-5 text-[#F5A623]" />
                <CardTitle>Hoja de Ruta 2025</CardTitle>
              </div>
              <CardDescription>
                Próximas funcionalidades planificadas
              </CardDescription>
            </CardHeader>
            <CardContent>
              <div className="space-y-3">
                {[
                  { quarter: 'Q1 2025', feature: 'Módulo de Proyectos Ambientales' },
                  {
                    quarter: 'Q1 2025',
                    feature: 'Integración API Ministerio del Medio Ambiente',
                  },
                  { quarter: 'Q2 2025', feature: 'App móvil iOS y Android' },
                  {
                    quarter: 'Q2 2025',
                    feature: 'Sistema de alertas automáticas por umbrales',
                  },
                  { quarter: 'Q3 2025', feature: 'IA para predicción de tendencias' },
                ].map((item, idx) => (
                  <div
                    key={idx}
                    className="flex items-center gap-3 p-3 bg-card rounded-lg"
                  >
                    <Badge variant="outline" className="flex-shrink-0">
                      {item.quarter}
                    </Badge>
                    <p className="text-sm">{item.feature}</p>
                  </div>
                ))}
              </div>
            </CardContent>
          </Card>
        </TabsContent>

        {/* Data Updates Tab */}
        <TabsContent value="data" className="space-y-4">
          {/* Category Filter */}
          <Card>
            <CardHeader>
              <div className="flex items-center gap-2">
                <Filter className="w-5 h-5" />
                <CardTitle>Filtrar por Categoría</CardTitle>
              </div>
            </CardHeader>
            <CardContent>
              <div className="flex flex-wrap gap-2">
                {categories.map((cat) => (
                  <Button
                    key={cat.id}
                    variant={selectedCategory === cat.id ? 'default' : 'outline'}
                    size="sm"
                    onClick={() => setSelectedCategory(cat.id)}
                    className={
                      selectedCategory === cat.id
                        ? 'bg-[#2D9D78] hover:bg-[#2D9D78]/90'
                        : ''
                    }
                  >
                    {cat.label}
                    <Badge
                      variant="secondary"
                      className="ml-2 bg-background text-foreground"
                    >
                      {cat.count}
                    </Badge>
                  </Button>
                ))}
              </div>
            </CardContent>
          </Card>

          {/* Data Updates List */}
          <Card>
            <CardHeader>
              <CardTitle>Actualizaciones de Datos Territoriales</CardTitle>
              <CardDescription>
                Nuevos conjuntos de datos añadidos a la base de datos de tu municipio
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              {filteredDataUpdates.map((update) => (
                <div
                  key={update.id}
                  className="flex items-start gap-4 p-5 rounded-lg border border-border hover:bg-muted/50 transition-colors"
                >
                  <div
                    className="flex-shrink-0 mt-1 p-3 rounded-lg"
                    style={{ backgroundColor: `${update.color}15` }}
                  >
                    <div style={{ color: update.color }}>{update.icon}</div>
                  </div>

                  <div className="flex-1 min-w-0">
                    <div className="flex items-start justify-between gap-2 mb-2">
                      <div>
                        <Badge
                          variant="outline"
                          className="mb-2"
                          style={{ borderColor: update.color, color: update.color }}
                        >
                          {update.category}
                        </Badge>
                        <h3 className="font-medium text-lg">{update.title}</h3>
                      </div>
                    </div>
                    <p className="text-sm text-muted-foreground mb-3">
                      {update.description}
                    </p>
                    <div className="flex items-center gap-4 text-xs text-muted-foreground">
                      <span>{update.date}</span>
                      <span>•</span>
                      <span>{update.municipality}</span>
                      <Button
                        variant="link"
                        size="sm"
                        className="h-auto p-0 text-[#2D9D78]"
                      >
                        Ver en Indicadores →
                      </Button>
                    </div>
                  </div>
                </div>
              ))}

              {filteredDataUpdates.length === 0 && (
                <div className="text-center py-8 text-muted-foreground">
                  No hay actualizaciones en esta categoría
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  );
}
