"use client";

import { useState } from 'react';
import {
    Droplets,
    Wind,
    Zap,
    Recycle,
    TreePine,
    Leaf,
    TrendingUp,
    TrendingDown,
    MapPin,
    Trophy,
    ChevronRight,
    ArrowLeft,
} from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import {
    AreaChart,
    Area,
    BarChart,
    Bar,
    LineChart,
    Line,
    XAxis,
    YAxis,
    CartesianGrid,
    Tooltip,
    ResponsiveContainer,
    Legend,
    Cell,
} from 'recharts';

// Categorías de indicadores (horizontal scroll)
const categories = [
    {
        id: 'clima',
        name: 'Clima',
        icon: <Wind className="w-8 h-8" />,
        color: '#0E7490',
    },
    {
        id: 'agua',
        name: 'Agua',
        icon: <Droplets className="w-8 h-8" />,
        color: '#059669',
    },
    {
        id: 'energia',
        name: 'Energía',
        icon: <Zap className="w-8 h-8" />,
        color: '#F59E0B',
    },
    {
        id: 'residuos',
        name: 'Residuos',
        icon: <Recycle className="w-8 h-8" />,
        color: '#EA580C',
    },
    {
        id: 'calidad-aire',
        name: 'Aire',
        icon: <Wind className="w-8 h-8" />,
        color: '#10B981',
    },
    {
        id: 'biodiversidad',
        name: 'Biodiversidad',
        icon: <TreePine className="w-8 h-8" />,
        color: '#059669',
    },
    {
        id: 'areas-verdes',
        name: 'Áreas Verdes',
        icon: <Leaf className="w-8 h-8" />,
        color: '#10B981',
    },
];

// Indicadores por categoría (lista compacta)
const indicatorsByCategory: Record<string, any[]> = {
    clima: [
        {
            id: 'prec-anual',
            name: 'Precipitación Anual',
            current: '445 mm',
            change: '+5.2%',
            trend: 'up',
            vs: 'promedio 10 años',
        },
        {
            id: 'temp-anual',
            name: 'Temperatura Media Anual',
            current: '18.5°C',
            change: '+1.2°C',
            trend: 'up',
            vs: 'histórico',
        },
        {
            id: 'dias-lluvia',
            name: 'Días con Lluvia',
            current: '87 días',
            change: '-12 días',
            trend: 'down',
            vs: 'promedio',
        },
    ],
    agua: [
        {
            id: 'consumo-residencial',
            name: 'Consumo Promedio Residencial',
            current: '15.8 m³',
            change: '-5%',
            trend: 'down',
            vs: 'período 2023',
        },
    ],
    energia: [
        {
            id: 'consumo-electrico',
            name: 'Consumo Eléctrico Residencial',
            current: '285 kWh',
            change: '+8%',
            trend: 'up',
            vs: 'mes anterior',
        },
    ],
    residuos: [
        {
            id: 'generacion-total',
            name: 'Generación Total de Residuos',
            current: '4,250 ton',
            change: '+3%',
            trend: 'up',
            vs: 'mes anterior',
        },
        {
            id: 'reciclaje',
            name: 'Tasa de Reciclaje',
            current: '18%',
            change: '+3%',
            trend: 'up',
            vs: 'mes anterior',
        },
    ],
    'calidad-aire': [
        {
            id: 'pm25',
            name: 'PM2.5 Promedio',
            current: '42 µg/m³',
            change: 'Meta <15',
            trend: 'up',
            vs: 'MINSAL',
        },
    ],
    biodiversidad: [
        {
            id: 'especies-nativas',
            name: 'Especies Nativas Registradas',
            current: '89',
            change: '+12',
            trend: 'up',
            vs: '2023',
        },
    ],
    'areas-verdes': [
        {
            id: 'ratio-habitante',
            name: 'Ratio m²/Habitante',
            current: '4.2 m²',
            change: '+0.3 m²',
            trend: 'up',
            vs: '2023',
        },
    ],
};

// Datos históricos mock
const historicalData = Array.from({ length: 10 }, (_, i) => ({
    year: (2015 + i).toString(),
    value: 400 + Math.random() * 100,
}));

