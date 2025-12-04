#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
SINADER Seed Generator - Versión Final Optimizada
Genera seeds SQL para ler_codes, waste_treatments y subscription_plans
adaptado al schema optimizado validado por el usuario.

Fecha: 2025-12-01
"""

import csv
import json
import os
from pathlib import Path

# ==============================================================================
# CONFIGURACIÓN
# ==============================================================================

BASE_DIR = Path(__file__).parent.parent
LER_CSV_PATH = BASE_DIR / 'docs' / 'data' / 'LER20250220.csv'
OUTPUT_SQL_PATH = BASE_DIR / 'scripts' / 'seed-sinader-final.sql'

# ==============================================================================
# DATOS DE TRATAMIENTOS (Fuente: Imágenes oficiales SINADER)
# ==============================================================================

TREATMENTS = [
    # (id, code, name, category, subcategory, description)
    
    # ELIMINACIÓN - Disposición final
    (11, '11', 'Relleno sanitario', 'eliminacion', 'Disposición final', None),
    (12, '12', 'Vertedero', 'eliminacion', 'Disposición final', None),
    (14, '14', 'Monorelleno', 'eliminacion', 'Disposición final', None),
    (30, '30', 'Basural', 'eliminacion', 'Disposición final', None),
    (32, '32', 'Recepción de Lodos en PTAS', 'eliminacion', 'Disposición final', None),
    (33, '33', 'Depósito de Seguridad', 'eliminacion', 'Disposición final', None),
    (60, '60', 'Sitio de Escombros de la Construcción', 'eliminacion', 'Disposición final', None),
    (65, '65', 'Área de disposición controlada', 'eliminacion', 'Disposición final', None),
    
    
    # ELIMINACIÓN - Pretratamiento (Centro de acopio) - 3 tratamientos
    (58, '58', 'Depósito de Cenizas', 'eliminacion', 'Pretratamiento (Centro de acopio)', None),
    (49, '49', 'Residuos Voluminosos', 'eliminacion', 'Pretratamiento (Centro de acopio)', None),
    (56, '56', 'Residuos Municipales', 'eliminacion', 'Pretratamiento (Centro de acopio)', None),
    
    # ELIMINACIÓN - Incineración sin recuperación de energía - 1 tratamiento
    (4, '4', 'Incineración sin recuperación de energía', 'eliminacion', 'Incineración sin recuperación de energía', 'Incineración sin recuperación de energía'),
    
    # VALORIZACIÓN - Pretratamiento (Centro de acopio) - 18 tratamientos
    (36, '36', 'Pretratamiento de papel, cartón y productos de papel', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (37, '37', 'Pretratamiento vidrio', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (38, '38', 'Pretratamiento de ropa', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (39, '39', 'Pretratamiento de textil, cuero y piel', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (40, '40', 'Pretratamiento de aceites y grasas comestibles', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (41, '41', 'Pretratamiento de pinturas, tintas, adhesivos y resinas que no contienen sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (42, '42', 'Pretratamiento de detergentes que no contienen sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (43, '43', 'Pretratamiento de madera que no contiene sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (44, '44', 'Pretratamiento de Metales', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (45, '45', 'Pretratamiento de plásticos', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (47, '47', 'Pretratamiento de Neumáticos Fuera de Uso', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (50, '50', 'Pretratamiento de Residuos Voluminosos', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (57, '57', 'Aparatos eléctricos y electrónicos', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (61, '61', 'Pretratamiento de caucho y goma', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (64, '64', 'Materiales eléctricos', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (73, '73', 'Residuos Agroalimentarios', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (74, '74', 'Tintas secas y Fertilizantes', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    (75, '75', 'Pretratamiento de Equipos de Refrigeración', 'valorizacion', 'Pretratamiento (Centro de acopio)', None),
    
    # VALORIZACIÓN - Reciclaje
    (16, '16', 'Reciclaje de papel, cartón y productos de papel', 'valorizacion', 'Reciclaje', None),
    (17, '17', 'Reciclaje de textiles', 'valorizacion', 'Reciclaje', None),
    (18, '18', 'Reciclaje de plásticos', 'valorizacion', 'Reciclaje', None),
    (19, '19', 'Reciclaje de vidrio', 'valorizacion', 'Reciclaje', None),
    (20, '20', 'Reciclaje de metales', 'valorizacion', 'Reciclaje', None),
    (22, '22', 'Residuos voluminosos', 'valorizacion', 'Reciclaje', None),
    (46, '46', 'Reciclaje de Neumáticos Fuera de Uso', 'valorizacion', 'Reciclaje', None),
    (66, '66', 'Reciclaje de residuos de pastas y/o productos alimenticios para consumo animal', 'valorizacion', 'Reciclaje', None),
    (76, '76', 'Reciclaje de Aparatos eléctricos y electrónicos', 'valorizacion', 'Reciclaje', None),
    
    # VALORIZACIÓN - Recuperación de energía
    (24, '24', 'Co-incineración', 'valorizacion', 'Recuperación de energía', None),
    (25, '25', 'Incineración con recuperación de energía', 'valorizacion', 'Recuperación de energía', None),
    (9, '9', 'Recuperación de energía', 'valorizacion', 'Recuperación de energía', None),
    
    # VALORIZACIÓN - Recepción de Lodos de PTAS
    (63, '63', 'Aplicación a suelo', 'valorizacion', 'Recepción de Lodos de PTAS', None),
    (62, '62', 'Recepción de Lodos de PTAS', 'valorizacion', 'Recepción de Lodos de PTAS', None),
    
    # VALORIZACIÓN - Otros
    (7, '7', 'Preparación para reutilización', 'valorizacion', 'Preparación para reutilización', None),
    (23, '23', 'Co-procesamiento', 'valorizacion', 'Co-procesamiento', None),
    (27, '27', 'Compostaje', 'valorizacion', 'Compostaje', None),
    (28, '28', 'Lombricultura', 'valorizacion', 'Lombricultura', None),
    (29, '29', 'Degradación Anaeróbica', 'valorizacion', 'Degradación Anaeróbica', None),
    (31, '31', 'Aplicación al Suelo', 'valorizacion', 'Aplicación al Suelo', None),
    (34, '34', 'Reducción de Recursos Hidrobiológicos', 'valorizacion', 'Reducción de Recursos Hidrobiológicos', None),
    (68, '68', 'Reducción de residuos orgánicos en base a larvas de insectos', 'valorizacion', 'Reducción de residuos orgánicos', None),
]

# ==============================================================================
# UTILIDADES
# ==============================================================================

def escape_sql(text):
    """Escapa comillas simples para SQL"""
    if text is None:
        return 'NULL'
    return "'" + str(text).replace("'", "''") + "'"

def parse_ler_code(code_str):
    """
    Parsea código LER "01 01 01" en componentes.
    Retorna: (chapter, subchapter, waste_code, code_formatted)
    """
    # Remover espacios y parsear
    clean = code_str.replace(' ', '').strip()
    if len(clean) >= 6:
        chapter = clean[0:2]
        subchapter = clean[2:4]
        waste_code = clean[4:6]
        # Reformatear con espacios
        code_formatted = f"{chapter} {subchapter} {waste_code}"
        return chapter, subchapter, waste_code, code_formatted
    return None, None, None, None

# ==============================================================================
# GENERADORES DE SEEDS
# ==============================================================================

def generate_ler_seeds():
    """Genera SQL seeds para ler_codes desde CSV"""
    print("📄 Leyendo códigos LER desde CSV...")
    
    sql_statements = []
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("-- SEED DATA: LER CODES (Lista Europea de Residuos)")
    sql_statements.append("-- Fuente: LER20250220.csv")
    sql_statements.append("-- Nota: SINADER solo gestiona residuos NO peligrosos")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.ler_codes CASCADE;")
    sql_statements.append("")
    
    # Diccionario para almacenar chapter y subchapter descriptions
    chapters = {}
    subchapters = {}
    
    try:
        with open(LER_CSV_PATH, 'r', encoding='utf-8-sig') as f:
            reader = csv.DictReader(f, delimiter=';')
            
            count = 0
            for row in reader:
                if 'Código' not in row:
                    print(f"⚠️ Error: Columna 'Código' no encontrada")
                    return []
                
                full_code = row['Código'].strip()
                chapter, subchapter, waste_code, code_formatted = parse_ler_code(full_code)
                
                if not chapter:
                    print(f"⚠️ Warning: No se pudo parsear código {full_code}, omitiendo")
                    continue
                
                # ID sin espacios
                id_value = full_code.replace(' ', '')
                
                # Parsear descripciones del CSV
                # Capítulo: "01 | Descripción..."
                chapter_raw = row['Capítulo'].split('|', 1)
                chapter_desc = chapter_raw[1].strip() if len(chapter_raw) > 1 else ''
                chapters[chapter] = chapter_desc
                
                # Subcapítulo: "01 | Descripción..."
                subchapter_raw = row['Subcapítulo'].split('|', 1)
                subchapter_desc = subchapter_raw[1].strip() if len(subchapter_raw) > 1 else ''
                subchapters[f"{chapter}{subchapter}"] = subchapter_desc
                
                # Descripción del residuo (Residuo)
                residuo_raw = row['Residuo'].split('|', 1)
                if len(residuo_raw) > 1 and residuo_raw[0].strip().replace(' ', '') == id_value:
                    waste_description = residuo_raw[1].strip()
                else:
                    waste_description = row['Residuo'].strip()
                
                # Remover asteriscos de peligrosidad (no aplica en SINADER)
                waste_description = waste_description.replace('*', '').strip()
                
                sql = f"""INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ({escape_sql(id_value)}, {escape_sql(code_formatted)}, {escape_sql(chapter)}, {escape_sql(chapter_desc)}, {escape_sql(subchapter)}, {escape_sql(subchapter_desc)}, {escape_sql(waste_code)}, {escape_sql(waste_description)}, FALSE);"""
                sql_statements.append(sql)
                count += 1
                
    except Exception as e:
        print(f"❌ Error leyendo CSV: {e}")
        return []
        
    print(f"✅ Generados {count} códigos LER")
    return sql_statements

def generate_treatment_seeds():
    """Genera SQL seeds para waste_treatments"""
    print("\n🏭 Generando seeds de tratamientos...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: WASTE TREATMENTS (Operaciones de Tratamiento)")
    sql_statements.append("-- Fuente: Imágenes oficiales SINADER transcritas")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.waste_treatments CASCADE;")
    sql_statements.append("")
    
    for id_val, code, name, category, subcategory, description in TREATMENTS:
        desc_sql = escape_sql(description) if description else 'NULL'
        subcat_sql = escape_sql(subcategory) if subcategory else 'NULL'
        
        sql = f"""INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES ({id_val}, {escape_sql(code)}, {escape_sql(name)}, {escape_sql(category)}, {subcat_sql}, {desc_sql});"""
        sql_statements.append(sql)
    
    print(f"✅ Generados {len(TREATMENTS)} tratamientos")
    return sql_statements

def generate_subscription_plans():
    """Genera SQL seeds para subscription_plans"""
    print("\n💳 Generando planes de suscripción...")
    
    sql_statements = []
    sql_statements.append("\n-- ==============================================================================")
    sql_statements.append("-- SEED DATA: SUBSCRIPTION PLANS")
    sql_statements.append("-- Planes diferenciados por sector (public/private) y tipo de entidad")
    sql_statements.append("-- ==============================================================================")
    sql_statements.append("TRUNCATE TABLE public.subscription_plans CASCADE;")
    sql_statements.append("")
    
    plans = [
        # Planes para SECTOR PRIVADO (Empresas)
        {
            'code': 'free',
            'name': 'Plan Semilla',
            'description': 'Plan gratuito para pequeñas organizaciones que inician su gestión de residuos',
            'sector': 'private',
            'public_entity_type': None,
            'price_clp': 0,
            'limits': {
                "users": 1,
                "establishments": 1,
                "storage_gb": 1,
                "monthly_declarations": 10,
                "custom_indicators": 5
            },
            'features': {
                "support": "community",
                "advanced_analytics": False,
                "custom_reports": False,
                "api_access": False,
                "data_visualization": "basic"
            },
            'is_recommended': False,
            'display_order': 1
        },
        {
            'code': 'pro_small',
            'name': 'Plan Brote',
            'description': 'Para empresas pequeñas y medianas en crecimiento',
            'sector': 'private',
            'public_entity_type': None,
            'price_clp': 50000,
            'limits': {
                "users": 5,
                "establishments": 5,
                "storage_gb": 10,
                "monthly_declarations": 100,
                "custom_indicators": 20
            },
            'features': {
                "support": "email",
                "advanced_analytics": True,
                "custom_reports": True,
                "api_access": True,
                "data_visualization": "advanced"
            },
            'is_recommended': True,
            'display_order': 2
        },
        {
            'code': 'pro_large',
            'name': 'Plan Bosque',
            'description': 'Solución integral para grandes empresas generadoras',
            'sector': 'private',
            'public_entity_type': None,
            'price_clp': 150000,
            'limits': {
                "users": "unlimited",
                "establishments": "unlimited",
                "storage_gb": 100,
                "monthly_declarations": "unlimited",
                "custom_indicators": "unlimited"
            },
            'features': {
                "support": "priority",
                "advanced_analytics": True,
                "custom_reports": True,
                "api_access": True,
                "whitelabel": True,
                "sla_uptime": 99.9,
                "data_visualization": "advanced"
            },
            'is_recommended': False,
            'display_order': 3
        },
        
        # Planes para SECTOR PÚBLICO
        {
            'code': 'municipality',
            'name': 'Plan Municipalidad',
            'description': 'Para gobiernos locales y municipalidades',
            'sector': 'public',
            'public_entity_type': 'municipality',
            'price_clp': 30000,
            'limits': {
                "users": 10,
                "establishments": "unlimited",
                "storage_gb": 20,
                "monthly_declarations": "unlimited",
                "custom_indicators": 30
            },
            'features': {
                "support": "email",
                "advanced_analytics": True,
                "custom_reports": True,
                "api_access": True,
                "data_visualization": "basic"
            },
            'is_recommended': False,
            'display_order': 4
        },
        {
            'code': 'gore',
            'name': 'Plan GORE / SEREMI',
            'description': 'Para gobiernos regionales y servicios ministeriales - Visualización agregada de todas las comunas',
            'sector': 'public',
            'public_entity_type': 'gore',
            'price_clp': 200000,
            'limits': {
                "users": "unlimited",
                "establishments": "unlimited",
                "storage_gb": 500,
                "monthly_declarations": "unlimited",
                "custom_indicators": "unlimited"
            },
            'features': {
                "support": "priority",
                "advanced_analytics": True,
                "custom_reports": True,
                "api_access": True,
                "data_visualization": "regional_aggregation",
                "multi_commune_dashboard": True,
                "sla_uptime": 99.9
            },
            'is_recommended': False,
            'display_order': 5
        }
    ]
    
    for plan in plans:
        limits_json = json.dumps(plan['limits'], ensure_ascii=False)
        features_json = json.dumps(plan['features'], ensure_ascii=False)
        
        public_entity = escape_sql(plan['public_entity_type']) if plan['public_entity_type'] else 'NULL'
        
        sql = f"""INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  {escape_sql(plan['code'])}, 
  {escape_sql(plan['name'])}, 
  {escape_sql(plan['description'])}, 
  {escape_sql(plan['sector'])}, 
  {public_entity}, 
  {plan['price_clp']}, 
  'CLP', 
  {escape_sql(limits_json)}::jsonb, 
  {escape_sql(features_json)}::jsonb, 
  {plan['is_recommended']}, 
  {plan['display_order']}
);"""
        sql_statements.append(sql)
    
    print(f"✅ Generados {len(plans)} planes de suscripción")
    return sql_statements

# ==============================================================================
# MAIN
# ==============================================================================

def main():
    print("=" * 80)
    print("🌱 GENERADOR DE SEEDS SINADER - VERSIÓN FINAL OPTIMIZADA")
    print("=" * 80)
    
    # Generar seeds
    ler_sql = generate_ler_seeds()
    treatment_sql = generate_treatment_seeds()
    plans_sql = generate_subscription_plans()
    
    if not ler_sql:
        print("\n❌ Error generando seeds de LER codes")
        return
    
    # Combinar todos los SQL
    all_sql = ler_sql + treatment_sql + plans_sql
    
    # Escribir a archivo
    output_path = OUTPUT_SQL_PATH
    output_path.parent.mkdir(parents=True, exist_ok=True)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(all_sql))
    
    print(f"\n{'=' * 80}")
    print(f"✅ SEEDS GENERADOS EXITOSAMENTE")
    print(f"{'=' * 80}")
    print(f"📁 Archivo: {output_path}")
    print(f"📊 Total statements: {len(all_sql)}")
    print(f"💾 Tamaño: {output_path.stat().st_size:,} bytes")
    print(f"\n🚀 Siguiente paso: Ejecutar en Supabase SQL Editor")

if __name__ == '__main__':
    main()
