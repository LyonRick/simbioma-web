"use client";

import { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { toast } from 'sonner';

export function ContactForm() {
    const [isLoading, setIsLoading] = useState(false);

    const handleSubmit = async (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault();
        setIsLoading(true);

        const formData = new FormData(e.currentTarget);
        const data = Object.fromEntries(formData.entries());

        try {
            const response = await fetch('/api/waitlist', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(data),
            });

            if (!response.ok) throw new Error('Error al enviar solicitud');

            toast.success('Solicitud enviada correctamente. Nos pondremos en contacto pronto.');
            (e.target as HTMLFormElement).reset();
        } catch (error) {
            toast.error('Hubo un error al enviar la solicitud. Por favor intenta nuevamente.');
        } finally {
            setIsLoading(false);
        }
    };

    return (
        <form onSubmit={handleSubmit} className="space-y-6">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="space-y-2">
                    <Label htmlFor="name">Nombre Completo</Label>
                    <Input id="name" name="name" required placeholder="Juan Pérez" />
                </div>
                <div className="space-y-2">
                    <Label htmlFor="email">Correo Corporativo</Label>
                    <Input id="email" name="email" type="email" required placeholder="juan@empresa.com" />
                </div>
            </div>

            <div className="space-y-2">
                <Label htmlFor="organization">Organización / Municipio</Label>
                <Input id="organization" name="organization" required placeholder="Municipalidad de..." />
            </div>

            <div className="space-y-2">
                <Label htmlFor="role">Cargo</Label>
                <Input id="role" name="role" required placeholder="Director de Medio Ambiente" />
            </div>

            <div className="space-y-2">
                <Label htmlFor="message">Mensaje (Opcional)</Label>
                <Textarea
                    id="message"
                    name="message"
                    placeholder="Cuéntanos sobre tus necesidades específicas..."
                    className="min-h-[120px]"
                />
            </div>

            <Button
                type="submit"
                className="w-full h-12 bg-[#2D9D78] hover:bg-[#258566] text-white font-bold text-base"
                disabled={isLoading}
            >
                {isLoading ? 'Enviando...' : 'Solicitar Demo'}
            </Button>
        </form>
    );
}
