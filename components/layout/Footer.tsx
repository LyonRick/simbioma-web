import Link from "next/link";
import { Twitter, Linkedin, Instagram, Mail } from "lucide-react";
import { Logo } from "@/components/brand/Logo";

export default function Footer() {
  return (
    <footer className="bg-gray-50 border-t border-gray-200 pt-16 pb-8">
      <div className="container mx-auto px-4 md:px-6">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-12">

          {/* Brand Column */}
          <div className="space-y-4">
            <Link href="/" className="inline-block group">
              <Logo />
            </Link>
            <p className="text-gray-500 text-sm leading-relaxed">
              Plataforma SaaS para la gestión de la sustentabilidad y regeneración ecosistémica en Chile. Conectando gobiernos y empresas por un futuro verde.
            </p>
            <div className="flex gap-4 pt-2">
              <a href="#" className="text-gray-400 hover:text-verde-bosque transition-colors">
                <Linkedin className="w-5 h-5" />
              </a>
              <a href="#" className="text-gray-400 hover:text-verde-bosque transition-colors">
                <Twitter className="w-5 h-5" />
              </a>
              <a href="#" className="text-gray-400 hover:text-verde-bosque transition-colors">
                <Instagram className="w-5 h-5" />
              </a>
            </div>
          </div>

          {/* Product Column */}
          <div>
            <h3 className="font-semibold text-gray-900 mb-4">Producto</h3>
            <ul className="space-y-3 text-sm text-gray-600">
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Para Municipios</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Para Empresas</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Indicadores</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Reportes ESG</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Precios</Link></li>
            </ul>
          </div>

          {/* Resources Column */}
          <div>
            <h3 className="font-semibold text-gray-900 mb-4">Recursos</h3>
            <ul className="space-y-3 text-sm text-gray-600">
              <li><Link href="/blog" className="hover:text-verde-bosque transition-colors">Blog</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Casos de Éxito</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Documentación</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Ayuda</Link></li>
              <li><Link href="#" className="hover:text-verde-bosque transition-colors">Estado del Sistema</Link></li>
            </ul>
          </div>

          {/* Contact Column */}
          <div>
            <h3 className="font-semibold text-gray-900 mb-4">Contacto</h3>
            <ul className="space-y-3 text-sm text-gray-600">
              <li className="flex items-center gap-2">
                <Mail className="w-4 h-4 text-verde-bosque" />
                <a href="mailto:contacto@simbioma.cl" className="hover:text-verde-bosque transition-colors">contacto@simbioma.cl</a>
              </li>
              <li>Av. Providencia 1234, Of. 601</li>
              <li>Santiago, Chile</li>
            </ul>
          </div>
        </div>

        <div className="border-t border-gray-200 pt-8 flex flex-col md:flex-row justify-between items-center gap-4 text-sm text-gray-500">
          <p>&copy; {new Date().getFullYear()} Simbioma SpA. Todos los derechos reservados.</p>
          <div className="flex gap-6">
            <Link href="/privacidad" className="hover:text-gray-900 transition-colors">Privacidad</Link>
            <Link href="/terminos" className="hover:text-gray-900 transition-colors">Términos</Link>
            <Link href="/seguridad" className="hover:text-gray-900 transition-colors">Seguridad</Link>
          </div>
        </div>
      </div>
    </footer>
  );
}