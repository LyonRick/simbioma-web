import csv
import os
from decimal import Decimal

# Configuración
LER_CSV_PATH = r'docs\data\LER20250220.csv'
OUTPUT_SQL_PATH = r'scripts\seed-sinader-catalogs-adapted.sql'

# Datos de Tratamientos (Transcribed from images)
# Format: (Category, Subcategory, Name, Code)
# NOTE: Subcategory will be ignored as it doesn't exist in schema
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

def parse_ler_code(code_str):
    """Parse LER code like '01 01 01' into components"""
    clean_code = code_str.replace(' ', '').strip()
    if len(clean_code) >= 6:
        return clean_code[0:2], clean_code[2:4], clean_code[4:6]
    return None, None, None

def generate_ler_seeds():
    print("Reading LER CSV...")
    
    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- SEED DATA: LER CODES (Lista Europea de Residuos)")
    sql_statements.append("-- Adapted to existing Supabase schema")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.ler_codes CASCADE;")
    
    try:
        with open(LER_CSV_PATH, 'r', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';')
            
            count = 0
            for row in reader:
                if 'Código' not in row:
                    print(f"Error: Missing 'Código' column")
                    return []
                    
                full_code = row['Código'].strip()
                
                # Parse code into components
                chapter, subchapter, specific = parse_ler_code(full_code)
                if not chapter:
                    print(f"Warning: Could not parse code {full_code}, skipping")
                    continue
                
                # Clean code for storage (remove spaces)
                clean_code = full_code.replace(' ', '')
                
                # Parse Description (Residuo)
                residuo_raw = row['Residuo'].split('|', 1)
                if len(residuo_raw) > 1 and residuo_raw[0].strip().replace(' ', '') == clean_code:
                    description = residuo_raw[1].strip()
                else:
                    description = row['Residuo'].strip()
                
                # Detect hazardous waste (marked with *)
                is_hazardous = '*' in description or '*' in full_code
                description = description.replace('*', '').strip()
                
                sql = f"""INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ({escape_sql(clean_code)}, {escape_sql(chapter)}, {escape_sql(subchapter)}, {escape_sql(specific)}, {escape_sql(description)}, {is_hazardous}, 'LER-EU');"""
                sql_statements.append(sql)
                count += 1
                
    except Exception as e:
        print(f"Error reading CSV: {e}")
        return []
        
    print(f"Generated {count} LER inserts")
    return sql_statements

def generate_treatment_seeds():
    print("Generating Waste Treatment seeds...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: WASTE TREATMENTS (Operaciones de Eliminación y Valorización)")
    sql_statements.append("-- Adapted to existing Supabase schema")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.waste_treatments CASCADE;")
    
    # Category mapping to match schema constraints
    category_map = {
        'Eliminación': 'eliminacion',
        'Valorización': 'valorizacion'
    }
    
    # Detect pretratamiento from subcategory
    for original_cat, subcategory, name, code in TREATMENTS:
        # Map category
        if 'Pretratamiento' in subcategory or 'pretratamiento' in subcategory.lower():
            mapped_category = 'pretratamiento'
        else:
            mapped_category = category_map.get(original_cat, 'eliminacion')
        
        sql = f"""INSERT INTO public.waste_treatments (code, name, category)
VALUES ({escape_sql(code)}, {escape_sql(name)}, {escape_sql(mapped_category)});"""
        sql_statements.append(sql)
        
    print(f"Generated {len(TREATMENTS)} Treatment inserts")
    return sql_statements

def generate_subscription_plans():
    print("Generating Subscription Plans seeds...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: SUBSCRIPTION PLANS")
    sql_statements.append("-- Adapted to existing Supabase schema")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.subscription_plans CASCADE;")
    
    plans = [
        {
            'code': 'free',
            'name': 'Plan Semilla',
            'sector': 'public',  # Orientado a municipios pequeños
            'price': 0,
            'max_custom_indicators': 5,
            'features': {
                "users": 1,
                "establishments": 1,
                "storage_gb": 1,
                "support": "community",
                "monthly_declarations": 10
            }
        },
        {
            'code': 'pro',
            'name': 'Plan Brote',
            'sector': 'private',  # Empresas medianas
            'price': 50000,
            'max_custom_indicators': 20,
            'features': {
                "users": 5,
                "establishments": 5,
                "storage_gb": 10,
                "support": "email",
                "monthly_declarations": 100
            }
        },
        {
            'code': 'enterprise',
            'name': 'Plan Bosque',
            'sector': 'public',  # Grandes municipios/GORE
            'price': 150000,
            'max_custom_indicators': None,  # Unlimited
            'features': {
                "users": "unlimited",
                "establishments": "unlimited",
                "storage_gb": 100,
                "support": "priority",
                "monthly_declarations": "unlimited"
            }
        }
    ]
    
    for plan in plans:
        # Convert features dict to JSON string
        import json
        features_json = json.dumps(plan['features'], ensure_ascii=False)
        
        # Handle unlimited indicators
        max_indicators = 'NULL' if plan['max_custom_indicators'] is None else str(plan['max_custom_indicators'])
        
        sql = f"""INSERT INTO public.subscription_plans (code, name, sector, price, currency, max_custom_indicators, features)
VALUES ({escape_sql(plan['code'])}, {escape_sql(plan['name'])}, {escape_sql(plan['sector'])}, {plan['price']}, 'CLP', {max_indicators}, {escape_sql(features_json)}::jsonb);"""
        sql_statements.append(sql)
        
    print(f"Generated {len(plans)} Subscription Plan inserts")
    return sql_statements

def main():
    print("=" * 70)
    print("SINADER SEED GENERATOR - ADAPTED TO EXISTING SCHEMA")
    print("=" * 70)
    
    ler_sql = generate_ler_seeds()
    treatment_sql = generate_treatment_seeds()
    plans_sql = generate_subscription_plans()
    
    all_sql = ler_sql + treatment_sql + plans_sql
    
    # Write to file
    os.makedirs(os.path.dirname(OUTPUT_SQL_PATH), exist_ok=True)
    with open(OUTPUT_SQL_PATH, 'w', encoding='utf-8') as f:
        f.write('\n'.join(all_sql))
        
    print(f"\n✅ Successfully wrote SQL seeds to {OUTPUT_SQL_PATH}")
    print(f"   Total statements: {len(all_sql)}")
    print(f"   File size: {os.path.getsize(OUTPUT_SQL_PATH)} bytes")

if __name__ == '__main__':
    main()
