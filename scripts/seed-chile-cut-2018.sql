-- ==============================================================================
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
(152, '01', 'Tarapacá', 'TPCA'),
(152, '02', 'Antofagasta', 'ANTOF'),
(152, '03', 'Atacama', 'ATCMA'),
(152, '04', 'Coquimbo', 'COQ'),
(152, '05', 'Valparaíso', 'VALPO'),
(152, '06', 'Libertador General Bernardo O''Higgins', 'LGBO'),
(152, '07', 'Maule', 'MAULE'),
(152, '08', 'Biobío', 'BBIO'),
(152, '09', 'La Araucanía', 'ARAUC'),
(152, '10', 'Los Lagos', 'LAGOS'),
(152, '11', 'Aysén del General Carlos Ibáñez del Campo', 'AYSEN'),
(152, '12', 'Magallanes y de la Antártica Chilena', 'MAG'),
(152, '13', 'Metropolitana de Santiago', 'RM'),
(152, '14', 'Los Ríos', 'RIOS'),
(152, '15', 'Arica y Parinacota', 'AyP'),
(152, '16', 'Ñuble', 'NUBLE')
ON CONFLICT (country_id, local_code) DO NOTHING;

-- ==============================================================================
-- PARTE 2: INSERCIÓN DE COMUNAS (346 comunas)
-- ==============================================================================
-- Organizadas por región con bloques transaccionales

