"use client";

import { useState } from 'react';
import {
    Calendar as CalendarIcon,
    Clock,
    Plus,
    Trash2,
    AlertTriangle,
    Leaf,
    Globe,
    Briefcase,
    ChevronLeft,
    ChevronRight,
    Filter
} from 'lucide-react';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from '@/components/ui/dialog';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from '@/components/ui/select';
import { cn } from '@/lib/utils';

// --- TIPOS ---
type EventCategory = 'normativo' | 'efemeride' | 'regenerativo' | 'gestion' | 'personal';

interface CalendarEvent {
    id: string;
    title: string;
    date: Date;
    category: EventCategory;
    priority: 'high' | 'medium' | 'low';
    description?: string;
    actionLink?: string;
    isGlobal: boolean; // True = Simbioma Master Calendar, False = User Created
}

// --- DATASET MAESTRO SIMBIOMA (2025) ---
// Integrando el contenido curado por el usuario
const masterCalendarData: CalendarEvent[] = [
    // ENERO
    { id: 'm1', title: 'Apertura Ventanilla Única RETC', date: new Date(2025, 0, 2), category: 'normativo', priority: 'high', description: 'Inicio oficial del periodo de declaración anual.', isGlobal: true },
    { id: 'm2', title: 'Día Mundial Educación Ambiental', date: new Date(2025, 0, 26), category: 'efemeride', priority: 'medium', description: 'Ideal para lanzar campañas municipales de verano.', isGlobal: true },
    { id: 'm3', title: 'Acción frente al Calentamiento', date: new Date(2025, 0, 28), category: 'efemeride', priority: 'medium', description: 'Revisión de KPIs de Huella de Carbono.', isGlobal: true },

    // FEBRERO
    { id: 'm4', title: 'Día Mundial de los Humedales', date: new Date(2025, 1, 2), category: 'efemeride', priority: 'medium', description: 'Relevante para municipios con ordenanzas de humedales urbanos.', isGlobal: true },
    { id: 'm5', title: 'Día Mundial de la Energía', date: new Date(2025, 1, 14), category: 'efemeride', priority: 'medium', description: 'Monitoreo de consumo eléctrico en edificios municipales.', isGlobal: true },

    // MARZO (Critical)
    { id: 'm6', title: 'Día Mundial Vida Silvestre', date: new Date(2025, 2, 3), category: 'efemeride', priority: 'low', description: 'Foco en biodiversidad local.', isGlobal: true },
    { id: 'm7', title: 'Día Mundial Eficiencia Energética', date: new Date(2025, 2, 5), category: 'efemeride', priority: 'medium', description: 'Revisión de proyectos de recambio LED.', isGlobal: true },
    { id: 'm8', title: 'Día Mundial del Agua', date: new Date(2025, 2, 22), category: 'regenerativo', priority: 'high', description: 'Indicador crítico: Consumo hídrico y sequía.', isGlobal: true },
    { id: 'm9', title: 'CIERRE SINADER (Estimado)', date: new Date(2025, 2, 30), category: 'normativo', priority: 'high', description: 'ALERTA MÁXIMA. Plazo legal declaración residuos (Ley 20.920).', isGlobal: true },
    { id: 'm10', title: 'Cierre Declaración Ley REP', date: new Date(2025, 2, 30), category: 'normativo', priority: 'high', description: 'Plazo para sistemas de gestión y empresas privadas.', isGlobal: true },

    // ABRIL
    { id: 'm11', title: 'Día de la Madre Tierra', date: new Date(2025, 3, 22), category: 'efemeride', priority: 'medium', description: 'Hito comunicacional más grande del año. Lanzamiento de reportes.', isGlobal: true },
    { id: 'm12', title: 'Cuenta Pública Municipal', date: new Date(2025, 3, 30), category: 'gestion', priority: 'medium', description: 'Fecha límite usual para presentar gestión ambiental.', isGlobal: true },

    // MAYO
    { id: 'm13', title: 'Día Mundial del Reciclaje', date: new Date(2025, 4, 17), category: 'efemeride', priority: 'medium', description: 'Campañas de separación en origen (Ley REP).', isGlobal: true },
    { id: 'm14', title: 'Día Int. de la Biodiversidad', date: new Date(2025, 4, 22), category: 'regenerativo', priority: 'medium', description: 'Vital para estrategia de regeneración ecosistémica.', isGlobal: true },

    // JUNIO
    { id: 'm15', title: 'Día Mundial Medio Ambiente', date: new Date(2025, 5, 5), category: 'efemeride', priority: 'high', description: 'Evento principal ONU. Fecha clave para hitos políticos.', isGlobal: true },
    { id: 'm16', title: 'We Tripantu (Solsticio)', date: new Date(2025, 5, 21), category: 'regenerativo', priority: 'medium', description: 'Año Nuevo Mapuche. Renovación de ciclos naturales.', isGlobal: true },
];

