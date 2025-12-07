"use client";

import { useState } from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Tabs, TabsContent, TabsList, TabsTrigger } from '@/components/ui/tabs';
import {
    FileText,
    Search,
    Filter,
    Download,
    MoreVertical,
    Upload,
    FileSpreadsheet,
    FileIcon,
    Globe,
    Lock,
    ShieldCheck,
    Eye,
    Trash2
} from 'lucide-react';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
    DropdownMenuSeparator
} from '@/components/ui/dropdown-menu';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from "@/components/ui/select"
import { Badge } from '@/components/ui/badge';
import { PaginationControl } from '@/components/common/PaginationControl';

// Tipos actualizados
interface StrategicDocument {
    id: string;
    name: string;
    document_type: string;
    file_url: string;
    visibility: 'public' | 'private' | 'official';
    is_verified?: boolean;
    created_at: string;
    uploaded_by: string;
    file_size: string;
    file_extension: 'pdf' | 'xlsx' | 'docx';
    organization_name?: string; // Para documentos públicos de otros
}

const mockDocuments: StrategicDocument[] = [
    // OFICIALES (Simbioma)
    {
        id: 'off1',
        name: 'Ley 20.920 (Ley REP) - Texto Refundido',
        document_type: 'normativa',
        file_url: '#',
        visibility: 'official',
        is_verified: true,
        created_at: '2023-01-01',
        uploaded_by: 'Simbioma Legal',
        file_size: '1.2 MB',
        file_extension: 'pdf'
    },
    {
        id: 'off2',
        name: 'Guía de Declaración SINADER 2024',
        document_type: 'guia',
        file_url: '#',
        visibility: 'official',
        is_verified: true,
        created_at: '2024-01-15',
        uploaded_by: 'Simbioma Soporte',
        file_size: '3.5 MB',
        file_extension: 'pdf'
    },

    // PÚBLICOS (De otros municipios)
    {
        id: 'pub1',
        name: 'Ordenanza de Humedales Urbanos',
        document_type: 'normativa',
        file_url: '#',
        visibility: 'public',
        is_verified: true,
        created_at: '2023-06-10',
        uploaded_by: 'Muni. Valdivia',
        organization_name: 'Municipalidad de Valdivia',
        file_size: '850 KB',
        file_extension: 'pdf'
    },
    {
        id: 'pub2',
        name: 'Plan de Gestión de Residuos Orgánicos',
        document_type: 'plan',
        file_url: '#',
        visibility: 'public',
        is_verified: false,
        created_at: '2023-11-20',
        uploaded_by: 'Muni. La Pintana',
        organization_name: 'Municipalidad de La Pintana',
        file_size: '5.1 MB',
        file_extension: 'pdf'
    },

    // PRIVADOS (Míos)
    {
        id: 'priv1',
        name: 'Contrato Gestión de Residuos - Veolia',
        document_type: 'contrato',
        file_url: '#',
        visibility: 'private',
        created_at: '2023-02-28',
        uploaded_by: 'Juan Martínez',
        file_size: '1.8 MB',
        file_extension: 'pdf'
    },
    {
        id: 'priv2',
        name: 'Matriz de Cumplimiento Normativo 2024',
        document_type: 'reporte',
        file_url: '#',
        visibility: 'private',
        created_at: '2024-01-10',
        uploaded_by: 'Ana Silva',
        file_size: '850 KB',
        file_extension: 'xlsx'
    },
];

