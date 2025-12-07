'use server';

import { createClient } from '@/lib/supabase/server';
import { revalidatePath } from 'next/cache';

// Tipos
export interface UserPreferences {
    user_id: string;
    email_digest_frequency: 'daily' | 'weekly' | 'never';
    notify_document_expiry: boolean;
    notify_platform_updates: boolean;
    notify_calendar_events: boolean;
    notify_user_actions: boolean;
    created_at: string;
    updated_at: string;
}

export interface UpdatePreferencesInput {
    email_digest_frequency?: 'daily' | 'weekly' | 'never';
    notify_document_expiry?: boolean;
    notify_platform_updates?: boolean;
    notify_calendar_events?: boolean;
    notify_user_actions?: boolean;
}

/**
 * Obtener preferencias del usuario actual
 */
export async function getUserPreferences(): Promise<{
    success: boolean;
    data?: UserPreferences;
    error?: string;
}> {
    try {
        const supabase = await createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
            return { success: false, error: 'Usuario no autenticado' };
        }

        const { data, error } = await supabase
            .from('user_preferences')
            .select('*')
            .eq('user_id', user.id)
            .single();

        if (error) {
            console.error('Error fetching preferences:', error);
            return { success: false, error: error.message };
        }

        return { success: true, data: data as UserPreferences };
    } catch (error) {
        console.error('Unexpected error:', error);
        return { success: false, error: 'Error inesperado al obtener preferencias' };
    }
}

/**
 * Actualizar preferencias del usuario
 */
export async function updateUserPreferences(
    preferences: UpdatePreferencesInput
): Promise<{
    success: boolean;
    message: string;
}> {
    try {
        const supabase = await createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
            return { success: false, message: 'Usuario no autenticado' };
        }

        const { error } = await supabase
            .from('user_preferences')
            .update({
                ...preferences,
                updated_at: new Date().toISOString(),
            })
            .eq('user_id', user.id);

        if (error) {
            console.error('Error updating preferences:', error);
            return { success: false, message: `Error al actualizar: ${error.message}` };
        }

        revalidatePath('/dashboard/configuracion');
        return { success: true, message: 'Preferencias actualizadas correctamente' };
    } catch (error) {
        console.error('Unexpected error:', error);
        return { success: false, message: 'Error inesperado al actualizar preferencias' };
    }
}

/**
 * Resetear preferencias a valores por defecto
 */
export async function resetUserPreferences(): Promise<{
    success: boolean;
    message: string;
}> {
    try {
        const supabase = await createClient();
        const { data: { user } } = await supabase.auth.getUser();

        if (!user) {
            return { success: false, message: 'Usuario no autenticado' };
        }

        const { error } = await supabase
            .from('user_preferences')
            .update({
                email_digest_frequency: 'weekly',
                notify_document_expiry: true,
                notify_platform_updates: true,
                notify_calendar_events: true,
                notify_user_actions: true,
                updated_at: new Date().toISOString(),
            })
            .eq('user_id', user.id);

        if (error) {
            console.error('Error resetting preferences:', error);
            return { success: false, message: `Error al resetear: ${error.message}` };
        }

        revalidatePath('/dashboard/configuracion');
        return { success: true, message: 'Preferencias restablecidas a valores por defecto' };
    } catch (error) {
        console.error('Unexpected error:', error);
        return { success: false, message: 'Error inesperado al resetear preferencias' };
    }
}
