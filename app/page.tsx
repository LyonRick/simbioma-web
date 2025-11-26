import Hero from '@/components/sections/Hero'
import Problema from '@/components/sections/Problema'
import Segmentacion from '@/components/sections/Segmentacion'
import Solucion from '@/components/sections/Solucion'
import Beneficios from '@/components/sections/Beneficios'
import FAQ from '@/components/sections/FAQ'
import CTAFinal from '@/components/sections/CTAFinal'

export default function Home() {
  return (
    <main className="flex-grow">
      <Hero />
      <Problema />
      <Segmentacion />
      <Solucion />
      <Beneficios />
      <FAQ />
      <CTAFinal />
    </main>
  )
}