export default function DocumentosPage() {
    const [searchTerm, setSearchTerm] = useState('');
    const [categoryFilter, setCategoryFilter] = useState('all');
    const [currentPage, setCurrentPage] = useState(1);
    const itemsPerPage = 5;

    const getFileIcon = (ext: string) => {
        switch (ext) {
            case 'pdf': return <FileText className="w-8 h-8 text-red-500" />;
            case 'xlsx': return <FileSpreadsheet className="w-8 h-8 text-green-600" />;
            case 'docx': return <FileText className="w-8 h-8 text-blue-600" />;
            default: return <FileIcon className="w-8 h-8 text-gray-500" />;
        }
    };

    const getVisibilityBadge = (visibility: string, isVerified?: boolean) => {
        if (visibility === 'official') return <Badge className="bg-[#1E5F8C] hover:bg-[#164A6E] text-white"><ShieldCheck className="w-3 h-3 mr-1" /> Oficial</Badge>;
        if (visibility === 'public') return <Badge variant="secondary" className="bg-emerald-100 text-emerald-800"><Globe className="w-3 h-3 mr-1" /> Público {isVerified && '✓'}</Badge>;
        return <Badge variant="outline" className="text-muted-foreground"><Lock className="w-3 h-3 mr-1" /> Privado</Badge>;
    };

    const filterDocs = (docs: StrategicDocument[]) => {
        return docs.filter(doc => {
            const matchesSearch = doc.name.toLowerCase().includes(searchTerm.toLowerCase());
            const matchesCategory = categoryFilter === 'all' || doc.document_type === categoryFilter;
            return matchesSearch && matchesCategory;
        });
    };

    const renderDocList = (docs: StrategicDocument[]) => {
        const filtered = filterDocs(docs);
        const paginated = filtered.slice((currentPage - 1) * itemsPerPage, currentPage * itemsPerPage);
        const totalPages = Math.ceil(filtered.length / itemsPerPage);

        if (filtered.length === 0) {
            return <div className="text-center py-12 text-muted-foreground">No se encontraron documentos.</div>;
        }

        return (
            <div className="space-y-4">
                {paginated.map((doc) => (
                    <div
                        key={doc.id}
                        className="flex items-center justify-between p-4 rounded-lg border border-border hover:bg-muted/50 transition-colors group bg-card"
                    >
                        <div className="flex items-center gap-4 flex-1 min-w-0">
                            <div className="p-3 bg-muted/50 rounded-lg group-hover:bg-background transition-colors border border-transparent group-hover:border-border">
                                {getFileIcon(doc.file_extension)}
                            </div>
                            <div className="flex-1 min-w-0">
                                <div className="flex items-center gap-2 mb-1">
                                    <h3 className="font-medium truncate text-base">{doc.name}</h3>
                                    {getVisibilityBadge(doc.visibility, doc.is_verified)}
                                </div>

                                <div className="flex items-center gap-3 text-sm text-muted-foreground">
                                    <span className="capitalize bg-muted px-2 py-0.5 rounded text-xs font-medium text-foreground">{doc.document_type}</span>
                                    <span>•</span>
                                    <span>{doc.file_size}</span>
                                    <span>•</span>
                                    <span>{new Date(doc.created_at).toLocaleDateString()}</span>
                                    {doc.organization_name && (
                                        <>
                                            <span>•</span>
                                            <span className="text-primary font-medium">{doc.organization_name}</span>
                                        </>
                                    )}
                                </div>
                            </div>
                        </div>

                        <div className="flex items-center gap-2">
                            <Button variant="outline" size="sm" className="hidden md:flex gap-2">
                                <Eye className="w-4 h-4" />
                                Ver
                            </Button>
                            <Button variant="outline" size="sm" className="hidden md:flex gap-2">
                                <Download className="w-4 h-4" />
                                Descargar
                            </Button>
                            <DropdownMenu>
                                <DropdownMenuTrigger asChild>
                                    <Button variant="ghost" size="icon">
                                        <MoreVertical className="w-4 h-4" />
                                    </Button>
                                </DropdownMenuTrigger>
                                <DropdownMenuContent align="end">
                                    <DropdownMenuItem>Ver detalles</DropdownMenuItem>
                                    <DropdownMenuItem>Compartir</DropdownMenuItem>
                                    {doc.visibility === 'private' && (
                                        <>
                                            <DropdownMenuSeparator />
                                            <DropdownMenuItem className="text-destructive">
                                                <Trash2 className="w-4 h-4 mr-2" />
                                                Eliminar
                                            </DropdownMenuItem>
                                        </>
                                    )}
                                </DropdownMenuContent>
                            </DropdownMenu>
                        </div>
                    </div>
                ))}

                <div className="pt-4">
                    <PaginationControl
                        currentPage={currentPage}
                        totalPages={totalPages}
                        onPageChange={setCurrentPage}
                    />
                </div>
            </div>
        );
    };

    return (
        <div className="space-y-6">
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                <div>
                    <h1 className="text-3xl font-bold mb-2">Biblioteca de Documentos</h1>
                    <p className="text-muted-foreground">
                        Repositorio de normativas, guías, informes y documentación ambiental.
                    </p>
                </div>
                <Button className="bg-[#2D9D78] hover:bg-[#2D9D78]/90 shadow-sm text-white cursor-pointer">
                    <Upload className="w-4 h-4 mr-2" />
                    Subir Documento
                </Button>
            </div>

            <div className="flex flex-col md:flex-row gap-4 items-center bg-card p-4 rounded-xl border shadow-sm">
                <div className="relative flex-1 w-full">
                    <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-muted-foreground" />
                    <Input
                        placeholder="Buscar documentos..."
                        className="pl-9 bg-background"
                        value={searchTerm}
                        onChange={(e) => setSearchTerm(e.target.value)}
                    />
                </div>
                <div className="flex items-center gap-2 w-full md:w-auto">
                    <Filter className="w-4 h-4 text-muted-foreground" />
                    <Select value={categoryFilter} onValueChange={setCategoryFilter}>
                        <SelectTrigger className="w-full md:w-[200px] bg-background">
                            <SelectValue placeholder="Todas las categorías" />
                        </SelectTrigger>
                        <SelectContent>
                            <SelectItem value="all">Todas las categorías</SelectItem>
                            <SelectItem value="normativa">Normativa</SelectItem>
                            <SelectItem value="guia">Guía</SelectItem>
                            <SelectItem value="informe">Informe</SelectItem>
                            <SelectItem value="plan">Plan</SelectItem>
                            <SelectItem value="contrato">Contrato</SelectItem>
                            <SelectItem value="reporte">Reporte</SelectItem>
                        </SelectContent>
                    </Select>
                </div>
            </div>

            <Tabs defaultValue="public" className="space-y-6">
                <TabsList className="grid w-full grid-cols-2 max-w-[400px]">
                    <TabsTrigger value="public" className="flex items-center gap-2 cursor-pointer hover:bg-muted data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white">
                        <Globe className="w-4 h-4" />
                        Documentos Públicos
                    </TabsTrigger>
                    <TabsTrigger value="private" className="flex items-center gap-2 cursor-pointer hover:bg-muted data-[state=active]:bg-[#2D9D78] data-[state=active]:text-white">
                        <Lock className="w-4 h-4" />
                        Mis Documentos
                    </TabsTrigger>
                </TabsList>

                <TabsContent value="public" className="space-y-4">
                    <div className="flex items-center justify-between">
                        <h2 className="text-lg font-semibold">Biblioteca Pública & Oficial</h2>
                        <Badge variant="outline" className="bg-blue-50 text-blue-700 border-blue-200">
                            {mockDocuments.filter(d => d.visibility !== 'private').length} documentos disponibles
                        </Badge>
                    </div>
                    {renderDocList(mockDocuments.filter(d => d.visibility !== 'private'))}
                </TabsContent>

                <TabsContent value="private" className="space-y-4">
                    <div className="flex items-center justify-between">
                        <h2 className="text-lg font-semibold">Documentos Privados de Peñalolén</h2>
                        <Badge variant="outline">
                            {mockDocuments.filter(d => d.visibility === 'private').length} documentos internos
                        </Badge>
                    </div>
                    {renderDocList(mockDocuments.filter(d => d.visibility === 'private'))}
                </TabsContent>
            </Tabs>
        </div>
    );
}