// Datos ranking nacional
const nationalRankingData = [
    { municipality: 'Las Condes', value: 8.5, rank: 1, isCurrent: false },
    { municipality: 'Providencia', value: 7.2, rank: 2, isCurrent: false },
    { municipality: 'Vitacura', value: 6.8, rank: 3, isCurrent: false },
    { municipality: 'La Reina', value: 5.9, rank: 4, isCurrent: false },
    { municipality: 'Ñuñoa', value: 5.5, rank: 5, isCurrent: false },
    { municipality: 'Lo Barnechea', value: 5.1, rank: 6, isCurrent: false },
    { municipality: 'La Florida', value: 4.8, rank: 7, isCurrent: false },
    { municipality: 'Peñalolén', value: 4.2, rank: 8, isCurrent: true },
    { municipality: 'Macul', value: 3.8, rank: 9, isCurrent: false },
    { municipality: 'Santiago', value: 3.5, rank: 10, isCurrent: false },
];

export default function IndicadoresPage() {
    const [selectedCategory, setSelectedCategory] = useState('clima');
    const [selectedIndicator, setSelectedIndicator] = useState<string | null>(null);
    const [viewMode, setViewMode] = useState<'local' | 'national'>('local');

    const currentCategory = categories.find((cat) => cat.id === selectedCategory);
    const availableIndicators = indicatorsByCategory[selectedCategory] || [];

    // Si hay un indicador seleccionado, mostrar vista detallada
    if (selectedIndicator) {
        const indicator = availableIndicators.find((ind) => ind.id === selectedIndicator);

        return (
            <div className="space-y-6">
                {/* Header con Back Button */}
                <div className="flex items-center gap-4">
                    <Button
                        variant="ghost"
                        size="sm"
                        onClick={() => setSelectedIndicator(null)}
                        className="gap-2 cursor-pointer"
                    >
                        <ArrowLeft className="w-4 h-4" />
                        Volver
                    </Button>
                    <div>
                        <h1 className="text-3xl font-bold">{indicator?.name}</h1>
                        <p className="text-muted-foreground">
                            {currentCategory?.name} • Peñalolén
                        </p>
                    </div>
                </div>

                <Tabs value={viewMode} onValueChange={(v) => setViewMode(v as any)}>
                    <TabsList className="grid w-full grid-cols-2 max-w-md">
                        <TabsTrigger value="local" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                            <MapPin className="w-4 h-4" />
                            Vista Local
                        </TabsTrigger>
                        <TabsTrigger value="national" className="flex items-center gap-2 cursor-pointer data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white transition-all">
                            <Trophy className="w-4 h-4" />
                            Visor Nacional
                        </TabsTrigger>
                    </TabsList>

                    {/* Vista Local - Above the Fold */}
                    <TabsContent value="local" className="space-y-6 mt-6">
                        {/* Executive Summary - 4 KPIs Compact */}
                        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
                            <Card className="h-36">
                                <CardContent className="pt-6">
                                    <p className="text-xs font-semibold text-muted-foreground uppercase mb-2">
                                        Actual (2024)
                                    </p>
                                    <p className="text-3xl font-bold tabular-nums">{indicator?.current}</p>
                                    <Badge className="mt-2 bg-green-100 text-green-800 dark:bg-green-900/30 dark:text-green-400 hover:bg-green-100">
                                        <TrendingUp className="w-3 h-3 mr-1" />
                                        {indicator?.change}
                                    </Badge>
                                </CardContent>
                            </Card>

                            <Card className="h-36">
                                <CardContent className="pt-6">
                                    <p className="text-xs font-semibold text-muted-foreground uppercase mb-2">
                                        Prom 10 años
                                    </p>
                                    <p className="text-3xl font-bold tabular-nums">423 mm</p>
                                </CardContent>
                            </Card>

                            <Card className="h-36">
                                <CardContent className="pt-6">
                                    <p className="text-xs font-semibold text-muted-foreground uppercase mb-2">
                                        Máximo Hist
                                    </p>
                                    <p className="text-3xl font-bold tabular-nums">612 mm</p>
                                    <p className="text-xs text-muted-foreground mt-1">(2016)</p>
                                </CardContent>
                            </Card>

                            <Card className="h-36">
                                <CardContent className="pt-6">
                                    <p className="text-xs font-semibold text-muted-foreground uppercase mb-2">
                                        Mínimo Hist
                                    </p>
                                    <p className="text-3xl font-bold tabular-nums">287 mm</p>
                                    <p className="text-xs text-muted-foreground mt-1">(2019)</p>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Chart + Insight Row */}
                        <div className="grid grid-cols-1 lg:grid-cols-5 gap-6">
                            {/* Chart 3 columns */}
                            <div className="lg:col-span-3">
                                <Card>
                                    <CardHeader>
                                        <CardTitle>Tendencia Histórica 2015-2024</CardTitle>
                                    </CardHeader>
                                    <CardContent>
                                        <ResponsiveContainer width="100%" height={320}>
                                            <AreaChart data={historicalData}>
                                                <defs>
                                                    <linearGradient id="emeraldGradient" x1="0" y1="0" x2="0" y2="1">
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
                                                    dataKey="year"
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
                                                    fill="url(#emeraldGradient)"
                                                />
                                            </AreaChart>
                                        </ResponsiveContainer>
                                    </CardContent>
                                </Card>
                            </div>

                            {/* Insight Panel 2 columns */}
                            <div className="lg:col-span-2">
                                <Card className="h-full bg-emerald-50 dark:bg-emerald-950/30 border-l-4 border-emerald-500">
                                    <CardHeader>
                                        <CardTitle className="text-lg flex items-center gap-2">
                                            <TrendingUp className="w-5 h-5 text-emerald-600" />
                                            Insight Clave
                                        </CardTitle>
                                    </CardHeader>
                                    <CardContent className="space-y-4">
                                        <p className="text-sm leading-relaxed">
                                            La precipitación de 2024 está 5.2% sobre el promedio histórico,
                                            indicando una tendencia creciente sostenida desde 2019.
                                        </p>
                                        <div className="p-3 bg-card rounded-lg border border-border">
                                            <p className="text-xs font-semibold mb-1">Recomendación:</p>
                                            <p className="text-xs text-muted-foreground">
                                                Revisar capacidad de sistemas de drenaje urbano para eventos
                                                extremos.
                                            </p>
                                        </div>
                                        <div className="p-3 bg-card rounded-lg border border-border">
                                            <p className="text-xs font-semibold mb-1">Meta 2025:</p>
                                            <p className="text-xs text-muted-foreground">
                                                Implementar 3 nuevos sistemas de infiltración de aguas lluvias.
                                            </p>
                                        </div>
                                    </CardContent>
                                </Card>
                            </div>
                        </div>

                        {/* Comparación Nacional Compacta */}
                        <Card>
                            <CardHeader>
                                <div className="flex items-center justify-between">
                                    <CardTitle>Comparación Nacional</CardTitle>
                                    <Button
                                        variant="outline"
                                        size="sm"
                                        onClick={() => setViewMode('national')}
                                    >
                                        Ver Detalle →
                                    </Button>
                                </div>
                                <CardDescription>
                                    Tu posición: #8 de 346 comunas (Top 2.3%)
                                </CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="flex items-center gap-4">
                                    <div className="flex-1">
                                        <p className="text-sm text-muted-foreground mb-2">
                                            Promedio Nacional
                                        </p>
                                        <p className="text-2xl font-bold">3.2 m²/hab</p>
                                    </div>
                                    <div className="h-12 w-px bg-border" />
                                    <div className="flex-1">
                                        <p className="text-sm text-muted-foreground mb-2">Tu Comuna</p>
                                        <p className="text-2xl font-bold text-emerald-600">4.2 m²/hab</p>
                                    </div>
                                    <div className="h-12 w-px bg-border" />
                                    <div className="flex-1">
                                        <p className="text-sm text-muted-foreground mb-2">Diferencia</p>
                                        <Badge className="bg-green-100 text-green-800 text-base px-3 py-1 hover:bg-green-100">
                                            +31%
                                        </Badge>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* Visor Nacional */}
                    <TabsContent value="national" className="space-y-6 mt-6">
                        {/* Estadísticas Nacionales */}
                        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                            <Card>
                                <CardHeader>
                                    <CardTitle className="text-base">Tu Posición</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="flex items-baseline gap-2">
                                        <span className="text-4xl font-bold">#8</span>
                                        <span className="text-muted-foreground">de 346 comunas</span>
                                    </div>
                                    <Badge className="mt-3 bg-emerald-600 text-white hover:bg-emerald-700">Top 2.3%</Badge>
                                </CardContent>
                            </Card>

                            <Card>
                                <CardHeader>
                                    <CardTitle className="text-base">Promedio Nacional</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="flex items-baseline gap-2 mb-2">
                                        <span className="text-4xl font-bold tabular-nums">3.2</span>
                                        <span className="text-muted-foreground">m²/hab</span>
                                    </div>
                                    <div className="flex items-center gap-2 text-sm text-emerald-600">
                                        <TrendingUp className="w-4 h-4" />
                                        +31% sobre promedio
                                    </div>
                                </CardContent>
                            </Card>

                            <Card>
                                <CardHeader>
                                    <CardTitle className="text-base">Mediana Nacional</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <div className="flex items-baseline gap-2 mb-2">
                                        <span className="text-4xl font-bold tabular-nums">2.8</span>
                                        <span className="text-muted-foreground">m²/hab</span>
                                    </div>
                                    <div className="flex items-center gap-2 text-sm text-emerald-600">
                                        <TrendingUp className="w-4 h-4" />
                                        +50% sobre mediana
                                    </div>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Ranking Nacional */}
                        <Card>
                            <CardHeader>
                                <CardTitle>Ranking Nacional - Top 10 + Tu Posición</CardTitle>
                            </CardHeader>
                            <CardContent>
                                <div className="space-y-2">
                                    {nationalRankingData.map((item) => (
                                        <div
                                            key={item.rank}
                                            className={`flex items-center justify-between p-4 rounded-lg transition-colors ${item.isCurrent
                                                ? 'bg-emerald-50 dark:bg-emerald-950/30 border-2 border-emerald-500'
                                                : 'bg-muted hover:bg-muted/80'
                                                }`}
                                        >
                                            <div className="flex items-center gap-4 flex-1">
                                                <div
                                                    className={`w-10 h-10 rounded-full flex items-center justify-center font-semibold ${item.rank <= 3
                                                        ? 'bg-amber-500 text-white'
                                                        : item.isCurrent
                                                            ? 'bg-emerald-500 text-white'
                                                            : 'bg-background text-foreground'
                                                        }`}
                                                >
                                                    {item.rank}
                                                </div>
                                                <div className="flex-1">
                                                    <p className="font-medium">{item.municipality}</p>
                                                    {item.isCurrent && (
                                                        <Badge className="mt-1 bg-emerald-600 text-white hover:bg-emerald-700">
                                                            Tu Municipio
                                                        </Badge>
                                                    )}
                                                </div>
                                            </div>
                                            <div className="text-right">
                                                <p className="text-xl font-bold tabular-nums">{item.value}</p>
                                                <p className="text-sm text-muted-foreground">m²/hab</p>
                                            </div>
                                        </div>
                                    ))}
                                </div>
                            </CardContent>
                        </Card>

                        {/* Gráfico Comparativo Temporal */}
                        <Card>
                            <CardHeader>
                                <CardTitle>Evolución vs Promedio Nacional</CardTitle>
                            </CardHeader>
                            <CardContent>
                                <ResponsiveContainer width="100%" height={320}>
                                    <LineChart
                                        data={[
                                            { year: '2020', penalolen: 3.8, nacional: 2.9 },
                                            { year: '2021', penalolen: 3.9, nacional: 3.0 },
                                            { year: '2022', penalolen: 4.0, nacional: 3.1 },
                                            { year: '2023', penalolen: 4.1, nacional: 3.15 },
                                            { year: '2024', penalolen: 4.2, nacional: 3.2 },
                                        ]}
                                    >
                                        <CartesianGrid
                                            strokeDasharray="4 4"
                                            stroke="rgba(0,0,0,0.1)"
                                            vertical={false}
                                        />
                                        <XAxis
                                            dataKey="year"
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
                                        <Legend />
                                        <Line
                                            type="monotone"
                                            dataKey="penalolen"
                                            stroke="#059669"
                                            strokeWidth={3}
                                            name="Peñalolén"
                                            dot={{ fill: '#059669', r: 5 }}
                                        />
                                        <Line
                                            type="monotone"
                                            dataKey="nacional"
                                            stroke="#0E7490"
                                            strokeWidth={3}
                                            strokeDasharray="5 5"
                                            name="Promedio Nacional"
                                            dot={{ fill: '#0E7490', r: 5 }}
                                        />
                                    </LineChart>
                                </ResponsiveContainer>
                            </CardContent>
                        </Card>
                    </TabsContent>
                </Tabs>
            </div>
        );
    }

    // Vista principal con lista de indicadores
    return (
        <div className="space-y-6">
            <div>
                <h1 className="text-3xl font-bold mb-2">Indicadores Territoriales</h1>
                <p className="text-muted-foreground">
                    Visualiza y analiza datos ambientales históricos de tu territorio
                </p>
            </div>

            {/* Selector de Categorías - Horizontal Scroll */}
            <div className="flex gap-4 overflow-x-auto pb-4 -mx-6 px-6 scrollbar-thin">
                {categories.map((category) => (
                    <button
                        key={category.id}
                        onClick={() => setSelectedCategory(category.id)}
                        className={`flex-shrink-0 h-24 w-24 rounded-xl border-2 transition-all hover:shadow-lg cursor-pointer ${selectedCategory === category.id
                            ? 'border-primary bg-primary/5 shadow-md'
                            : 'border-border hover:border-[#2D9D78]'
                            }`}
                    >
                        <div className="flex flex-col items-center justify-center h-full gap-2">
                            <div style={{ color: category.color }}>{category.icon}</div>
                            <span className="text-xs font-medium">{category.name}</span>
                        </div>
                    </button>
                ))}
            </div>

            {/* Lista de Indicadores - Compacta */}
            <Card>
                <CardHeader>
                    <div className="flex items-center gap-3">
                        <div
                            className="p-2 rounded-lg"
                            style={{ backgroundColor: `${currentCategory?.color}15` }}
                        >
                            <div style={{ color: currentCategory?.color }}>{currentCategory?.icon}</div>
                        </div>
                        <div>
                            <CardTitle>Indicadores de {currentCategory?.name}</CardTitle>
                            <CardDescription>
                                {availableIndicators.length} indicadores disponibles
                            </CardDescription>
                        </div>
                    </div>
                </CardHeader>
                <CardContent>
                    <div className="space-y-3">
                        {availableIndicators.map((indicator) => (
                            <button
                                key={indicator.id}
                                onClick={() => setSelectedIndicator(indicator.id)}
                                className="w-full flex items-center justify-between p-4 rounded-lg border border-border hover:bg-muted/50 hover:border-primary transition-all text-left group cursor-pointer"
                            >
                                <div className="flex-1 min-w-0">
                                    <h4 className="font-medium mb-1 group-hover:text-primary transition-colors">
                                        {indicator.name}
                                    </h4>
                                    <p className="text-sm text-muted-foreground">
                                        <span className="font-semibold text-foreground tabular-nums">
                                            {indicator.current}
                                        </span>{' '}
                                        (2024) |{' '}
                                        <span
                                            className={
                                                indicator.trend === 'up'
                                                    ? 'text-green-600'
                                                    : indicator.trend === 'down'
                                                        ? 'text-red-600'
                                                        : ''
                                            }
                                        >
                                            {indicator.change}
                                        </span>{' '}
                                        vs {indicator.vs}
                                    </p>
                                </div>
                                <ChevronRight className="w-5 h-5 text-muted-foreground group-hover:text-primary transition-colors" />
                            </button>
                        ))}
                    </div>
                </CardContent>
            </Card>
        </div>
    );
}
