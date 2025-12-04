import csv
import os

# Configuración
LER_CSV_PATH = r'docs\data\LER20250220.csv'
OUTPUT_SQL_PATH = r'scripts\seed-sinader-catalogs.sql'

# Datos de Tratamientos (Transcribed from images)
# Format: (Category, Subcategory, Name, Code)
TREATMENTS = [
    # Eliminación
    ('Eliminación', 'Disposición final', 'Relleno sanitario', '11'),
    ('Eliminación', 'Disposición final', 'Vertedero', '12'),
    ('Eliminación', 'Disposición final', 'Monorelleno', '14'),
    ('Eliminación', 'Disposición final', 'Basural', '30'),
    ('Eliminación', 'Disposición final', 'Recepción de Lodos en PTAS', '32'),
    ('Eliminación', 'Disposición final', 'Depósito de Seguridad', '33'),
    ('Eliminación', 'Disposición final', 'Sitio de Escombros de la Construcción', '60'),
    ('Eliminación', 'Disposición final', 'Área de disposición controlada', '65'),
    ('Eliminación', 'Pretratamiento (Centro de acopio)', 'Depósito de Cenizas', '58'),
    ('Eliminación', 'Pretratamiento (Centro de acopio)', 'Residuos Voluminosos', '49'),
    ('Eliminación', 'Pretratamiento (Centro de acopio)', 'Residuos Municipales', '56'),
    ('Eliminación', 'Incineración sin recuperación de energía', 'Incineración sin recuperación de energía', '4'),
    
    # Valorización
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de papel, cartón y productos de papel', '36'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento vidrio', '37'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de ropa', '38'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de textil, cuero y piel', '39'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de aceites y grasas comestibles', '40'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de pinturas, tintas, adhesivos y resinas que no contienen sustancias peligrosas', '41'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de detergentes que no contienen sustancias peligrosas', '42'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de madera que no contiene sustancias peligrosas', '43'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de Metales', '44'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de plásticos', '45'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de Neumáticos Fuera de Uso', '47'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de Residuos Voluminosos', '50'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Aparatos eléctricos y electrónicos', '57'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de caucho y goma', '61'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Materiales eléctricos', '64'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Residuos Agroalimentarios', '73'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Tintas secas y Fertilizantes', '74'),
    ('Valorización', 'Pretratamiento (Centro de acopio)', 'Pretratamiento de Equipos de Refrigeración', '75'),
    
    ('Valorización', 'Reciclaje', 'Reciclaje de papel, cartón y productos de papel', '16'),
    ('Valorización', 'Reciclaje', 'Reciclaje de textiles', '17'),
    ('Valorización', 'Reciclaje', 'Reciclaje de plásticos', '18'),
    ('Valorización', 'Reciclaje', 'Reciclaje de vidrio', '19'),
    ('Valorización', 'Reciclaje', 'Reciclaje de metales', '20'),
    ('Valorización', 'Reciclaje', 'Residuos voluminosos', '22'),
    ('Valorización', 'Reciclaje', 'Reciclaje de Neumáticos Fuera de Uso', '46'),
    ('Valorización', 'Reciclaje', 'Reciclaje de residuos de pastas y/o productos alimenticios para consumo animal', '66'),
    ('Valorización', 'Reciclaje', 'Reciclaje de Aparatos eléctricos y electrónicos', '76'),
    
    ('Valorización', 'Recuperación de energía', 'Co-incineración', '24'),
    ('Valorización', 'Recuperación de energía', 'Incineración con recuperación de energía', '25'),
    ('Valorización', 'Recuperación de energía', 'Recuperación de energía', '9'),
    
    ('Valorización', 'Recepción de Lodos de PTAS', 'Aplicación a suelo', '63'),
    ('Valorización', 'Recepción de Lodos de PTAS', 'Recepción de Lodos de PTAS', '62'),
    
    ('Valorización', 'Preparación para reutilización', 'Preparación para reutilización', '7'),
    
    ('Valorización', 'Co-procesamiento', 'Co-procesamiento', '23'),
    ('Valorización', 'Compostaje', 'Compostaje', '27'),
    ('Valorización', 'Lombricultura', 'Lombricultura', '28'),
    ('Valorización', 'Degradación Anaeróbica', 'Degradación Anaeróbica', '29'),
    ('Valorización', 'Aplicación al Suelo', 'Aplicación al Suelo', '31'),
    ('Valorización', 'Reducción de Recursos Hidrobiológicos', 'Reducción de Recursos Hidrobiológicos', '34'),
    ('Valorización', 'Reducción de residuos orgánicos', 'Reducción de residuos orgánicos en base a larvas de insectos', '68'),
]

def escape_sql(text):
    if text is None:
        return 'NULL'
    return "'" + text.replace("'", "''") + "'"