// Datos de usuario (Mock)
const userEvents: CalendarEvent[] = [
    { id: 'u1', title: 'Reunión Comité Ambiental', date: new Date(2025, 2, 10), category: 'personal', priority: 'medium', description: 'Revisión trimestral.', isGlobal: false },
];

export default function CalendarPage() {
    const [currentDate, setCurrentDate] = useState(new Date(2025, 2, 1)); // Iniciamos en Marzo 2025 para ver hitos
    const [events, setEvents] = useState<CalendarEvent[]>([...masterCalendarData, ...userEvents]);
    const [selectedDate, setSelectedDate] = useState<Date | null>(null);
    const [filter, setFilter] = useState<string>('all');
    const [isDialogOpen, setIsDialogOpen] = useState(false);
    const [newEvent, setNewEvent] = useState({ title: '', category: 'personal' });

    // --- HELPERS ---
    const getDaysInMonth = (date: Date) => {
        const year = date.getFullYear();
        const month = date.getMonth();
        const days = new Date(year, month + 1, 0).getDate();
        const firstDay = new Date(year, month, 1).getDay(); // 0 = Sunday
        return { days, firstDay: firstDay === 0 ? 6 : firstDay - 1 }; // Adjust to start on Monday
    };

    const { days, firstDay } = getDaysInMonth(currentDate);

    const prevMonth = () => setCurrentDate(new Date(currentDate.getFullYear(), currentDate.getMonth() - 1, 1));
    const nextMonth = () => setCurrentDate(new Date(currentDate.getFullYear(), currentDate.getMonth() + 1, 1));

    const getEventsForDay = (day: number) => {
        return events.filter(e =>
            e.date.getDate() === day &&
            e.date.getMonth() === currentDate.getMonth() &&
            e.date.getFullYear() === currentDate.getFullYear() &&
            (filter === 'all' || e.category === filter)
        );
    };

    const getCategoryColor = (category: EventCategory) => {
        switch (category) {
            case 'normativo': return 'bg-red-100 text-red-700 border-red-200 dark:bg-red-900/30 dark:text-red-300';
            case 'efemeride': return 'bg-emerald-100 text-emerald-700 border-emerald-200 dark:bg-emerald-900/30 dark:text-emerald-300';
            case 'regenerativo': return 'bg-indigo-100 text-indigo-700 border-indigo-200 dark:bg-indigo-900/30 dark:text-indigo-300';
            case 'gestion': return 'bg-amber-100 text-amber-700 border-amber-200 dark:bg-amber-900/30 dark:text-amber-300';
            default: return 'bg-gray-100 text-gray-700 border-gray-200 dark:bg-gray-800 dark:text-gray-300';
        }
    };

    const getCategoryIcon = (category: EventCategory) => {
        switch (category) {
            case 'normativo': return <AlertTriangle className="w-3 h-3" />;
            case 'efemeride': return <Globe className="w-3 h-3" />;
            case 'regenerativo': return <Leaf className="w-3 h-3" />;
            case 'gestion': return <Briefcase className="w-3 h-3" />;
            default: return <Clock className="w-3 h-3" />;
        }
    };

    const handleAddEvent = () => {
        if (!selectedDate || !newEvent.title) return;
        const event: CalendarEvent = {
            id: Date.now().toString(),
            title: newEvent.title,
            date: selectedDate,
            category: newEvent.category as EventCategory,
            priority: 'medium',
            isGlobal: false,
            description: 'Evento creado por usuario'
        };
        setEvents([...events, event]);
        setIsDialogOpen(false);
        setNewEvent({ title: '', category: 'personal' });
    };

    // --- RENDER ---
    return (
        <div className="space-y-6 h-[calc(100vh-100px)] flex flex-col">
            {/* Header & Controls */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                <div>
                    <h1 className="text-3xl font-bold flex items-center gap-2">
                        Calendario Estratégico
                        <Badge variant="outline" className="text-xs font-normal">2025</Badge>
                    </h1>
                    <p className="text-muted-foreground">
                        Gestión de cumplimiento normativo, efemérides ambientales y agenda personal.
                    </p>
                </div>

                <div className="flex items-center gap-2">
                    <Select value={filter} onValueChange={setFilter}>
                        <SelectTrigger className="w-[180px]">
                            <Filter className="w-4 h-4 mr-2" />
                            <SelectValue placeholder="Filtrar por tipo" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Todos los eventos</SelectItem>
                            <SelectItem value="normativo">🔴 Normativo (Crítico)</SelectItem>
                            <SelectItem value="efemeride">🟢 Efemérides</SelectItem>
                            <SelectItem value="regenerativo">🔵 Regenerativo</SelectItem>
                            <SelectItem value="gestion">🟠 Gestión</SelectItem>
                            <SelectItem value="personal">⚪ Personal</SelectItem>
                        </SelectContent>
                    </Select>

                    <div className="flex items-center border rounded-md bg-card">
                        <Button variant="ghost" size="icon" onClick={prevMonth}>
                            <ChevronLeft className="w-4 h-4" />
                        </Button>
                        <span className="w-40 text-center font-semibold">
                            {currentDate.toLocaleDateString('es-CL', { month: 'long', year: 'numeric' })}
                        </span>
                        <Button variant="ghost" size="icon" onClick={nextMonth}>
                            <ChevronRight className="w-4 h-4" />
                        </Button>
                    </div>
                </div>
            </div>

            {/* Calendar Grid */}
            <div className="flex-1 bg-card border rounded-xl shadow-sm overflow-hidden flex flex-col">
                {/* Days Header */}
                <div className="grid grid-cols-7 border-b bg-muted/30">
                    {['Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb', 'Dom'].map(day => (
                        <div key={day} className="p-3 text-center text-sm font-medium text-muted-foreground">
                            {day}
                        </div>
                    ))}
                </div>

                {/* Days Grid */}
                <div className="grid grid-cols-7 flex-1 auto-rows-fr">
                    {/* Empty cells for previous month */}
                    {Array.from({ length: firstDay }).map((_, i) => (
                        <div key={`empty-${i}`} className="border-b border-r bg-muted/5 p-2" />
                    ))}

                    {/* Days of current month */}
                    {Array.from({ length: days }).map((_, i) => {
                        const day = i + 1;
                        const dayEvents = getEventsForDay(day);
                        const isToday =
                            day === new Date().getDate() &&
                            currentDate.getMonth() === new Date().getMonth() &&
                            currentDate.getFullYear() === new Date().getFullYear();

                        return (
                            <div
                                key={day}
                                className={cn(
                                    "border-b border-r p-2 min-h-[100px] relative group transition-colors hover:bg-muted/10 cursor-pointer",
                                    isToday && "bg-primary/5"
                                )}
                                onClick={() => {
                                    setSelectedDate(new Date(currentDate.getFullYear(), currentDate.getMonth(), day));
                                    setIsDialogOpen(true);
                                }}
                            >
                                <div className="flex justify-between items-start mb-1">
                                    <span className={cn(
                                        "text-sm font-medium w-7 h-7 flex items-center justify-center rounded-full",
                                        isToday ? "bg-primary text-primary-foreground" : "text-muted-foreground"
                                    )}>
                                        {day}
                                    </span>
                                    {dayEvents.length > 0 && (
                                        <Badge variant="secondary" className="text-[10px] px-1 h-5">
                                            {dayEvents.length}
                                        </Badge>
                                    )}
                                </div>

                                <div className="space-y-1">
                                    {dayEvents.map(event => (
                                        <div
                                            key={event.id}
                                            className={cn(
                                                "text-[10px] px-1.5 py-1 rounded border truncate flex items-center gap-1",
                                                getCategoryColor(event.category)
                                            )}
                                            title={event.title}
                                        >
                                            {getCategoryIcon(event.category)}
                                            <span className="truncate">{event.title}</span>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        );
                    })}
                </div>
            </div>

            {/* Dialog for Event Details / Creation */}
            <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
                <DialogContent className="sm:max-w-[500px]">
                    <DialogHeader>
                        <DialogTitle>
                            {selectedDate?.toLocaleDateString('es-CL', { weekday: 'long', day: 'numeric', month: 'long' })}
                        </DialogTitle>
                        <DialogDescription>
                            Eventos programados para este día
                        </DialogDescription>
                    </DialogHeader>

                    <div className="space-y-4 py-4">
                        {/* Existing Events List */}
                        {selectedDate && getEventsForDay(selectedDate.getDate()).length > 0 ? (
                            <div className="space-y-3">
                                {getEventsForDay(selectedDate.getDate()).map(event => (
                                    <Card key={event.id} className="border-l-4" style={{ borderLeftColor: event.isGlobal ? undefined : '#2D9D78' }}>
                                        <CardContent className="p-3">
                                            <div className="flex justify-between items-start">
                                                <div>
                                                    <h4 className="font-semibold text-sm flex items-center gap-2">
                                                        {event.title}
                                                        {event.isGlobal && <Badge variant="outline" className="text-[10px]">Simbioma</Badge>}
                                                    </h4>
                                                    <p className="text-xs text-muted-foreground mt-1">{event.description}</p>
                                                    {event.category === 'normativo' && (
                                                        <p className="text-xs text-red-600 font-medium mt-2 flex items-center gap-1">
                                                            <AlertTriangle className="w-3 h-3" />
                                                            Acción Requerida: Revisar plataforma RETC
                                                        </p>
                                                    )}
                                                </div>
                                                {!event.isGlobal && (
                                                    <Button variant="ghost" size="icon" className="h-6 w-6 text-destructive">
                                                        <Trash2 className="w-3 h-3" />
                                                    </Button>
                                                )}
                                            </div>
                                        </CardContent>
                                    </Card>
                                ))}
                            </div>
                        ) : (
                            <p className="text-sm text-muted-foreground text-center py-4">No hay eventos para este día.</p>
                        )}

                        {/* Add New Event Form */}
                        <div className="border-t pt-4 mt-4">
                            <h4 className="text-sm font-medium mb-3">Agregar Hito Personal</h4>
                            <div className="flex gap-2">
                                <Input
                                    placeholder="Título del evento..."
                                    value={newEvent.title}
                                    onChange={(e) => setNewEvent({ ...newEvent, title: e.target.value })}
                                />
                                <Select
                                    value={newEvent.category}
                                    onValueChange={(v) => setNewEvent({ ...newEvent, category: v })}
                                >
                                    <SelectTrigger className="w-[130px]">
                                        <SelectValue />
                                    </SelectTrigger>
                                    <SelectContent>
                                        <SelectItem value="personal">Personal</SelectItem>
                                        <SelectItem value="gestion">Gestión</SelectItem>
                                    </SelectContent>
                                </Select>
                                <Button onClick={handleAddEvent} size="icon" className="shrink-0 bg-[#2D9D78]">
                                    <Plus className="w-4 h-4" />
                                </Button>
                            </div>
                        </div>
                    </div>
                </DialogContent>
            </Dialog>
        </div>
    );
}
