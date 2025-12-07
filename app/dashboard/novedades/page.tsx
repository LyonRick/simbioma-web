"use client";

import { useState } from 'react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Badge } from '@/components/ui/badge';
import { Zap, Database, Map, Calendar, CheckCircle2, AlertCircle } from 'lucide-react';
import { PaginationControl } from '@/components/common/PaginationControl';

// Tipos basados en el schema SQL
type UpdateCategory = 'platform' | 'data' | 'roadmap';
type UpdateType = 'new' | 'improvement' | 'fix' | 'announcement';

interface PlatformUpdate {
    id: string;
    title: string;
    description: string;
    category: UpdateCategory;
    type: UpdateType;
    version?: string;
    date: string; // Fecha de publicación o creación
    scheduledFor?: string; // Para roadmap: "Q1 2025", "Enero 2025"
}

// Datos Mock (Simulando DB)
const updatesData: PlatformUpdate[] = [
    // PLATAFORMA
    {
        id: '1',
        title: 'Nueva funcionalidad: Exportación de datos SINADER',
        description: 'Ahora puedes exportar tus reportes del Sistema Nacional de Declaración de Residuos en formato PDF y Excel para facilitar su envío y respaldo.',
        category: 'platform',
        type: 'new',
        version: 'v1.2.0',
        date: '2024-11-24',
    },
    {
        id: '2',
        title: 'Optimización en indicadores territoriales',
        description: 'Actualización automática de datos climáticos en tiempo real. Los gráficos ahora se actualizan cada 15 minutos con información de estaciones meteorológicas.',
        category: 'platform',
        type: 'improvement',
        version: 'v1.1.5',
        date: '2024-11-20',
    },
    {
        id: '3',
        title: 'Visor Nacional de Indicadores',
        description: 'Compara tu municipio con otras comunas del país. Incluye ranking nacional, promedio y mediana, y visualización geográfica interactiva.',
        category: 'platform',
        type: 'new',
        version: 'v1.1.0',
        date: '2024-11-15',
    },
    {
        id: '4',
        title: 'Corrección en carga de archivos masivos',
        description: 'Se solucionó un problema que impedía subir archivos Excel de más de 5MB en el módulo de gestión documental.',
        category: 'platform',
        type: 'fix',
        version: 'v1.0.8',
        date: '2024-11-10',
    },

    // DATOS
    {
        id: '5',
        title: 'Actualización de Factores de Emisión 2024',
        description: 'Se han actualizado los factores de emisión para el cálculo de Huella de Carbono según la última normativa del Ministerio de Energía.',
        category: 'data',
        type: 'improvement',
        date: '2024-12-01',
    },
    {
        id: '6',
        title: 'Nuevos datasets de Biodiversidad',
        description: 'Incorporación de catastro de especies nativas zona central actualizado al 2024.',
        category: 'data',
        type: 'new',
        date: '2024-11-28',
    },

    // ROADMAP (Hoja de Ruta)
    {
        id: '7',
        title: 'Módulo de Proyectos Ambientales',
        description: 'Gestión integral de proyectos con seguimiento financiero y de hitos.',
        category: 'roadmap',
        type: 'new',
        date: '2024-12-01',
        scheduledFor: 'Q1 2025',
    },
    {
        id: '8',
        title: 'Integración API Ministerio del Medio Ambiente',
        description: 'Sincronización automática con datos oficiales de calidad del aire, emisiones y residuos directamente desde fuentes gubernamentales.',
        category: 'roadmap',
        type: 'new',
        date: '2024-12-01',
        scheduledFor: 'Q1 2025',
    },
    {
        id: '9',
        title: 'App móvil iOS y Android',
        description: 'Versión móvil para levantamiento de datos en terreno y alertas en tiempo real.',
        category: 'roadmap',
        type: 'new',
        date: '2024-12-01',
        scheduledFor: 'Q2 2025',
    },
    {
        id: '10',
        title: 'Sistema de alertas automáticas por umbrales',
        description: 'Configuración de notificaciones push cuando indicadores críticos superen valores definidos.',
        category: 'roadmap',
        type: 'improvement',
        date: '2024-12-01',
        scheduledFor: 'Q2 2025',
    },
    {
        id: '11',
        title: 'IA para predicción de tendencias',
        description: 'Modelos predictivos para anticipar escenarios ambientales basados en datos históricos.',
        category: 'roadmap',
        type: 'new',
        date: '2024-12-01',
        scheduledFor: 'Q3 2025',
    },
];

