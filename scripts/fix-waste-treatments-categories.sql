-- ==============================================================================
-- CORRECCIÓN DE CATEGORÍAS DE WASTE_TREATMENTS
-- Basado en manual oficial SINADER
-- ==============================================================================

-- ELIMINACIÓN debe tener 12 tratamientos total:
-- - 8 de Disposición final
-- - 3 de Pretratamiento (Centro de acopio): códigos 58, 49, 56
-- - 1 de Incineración sin recuperación: código 4

-- VALORIZACIÓN debe tener 41 tratamientos (TODO EL RESTO)
-- - 'pretratamiento' NO es una categoría, solo subcategoría

-- Paso 1: Corregir códigos 58, 49, 56 de 'pretratamiento' a 'eliminacion'
UPDATE public.waste_treatments
SET category = 'eliminacion'
WHERE code IN ('58', '49', '56');

-- Paso 2: Corregir TODOS los demás 'pretratamiento' a 'valorizacion'
-- Estos son los 18 códigos que están mal clasificados
UPDATE public.waste_treatments
SET category = 'valorizacion'
WHERE category = 'pretratamiento';
-- Esto cambiará: 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 47, 50, 57, 61, 64, 73, 74, 75

-- Paso 3: Agregar descripción al código 4
UPDATE public.waste_treatments
SET description = 'Incineración sin recuperación de energía'
WHERE code = '4';

-- ==============================================================================
-- VERIFICACIÓN POST-CORRECCIÓN
-- ==============================================================================

-- Contar por categoría (debe dar: eliminacion=12, valorizacion=41)
SELECT 
  category,
  COUNT(*) as total,
  string_agg(code, ', ' ORDER BY code::integer) as codes
FROM public.waste_treatments
GROUP BY category
ORDER BY category;

-- Ver los 12 tratamientos de eliminación
SELECT code, name, subcategory
FROM public.waste_treatments
WHERE category = 'eliminacion'
ORDER BY code::integer;
