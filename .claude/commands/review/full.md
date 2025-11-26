# Review Completo de Código

Realiza una revisión exhaustiva del código considerando:

## 1. Funcionalidad

- ¿El código hace lo que se supone que debe hacer?
- ¿Hay casos edge sin manejar?
- ¿Los tests cubren los escenarios principales?

## 2. Seguridad

- ¿Hay validación de entrada?
- ¿Riesgo de inyección SQL/XSS/CSRF?
- ¿Secretos o credenciales expuestos?
- ¿Dependencias con vulnerabilidades conocidas?

## 3. Rendimiento

- ¿Queries N+1?
- ¿Carga innecesaria de datos?
- ¿Operaciones bloqueantes?

## 4. Mantenibilidad

- ¿El código es legible y está bien documentado?
- ¿Sigue los principios SOLID?
- ¿Hay duplicación de código?

## 5. Tests

- ¿Cobertura adecuada?
- ¿Tests unitarios e integración?
- ¿Tests son mantenibles?

Proporciona un resumen con:

- ✅ Aspectos positivos
- ⚠️ Advertencias (mejoras sugeridas)
- 🔴 Críticos (deben arreglarse)