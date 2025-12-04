import { Calendar, Clock, Plus, Trash2, AlertCircle } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Badge } from '../ui/badge';
import { Button } from '../ui/button';
import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from '../ui/dialog';
import { Input } from '../ui/input';
import { Label } from '../ui/label';
import { useState } from 'react';

interface Milestone {
  id: number;
  title: string;
  date: string;
  type: 'user' | 'national' | 'deadline';
  category?: string;
  description?: string;
}

interface CalendarWidgetProps {
  compact?: boolean;
}

const defaultMilestones: Milestone[] = [
  {
    id: 1,
    title: 'Reporte SINADER 2024',
    date: '15 Dic 2024',
    type: 'deadline',
    category: 'Cumplimiento',
    description: 'Plazo límite para envío del Sistema Nacional de Declaración de Residuos',
  },
  {
    id: 2,
    title: 'Día Mundial del Agua',
    date: '22 Mar 2025',
    type: 'national',
    category: 'Calendario Ambiental',
    description: 'Fecha clave para campañas de concientización sobre recursos hídricos',
  },
  {
    id: 3,
    title: 'Día de la Tierra',
    date: '22 Abr 2025',
    type: 'national',
    category: 'Calendario Ambiental',
    description: 'Actividades ambientales y celebración del cuidado del planeta',
  },
  {
    id: 4,
    title: 'Reunión de Planificación Ambiental',
    date: '05 Dic 2024',
    type: 'user',
    category: 'Reunión',
    description: 'Planificación estratégica para el primer trimestre 2025',
  },
  {
    id: 5,
    title: 'Día Mundial del Medio Ambiente',
    date: '05 Jun 2025',
    type: 'national',
    category: 'Calendario Ambiental',
    description: 'Principal fecha del calendario ambiental de Naciones Unidas',
  },
  {
    id: 6,
    title: 'Evaluación de Indicadores Q1',
    date: '31 Mar 2025',
    type: 'user',
    category: 'Evaluación',
    description: 'Revisión trimestral de métricas e indicadores ambientales',
  },
  {
    id: 7,
    title: 'Día Internacional de los Bosques',
    date: '21 Mar 2025',
    type: 'national',
    category: 'Calendario Ambiental',
    description: 'Promoción de la forestación urbana y protección de bosques nativos',
  },
];

