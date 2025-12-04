import { createClient } from '@/lib/supabase/server'
import { NextResponse } from 'next/server'

/**
 * API Route: /api/waitlist
 * Maneja las solicitudes del formulario Beta (CTAFinal.tsx)
 */

export async function POST(request: Request) {
    try {
        const body = await request.json()

        // Validar campos requeridos
        if (!body.name || !body.email || !body.organization || !body.type) {
            return NextResponse.json(
                { error: 'Faltan campos requeridos' },
                { status: 400 }
            )
        }

        // Mapeo de valores del formulario a schema normalizado
        const organizationTypeMap: Record<string, string> = {
            'gobierno': 'municipality',
            'empresa': 'company',
            'otro': 'other'
        }

        const organizationType = organizationTypeMap[body.type] || 'other'

        // Crear cliente Supabase
        const supabase = await createClient()

        // Insertar en waitlist
        const { data, error } = await supabase
            .from('waitlist')
            .insert({
                full_name: body.name,
                email: body.email,
                organization_name: body.organization,
                organization_type: organizationType,
                country_id: 152, // Chile por defecto (MVP)
                country_code: 'CL', // Legacy field
                notes: null,
                created_at: new Date().toISOString()
            })
            .select()
            .single()

        if (error) {
            console.error('Error insertando en waitlist:', error)

            // Error de email duplicado
            if (error.code === '23505') {
                return NextResponse.json(
                    { error: 'Este email ya está registrado en la lista de espera' },
                    { status: 409 }
                )
            }

            return NextResponse.json(
                { error: 'Error al procesar la solicitud' },
                { status: 500 }
            )
        }

        // TODO: Enviar email de confirmación
        // await sendWelcomeEmail(body.email, body.name)

        // TODO: Notificar a equipo comercial
        // await notifySalesTeam(data)

        return NextResponse.json({
            success: true,
            data,
            message: '¡Solicitud recibida! Te contactaremos pronto.'
        })

    } catch (error) {
        console.error('Error en API waitlist:', error)
        return NextResponse.json(
            { error: 'Error interno del servidor' },
            { status: 500 }
        )
    }
}

/**
 * GET /api/waitlist
 * Obtener estadísticas de la lista de espera (admin only)
 */
export async function GET() {
    try {
        const supabase = createClient()

        // TODO: Verificar autenticación de admin

        // Obtener estadísticas
        const { data: stats, error } = await supabase
            .from('waitlist')
            .select('organization_type, country_id, created_at')

        if (error) {
            return NextResponse.json({ error: error.message }, { status: 500 })
        }

        // Agregar estadísticas
        const totalCount = stats?.length || 0
        const byType = stats?.reduce((acc, item) => {
            acc[item.organization_type] = (acc[item.organization_type] || 0) + 1
            return acc
        }, {} as Record<string, number>)

        return NextResponse.json({
            total: totalCount,
            byType,
            recentCount: stats?.filter(s =>
                new Date(s.created_at) > new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)
            ).length
        })

    } catch (error) {
        console.error('Error obteniendo stats waitlist:', error)
        return NextResponse.json(
            { error: 'Error interno del servidor' },
            { status: 500 }
        )
    }
}
