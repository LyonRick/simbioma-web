import { LucideIcon } from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Badge } from '../ui/badge';

interface PlaceholderViewProps {
  title: string;
  description: string;
  icon: LucideIcon;
  status?: 'disponible' | 'desarrollo' | 'pronto';
}

export function PlaceholderView({
  title,
  description,
  icon: Icon,
  status = 'desarrollo',
}: PlaceholderViewProps) {
  const statusConfig = {
    disponible: { label: 'Disponible', color: 'bg-[#2D9D78] text-white' },
    desarrollo: { label: 'En Desarrollo', color: 'bg-[#1E5F8C] text-white' },
    pronto: { label: 'Próximamente', color: 'bg-muted text-muted-foreground' },
  };

  const config = statusConfig[status];

  return (
    <div className="flex items-center justify-center min-h-[calc(100vh-200px)]">
      <Card className="max-w-md w-full text-center">
        <CardHeader>
          <div className="flex justify-center mb-4">
            <div className="p-4 bg-muted rounded-full">
              <Icon className="w-12 h-12 text-muted-foreground" />
            </div>
          </div>
          <CardTitle className="text-2xl">{title}</CardTitle>
          <CardDescription className="text-base mt-2">
            {description}
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Badge className={config.color}>{config.label}</Badge>
          <p className="text-sm text-muted-foreground mt-4">
            Esta funcionalidad estará disponible próximamente. Mientras tanto, puedes explorar otras secciones de la plataforma.
          </p>
        </CardContent>
      </Card>
    </div>
  );
}
