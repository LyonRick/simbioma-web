# Crear Pull Request

Ejecuta los siguientes pasos:

1. **Verificar estado**
   - Revisa qué archivos han cambiado
   - Confirma que todos los tests pasan

2. **Formatear código**
   - Ejecuta el linter del proyecto
   - Corrige problemas de formato automáticamente

3. **Analizar cambios**
   - Identifica cambios lógicos separados
   - Agrupa cambios relacionados

4. **Crear commits lógicos**
   - Si hay múltiples cambios no relacionados, créalos en commits separados
   - Cada commit debe ser independiente y comprensible
   - Mensajes descriptivos siguiendo [Conventional Commits](https://www.conventionalcommits.org/)

5. **Crear branch y push**
   - Nombre de branch: feature/[descripción] o fix/[descripción]
   - Push a origin

6. **Generar descripción de PR**
   - Resumen de cambios
   - Motivación del cambio
   - Plan de prueba
   - Screenshots si aplica (cambios visuales)