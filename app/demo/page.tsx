"use client";

import { ContactForm } from '@/components/forms/ContactForm';

export default function DemoPage() {
    return (
        <main className="min-h-screen pt-24 pb-16 px-6">
            <div className="max-w-2xl mx-auto space-y-8">
                <div className="text-center space-y-4">
                    <h1 className="text-4xl font-heading font-bold tracking-tight">
                        Solicita una Demo
                    </h1>
                    <p className="text-lg text-muted-foreground">
                        Descubre cómo Simbioma puede transformar la gestión ambiental de tu organización.
                    </p>
                </div>

                <div className="bg-card border border-border rounded-xl p-8 shadow-sm">
                    <ContactForm />
                </div>
            </div>
        </main>
    );
}