def generate_ler_seeds():
    print(f"Reading LER CSV from {LER_CSV_PATH}...")
    
    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- SEED DATA: LER CODES (Lista Europea de Residuos)")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.ler_codes CASCADE;")
    
    try:
        with open(LER_CSV_PATH, 'r', encoding='utf-8-sig') as f:
            # Detect delimiter (semicolon based on file view)
            reader = csv.DictReader(f, delimiter=';')
            
            # Debug: print first row keys to verify
            with open('debug_headers.txt', 'w') as dbg:
                dbg.write(f"CSV Headers: {reader.fieldnames}\n")
            
            for row in reader:
                # Parse columns
                # Código;Capítulo;Subcapítulo;Residuo
                if 'Código' not in row:
                    with open('debug_error.txt', 'w') as err:
                        err.write(f"Error: 'Código' column not found. Available columns: {list(row.keys())}\n")
                    return []
                    
                code = row['Código'].strip()
                
                # Parse Chapter
                chapter_raw = row['Capítulo'].split('|', 1)
                chapter_code = chapter_raw[0].strip()
                chapter_desc = chapter_raw[1].strip() if len(chapter_raw) > 1 else ''
                
                # Parse Subchapter
                subchapter_raw = row['Subcapítulo'].split('|', 1)
                subchapter_code = subchapter_raw[0].strip()
                subchapter_desc = subchapter_raw[1].strip() if len(subchapter_raw) > 1 else ''
                
                # Parse Description (Residuo)
                # Sometimes Residuo column also has "Code | Description" format
                residuo_raw = row['Residuo'].split('|', 1)
                if len(residuo_raw) > 1 and residuo_raw[0].strip() == code:
                    description = residuo_raw[1].strip()
                else:
                    description = row['Residuo'].strip()
                
                sql = f"""INSERT INTO public.ler_codes (id, description, chapter_code, chapter_description, subchapter_code, subchapter_description)
VALUES ({escape_sql(code)}, {escape_sql(description)}, {escape_sql(chapter_code)}, {escape_sql(chapter_desc)}, {escape_sql(subchapter_code)}, {escape_sql(subchapter_desc)});"""
                sql_statements.append(sql)
                
    except Exception as e:
        with open('debug_error.txt', 'w') as err:
            err.write(f"Error reading CSV: {e}\n")
        return []
        
    with open('debug_success.txt', 'w') as succ:
        succ.write(f"Generated {len(sql_statements)-3} LER inserts.\n")
    return sql_statements

def generate_treatment_seeds():
    print("Generating Waste Treatment seeds...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: WASTE TREATMENTS (Operaciones de Eliminación y Valorización)")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.waste_treatments CASCADE;")
    
    for category, subcategory, name, code in TREATMENTS:
        sql = f"""INSERT INTO public.waste_treatments (code, name, category, subcategory)
VALUES ({escape_sql(code)}, {escape_sql(name)}, {escape_sql(category)}, {escape_sql(subcategory)});"""
        sql_statements.append(sql)
        
    print(f"Generated {len(sql_statements)-3} Treatment inserts.")
    return sql_statements

def generate_subscription_plans():
    print("Generating Subscription Plans seeds...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: SUBSCRIPTION PLANS")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.subscription_plans CASCADE;")
    
    plans = [
        {
            'code': 'free',
            'name': 'Plan Semilla',
            'description': 'Para pequeñas organizaciones que inician su gestión de residuos.',
            'price': 0,
            'features': '{"users": 1, "establishments": 1, "storage_gb": 1, "support": "community"}',
            'limits': '{"monthly_declarations": 10}'
        },
        {
            'code': 'pro',
            'name': 'Plan Brote',
            'description': 'Para empresas en crecimiento que requieren reportes avanzados.',
            'price': 50000,
            'features': '{"users": 5, "establishments": 5, "storage_gb": 10, "support": "email"}',
            'limits': '{"monthly_declarations": 100}'
        },
        {
            'code': 'enterprise',
            'name': 'Plan Bosque',
            'description': 'Solución integral para grandes generadores y municipios.',
            'price': 150000,
            'features': '{"users": "unlimited", "establishments": "unlimited", "storage_gb": 100, "support": "priority"}',
            'limits': '{"monthly_declarations": "unlimited"}'
        }
    ]
    
    for plan in plans:
        sql = f"""INSERT INTO public.subscription_plans (code, name, description, price_clp, features, limits)
VALUES ({escape_sql(plan['code'])}, {escape_sql(plan['name'])}, {escape_sql(plan['description'])}, {plan['price']}, {escape_sql(plan['features'])}, {escape_sql(plan['limits'])});"""
        sql_statements.append(sql)
        
    return sql_statements

def main():
    ler_sql = generate_ler_seeds()
    treatment_sql = generate_treatment_seeds()
    plans_sql = generate_subscription_plans()
    
    all_sql = ler_sql + treatment_sql + plans_sql
    
    with open(OUTPUT_SQL_PATH, 'w', encoding='utf-8') as f:
        f.write('\n'.join(all_sql))
        
    print(f"Successfully wrote SQL seeds to {OUTPUT_SQL_PATH}")

if __name__ == '__main__':
    main()
