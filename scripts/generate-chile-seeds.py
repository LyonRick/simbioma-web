#!/usr/bin/env python3
"""
GENERADOR DE SEEDS GEOGRÁFICOS DE CHILE
========================================
Lee el archivo CUT_2018_v04.csv y genera SQL para poblar:
- geo_regions (16 regiones)
- geo_communes (346 comunas con metadata provincial)

Uso:
    python generate-chile-seeds.py

Output:
    seed-chile-cut-2018.sql
"""

import csv
from collections import OrderedDict
from pathlib import Path

# Rutas absolutas basadas en la ubicación del script
SCRIPT_DIR = Path(__file__).parent
PROJECT_ROOT = SCRIPT_DIR.parent
CSV_PATH = PROJECT_ROOT / 'docs' / 'data' / 'CUT_2018_v04.csv'
OUTPUT_SQL = SCRIPT_DIR / 'seed-chile-cut-2018.sql'

def escape_sql_string(s):
    """Escapa comillas simples para SQL"""
    return s.replace("'", "''")

def main():
    # Leer CSV con encoding correcto (UTF-8 con BOM)
    try:
        with open(CSV_PATH, 'r', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';')
            rows = [row for row in reader if row.get('Código Región', '').strip()]
    except Exception as e:
        print(f"❌ Error leyendo CSV: {e}")
        print(f"📁 Ruta: {CSV_PATH}")
        return
    
    if not rows:
        print("❌ No se encontraron datos en el CSV")
        return
    
    # Extraer regiones únicas
    regions = OrderedDict()
    for row in rows:
        code = row['Código Región'].strip()
        if code and code not in regions:
            regions[code] = {
                'name': row['Nombre Región'].strip(),
                'abbreviation': row['Abreviatura Región'].strip()
            }
    
    # Agrupar comunas por región
    communes_by_region = OrderedDict()
    for row in rows:
        region_code = row['Código Región'].strip()
        if not region_code:
            continue
        
        if region_code not in communes_by_region:
            communes_by_region[region_code] = []
        
        communes_by_region[region_code].append({
            'commune_code': row['Código Comuna 2018'].strip(),
            'commune_name': row['Nombre Comuna'].strip(),
            'province_code': row['Código Provincia'].strip(),
            'province_name': row['Nombre Provincia'].strip()
        })
    
    # Generar SQL
    with open(OUTPUT_SQL, 'w', encoding='utf-8') as f:
        f.write("""-- ==============================================================================
-- SEEDS GEOGRÁFICOS - CHILE (CUT 2018)
-- ==============================================================================
-- Fuente: CUT_2018_v04.csv
-- Generado automáticamente con generate-chile-seeds.py
-- ==============================================================================

BEGIN;

-- ==============================================================================
-- PARTE 1: INSERCIÓN DE REGIONES (16 regiones)
-- ==============================================================================

-- Insertar las 16 regiones de Chile
INSERT INTO geo_regions (country_id, local_code, name, abbreviation) VALUES
""")
        
        # Escribir regiones
        region_inserts = []
        for code, data in regions.items():
            region_inserts.append(
                f"(152, '{code}', '{escape_sql_string(data['name'])}', '{data['abbreviation']}')"
            )
        
        f.write(',\n'.join(region_inserts))
        f.write('\nON CONFLICT (country_id, local_code) DO NOTHING;\n\n')
        
        # Escribir comunas por región
        f.write("""-- ==============================================================================
-- PARTE 2: INSERCIÓN DE COMUNAS (346 comunas)
-- ==============================================================================
-- Organizadas por región con bloques transaccionales

""")
        
        for region_code, communes in communes_by_region.items():
            region_name = regions[region_code]['name']
            
            f.write(f"""-- ------------------------------------------------------------------------------
-- Región {region_code}: {region_name} ({len(communes)} comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '{region_code}';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región {region_code} no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
""")
            
            commune_inserts = []
            for comm in communes:
                commune_inserts.append(
                    f"    (region_id_var, 152, '{comm['commune_code']}', '{escape_sql_string(comm['commune_name'])}', '{comm['province_code']}', '{escape_sql_string(comm['province_name'])}')"
                )
            
            f.write(',\n'.join(commune_inserts))
            f.write('\n    ON CONFLICT (country_id, local_code) DO NOTHING;\n')
            f.write('END $$;\n\n')
        
        # Footer
        f.write("""-- ==============================================================================
-- VALIDACIÓN FINAL
-- ==============================================================================

-- Verificar conteo de regiones
SELECT COUNT(*) as total_regiones FROM geo_regions WHERE country_id = 152;
-- Esperado: 16

-- Verificar conteo de comunas
SELECT COUNT(*) as total_comunas FROM geo_communes WHERE country_id = 152;
-- Esperado: 346

-- Verificar distribución por región
SELECT 
    r.local_code,
    r.name as region_name,
    COUNT(c.id) as comunas_count
FROM geo_regions r
LEFT JOIN geo_communes c ON c.region_id = r.id
WHERE r.country_id = 152
GROUP BY r.id, r.local_code, r.name
ORDER BY r.local_code;

COMMIT;

-- ==============================================================================
-- FIN DE SEEDS
-- ==============================================================================
""")
    
    print(f"✅ Archivo SQL generado: {OUTPUT_SQL}")
    print(f"📊 Estadísticas:")
    print(f"   - Regiones: {len(regions)}")
    print(f"   - Comunas totales: {sum(len(c) for c in communes_by_region.values())}")
    print(f"\n📋 Distribución por región:")
    for code, communes in communes_by_region.items():
        print(f"   - {code} ({regions[code]['abbreviation']}): {len(communes)} comunas")

if __name__ == '__main__':
    main()
