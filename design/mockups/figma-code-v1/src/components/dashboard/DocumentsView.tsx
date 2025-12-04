import { useState } from 'react';
import {
  FileText,
  Upload,
  Download,
  ExternalLink,
  Lock,
  Globe,
  Search,
  Filter,
  Trash2,
  Eye,
  AlertCircle,
} from 'lucide-react';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '../ui/card';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '../ui/tabs';
import { Badge } from '../ui/badge';
import { Button } from '../ui/button';
import { Input } from '../ui/input';
import { Label } from '../ui/label';
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogTrigger,
} from '../ui/dialog';
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from '../ui/select';

interface Document {
  id: number;
  title: string;
  type: 'pdf' | 'excel' | 'word' | 'link';
  category: string;
  source: string;
  date: string;
  size?: string;
  url?: string;
  isPublic: boolean;
  uploadedBy?: string;
  description?: string;
}

const publicDocuments: Document[] = [
  {
    id: 1,
    title: 'Ley 20.920 - Marco para la Gestión de Residuos',
    type: 'pdf',
    category: 'Normativa',
    source: 'Ministerio del Medio Ambiente',
    date: '01 Jun 2016',
    size: '2.3 MB',
    isPublic: true,
    description: 'Ley que establece el marco para la gestión de residuos, responsabilidad extendida del productor y fomento al reciclaje',
  },
  {
    id: 2,
    title: 'Norma de Emisión para Calderas',
    type: 'pdf',
    category: 'Normativa',
    source: 'MMA Chile',
    date: '15 Ago 2020',
    size: '1.8 MB',
    isPublic: true,
    description: 'D.S. N°15/2012 - Establece normas de emisión para calderas a biomasa',
  },
  {
    id: 3,
    title: 'Guía de Buenas Prácticas en Gestión Municipal de Residuos',
    type: 'pdf',
    category: 'Guía',
    source: 'SUBDERE',
    date: '20 Mar 2023',
    size: '5.1 MB',
    isPublic: true,
    description: 'Manual práctico para municipalidades sobre gestión integral de residuos sólidos domiciliarios',
  },
  {
    id: 4,
    title: 'Informe Estado del Medio Ambiente 2023',
    type: 'pdf',
    category: 'Informe',
    source: 'ONG Fundación Terram',
    date: '10 Ene 2024',
    size: '12.5 MB',
    isPublic: true,
    description: 'Análisis del estado ambiental de Chile con foco en cambio climático y biodiversidad',
  },
  {
    id: 5,
    title: 'Plan Nacional de Adaptación al Cambio Climático',
    type: 'pdf',
    category: 'Plan',
    source: 'Ministerio del Medio Ambiente',
    date: '05 Dic 2022',
    size: '8.7 MB',
    isPublic: true,
    description: 'Estrategia nacional para la adaptación ante los efectos del cambio climático',
  },
  {
    id: 6,
    title: 'Decreto Supremo 38 - Norma Calidad del Aire',
    type: 'pdf',
    category: 'Normativa',
    source: 'MMA Chile',
    date: '12 Jun 2012',
    size: '950 KB',
    isPublic: true,
    description: 'Establece norma primaria de calidad ambiental para material particulado respirable MP10',
  },
  {
    id: 7,
    title: 'Programa de Gestión de Áreas Verdes Urbanas',
    type: 'pdf',
    category: 'Programa',
    source: 'MINVU',
    date: '18 Sep 2023',
    size: '3.2 MB',
    isPublic: true,
    description: 'Lineamientos para el diseño, mantención y gestión de espacios verdes en ciudades',
  },
  {
    id: 8,
    title: 'Manual SINADER - Sistema Nacional de Declaración de Residuos',
    type: 'pdf',
    category: 'Manual',
    source: 'Ministerio del Medio Ambiente',
    date: '25 Ene 2024',
    size: '4.6 MB',
    isPublic: true,
    description: 'Guía completa para el reporte en SINADER con ejemplos prácticos',
  },
];

