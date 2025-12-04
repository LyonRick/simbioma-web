import { Download, FileSpreadsheet, Presentation, Copy } from 'lucide-react';
import { Button } from './button';

interface ChartExportProps {
  onDownloadPNG?: () => void;
  onExportPPT?: () => void;
  onCopyCSV?: () => void;
  className?: string;
}

export function ChartExport({
  onDownloadPNG,
  onExportPPT,
  onCopyCSV,
  className = '',
}: ChartExportProps) {
  const handleDownloadPNG = () => {
    if (onDownloadPNG) {
      onDownloadPNG();
    } else {
      // Mock implementation
      alert('Función de exportación PNG en desarrollo');
    }
  };

  const handleExportPPT = () => {
    if (onExportPPT) {
      onExportPPT();
    } else {
      alert('Función de exportación PowerPoint en desarrollo');
    }
  };

  const handleCopyCSV = () => {
    if (onCopyCSV) {
      onCopyCSV();
    } else {
      alert('Función de copia CSV en desarrollo');
    }
  };

  return (
    <div className={`flex items-center gap-2 ${className}`}>
      <Button
        variant="outline"
        size="sm"
        onClick={handleDownloadPNG}
        className="h-8 px-3 text-xs"
        title="Descargar como imagen PNG (2× resolución)"
      >
        <Download className="w-3.5 h-3.5 mr-1.5" />
        PNG
      </Button>
      <Button
        variant="outline"
        size="sm"
        onClick={handleExportPPT}
        className="h-8 px-3 text-xs"
        title="Exportar a PowerPoint"
      >
        <Presentation className="w-3.5 h-3.5 mr-1.5" />
        PPT
      </Button>
      <Button
        variant="outline"
        size="sm"
        onClick={handleCopyCSV}
        className="h-8 px-3 text-xs"
        title="Copiar tabla de datos (CSV)"
      >
        <FileSpreadsheet className="w-3.5 h-3.5 mr-1.5" />
        CSV
      </Button>
    </div>
  );
}

interface ChartContainerProps {
  title: string;
  children: React.ReactNode;
  exportable?: boolean;
  onDownloadPNG?: () => void;
  onExportPPT?: () => void;
  onCopyCSV?: () => void;
  className?: string;
}

export function ChartContainer({
  title,
  children,
  exportable = true,
  onDownloadPNG,
  onExportPPT,
  onCopyCSV,
  className = '',
}: ChartContainerProps) {
  return (
    <div className={`bg-card rounded-xl p-6 shadow-sm border border-border ${className}`}>
      <div className="flex items-center justify-between mb-4">
        <h3 className="text-lg font-semibold">{title}</h3>
        {exportable && (
          <ChartExport
            onDownloadPNG={onDownloadPNG}
            onExportPPT={onExportPPT}
            onCopyCSV={onCopyCSV}
          />
        )}
      </div>
      {children}
    </div>
  );
}
