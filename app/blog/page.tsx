import Link from "next/link";
import Image from "next/image";
import { Calendar, User, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Metadata } from "next";

export const metadata: Metadata = {
    title: "Blog Simbioma - Noticias sobre Sustentabilidad y Tecnología",
    description: "Noticias, tendencias y análisis sobre sustentabilidad, tecnología y gestión territorial. Descubre cómo la innovación está transformando la gestión ambiental en Chile.",
    keywords: ["sustentabilidad", "tecnología ambiental", "gestión territorial", "ESG", "Chile", "innovación", "municipios", "empresas"],
    openGraph: {
        title: "Blog Simbioma - Noticias sobre Sustentabilidad y Tecnología",
        description: "Noticias, tendencias y análisis sobre sustentabilidad, tecnología y gestión territorial.",
        type: "website",
        locale: "es_CL",
    },
};

export default function BlogPage() {
    const posts = [
        {
            slug: "simbioma-beneficios-gestion-ambiental",
            title: "Transformando la Gestión Ambiental en Chile: El Impacto de Simbioma",
            excerpt: "Descubre cómo la tecnología está revolucionando la forma en que municipios y empresas gestionan sus datos ambientales, pasando de la fragmentación a la inteligencia territorial.",
            date: "26-11-2025",
            author: "Equipo Simbioma",
            image: "/images/blog/gestion-ambiental-hero.png",
            altText: "Ilustración mostrando la transformación digital de la gestión ambiental con gráficos de datos, indicadores ambientales y conexión entre municipios y empresas",
            category: "Innovación"
        }
    ];

    return (
        <div className="container mx-auto px-4 py-24">
            <div className="text-center max-w-3xl mx-auto mb-16">
                <h1 className="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
                    Blog <span className="text-verde-bosque">Simbioma</span>
                </h1>
                <p className="text-xl text-gray-600">
                    Noticias, tendencias y análisis sobre sustentabilidad, tecnología y gestión territorial.
                </p>
            </div>

            <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                {posts.map((post) => (
                    <article key={post.slug} className="bg-white rounded-2xl overflow-hidden shadow-lg border border-gray-100 hover:shadow-xl transition-all group">
                        <div className="relative h-48 overflow-hidden">
                            <Image
                                src={post.image}
                                alt={post.altText}
                                fill
                                className="object-cover group-hover:scale-105 transition-transform duration-500"
                            />
                            <div className="absolute top-4 left-4 bg-white/90 backdrop-blur-sm px-3 py-1 rounded-full text-xs font-bold text-verde-bosque uppercase tracking-wide">
                                {post.category}
                            </div>
                        </div>
                        <div className="p-6">
                            <div className="flex items-center gap-4 text-xs text-gray-500 mb-4">
                                <div className="flex items-center gap-1">
                                    <Calendar className="w-3 h-3" />
                                    {post.date}
                                </div>
                                <div className="flex items-center gap-1">
                                    <User className="w-3 h-3" />
                                    {post.author}
                                </div>
                            </div>
                            <h2 className="text-xl font-bold text-gray-900 mb-3 group-hover:text-verde-bosque transition-colors">
                                <Link href={`/blog/${post.slug}`}>
                                    {post.title}
                                </Link>
                            </h2>
                            <p className="text-gray-600 text-sm mb-6 line-clamp-3">
                                {post.excerpt}
                            </p>
                            <Link href={`/blog/${post.slug}`}>
                                <Button variant="ghost" className="p-0 h-auto text-verde-bosque hover:text-verde-bosque-dark hover:bg-transparent">
                                    Leer más <ArrowRight className="ml-2 w-4 h-4" />
                                </Button>
                            </Link>
                        </div>
                    </article>
                ))}
            </div>
        </div>
    );
}