export default function NovedadesPage() {
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 5;

    const getBadgeColor = (type: UpdateType) => {
        switch (type) {
            case 'new': return 'bg-emerald-500 hover:bg-emerald-600';
            case 'improvement': return 'bg-blue-500 hover:bg-blue-600';
            case 'fix': return 'bg-amber-500 hover:bg-amber-600';
            case 'announcement': return 'bg-purple-500 hover:bg-purple-600';
            default: return 'bg-gray-500';
        }
    };

    const getBadgeLabel = (type: UpdateType) => {
        switch (type) {
            case 'new': return 'Nuevo';
            case 'improvement': return 'Mejora';
            case 'fix': return 'Corrección';
            case 'announcement': return 'Anuncio';
            default: return type;
        }
    };

    const getIcon = (type: UpdateType) => {
        switch (type) {
            case 'new': return <Zap className="w-5 h-5 text-emerald-600" />;
            case 'improvement': return <CheckCircle2 className="w-5 h-5 text-blue-600" />;
            case 'fix': return <AlertCircle className="w-5 h-5 text-amber-600" />;
            default: return <Zap className="w-5 h-5" />;
        }
    };

    const renderUpdateCard = (update: PlatformUpdate) => (
        <Card key={update.id} className="mb-4 hover:shadow-md transition-shadow">
            <CardContent className="p-6">
                <div className="flex items-start gap-4">
                    <div className={`p-3 rounded-lg bg-muted/50 flex-shrink-0`}>
                        {update.category === 'roadmap' ? <Calendar className="w-5 h-5 text-primary" /> : getIcon(update.type)}
                    </div>
                    <div className="flex-1 min-w-0">
                        <div className="flex items-center justify-between gap-2 mb-2">
                            <h3 className="text-lg font-semibold truncate pr-2">{update.title}</h3>
                            <Badge className={`${getBadgeColor(update.type)} text-white border-0`}>
                                {update.scheduledFor ? 'Próximamente' : getBadgeLabel(update.type)}
                            </Badge>
                        </div>
                        <p className="text-muted-foreground mb-3 text-sm leading-relaxed">
                            {update.description}
                        </p>
                        <div className="flex items-center gap-3 text-xs text-muted-foreground font-medium">
                            {update.scheduledFor ? (
                                <span className="flex items-center gap-1 text-primary font-bold bg-primary/10 px-2 py-1 rounded">
                                    <Calendar className="w-3 h-3" />
                                    {update.scheduledFor}
                                </span>
                            ) : (
                                <span>{new Date(update.date).toLocaleDateString('es-CL', { day: 'numeric', month: 'short', year: 'numeric' })}</span>
                            )}
                            {update.version && (
                                <>
                                    <span>•</span>
                                    <span className="font-mono bg-muted px-1.5 py-0.5 rounded">{update.version}</span>
                                </>
                            )}
                        </div>
                    </div>
                </div>
            </CardContent>
        </Card>
    );

    const filterUpdates = (category: UpdateCategory) => {
        return updatesData.filter(u => u.category === category);
    };

    const paginate = (items: PlatformUpdate[]) => {
        const startIndex = (currentPage - 1) * itemsPerPage;
        return items.slice(startIndex, startIndex + itemsPerPage);
    };

    return (
        <div className="space-y-6 max-w-5xl mx-auto">
            <div>
                <h1 className="text-3xl font-bold mb-2">Centro de Novedades</h1>
                <p className="text-muted-foreground">
                    Mantente informado sobre actualizaciones de la plataforma, nuevos datos territoriales y nuestra hoja de ruta.
                </p>
            </div>

            <Tabs defaultValue="platform" className="space-y-6" onValueChange={() => setCurrentPage(1)}>
                <TabsList className="grid w-full grid-cols-3 lg:w-[400px]">
                    <TabsTrigger value="platform" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Zap className="w-4 h-4" />
                        Plataforma
                    </TabsTrigger>
                    <TabsTrigger value="data" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Database className="w-4 h-4" />
                        Datos
                    </TabsTrigger>
                    <TabsTrigger value="roadmap" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                        <Map className="w-4 h-4" />
                        Hoja de Ruta
                    </TabsTrigger>
                </TabsList>

                <TabsContent value="platform" className="space-y-6">
                    <div className="space-y-1">
                        <h2 className="text-lg font-semibold">Changelog de Plataforma</h2>
                        <p className="text-sm text-muted-foreground mb-4">Nuevas funcionalidades y mejoras técnicas desplegadas.</p>
                        {paginate(filterUpdates('platform')).map(renderUpdateCard)}
                    </div>
                    <PaginationControl
                        currentPage={currentPage}
                        totalPages={Math.ceil(filterUpdates('platform').length / itemsPerPage)}
                        onPageChange={setCurrentPage}
                    />
                </TabsContent>

                <TabsContent value="data" className="space-y-6">
                    <div className="space-y-1">
                        <h2 className="text-lg font-semibold">Actualizaciones de Datos</h2>
                        <p className="text-sm text-muted-foreground mb-4">Nuevos datasets, factores de emisión y actualizaciones territoriales.</p>
                        {paginate(filterUpdates('data')).map(renderUpdateCard)}
                    </div>
                    <PaginationControl
                        currentPage={currentPage}
                        totalPages={Math.ceil(filterUpdates('data').length / itemsPerPage)}
                        onPageChange={setCurrentPage}
                    />
                </TabsContent>

                <TabsContent value="roadmap" className="space-y-6">
                    <div className="space-y-1">
                        <h2 className="text-lg font-semibold text-primary">Hoja de Ruta 2025</h2>
                        <p className="text-sm text-muted-foreground mb-4">Próximas funcionalidades planificadas para Simbioma.</p>

                        <Card className="mb-6 border-2 border-primary/20 bg-card">
                            <CardContent className="p-6">
                                <div className="flex items-start gap-4">
                                    <div className="p-3 bg-primary/10 rounded-full">
                                        <Map className="w-6 h-6 text-primary" />
                                    </div>
                                    <div>
                                        <h3 className="text-lg font-bold text-foreground mb-1">Nuestra Visión 2025</h3>
                                        <p className="text-muted-foreground text-sm leading-relaxed">
                                            Estamos construyendo el sistema operativo ambiental más completo para gobiernos locales.
                                            Este año nos enfocaremos en la integración profunda de datos (IoT, APIs gubernamentales)
                                            y en herramientas predictivas basadas en IA.
                                        </p>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>

                        {paginate(filterUpdates('roadmap')).map(renderUpdateCard)}
                    </div>
                    <PaginationControl
                        currentPage={currentPage}
                        totalPages={Math.ceil(filterUpdates('roadmap').length / itemsPerPage)}
                        onPageChange={setCurrentPage}
                    />
                </TabsContent>
            </Tabs>
        </div>
    );
}