export function CalendarWidget({ compact = false }: CalendarWidgetProps) {
  const [milestones, setMilestones] = useState<Milestone[]>(defaultMilestones);
  const [isDialogOpen, setIsDialogOpen] = useState(false);
  const [newMilestone, setNewMilestone] = useState({
    title: '',
    date: '',
    description: '',
  });

  // Ordenar por fecha más cercana
  const sortedMilestones = [...milestones].sort((a, b) => {
    return new Date(a.date).getTime() - new Date(b.date).getTime();
  });

  // Solo próximos hitos (para vista compacta)
  const upcomingMilestones = sortedMilestones.slice(0, compact ? 3 : 10);

  const handleAddMilestone = () => {
    if (newMilestone.title && newMilestone.date) {
      const milestone: Milestone = {
        id: Date.now(),
        title: newMilestone.title,
        date: newMilestone.date,
        type: 'user',
        category: 'Personal',
        description: newMilestone.description,
      };
      setMilestones([...milestones, milestone]);
      setNewMilestone({ title: '', date: '', description: '' });
      setIsDialogOpen(false);
    }
  };

  const handleDeleteMilestone = (id: number) => {
    setMilestones(milestones.filter((m) => m.id !== id));
  };

  const getBadgeColor = (type: string) => {
    switch (type) {
      case 'deadline':
        return 'bg-destructive text-white';
      case 'national':
        return 'bg-[#1E5F8C] text-white';
      case 'user':
        return 'bg-[#2D9D78] text-white';
      default:
        return 'bg-muted';
    }
  };

  const getBadgeLabel = (type: string) => {
    switch (type) {
      case 'deadline':
        return 'Plazo';
      case 'national':
        return 'Nacional';
      case 'user':
        return 'Personal';
      default:
        return '';
    }
  };

  if (compact) {
    return (
      <Card>
        <CardHeader className="pb-3">
          <div className="flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Calendar className="w-4 h-4 text-[#2D9D78]" />
              <CardTitle className="text-base">Próximos Hitos</CardTitle>
            </div>
            <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
              <DialogTrigger asChild>
                <Button variant="ghost" size="sm" className="h-8 w-8 p-0">
                  <Plus className="w-4 h-4" />
                </Button>
              </DialogTrigger>
              <DialogContent>
                <DialogHeader>
                  <DialogTitle>Agregar Hito</DialogTitle>
                  <DialogDescription>
                    Crea un recordatorio para fechas importantes de tu trabajo
                  </DialogDescription>
                </DialogHeader>
                <div className="space-y-4 pt-4">
                  <div className="space-y-2">
                    <Label htmlFor="title">Título</Label>
                    <Input
                      id="title"
                      value={newMilestone.title}
                      onChange={(e) =>
                        setNewMilestone({ ...newMilestone, title: e.target.value })
                      }
                      placeholder="Ej: Reunión de equipo"
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="date">Fecha</Label>
                    <Input
                      id="date"
                      type="date"
                      value={newMilestone.date}
                      onChange={(e) =>
                        setNewMilestone({ ...newMilestone, date: e.target.value })
                      }
                    />
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="description">Descripción (opcional)</Label>
                    <Input
                      id="description"
                      value={newMilestone.description}
                      onChange={(e) =>
                        setNewMilestone({ ...newMilestone, description: e.target.value })
                      }
                      placeholder="Detalles del hito"
                    />
                  </div>
                  <Button
                    onClick={handleAddMilestone}
                    className="w-full bg-[#2D9D78] hover:bg-[#2D9D78]/90"
                  >
                    Agregar Hito
                  </Button>
                </div>
              </DialogContent>
            </Dialog>
          </div>
        </CardHeader>
        <CardContent className="space-y-3">
          {upcomingMilestones.map((milestone) => (
            <div
              key={milestone.id}
              className="flex items-start gap-3 p-3 rounded-lg bg-muted hover:bg-muted/80 transition-colors"
            >
              <div className="flex-shrink-0 mt-0.5">
                <div
                  className={`w-2 h-2 rounded-full ${
                    milestone.type === 'deadline'
                      ? 'bg-destructive'
                      : milestone.type === 'national'
                      ? 'bg-[#1E5F8C]'
                      : 'bg-[#2D9D78]'
                  }`}
                />
              </div>
              <div className="flex-1 min-w-0">
                <p className="text-sm font-medium truncate">{milestone.title}</p>
                <div className="flex items-center gap-2 mt-1">
                  <p className="text-xs text-muted-foreground flex items-center gap-1">
                    <Clock className="w-3 h-3" />
                    {milestone.date}
                  </p>
                  <Badge className={`${getBadgeColor(milestone.type)} text-xs`}>
                    {getBadgeLabel(milestone.type)}
                  </Badge>
                </div>
              </div>
            </div>
          ))}
        </CardContent>
      </Card>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h2 className="text-2xl mb-1">Calendario de Hitos</h2>
          <p className="text-muted-foreground">
            Fechas clave del calendario ambiental y tus recordatorios personales
          </p>
        </div>
        <Dialog open={isDialogOpen} onOpenChange={setIsDialogOpen}>
          <DialogTrigger asChild>
            <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
              <Plus className="w-4 h-4 mr-2" />
              Agregar Hito
            </Button>
          </DialogTrigger>
          <DialogContent>
            <DialogHeader>
              <DialogTitle>Agregar Hito Personal</DialogTitle>
              <DialogDescription>
                Crea un recordatorio para fechas importantes de tu trabajo
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4 pt-4">
              <div className="space-y-2">
                <Label htmlFor="title-full">Título</Label>
                <Input
                  id="title-full"
                  value={newMilestone.title}
                  onChange={(e) =>
                    setNewMilestone({ ...newMilestone, title: e.target.value })
                  }
                  placeholder="Ej: Reunión de equipo ambiental"
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="date-full">Fecha</Label>
                <Input
                  id="date-full"
                  type="date"
                  value={newMilestone.date}
                  onChange={(e) =>
                    setNewMilestone({ ...newMilestone, date: e.target.value })
                  }
                />
              </div>
              <div className="space-y-2">
                <Label htmlFor="description-full">Descripción (opcional)</Label>
                <Input
                  id="description-full"
                  value={newMilestone.description}
                  onChange={(e) =>
                    setNewMilestone({ ...newMilestone, description: e.target.value })
                  }
                  placeholder="Detalles adicionales del hito"
                />
              </div>
              <Button
                onClick={handleAddMilestone}
                className="w-full bg-[#2D9D78] hover:bg-[#2D9D78]/90"
              >
                Agregar Hito
              </Button>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Todos los Hitos</CardTitle>
          <CardDescription>
            Hitos personales, plazos de cumplimiento y fechas del calendario ambiental nacional
          </CardDescription>
        </CardHeader>
        <CardContent className="space-y-3">
          {upcomingMilestones.map((milestone) => (
            <div
              key={milestone.id}
              className="flex items-start gap-4 p-4 rounded-lg border border-border hover:bg-muted/50 transition-colors"
            >
              <div className="flex-shrink-0 mt-1">
                {milestone.type === 'deadline' ? (
                  <div className="p-2 bg-destructive/10 rounded-lg">
                    <AlertCircle className="w-5 h-5 text-destructive" />
                  </div>
                ) : milestone.type === 'national' ? (
                  <div className="p-2 bg-[#1E5F8C]/10 rounded-lg">
                    <Calendar className="w-5 h-5 text-[#1E5F8C]" />
                  </div>
                ) : (
                  <div className="p-2 bg-[#2D9D78]/10 rounded-lg">
                    <Calendar className="w-5 h-5 text-[#2D9D78]" />
                  </div>
                )}
              </div>

              <div className="flex-1 min-w-0">
                <div className="flex items-start justify-between gap-2 mb-2">
                  <h3 className="font-medium">{milestone.title}</h3>
                  <Badge className={getBadgeColor(milestone.type)}>
                    {getBadgeLabel(milestone.type)}
                  </Badge>
                </div>
                {milestone.description && (
                  <p className="text-sm text-muted-foreground mb-2">
                    {milestone.description}
                  </p>
                )}
                <div className="flex items-center gap-3 text-sm text-muted-foreground">
                  <span className="flex items-center gap-1">
                    <Clock className="w-4 h-4" />
                    {milestone.date}
                  </span>
                  {milestone.category && (
                    <>
                      <span>•</span>
                      <span>{milestone.category}</span>
                    </>
                  )}
                </div>
              </div>

              {milestone.type === 'user' && (
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleDeleteMilestone(milestone.id)}
                  className="text-destructive hover:text-destructive hover:bg-destructive/10"
                >
                  <Trash2 className="w-4 h-4" />
                </Button>
              )}
            </div>
          ))}
        </CardContent>
      </Card>
    </div>
  );
}