const privateDocuments: Document[] = [
  {
    id: 101,
    title: 'Plan de Gestión Ambiental Peñalolén 2024',
    type: 'pdf',
    category: 'Plan',
    source: 'Interno',
    date: '15 Ene 2024',
    size: '6.8 MB',
    isPublic: false,
    uploadedBy: 'Juan Martínez',
    description: 'Plan estratégico ambiental del municipio para el período 2024-2028',
  },
  {
    id: 102,
    title: 'Reporte SINADER 2023 - Peñalolén',
    type: 'excel',
    category: 'Reporte',
    source: 'Interno',
    date: '10 Dic 2023',
    size: '2.1 MB',
    isPublic: false,
    uploadedBy: 'María González',
    description: 'Declaración anual de residuos enviada al MMA',
  },
  {
    id: 103,
    title: 'Inventario de Emisiones Municipales 2023',
    type: 'excel',
    category: 'Inventario',
    source: 'Interno',
    date: '20 Feb 2024',
    size: '1.5 MB',
    isPublic: false,
    uploadedBy: 'Carlos Silva',
    description: 'Cálculo de huella de carbono de operaciones municipales',
  },
  {
    id: 104,
    title: 'Acta Reunión Comité Ambiental - Nov 2024',
    type: 'word',
    category: 'Acta',
    source: 'Interno',
    date: '25 Nov 2024',
    size: '450 KB',
    isPublic: false,
    uploadedBy: 'Juan Martínez',
    description: 'Acuerdos y seguimiento de compromisos del comité ambiental municipal',
  },
  {
    id: 105,
    title: 'Presupuesto Ambiental 2025',
    type: 'excel',
    category: 'Presupuesto',
    source: 'Interno',
    date: '30 Oct 2024',
    size: '980 KB',
    isPublic: false,
    uploadedBy: 'María González',
    description: 'Planificación presupuestaria para programas ambientales',
  },
];