-- ------------------------------------------------------------------------------
-- Región 01: Tarapacá (7 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '01';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 01 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '01101', 'Iquique', '011', 'Iquique'),
    (region_id_var, 152, '01107', 'Alto Hospicio', '011', 'Iquique'),
    (region_id_var, 152, '01401', 'Pozo Almonte', '014', 'Tamarugal'),
    (region_id_var, 152, '01402', 'Camiña', '014', 'Tamarugal'),
    (region_id_var, 152, '01403', 'Colchane', '014', 'Tamarugal'),
    (region_id_var, 152, '01404', 'Huara', '014', 'Tamarugal'),
    (region_id_var, 152, '01405', 'Pica', '014', 'Tamarugal')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 02: Antofagasta (9 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '02';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 02 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '02101', 'Antofagasta', '021', 'Antofagasta'),
    (region_id_var, 152, '02102', 'Mejillones', '021', 'Antofagasta'),
    (region_id_var, 152, '02103', 'Sierra Gorda', '021', 'Antofagasta'),
    (region_id_var, 152, '02104', 'Taltal', '021', 'Antofagasta'),
    (region_id_var, 152, '02201', 'Calama', '022', 'El Loa'),
    (region_id_var, 152, '02202', 'Ollagüe', '022', 'El Loa'),
    (region_id_var, 152, '02203', 'San Pedro de Atacama', '022', 'El Loa'),
    (region_id_var, 152, '02301', 'Tocopilla', '023', 'Tocopilla'),
    (region_id_var, 152, '02302', 'María Elena', '023', 'Tocopilla')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 03: Atacama (9 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '03';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 03 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '03101', 'Copiapó', '031', 'Copiapó'),
    (region_id_var, 152, '03102', 'Caldera', '031', 'Copiapó'),
    (region_id_var, 152, '03103', 'Tierra Amarilla', '031', 'Copiapó'),
    (region_id_var, 152, '03201', 'Chañaral', '032', 'Chañaral'),
    (region_id_var, 152, '03202', 'Diego de Almagro', '032', 'Chañaral'),
    (region_id_var, 152, '03301', 'Vallenar', '033', 'Huasco'),
    (region_id_var, 152, '03302', 'Alto del Carmen', '033', 'Huasco'),
    (region_id_var, 152, '03303', 'Freirina', '033', 'Huasco'),
    (region_id_var, 152, '03304', 'Huasco', '033', 'Huasco')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 04: Coquimbo (15 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '04';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 04 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '04101', 'La Serena', '041', 'Elqui'),
    (region_id_var, 152, '04102', 'Coquimbo', '041', 'Elqui'),
    (region_id_var, 152, '04103', 'Andacollo', '041', 'Elqui'),
    (region_id_var, 152, '04104', 'La Higuera', '041', 'Elqui'),
    (region_id_var, 152, '04105', 'Paiguano', '041', 'Elqui'),
    (region_id_var, 152, '04106', 'Vicuña', '041', 'Elqui'),
    (region_id_var, 152, '04201', 'Illapel', '042', 'Choapa'),
    (region_id_var, 152, '04202', 'Canela', '042', 'Choapa'),
    (region_id_var, 152, '04203', 'Los Vilos', '042', 'Choapa'),
    (region_id_var, 152, '04204', 'Salamanca', '042', 'Choapa'),
    (region_id_var, 152, '04301', 'Ovalle', '043', 'Limarí'),
    (region_id_var, 152, '04302', 'Combarbalá', '043', 'Limarí'),
    (region_id_var, 152, '04303', 'Monte Patria', '043', 'Limarí'),
    (region_id_var, 152, '04304', 'Punitaqui', '043', 'Limarí'),
    (region_id_var, 152, '04305', 'Río Hurtado', '043', 'Limarí')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 05: Valparaíso (38 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '05';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 05 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '05101', 'Valparaíso', '051', 'Valparaíso'),
    (region_id_var, 152, '05102', 'Casablanca', '051', 'Valparaíso'),
    (region_id_var, 152, '05103', 'Concón', '051', 'Valparaíso'),
    (region_id_var, 152, '05104', 'Juan Fernández', '051', 'Valparaíso'),
    (region_id_var, 152, '05105', 'Puchuncaví', '051', 'Valparaíso'),
    (region_id_var, 152, '05107', 'Quintero', '051', 'Valparaíso'),
    (region_id_var, 152, '05109', 'Viña del Mar', '051', 'Valparaíso'),
    (region_id_var, 152, '05201', 'Isla de Pascua', '052', 'Isla de Pascua'),
    (region_id_var, 152, '05301', 'Los Andes', '053', 'Los Andes'),
    (region_id_var, 152, '05302', 'Calle Larga', '053', 'Los Andes'),
    (region_id_var, 152, '05303', 'Rinconada', '053', 'Los Andes'),
    (region_id_var, 152, '05304', 'San Esteban', '053', 'Los Andes'),
    (region_id_var, 152, '05401', 'La Ligua', '054', 'Petorca'),
    (region_id_var, 152, '05402', 'Cabildo', '054', 'Petorca'),
    (region_id_var, 152, '05403', 'Papudo', '054', 'Petorca'),
    (region_id_var, 152, '05404', 'Petorca', '054', 'Petorca'),
    (region_id_var, 152, '05405', 'Zapallar', '054', 'Petorca'),
    (region_id_var, 152, '05501', 'Quillota', '055', 'Quillota'),
    (region_id_var, 152, '05502', 'Calera', '055', 'Quillota'),
    (region_id_var, 152, '05503', 'Hijuelas', '055', 'Quillota'),
    (region_id_var, 152, '05504', 'La Cruz', '055', 'Quillota'),
    (region_id_var, 152, '05506', 'Nogales', '055', 'Quillota'),
    (region_id_var, 152, '05601', 'San Antonio', '056', 'San Antonio'),
    (region_id_var, 152, '05602', 'Algarrobo', '056', 'San Antonio'),
    (region_id_var, 152, '05603', 'Cartagena', '056', 'San Antonio'),
    (region_id_var, 152, '05604', 'El Quisco', '056', 'San Antonio'),
    (region_id_var, 152, '05605', 'El Tabo', '056', 'San Antonio'),
    (region_id_var, 152, '05606', 'Santo Domingo', '056', 'San Antonio'),
    (region_id_var, 152, '05701', 'San Felipe', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05702', 'Catemu', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05703', 'Llaillay', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05704', 'Panquehue', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05705', 'Putaendo', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05706', 'Santa María', '057', 'San Felipe de Aconcagua'),
    (region_id_var, 152, '05801', 'Quilpué', '058', 'Marga Marga'),
    (region_id_var, 152, '05802', 'Limache', '058', 'Marga Marga'),
    (region_id_var, 152, '05803', 'Olmué', '058', 'Marga Marga'),
    (region_id_var, 152, '05804', 'Villa Alemana', '058', 'Marga Marga')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 06: Libertador General Bernardo O'Higgins (33 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '06';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 06 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '06101', 'Rancagua', '061', 'Cachapoal'),
    (region_id_var, 152, '06102', 'Codegua', '061', 'Cachapoal'),
    (region_id_var, 152, '06103', 'Coinco', '061', 'Cachapoal'),
    (region_id_var, 152, '06104', 'Coltauco', '061', 'Cachapoal'),
    (region_id_var, 152, '06105', 'Doñihue', '061', 'Cachapoal'),
    (region_id_var, 152, '06106', 'Graneros', '061', 'Cachapoal'),
    (region_id_var, 152, '06107', 'Las Cabras', '061', 'Cachapoal'),
    (region_id_var, 152, '06108', 'Machalí', '061', 'Cachapoal'),
    (region_id_var, 152, '06109', 'Malloa', '061', 'Cachapoal'),
    (region_id_var, 152, '06110', 'Mostazal', '061', 'Cachapoal'),
    (region_id_var, 152, '06111', 'Olivar', '061', 'Cachapoal'),
    (region_id_var, 152, '06112', 'Peumo', '061', 'Cachapoal'),
    (region_id_var, 152, '06113', 'Pichidegua', '061', 'Cachapoal'),
    (region_id_var, 152, '06114', 'Quinta de Tilcoco', '061', 'Cachapoal'),
    (region_id_var, 152, '06115', 'Rengo', '061', 'Cachapoal'),
    (region_id_var, 152, '06116', 'Requínoa', '061', 'Cachapoal'),
    (region_id_var, 152, '06117', 'San Vicente', '061', 'Cachapoal'),
    (region_id_var, 152, '06201', 'Pichilemu', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06202', 'La Estrella', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06203', 'Litueche', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06204', 'Marchihue', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06205', 'Navidad', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06206', 'Paredones', '062', 'Cardenal Caro'),
    (region_id_var, 152, '06301', 'San Fernando', '063', 'Colchagua'),
    (region_id_var, 152, '06302', 'Chépica', '063', 'Colchagua'),
    (region_id_var, 152, '06303', 'Chimbarongo', '063', 'Colchagua'),
    (region_id_var, 152, '06304', 'Lolol', '063', 'Colchagua'),
    (region_id_var, 152, '06305', 'Nancagua', '063', 'Colchagua'),
    (region_id_var, 152, '06306', 'Palmilla', '063', 'Colchagua'),
    (region_id_var, 152, '06307', 'Peralillo', '063', 'Colchagua'),
    (region_id_var, 152, '06308', 'Placilla', '063', 'Colchagua'),
    (region_id_var, 152, '06309', 'Pumanque', '063', 'Colchagua'),
    (region_id_var, 152, '06310', 'Santa Cruz', '063', 'Colchagua')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 07: Maule (30 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '07';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 07 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '07101', 'Talca', '071', 'Talca'),
    (region_id_var, 152, '07102', 'Constitución', '071', 'Talca'),
    (region_id_var, 152, '07103', 'Curepto', '071', 'Talca'),
    (region_id_var, 152, '07104', 'Empedrado', '071', 'Talca'),
    (region_id_var, 152, '07105', 'Maule', '071', 'Talca'),
    (region_id_var, 152, '07106', 'Pelarco', '071', 'Talca'),
    (region_id_var, 152, '07107', 'Pencahue', '071', 'Talca'),
    (region_id_var, 152, '07108', 'Río Claro', '071', 'Talca'),
    (region_id_var, 152, '07109', 'San Clemente', '071', 'Talca'),
    (region_id_var, 152, '07110', 'San Rafael', '071', 'Talca'),
    (region_id_var, 152, '07201', 'Cauquenes', '072', 'Cauquenes'),
    (region_id_var, 152, '07202', 'Chanco', '072', 'Cauquenes'),
    (region_id_var, 152, '07203', 'Pelluhue', '072', 'Cauquenes'),
    (region_id_var, 152, '07301', 'Curicó', '073', 'Curicó'),
    (region_id_var, 152, '07302', 'Hualañé', '073', 'Curicó'),
    (region_id_var, 152, '07303', 'Licantén', '073', 'Curicó'),
    (region_id_var, 152, '07304', 'Molina', '073', 'Curicó'),
    (region_id_var, 152, '07305', 'Rauco', '073', 'Curicó'),
    (region_id_var, 152, '07306', 'Romeral', '073', 'Curicó'),
    (region_id_var, 152, '07307', 'Sagrada Familia', '073', 'Curicó'),
    (region_id_var, 152, '07308', 'Teno', '073', 'Curicó'),
    (region_id_var, 152, '07309', 'Vichuquén', '073', 'Curicó'),
    (region_id_var, 152, '07401', 'Linares', '074', 'Linares'),
    (region_id_var, 152, '07402', 'Colbún', '074', 'Linares'),
    (region_id_var, 152, '07403', 'Longaví', '074', 'Linares'),
    (region_id_var, 152, '07404', 'Parral', '074', 'Linares'),
    (region_id_var, 152, '07405', 'Retiro', '074', 'Linares'),
    (region_id_var, 152, '07406', 'San Javier', '074', 'Linares'),
    (region_id_var, 152, '07407', 'Villa Alegre', '074', 'Linares'),
    (region_id_var, 152, '07408', 'Yerbas Buenas', '074', 'Linares')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 08: Biobío (33 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '08';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 08 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '08101', 'Concepción', '081', 'Concepción'),
    (region_id_var, 152, '08102', 'Coronel', '081', 'Concepción'),
    (region_id_var, 152, '08103', 'Chiguayante', '081', 'Concepción'),
    (region_id_var, 152, '08104', 'Florida', '081', 'Concepción'),
    (region_id_var, 152, '08105', 'Hualqui', '081', 'Concepción'),
    (region_id_var, 152, '08106', 'Lota', '081', 'Concepción'),
    (region_id_var, 152, '08107', 'Penco', '081', 'Concepción'),
    (region_id_var, 152, '08108', 'San Pedro de la Paz', '081', 'Concepción'),
    (region_id_var, 152, '08109', 'Santa Juana', '081', 'Concepción'),
    (region_id_var, 152, '08110', 'Talcahuano', '081', 'Concepción'),
    (region_id_var, 152, '08111', 'Tomé', '081', 'Concepción'),
    (region_id_var, 152, '08112', 'Hualpén', '081', 'Concepción'),
    (region_id_var, 152, '08201', 'Lebu', '082', 'Arauco'),
    (region_id_var, 152, '08202', 'Arauco', '082', 'Arauco'),
    (region_id_var, 152, '08203', 'Cañete', '082', 'Arauco'),
    (region_id_var, 152, '08204', 'Contulmo', '082', 'Arauco'),
    (region_id_var, 152, '08205', 'Curanilahue', '082', 'Arauco'),
    (region_id_var, 152, '08206', 'Los Alamos', '082', 'Arauco'),
    (region_id_var, 152, '08207', 'Tirúa', '082', 'Arauco'),
    (region_id_var, 152, '08301', 'Los Angeles', '083', 'Biobío'),
    (region_id_var, 152, '08302', 'Antuco', '083', 'Biobío'),
    (region_id_var, 152, '08303', 'Cabrero', '083', 'Biobío'),
    (region_id_var, 152, '08304', 'Laja', '083', 'Biobío'),
    (region_id_var, 152, '08305', 'Mulchén', '083', 'Biobío'),
    (region_id_var, 152, '08306', 'Nacimiento', '083', 'Biobío'),
    (region_id_var, 152, '08307', 'Negrete', '083', 'Biobío'),
    (region_id_var, 152, '08308', 'Quilaco', '083', 'Biobío'),
    (region_id_var, 152, '08309', 'Quilleco', '083', 'Biobío'),
    (region_id_var, 152, '08310', 'San Rosendo', '083', 'Biobío'),
    (region_id_var, 152, '08311', 'Santa Bárbara', '083', 'Biobío'),
    (region_id_var, 152, '08312', 'Tucapel', '083', 'Biobío'),
    (region_id_var, 152, '08313', 'Yumbel', '083', 'Biobío'),
    (region_id_var, 152, '08314', 'Alto Biobío', '083', 'Biobío')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 09: La Araucanía (32 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '09';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 09 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '09101', 'Temuco', '091', 'Cautín'),
    (region_id_var, 152, '09102', 'Carahue', '091', 'Cautín'),
    (region_id_var, 152, '09103', 'Cunco', '091', 'Cautín'),
    (region_id_var, 152, '09104', 'Curarrehue', '091', 'Cautín'),
    (region_id_var, 152, '09105', 'Freire', '091', 'Cautín'),
    (region_id_var, 152, '09106', 'Galvarino', '091', 'Cautín'),
    (region_id_var, 152, '09107', 'Gorbea', '091', 'Cautín'),
    (region_id_var, 152, '09108', 'Lautaro', '091', 'Cautín'),
    (region_id_var, 152, '09109', 'Loncoche', '091', 'Cautín'),
    (region_id_var, 152, '09110', 'Melipeuco', '091', 'Cautín'),
    (region_id_var, 152, '09111', 'Nueva Imperial', '091', 'Cautín'),
    (region_id_var, 152, '09112', 'Padre Las Casas', '091', 'Cautín'),
    (region_id_var, 152, '09113', 'Perquenco', '091', 'Cautín'),
    (region_id_var, 152, '09114', 'Pitrufquén', '091', 'Cautín'),
    (region_id_var, 152, '09115', 'Pucón', '091', 'Cautín'),
    (region_id_var, 152, '09116', 'Saavedra', '091', 'Cautín'),
    (region_id_var, 152, '09117', 'Teodoro Schmidt', '091', 'Cautín'),
    (region_id_var, 152, '09118', 'Toltén', '091', 'Cautín'),
    (region_id_var, 152, '09119', 'Vilcún', '091', 'Cautín'),
    (region_id_var, 152, '09120', 'Villarrica', '091', 'Cautín'),
    (region_id_var, 152, '09121', 'Cholchol', '091', 'Cautín'),
    (region_id_var, 152, '09201', 'Angol', '092', 'Malleco'),
    (region_id_var, 152, '09202', 'Collipulli', '092', 'Malleco'),
    (region_id_var, 152, '09203', 'Curacautín', '092', 'Malleco'),
    (region_id_var, 152, '09204', 'Ercilla', '092', 'Malleco'),
    (region_id_var, 152, '09205', 'Lonquimay', '092', 'Malleco'),
    (region_id_var, 152, '09206', 'Los Sauces', '092', 'Malleco'),
    (region_id_var, 152, '09207', 'Lumaco', '092', 'Malleco'),
    (region_id_var, 152, '09208', 'Purén', '092', 'Malleco'),
    (region_id_var, 152, '09209', 'Renaico', '092', 'Malleco'),
    (region_id_var, 152, '09210', 'Traiguén', '092', 'Malleco'),
    (region_id_var, 152, '09211', 'Victoria', '092', 'Malleco')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 10: Los Lagos (30 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '10';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 10 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '10101', 'Puerto Montt', '101', 'Llanquihue'),
    (region_id_var, 152, '10102', 'Calbuco', '101', 'Llanquihue'),
    (region_id_var, 152, '10103', 'Cochamó', '101', 'Llanquihue'),
    (region_id_var, 152, '10104', 'Fresia', '101', 'Llanquihue'),
    (region_id_var, 152, '10105', 'Frutillar', '101', 'Llanquihue'),
    (region_id_var, 152, '10106', 'Los Muermos', '101', 'Llanquihue'),
    (region_id_var, 152, '10107', 'Llanquihue', '101', 'Llanquihue'),
    (region_id_var, 152, '10108', 'Maullín', '101', 'Llanquihue'),
    (region_id_var, 152, '10109', 'Puerto Varas', '101', 'Llanquihue'),
    (region_id_var, 152, '10201', 'Castro', '102', 'Chiloé'),
    (region_id_var, 152, '10202', 'Ancud', '102', 'Chiloé'),
    (region_id_var, 152, '10203', 'Chonchi', '102', 'Chiloé'),
    (region_id_var, 152, '10204', 'Curaco de Vélez', '102', 'Chiloé'),
    (region_id_var, 152, '10205', 'Dalcahue', '102', 'Chiloé'),
    (region_id_var, 152, '10206', 'Puqueldón', '102', 'Chiloé'),
    (region_id_var, 152, '10207', 'Queilén', '102', 'Chiloé'),
    (region_id_var, 152, '10208', 'Quellón', '102', 'Chiloé'),
    (region_id_var, 152, '10209', 'Quemchi', '102', 'Chiloé'),
    (region_id_var, 152, '10210', 'Quinchao', '102', 'Chiloé'),
    (region_id_var, 152, '10301', 'Osorno', '103', 'Osorno'),
    (region_id_var, 152, '10302', 'Puerto Octay', '103', 'Osorno'),
    (region_id_var, 152, '10303', 'Purranque', '103', 'Osorno'),
    (region_id_var, 152, '10304', 'Puyehue', '103', 'Osorno'),
    (region_id_var, 152, '10305', 'Río Negro', '103', 'Osorno'),
    (region_id_var, 152, '10306', 'San Juan de la Costa', '103', 'Osorno'),
    (region_id_var, 152, '10307', 'San Pablo', '103', 'Osorno'),
    (region_id_var, 152, '10401', 'Chaitén', '104', 'Palena'),
    (region_id_var, 152, '10402', 'Futaleufú', '104', 'Palena'),
    (region_id_var, 152, '10403', 'Hualaihué', '104', 'Palena'),
    (region_id_var, 152, '10404', 'Palena', '104', 'Palena')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 11: Aysén del General Carlos Ibáñez del Campo (10 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '11';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 11 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '11101', 'Coyhaique', '111', 'Coyhaique'),
    (region_id_var, 152, '11102', 'Lago Verde', '111', 'Coyhaique'),
    (region_id_var, 152, '11201', 'Aysén', '112', 'Aysén'),
    (region_id_var, 152, '11202', 'Cisnes', '112', 'Aysén'),
    (region_id_var, 152, '11203', 'Guaitecas', '112', 'Aysén'),
    (region_id_var, 152, '11301', 'Cochrane', '113', 'Capitán Prat'),
    (region_id_var, 152, '11302', 'O''Higgins', '113', 'Capitán Prat'),
    (region_id_var, 152, '11303', 'Tortel', '113', 'Capitán Prat'),
    (region_id_var, 152, '11401', 'Chile Chico', '114', 'General Carrera'),
    (region_id_var, 152, '11402', 'Río Ibáñez', '114', 'General Carrera')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 12: Magallanes y de la Antártica Chilena (11 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '12';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 12 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '12101', 'Punta Arenas', '121', 'Magallanes'),
    (region_id_var, 152, '12102', 'Laguna Blanca', '121', 'Magallanes'),
    (region_id_var, 152, '12103', 'Río Verde', '121', 'Magallanes'),
    (region_id_var, 152, '12104', 'San Gregorio', '121', 'Magallanes'),
    (region_id_var, 152, '12201', 'Cabo de Hornos', '122', 'Antártica Chilena'),
    (region_id_var, 152, '12202', 'Antártica', '122', 'Antártica Chilena'),
    (region_id_var, 152, '12301', 'Porvenir', '123', 'Tierra del Fuego'),
    (region_id_var, 152, '12302', 'Primavera', '123', 'Tierra del Fuego'),
    (region_id_var, 152, '12303', 'Timaukel', '123', 'Tierra del Fuego'),
    (region_id_var, 152, '12401', 'Natales', '124', 'Última Esperanza'),
    (region_id_var, 152, '12402', 'Torres del Paine', '124', 'Última Esperanza')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 13: Metropolitana de Santiago (52 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '13';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 13 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '13101', 'Santiago', '131', 'Santiago'),
    (region_id_var, 152, '13102', 'Cerrillos', '131', 'Santiago'),
    (region_id_var, 152, '13103', 'Cerro Navia', '131', 'Santiago'),
    (region_id_var, 152, '13104', 'Conchalí', '131', 'Santiago'),
    (region_id_var, 152, '13105', 'El Bosque', '131', 'Santiago'),
    (region_id_var, 152, '13106', 'Estación Central', '131', 'Santiago'),
    (region_id_var, 152, '13107', 'Huechuraba', '131', 'Santiago'),
    (region_id_var, 152, '13108', 'Independencia', '131', 'Santiago'),
    (region_id_var, 152, '13109', 'La Cisterna', '131', 'Santiago'),
    (region_id_var, 152, '13110', 'La Florida', '131', 'Santiago'),
    (region_id_var, 152, '13111', 'La Granja', '131', 'Santiago'),
    (region_id_var, 152, '13112', 'La Pintana', '131', 'Santiago'),
    (region_id_var, 152, '13113', 'La Reina', '131', 'Santiago'),
    (region_id_var, 152, '13114', 'Las Condes', '131', 'Santiago'),
    (region_id_var, 152, '13115', 'Lo Barnechea', '131', 'Santiago'),
    (region_id_var, 152, '13116', 'Lo Espejo', '131', 'Santiago'),
    (region_id_var, 152, '13117', 'Lo Prado', '131', 'Santiago'),
    (region_id_var, 152, '13118', 'Macul', '131', 'Santiago'),
    (region_id_var, 152, '13119', 'Maipú', '131', 'Santiago'),
    (region_id_var, 152, '13120', 'Ñuñoa', '131', 'Santiago'),
    (region_id_var, 152, '13121', 'Pedro Aguirre Cerda', '131', 'Santiago'),
    (region_id_var, 152, '13122', 'Peñalolén', '131', 'Santiago'),
    (region_id_var, 152, '13123', 'Providencia', '131', 'Santiago'),
    (region_id_var, 152, '13124', 'Pudahuel', '131', 'Santiago'),
    (region_id_var, 152, '13125', 'Quilicura', '131', 'Santiago'),
    (region_id_var, 152, '13126', 'Quinta Normal', '131', 'Santiago'),
    (region_id_var, 152, '13127', 'Recoleta', '131', 'Santiago'),
    (region_id_var, 152, '13128', 'Renca', '131', 'Santiago'),
    (region_id_var, 152, '13129', 'San Joaquín', '131', 'Santiago'),
    (region_id_var, 152, '13130', 'San Miguel', '131', 'Santiago'),
    (region_id_var, 152, '13131', 'San Ramón', '131', 'Santiago'),
    (region_id_var, 152, '13132', 'Vitacura', '131', 'Santiago'),
    (region_id_var, 152, '13201', 'Puente Alto', '132', 'Cordillera'),
    (region_id_var, 152, '13202', 'Pirque', '132', 'Cordillera'),
    (region_id_var, 152, '13203', 'San José de Maipo', '132', 'Cordillera'),
    (region_id_var, 152, '13301', 'Colina', '133', 'Chacabuco'),
    (region_id_var, 152, '13302', 'Lampa', '133', 'Chacabuco'),
    (region_id_var, 152, '13303', 'Tiltil', '133', 'Chacabuco'),
    (region_id_var, 152, '13401', 'San Bernardo', '134', 'Maipo'),
    (region_id_var, 152, '13402', 'Buin', '134', 'Maipo'),
    (region_id_var, 152, '13403', 'Calera de Tango', '134', 'Maipo'),
    (region_id_var, 152, '13404', 'Paine', '134', 'Maipo'),
    (region_id_var, 152, '13501', 'Melipilla', '135', 'Melipilla'),
    (region_id_var, 152, '13502', 'Alhué', '135', 'Melipilla'),
    (region_id_var, 152, '13503', 'Curacaví', '135', 'Melipilla'),
    (region_id_var, 152, '13504', 'María Pinto', '135', 'Melipilla'),
    (region_id_var, 152, '13505', 'San Pedro', '135', 'Melipilla'),
    (region_id_var, 152, '13601', 'Talagante', '136', 'Talagante'),
    (region_id_var, 152, '13602', 'El Monte', '136', 'Talagante'),
    (region_id_var, 152, '13603', 'Isla de Maipo', '136', 'Talagante'),
    (region_id_var, 152, '13604', 'Padre Hurtado', '136', 'Talagante'),
    (region_id_var, 152, '13605', 'Peñaflor', '136', 'Talagante')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 14: Los Ríos (12 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '14';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 14 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '14101', 'Valdivia', '141', 'Valdivia'),
    (region_id_var, 152, '14102', 'Corral', '141', 'Valdivia'),
    (region_id_var, 152, '14103', 'Lanco', '141', 'Valdivia'),
    (region_id_var, 152, '14104', 'Los Lagos', '141', 'Valdivia'),
    (region_id_var, 152, '14105', 'Máfil', '141', 'Valdivia'),
    (region_id_var, 152, '14106', 'Mariquina', '141', 'Valdivia'),
    (region_id_var, 152, '14107', 'Paillaco', '141', 'Valdivia'),
    (region_id_var, 152, '14108', 'Panguipulli', '141', 'Valdivia'),
    (region_id_var, 152, '14201', 'La Unión', '142', 'Ranco'),
    (region_id_var, 152, '14202', 'Futrono', '142', 'Ranco'),
    (region_id_var, 152, '14203', 'Lago Ranco', '142', 'Ranco'),
    (region_id_var, 152, '14204', 'Río Bueno', '142', 'Ranco')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 15: Arica y Parinacota (4 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '15';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 15 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '15101', 'Arica', '151', 'Arica'),
    (region_id_var, 152, '15102', 'Camarones', '151', 'Arica'),
    (region_id_var, 152, '15201', 'Putre', '152', 'Parinacota'),
    (region_id_var, 152, '15202', 'General Lagos', '152', 'Parinacota')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ------------------------------------------------------------------------------
-- Región 16: Ñuble (21 comunas)
-- ------------------------------------------------------------------------------

DO $$
DECLARE
    region_id_var UUID;
BEGIN
    -- Obtener ID de la región
    SELECT id INTO region_id_var 
    FROM geo_regions 
    WHERE country_id = 152 AND local_code = '16';
    
    IF region_id_var IS NULL THEN
        RAISE EXCEPTION 'Región 16 no encontrada';
    END IF;
    
    -- Insertar comunas
    INSERT INTO geo_communes (region_id, country_id, local_code, name, province_code, province_name) VALUES
    (region_id_var, 152, '16101', 'Chillán', '161', 'Diguillín'),
    (region_id_var, 152, '16102', 'Bulnes', '161', 'Diguillín'),
    (region_id_var, 152, '16103', 'Chillán Viejo', '161', 'Diguillín'),
    (region_id_var, 152, '16104', 'El Carmen', '161', 'Diguillín'),
    (region_id_var, 152, '16105', 'Pemuco', '161', 'Diguillín'),
    (region_id_var, 152, '16106', 'Pinto', '161', 'Diguillín'),
    (region_id_var, 152, '16107', 'Quillón', '161', 'Diguillín'),
    (region_id_var, 152, '16108', 'San Ignacio', '161', 'Diguillín'),
    (region_id_var, 152, '16109', 'Yungay', '161', 'Diguillín'),
    (region_id_var, 152, '16201', 'Quirihue', '162', 'Itata'),
    (region_id_var, 152, '16202', 'Cobquecura', '162', 'Itata'),
    (region_id_var, 152, '16203', 'Coelemu', '162', 'Itata'),
    (region_id_var, 152, '16204', 'Ninhue', '162', 'Itata'),
    (region_id_var, 152, '16205', 'Portezuelo', '162', 'Itata'),
    (region_id_var, 152, '16206', 'Ranquil', '162', 'Itata'),
    (region_id_var, 152, '16207', 'Treguaco', '162', 'Itata'),
    (region_id_var, 152, '16301', 'San Carlos', '163', 'Punilla'),
    (region_id_var, 152, '16302', 'Coihueco', '163', 'Punilla'),
    (region_id_var, 152, '16303', 'Ñiquén', '163', 'Punilla'),
    (region_id_var, 152, '16304', 'San Fabián', '163', 'Punilla'),
    (region_id_var, 152, '16305', 'San Nicolás', '163', 'Punilla')
    ON CONFLICT (country_id, local_code) DO NOTHING;
END $$;

-- ==============================================================================
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
