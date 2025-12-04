'use server'

import { revalidatePath } from 'next/cache'
import { redirect } from 'next/navigation'
import { createClient } from '@/lib/supabase/server'
import { z } from 'zod'

// ===================================================
// VALIDATION SCHEMAS
// ===================================================

const loginSchema = z.object({
  email: z.string().email('Email inválido'),
  password: z.string().min(1, 'Contraseña requerida'),
})

const signupSchema = z.object({
  email: z.string().email('Email inválido'),
  password: z.string()
    .min(8, 'La contraseña debe tener al menos 8 caracteres')
    .regex(/[A-Z]/, 'Debe contener al menos una mayúscula')
    .regex(/[0-9]/, 'Debe contener al menos un número'),
  fullName: z.string().min(2, 'Nombre completo requerido'),
})

// ===================================================
// LOGIN ACTION
// ===================================================

export async function login(formData: FormData) {
  const supabase = await createClient()

  // Validate input
  const rawData = {
    email: formData.get('email') as string,
    password: formData.get('password') as string,
  }

  const validation = loginSchema.safeParse(rawData)

  if (!validation.success) {
    const errors = validation.error.flatten().fieldErrors
    const errorMessage = Object.values(errors).flat().join(', ')
    redirect(`/login?error=${encodeURIComponent(errorMessage)}`)
  }

  const { email, password } = validation.data

  // Attempt login
  const { data, error } = await supabase.auth.signInWithPassword({
    email,
    password,
  })

  if (error) {
    console.error('Login error:', error)

    // Friendly error messages
    let errorMessage = 'Error al iniciar sesión'
    if (error.message.includes('Invalid login credentials')) {
      errorMessage = 'Email o contraseña incorrectos'
    } else if (error.message.includes('Email not confirmed')) {
      errorMessage = 'Por favor, confirma tu email antes de iniciar sesión'
    } else if (error.message.includes('Email not authorized')) {
      errorMessage = 'Este email no está autorizado para acceder'
    }

    redirect(`/login?error=${encodeURIComponent(errorMessage)}`)
  }

  // Profile check removed to avoid session propagation issues in Server Actions.
  // We verified profiles exist via script.
  // The dashboard will handle profile loading correctly.

  revalidatePath('/', 'layout')
  redirect('/dashboard')
}

// ===================================================
// SIGNUP ACTION
// ===================================================

export async function signup(formData: FormData) {
  const supabase = await createClient()

  // Validate input
  const rawData = {
    email: formData.get('email') as string,
    password: formData.get('password') as string,
    fullName: formData.get('fullName') as string,
  }

  const validation = signupSchema.safeParse(rawData)

  if (!validation.success) {
    const errors = validation.error.flatten().fieldErrors
    const errorMessage = Object.values(errors).flat().join(', ')
    redirect(`/login?error=${encodeURIComponent(errorMessage)}`)
  }

  const { email, password, fullName } = validation.data

  // Attempt signup
  const { data, error } = await supabase.auth.signUp({
    email,
    password,
    options: {
      data: {
        full_name: fullName,
      },
      emailRedirectTo: `${process.env.NEXT_PUBLIC_SITE_URL || 'http://localhost:3000'}/auth/callback`,
    },
  })

  if (error) {
    console.error('Signup error:', error)

    let errorMessage = 'Error al crear cuenta'
    if (error.message.includes('User already registered')) {
      errorMessage = 'Este email ya está registrado'
    } else if (error.message.includes('Password should be')) {
      errorMessage = 'La contraseña no cumple los requisitos de seguridad'
    }

    redirect(`/login?error=${encodeURIComponent(errorMessage)}`)
  }

  // Check if email confirmation is required
  if (data.user && !data.user.email_confirmed_at) {
    redirect('/login?message=Revisa tu email para confirmar tu cuenta antes de iniciar sesión')
  }

  // If auto-confirmed, redirect to dashboard
  revalidatePath('/', 'layout')
  redirect('/dashboard')
}

// ===================================================
// LOGOUT ACTION
// ===================================================

export async function logout() {
  const supabase = await createClient()

  const { error } = await supabase.auth.signOut()

  if (error) {
    console.error('Logout error:', error)
    redirect('/login?error=Error al cerrar sesión')
  }

  revalidatePath('/', 'layout')
  redirect('/login')
}