export function DocumentsView() {
  const [searchTerm, setSearchTerm] = useState('');
  const [selectedCategory, setSelectedCategory] = useState<string>('all');
  const [isUploadDialogOpen, setIsUploadDialogOpen] = useState(false);
  const [uploadType, setUploadType] = useState<'public' | 'private'>('private');

  const categories = [
    'all',
    'Normativa',
    'Guía',
    'Informe',
    'Plan',
    'Manual',
    'Programa',
    'Reporte',
    'Inventario',
    'Acta',
    'Presupuesto',
  ];

  const filterDocuments = (docs: Document[]) => {
    return docs.filter((doc) => {
      const matchesSearch =
        doc.title.toLowerCase().includes(searchTerm.toLowerCase()) ||
        doc.description?.toLowerCase().includes(searchTerm.toLowerCase());
      const matchesCategory =
        selectedCategory === 'all' || doc.category === selectedCategory;
      return matchesSearch && matchesCategory;
    });
  };

  const getFileIcon = (type: string) => {
    switch (type) {
      case 'pdf':
        return '📄';
      case 'excel':
        return '📊';
      case 'word':
        return '📝';
      case 'link':
        return '🔗';
      default:
        return '📄';
    }
  };

  const DocumentCard = ({ doc }: { doc: Document }) => (
    <div className="flex items-start gap-4 p-5 rounded-lg border border-border hover:bg-muted/50 transition-colors">
      <div className="text-4xl">{getFileIcon(doc.type)}</div>

      <div className="flex-1 min-w-0">
        <div className="flex items-start justify-between gap-2 mb-2">
          <h3 className="font-medium text-lg">{doc.title}</h3>
          <div className="flex items-center gap-2 flex-shrink-0">
            {doc.isPublic ? (
              <Badge variant="outline" className="gap-1">
                <Globe className="w-3 h-3" />
                Público
              </Badge>
            ) : (
              <Badge variant="outline" className="gap-1">
                <Lock className="w-3 h-3" />
                Privado
              </Badge>
            )}
            <Badge>{doc.category}</Badge>
          </div>
        </div>

        {doc.description && (
          <p className="text-sm text-muted-foreground mb-3">{doc.description}</p>
        )}

        <div className="flex items-center gap-4 text-sm text-muted-foreground mb-3">
          <span>{doc.source}</span>
          <span>•</span>
          <span>{doc.date}</span>
          {doc.size && (
            <>
              <span>•</span>
              <span>{doc.size}</span>
            </>
          )}
          {doc.uploadedBy && (
            <>
              <span>•</span>
              <span>Subido por {doc.uploadedBy}</span>
            </>
          )}
        </div>

        <div className="flex items-center gap-2">
          <Button variant="outline" size="sm">
            <Eye className="w-4 h-4 mr-2" />
            Ver
          </Button>
          <Button variant="outline" size="sm">
            <Download className="w-4 h-4 mr-2" />
            Descargar
          </Button>
          {!doc.isPublic && (
            <Button
              variant="outline"
              size="sm"
              className="text-destructive hover:text-destructive"
            >
              <Trash2 className="w-4 h-4 mr-2" />
              Eliminar
            </Button>
          )}
        </div>
      </div>
    </div>
  );

  return (
    <div className="space-y-6">
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl mb-2">Biblioteca de Documentos</h1>
          <p className="text-muted-foreground">
            Repositorio de normativas, guías, informes y documentación ambiental
          </p>
        </div>
        <Dialog open={isUploadDialogOpen} onOpenChange={setIsUploadDialogOpen}>
          <DialogTrigger asChild>
            <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90">
              <Upload className="w-4 h-4 mr-2" />
              Subir Documento
            </Button>
          </DialogTrigger>
          <DialogContent className="max-w-2xl">
            <DialogHeader>
              <DialogTitle>Subir Nuevo Documento</DialogTitle>
              <DialogDescription>
                Agrega documentos a tu biblioteca privada o contribuye a la base de conocimiento pública
              </DialogDescription>
            </DialogHeader>
            <div className="space-y-4 pt-4">
              <div className="space-y-2">
                <Label>Tipo de Documento</Label>
                <Select value={uploadType} onValueChange={(v: any) => setUploadType(v)}>
                  <SelectTrigger>
                    <SelectValue />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="private">
                      <div className="flex items-center gap-2">
                        <Lock className="w-4 h-4" />
                        Privado (solo tu organización)
                      </div>
                    </SelectItem>
                    <SelectItem value="public">
                      <div className="flex items-center gap-2">
                        <Globe className="w-4 h-4" />
                        Público (compartir con comunidad)
                      </div>
                    </SelectItem>
                  </SelectContent>
                </Select>
              </div>

              {uploadType === 'public' && (
                <div className="p-4 rounded-lg bg-[#F5A623]/10 border border-[#F5A623] flex items-start gap-3">
                  <AlertCircle className="w-5 h-5 text-[#F5A623] flex-shrink-0 mt-0.5" />
                  <div className="text-sm">
                    <p className="font-medium mb-1">Contribución a Base Pública</p>
                    <p className="text-muted-foreground">
                      El sistema verificará que no exista un documento duplicado antes de publicarlo.
                      Los documentos públicos son revisados para asegurar su calidad y relevancia.
                    </p>
                  </div>
                </div>
              )}

              <div className="space-y-2">
                <Label htmlFor="doc-title">Título del Documento</Label>
                <Input id="doc-title" placeholder="Ej: Plan de Gestión Ambiental 2024" />
              </div>

              <div className="space-y-2">
                <Label htmlFor="doc-category">Categoría</Label>
                <Select>
                  <SelectTrigger id="doc-category">
                    <SelectValue placeholder="Seleccionar categoría" />
                  </SelectTrigger>
                  <SelectContent>
                    {categories.slice(1).map((cat) => (
                      <SelectItem key={cat} value={cat}>
                        {cat}
                      </SelectItem>
                    ))}
                  </SelectContent>
                </Select>
              </div>

              <div className="space-y-2">
                <Label htmlFor="doc-description">Descripción</Label>
                <Input
                  id="doc-description"
                  placeholder="Breve descripción del contenido del documento"
                />
              </div>

              <div className="space-y-2">
                <Label htmlFor="doc-file">Archivo</Label>
                <div className="border-2 border-dashed border-border rounded-lg p-8 text-center hover:bg-muted/50 transition-colors cursor-pointer">
                  <Upload className="w-8 h-8 mx-auto mb-3 text-muted-foreground" />
                  <p className="text-sm font-medium mb-1">
                    Haz clic para seleccionar o arrastra el archivo
                  </p>
                  <p className="text-xs text-muted-foreground">
                    PDF, Word, Excel (máx. 50 MB)
                  </p>
                </div>
              </div>

              <Button className="w-full bg-[#2D9D78] hover:bg-[#2D9D78]/90">
                Subir Documento
              </Button>
            </div>
          </DialogContent>
        </Dialog>
      </div>

      {/* Filtros y Búsqueda */}
      <Card>
        <CardContent className="pt-6">
          <div className="flex flex-col md:flex-row gap-4">
            <div className="flex-1">
              <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-muted-foreground" />
                <Input
                  placeholder="Buscar documentos..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="pl-10"
                />
              </div>
            </div>
            <div className="w-full md:w-64">
              <Select value={selectedCategory} onValueChange={setSelectedCategory}>
                <SelectTrigger>
                  <Filter className="w-4 h-4 mr-2" />
                  <SelectValue placeholder="Filtrar por categoría" />
                </SelectTrigger>
                <SelectContent>
                  {categories.map((cat) => (
                    <SelectItem key={cat} value={cat}>
                      {cat === 'all' ? 'Todas las categorías' : cat}
                    </SelectItem>
                  ))}
                </SelectContent>
              </Select>
            </div>
          </div>
        </CardContent>
      </Card>

      <Tabs defaultValue="public" className="space-y-6">
        <TabsList className="grid w-full grid-cols-2 max-w-md">
          <TabsTrigger value="public" className="flex items-center gap-2">
            <Globe className="w-4 h-4" />
            Documentos Públicos
          </TabsTrigger>
          <TabsTrigger value="private" className="flex items-center gap-2">
            <Lock className="w-4 h-4" />
            Mis Documentos
          </TabsTrigger>
        </TabsList>

        {/* Public Documents Tab */}
        <TabsContent value="public" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Base de Conocimiento Pública</CardTitle>
              <CardDescription>
                Leyes, normativas, guías e informes de organismos públicos, ONGs e instituciones
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              {filterDocuments(publicDocuments).map((doc) => (
                <DocumentCard key={doc.id} doc={doc} />
              ))}
              {filterDocuments(publicDocuments).length === 0 && (
                <div className="text-center py-8 text-muted-foreground">
                  No se encontraron documentos públicos
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>

        {/* Private Documents Tab */}
        <TabsContent value="private" className="space-y-4">
          <Card>
            <CardHeader>
              <CardTitle>Documentos Privados de Peñalolén</CardTitle>
              <CardDescription>
                Documentos internos visibles solo para tu organización
              </CardDescription>
            </CardHeader>
            <CardContent className="space-y-4">
              {filterDocuments(privateDocuments).map((doc) => (
                <DocumentCard key={doc.id} doc={doc} />
              ))}
              {filterDocuments(privateDocuments).length === 0 && (
                <div className="text-center py-8 text-muted-foreground">
                  No se encontraron documentos privados
                </div>
              )}
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  );
}
