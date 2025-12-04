-- ==============================================================================
-- SEED DATA: LER CODES (Lista Europea de Residuos)
-- Fuente: LER20250220.csv
-- Nota: SINADER solo gestiona residuos NO peligrosos
-- ==============================================================================
TRUNCATE TABLE public.ler_codes CASCADE;

INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010101', '01 01 01', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '01', 'Residuos de la extracción de minerales', '01', 'Residuos de la extracción de minerales metálicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010102', '01 01 02', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '01', 'Residuos de la extracción de minerales', '02', 'Residuos de la extracción de minerales no metálicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010306', '01 03 06', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '03', 'Residuos de la transformación física y química de minerales metálicos', '06', 'Estériles distintos de los mencionados en los códigos 01 03 04 y 01 03 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010308', '01 03 08', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '03', 'Residuos de la transformación física y química de minerales metálicos', '08', 'Residuos de polvo y arenilla distintos de los mencionados en el código 01 03 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010309', '01 03 09', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '03', 'Residuos de la transformación física y química de minerales metálicos', '09', 'Lodos rojos de la producción de alúmina distintos de los mencionados en el código 01 03 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010399', '01 03 99', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '03', 'Residuos de la transformación física y química de minerales metálicos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010408', '01 04 08', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '08', 'Residuos de grava y rocas trituradas distintos de los mencionados en el código 01 04 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010409', '01 04 09', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '09', 'Residuos de arena y arcillas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010410', '01 04 10', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '10', 'Residuos de polvo y arenilla distintos de los mencionados en el código 01 04 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010411', '01 04 11', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '11', 'Residuos de la transformación de potasa y sal gema distintos de los mencionados en el código 01 04 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010412', '01 04 12', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '12', 'Estériles y otros residuos del lavado y limpieza de minerales, distintos de los mencionados en los códigos 01 04 07 y 01 04 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010413', '01 04 13', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '13', 'Residuos del corte y serrado de piedra distintos de los mencionados en el código 01 04 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010499', '01 04 99', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '04', 'Residuos de la transformación física y química de minerales no metálicos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010504', '01 05 04', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '05', 'Lodos y otros residuos de perforaciones', '04', 'Lodos y residuos de perforaciones que contienen agua dulce', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010507', '01 05 07', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '05', 'Lodos y otros residuos de perforaciones', '07', 'Lodos y otros residuos de perforaciones que contienen sales de bario distintos de los mencionados en los códigos 01 05 05 y 01 05 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010508', '01 05 08', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '05', 'Lodos y otros residuos de perforaciones', '08', 'Lodos y otros residuos de perforaciones que contienen cloruros distintos de los mencionados en los códigos 01 05 05 y 01 05 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('010599', '01 05 99', '01', 'Residuos de la prospección, extracción de minas y canteras y tratamientos físicos y químicos de minerales', '05', 'Lodos y otros residuos de perforaciones', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020101', '02 01 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '01', 'Lodos de lavado y limpieza', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020102', '02 01 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '02', 'Residuos de tejidos de animales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020103', '02 01 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '03', 'Residuos de tejidos de vegetales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020104', '02 01 04', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '04', 'Residuos de plásticos (excepto embalajes)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020106', '02 01 06', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '06', 'Heces de animales, orina y estiércol (incluida paja podrida) y efluentes recogidos selectivamente y tratados fuera del lugar donde se generan', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020107', '02 01 07', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '07', 'Residuos de la silvicultura', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020109', '02 01 09', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '09', 'Residuos agroquímicos distintos de los mencionados en el código 02 01 08', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020110', '02 01 10', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '10', 'Residuos metálicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020199', '02 01 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '01', 'Residuos de la agricultura, horticultura, silvicultura y caza', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020201', '02 02 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '02', 'Residuos de la preparación y elaboración de carne y otros alimentos de origen animal', '01', 'Lodos de lavado y limpieza', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020202', '02 02 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '02', 'Residuos de la preparación y elaboración de carne y otros alimentos de origen animal', '02', 'Residuos de tejidos de animales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020203', '02 02 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '02', 'Residuos de la preparación y elaboración de carne y otros alimentos de origen animal', '03', 'Materiales inadecuados para el consumo o la elaboración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020204', '02 02 04', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '02', 'Residuos de la preparación y elaboración de carne y otros alimentos de origen animal', '04', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020299', '02 02 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '02', 'Residuos de la preparación y elaboración de carne y otros alimentos de origen animal', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020301', '02 03 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '01', 'Lodos de lavado, limpieza, pelado, centrifugado y separación', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020302', '02 03 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '02', 'Residuos de conservantes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020303', '02 03 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '03', 'Residuos de la extracción con disolventes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020304', '02 03 04', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '04', 'Materiales inadecuados para el consumo o la elaboración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020305', '02 03 05', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '05', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020399', '02 03 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '03', 'Residuos de la preparación y elaboración de frutas, hortalizas, cereales, aceites comestibles, cacao, café, té y tabaco; producción de conservas; producción de levadura y extracto de levadura, preparación y fermentación de melazas', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020401', '02 04 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '04', 'Residuos de la elaboración de azúcar', '01', 'Tierra procedente de la limpieza y lavado de la remolacha', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020402', '02 04 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '04', 'Residuos de la elaboración de azúcar', '02', 'Carbonato cálcico fuera de especificación', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020403', '02 04 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '04', 'Residuos de la elaboración de azúcar', '03', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020499', '02 04 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '04', 'Residuos de la elaboración de azúcar', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020501', '02 05 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '05', 'Residuos de la industria de productos lácteos', '01', 'Materiales inadecuados para el consumo o la elaboración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020502', '02 05 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '05', 'Residuos de la industria de productos lácteos', '02', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020599', '02 05 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '05', 'Residuos de la industria de productos lácteos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020601', '02 06 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '06', 'Residuos de la industria de panadería y pastelería', '01', 'Materiales inadecuados para el consumo o la elaboración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020602', '02 06 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '06', 'Residuos de la industria de panadería y pastelería', '02', 'Residuos de conservantes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020603', '02 06 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '06', 'Residuos de la industria de panadería y pastelería', '03', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020699', '02 06 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '06', 'Residuos de la industria de panadería y pastelería', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020701', '02 07 01', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '01', 'Residuos de lavado, limpieza y reducción mecánica de materias primas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020702', '02 07 02', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '02', 'Residuos de la destilación de alcoholes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020703', '02 07 03', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '03', 'Residuos del tratamiento químico', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020704', '02 07 04', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '04', 'Materiales inadecuados para el consumo o la elaboración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020705', '02 07 05', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '05', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('020799', '02 07 99', '02', 'Residuos de la agricultura, horticultura, silvicultura y caza; residuos de la preparación y elaboración de alimentos', '07', 'Residuos de la producción de bebidas alcohólicas y no alcohólicas (excepto café, té y cacao)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030101', '03 01 01', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '01', 'Residuos de la transformación de la madera y de la producción de tableros y muebles', '01', 'Residuos de corteza y corcho', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030105', '03 01 05', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '01', 'Residuos de la transformación de la madera y de la producción de tableros y muebles', '05', 'Serrín, virutas, recortes, madera, tableros de partículas y chapas distintos de los mencionados en el código 03 01 04', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030199', '03 01 99', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '01', 'Residuos de la transformación de la madera y de la producción de tableros y muebles', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030299', '03 02 99', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '02', 'Residuos de los tratamientos de conservación de la madera', '99', 'Conservantes de la madera no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030301', '03 03 01', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '01', 'Residuos de corteza y madera', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030302', '03 03 02', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '02', 'Lodos de lejías verdes (procedentes de la recuperación de lejías de cocción)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030305', '03 03 05', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '05', 'Lodos de destintado procedentes del reciclado de papel', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030307', '03 03 07', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '07', 'Desechos, separados mecánicamente, de pasta elaborada a partir de residuos de papel y cartón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030308', '03 03 08', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '08', 'Residuos procedentes de la clasificación de papel y cartón destinados al reciclado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030309', '03 03 09', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '09', 'Residuos de lodos calizos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030310', '03 03 10', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '10', 'Desechos de fibras y lodos de fibras, de materiales de carga y de estucado, obtenidos por separación mecánica', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030311', '03 03 11', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '11', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 03 03 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('030399', '03 03 99', '03', 'Residuos de la transformación de la madera y de la producción de tableros y muebles, pasta de papel, papel y cartón', '03', 'Residuos de la producción y transformación de pasta de papel, papel y cartón', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040101', '04 01 01', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '01', 'Carnazas y serrajes de encalado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040102', '04 01 02', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '02', 'Residuos de encalado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040104', '04 01 04', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '04', 'Residuos líquidos de curtición que contienen cromo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040105', '04 01 05', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '05', 'Residuos líquidos de curtición que no contienen cromo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040106', '04 01 06', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '06', 'Lodos, en particular los procedentes del tratamiento in situ de efluentes, que contienen cromo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040107', '04 01 07', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '07', 'Lodos, en particular los procedentes del tratamiento in situ de efluentes, que no contienen cromo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040108', '04 01 08', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '08', 'Residuos de piel curtida (serrajes, rebajaduras, recortes y polvo de esmerilado) que contienen cromo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040109', '04 01 09', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '09', 'Residuos de confección y acabado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040199', '04 01 99', '04', 'Residuos de las industrias del cuero, de la piel y textil', '01', 'Residuos de las industrias del cuero y de la piel', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040209', '04 02 09', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '09', 'Residuos de materiales compuestos (textiles impregnados, elastómeros, plastómeros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040210', '04 02 10', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '10', 'Materia orgánica de productos naturales (por ejemplo grasa, cera)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040215', '04 02 15', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '15', 'Residuos del acabado distintos de los especificados en el código 04 02 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040217', '04 02 17', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '17', 'Colorantes y pigmentos distintos de los mencionados en el código 04 02 16', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040220', '04 02 20', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '20', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 04 02 19', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040221', '04 02 21', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '21', 'Residuos de fibras textiles no procesadas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040222', '04 02 22', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '22', 'Residuos de fibras textiles procesadas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('040299', '04 02 99', '04', 'Residuos de las industrias del cuero, de la piel y textil', '02', 'Residuos de la industria textil', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050110', '05 01 10', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '10', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 05 01 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050113', '05 01 13', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '13', 'Lodos procedentes del agua de alimentación de calderas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050114', '05 01 14', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '14', 'Residuos de columnas de refrigeración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050116', '05 01 16', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '16', 'Residuos que contienen azufre procedentes de la desulfuración del petróleo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050117', '05 01 17', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '17', 'Betunes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050199', '05 01 99', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '01', 'Residuos del refino de petróleo', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050604', '05 06 04', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '06', 'Residuos del tratamiento pirolítico del carbón', '04', 'Residuos de columnas de refrigeración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050699', '05 06 99', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '06', 'Residuos del tratamiento pirolítico del carbón', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050702', '05 07 02', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '07', 'Residuos de la purificación y transporte de gas natural', '02', 'Residuos que contienen azufre', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('050799', '05 07 99', '05', 'Residuos del refino de petróleo, purificación del gas natural y tratamiento pirolítico del carbón', '07', 'Residuos de la purificación y transporte de gas natural', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060199', '06 01 99', '06', 'Residuos de procesos químicos inorgánicos', '01', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de ácidos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060299', '06 02 99', '06', 'Residuos de procesos químicos inorgánicos', '02', 'Residuos de la FFDU de bases', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060314', '06 03 14', '06', 'Residuos de procesos químicos inorgánicos', '03', 'Residuos de la FFDU de sales y sus soluciones y de óxidos metálicos', '14', 'Sales sólidas y soluciones distintas de las mencionadas en los códigos 06 03 11 y 06 03 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060316', '06 03 16', '06', 'Residuos de procesos químicos inorgánicos', '03', 'Residuos de la FFDU de sales y sus soluciones y de óxidos metálicos', '16', 'Oxidos metálicos distintos de los mencionados en el código 06 03 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060399', '06 03 99', '06', 'Residuos de procesos químicos inorgánicos', '03', 'Residuos de la FFDU de sales y sus soluciones y de óxidos metálicos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060499', '06 04 99', '06', 'Residuos de procesos químicos inorgánicos', '04', 'Residuos que contienen metales distintos de los mencionados en el código 06 03', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060503', '06 05 03', '06', 'Residuos de procesos químicos inorgánicos', '05', 'Lodos del tratamiento in situ de efluentes', '03', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 06 05 02', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060603', '06 06 03', '06', 'Residuos de procesos químicos inorgánicos', '06', 'Residuos de la FFDU de productos químicos que contienen azufre, de procesos químicos del azufre y de procesos de desulfuración', '03', 'Residuos que contienen sulfuros distintos de los mencionados en el código 06 06 02', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060699', '06 06 99', '06', 'Residuos de procesos químicos inorgánicos', '06', 'Residuos de la FFDU de productos químicos que contienen azufre, de procesos químicos del azufre y de procesos de desulfuración', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060799', '06 07 99', '06', 'Residuos de procesos químicos inorgánicos', '07', 'Residuos de la FFDU de halógenos y de procesos químicos de los halógenos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060899', '06 08 99', '06', 'Residuos de procesos químicos inorgánicos', '08', 'Residuos de la FFDU del silicio y sus derivados', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060902', '06 09 02', '06', 'Residuos de procesos químicos inorgánicos', '09', 'Residuos de la FFDU de productos químicos que contienen fósforo y procesos químicos del fósforo', '02', 'Escorias de fósforo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060904', '06 09 04', '06', 'Residuos de procesos químicos inorgánicos', '09', 'Residuos de la FFDU de productos químicos que contienen fósforo y procesos químicos del fósforo', '04', 'Residuos cálcicos de reacción distintos de los mencionados en el código 06 09 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('060999', '06 09 99', '06', 'Residuos de procesos químicos inorgánicos', '09', 'Residuos de la FFDU de productos químicos que contienen fósforo y procesos químicos del fósforo', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('061099', '06 10 99', '06', 'Residuos de procesos químicos inorgánicos', '10', 'Residuos de la FFDU de productos químicos que contienen nitrógeno y procesos químicos del nitrógeno y de la fabricación de fertilizantes', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('061101', '06 11 01', '06', 'Residuos de procesos químicos inorgánicos', '11', 'Residuos de la fabricación de pigmentos inorgánicos y opacificantes', '01', 'Residuos cálcicos de reacción procedentes de la producción de dióxido de titanio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('061199', '06 11 99', '06', 'Residuos de procesos químicos inorgánicos', '11', 'Residuos de la fabricación de pigmentos inorgánicos y opacificantes', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('061303', '06 13 03', '06', 'Residuos de procesos químicos inorgánicos', '13', 'Residuos de procesos químicos inorgánicos no especificados en otra categoría', '03', 'Negro de carbón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('061399', '06 13 99', '06', 'Residuos de procesos químicos inorgánicos', '13', 'Residuos de procesos químicos inorgánicos no especificados en otra categoría', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070112', '07 01 12', '07', 'Residuos de procesos químicos orgánicos', '01', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de productos químicos orgánicos de base', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070199', '07 01 99', '07', 'Residuos de procesos químicos orgánicos', '01', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de productos químicos orgánicos de base', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070212', '07 02 12', '07', 'Residuos de procesos químicos orgánicos', '02', 'Residuos de la FFDU de plásticos, caucho sintético y fibras artificiales', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 02 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070213', '07 02 13', '07', 'Residuos de procesos químicos orgánicos', '02', 'Residuos de la FFDU de plásticos, caucho sintético y fibras artificiales', '13', 'Residuos de plástico', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070215', '07 02 15', '07', 'Residuos de procesos químicos orgánicos', '02', 'Residuos de la FFDU de plásticos, caucho sintético y fibras artificiales', '15', 'Residuos procedentes de aditivos distintos de los especificados en el código 07 02 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070217', '07 02 17', '07', 'Residuos de procesos químicos orgánicos', '02', 'Residuos de la FFDU de plásticos, caucho sintético y fibras artificiales', '17', 'Residuos que contengan siliconas distintas de las especificadas en el código 07 02 16', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070299', '07 02 99', '07', 'Residuos de procesos químicos orgánicos', '02', 'Residuos de la FFDU de plásticos, caucho sintético y fibras artificiales', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070312', '07 03 12', '07', 'Residuos de procesos químicos orgánicos', '03', 'Residuos de la FFDU de tintes y pigmentos orgánicos (excepto los del subcapítulo 06 11)', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 03 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070399', '07 03 99', '07', 'Residuos de procesos químicos orgánicos', '03', 'Residuos de la FFDU de tintes y pigmentos orgánicos (excepto los del subcapítulo 06 11)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070412', '07 04 12', '07', 'Residuos de procesos químicos orgánicos', '04', 'Residuos de la FFDU de productos fitosanitarios orgánicos (excepto los de los códigos 02 01 08 y 02 01 09), de conservantes de la madera (excepto los del subcapítulo 03 02) y de otros biocidas', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 04 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070499', '07 04 99', '07', 'Residuos de procesos químicos orgánicos', '04', 'Residuos de la FFDU de productos fitosanitarios orgánicos (excepto los de los códigos 02 01 08 y 02 01 09), de conservantes de la madera (excepto los del subcapítulo 03 02) y de otros biocidas', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070512', '07 05 12', '07', 'Residuos de procesos químicos orgánicos', '05', 'Residuos de la FFDU de productos farmacéuticos', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 05 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070514', '07 05 14', '07', 'Residuos de procesos químicos orgánicos', '05', 'Residuos de la FFDU de productos farmacéuticos', '14', 'Residuos sólidos distintos de los especificados en el código 07 05 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070599', '07 05 99', '07', 'Residuos de procesos químicos orgánicos', '05', 'Residuos de la FFDU de productos farmacéuticos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070612', '07 06 12', '07', 'Residuos de procesos químicos orgánicos', '06', 'Residuos de la FFDU de grasas, jabones, detergentes, desinfectantes y cosméticos', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 06 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070699', '07 06 99', '07', 'Residuos de procesos químicos orgánicos', '06', 'Residuos de la FFDU de grasas, jabones, detergentes, desinfectantes y cosméticos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070712', '07 07 12', '07', 'Residuos de procesos químicos orgánicos', '07', 'Residuos de la FFDU de productos químicos resultantes de la química fina y productos químicos no especificados en otra categoría', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 07 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('070799', '07 07 99', '07', 'Residuos de procesos químicos orgánicos', '07', 'Residuos de la FFDU de productos químicos resultantes de la química fina y productos químicos no especificados en otra categoría', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080112', '08 01 12', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '12', 'Residuos de pintura y barniz, distintos de los especificados en el código 08 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080114', '08 01 14', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '14', 'Lodos de pintura y barniz, distintos de los especificados en el código 08 01 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080116', '08 01 16', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '16', 'Lodos acuosos que contienen pintura o barniz, distintos de los especificados en el código 08 01 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080118', '08 01 18', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '18', 'Residuos del decapado o eliminación de pintura y barniz, distintos de los especificados en el código 08 01 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080120', '08 01 20', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '20', 'Suspensiones acuosas que contienen pintura o barniz, distintos de los especificados en el código 08 01 19', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080199', '08 01 99', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '01', 'Residuos de la FFDU y del decapado o eliminación de pintura y barniz', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080201', '08 02 01', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '02', 'Residuos de la FFDU de otros revestimientos (incluidos materiales cerámicos)', '01', 'Residuos de arenillas de revestimiento', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080202', '08 02 02', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '02', 'Residuos de la FFDU de otros revestimientos (incluidos materiales cerámicos)', '02', 'Lodos acuosos que contienen materiales cerámicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080203', '08 02 03', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '02', 'Residuos de la FFDU de otros revestimientos (incluidos materiales cerámicos)', '03', 'Suspensiones acuosas que contienen materiales cerámicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080299', '08 02 99', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '02', 'Residuos de la FFDU de otros revestimientos (incluidos materiales cerámicos)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080307', '08 03 07', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '07', 'Lodos acuosos que contienen tinta', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080308', '08 03 08', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '08', 'Residuos líquidos acuosos que contienen tinta', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080313', '08 03 13', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '13', 'Residuos de tintas distintos de los especificados en el código 08 03 12', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080315', '08 03 15', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '15', 'Lodos de tinta distintos de los especificados en el código 08 03 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080318', '08 03 18', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '18', 'Residuos de tóner de impresión, distintos de los especificados en el código 08 03 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080399', '08 03 99', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '03', 'Residuos de la FFDU de tintas de impresión', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080410', '08 04 10', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '04', 'Residuos de la FFDU de adhesivos y sellantes (incluyendo productos de impermeabilización)', '10', 'Residuos de adhesivos y sellantes, distintos de los especificados en el código 08 04 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080412', '08 04 12', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '04', 'Residuos de la FFDU de adhesivos y sellantes (incluyendo productos de impermeabilización)', '12', 'Lodos de adhesivos y sellantes, distintos de los especificados en el código 08 04 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080414', '08 04 14', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '04', 'Residuos de la FFDU de adhesivos y sellantes (incluyendo productos de impermeabilización)', '14', 'Lodos acuosos que contienen adhesivos o sellantes, distintos de los especificados en el código 08 04 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080416', '08 04 16', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '04', 'Residuos de la FFDU de adhesivos y sellantes (incluyendo productos de impermeabilización)', '16', 'Residuos líquidos acuosos que contienen adhesivos o sellantes, distintos de los especificados en el código 08 04 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('080499', '08 04 99', '08', 'Residuos de la fabricación, formulación, distribución y utilización (FFDU) de revestimientos (pinturas, barnices y esmaltes vítreos), adhesivos, sellantes y tintas de impresión', '04', 'Residuos de la FFDU de adhesivos y sellantes (incluyendo productos de impermeabilización)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('090107', '09 01 07', '09', 'Residuos de la industria fotográfica', '01', 'Residuos de la industria fotográfica', '07', 'Películas y papel fotográfico que contienen plata o compuestos de plata', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('090108', '09 01 08', '09', 'Residuos de la industria fotográfica', '01', 'Residuos de la industria fotográfica', '08', 'Películas y papel fotográfico que no contienen plata ni compuestos de plata', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('090110', '09 01 10', '09', 'Residuos de la industria fotográfica', '01', 'Residuos de la industria fotográfica', '10', 'Cámaras de un solo uso sin pilas ni acumuladores', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('090112', '09 01 12', '09', 'Residuos de la industria fotográfica', '01', 'Residuos de la industria fotográfica', '12', 'Cámaras de un solo uso con pilas o acumuladores distintas de las especificadas en el código 09 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('090199', '09 01 99', '09', 'Residuos de la industria fotográfica', '01', 'Residuos de la industria fotográfica', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100101', '10 01 01', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '01', 'Cenizas del hogar, escorias y polvo de caldera (excepto el polvo de caldera especificado en el código 10 01 04)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100102', '10 01 02', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '02', 'Cenizas volantes de carbón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100103', '10 01 03', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '03', 'Cenizas volantes de turba y de madera (no tratada)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100105', '10 01 05', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '05', 'Residuos cálcicos de reacción, en forma sólida, procedentes de la desulfuración de gases de combustión', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100107', '10 01 07', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '07', 'Residuos cálcicos de reacción, en forma de lodos, procedentes de la desulfuración de gases de combustión', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100115', '10 01 15', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '15', 'Cenizas del hogar, escorias y polvo de caldera procedentes de la coincineración, distintos de los especificados en el código 10 01 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100117', '10 01 17', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '17', 'Cenizas volantes procedentes de la co-incineración distintas de las especificadas en el código 10 01 16', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100119', '10 01 19', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '19', 'Residuos procedentes de la depuración de gases distintos de los especificados en los códigos 10 01 05, 10 01 07 y 10 01 18', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100121', '10 01 21', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '21', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 10 01 20', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100123', '10 01 23', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '23', 'Lodos acuosos procedentes de la limpieza de calderas, distintos de los especificados en el código 10 01 22', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100124', '10 01 24', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '24', 'Arenas de lechos fluidizados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100125', '10 01 25', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '25', 'Residuos procedentes del almacenamiento y preparación de combustible de centrales termoeléctricas de carbón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100126', '10 01 26', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '26', 'Residuos del tratamiento del agua de refrigeración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100199', '10 01 99', '10', 'Residuos de procesos térmicos', '01', 'Residuos de centrales eléctricas y otras plantas de combustión (excepto el capítulo 19)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100201', '10 02 01', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '01', 'Residuos del tratamiento de escorias', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100202', '10 02 02', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '02', 'Escorias no tratadas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100208', '10 02 08', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '08', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 02 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100210', '10 02 10', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '10', 'Cascarilla de laminación', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100212', '10 02 12', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '12', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 02 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100214', '10 02 14', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '14', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 02 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100215', '10 02 15', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '15', 'Otros lodos y tortas de filtración', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100299', '10 02 99', '10', 'Residuos de procesos térmicos', '02', 'Residuos de la industria del hierro y del acero', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100302', '10 03 02', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '02', 'Fragmentos de ánodos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100305', '10 03 05', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '05', 'Residuos de alúmina', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100316', '10 03 16', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '16', 'Espumas distintas de las especificadas en el código 10 03 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100318', '10 03 18', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '18', 'Residuos que contienen carbono procedentes de la fabricación de ánodos, distintos de los especificados en el código 10 03 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100320', '10 03 20', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '20', 'Partículas, procedentes de los efluentes gaseosos, distintas de las especificadas en el código 10 03 19', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100322', '10 03 22', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '22', 'Otras partículas y polvo (incluido el polvo de molienda) distintos de los especificados en el código 10 03 21', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100324', '10 03 24', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '24', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 03 23', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100326', '10 03 26', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '26', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 03 25', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100328', '10 03 28', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '28', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 03 27', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100330', '10 03 30', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '30', 'Residuos del tratamiento de escorias salinas y granzas negras distintos de los especificados en el código 10 03 29', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100399', '10 03 99', '10', 'Residuos de procesos térmicos', '03', 'Residuos de la termometalurgia del aluminio', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100410', '10 04 10', '10', 'Residuos de procesos térmicos', '04', 'Residuos de la termometalurgia del plomo', '10', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 04 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100499', '10 04 99', '10', 'Residuos de procesos térmicos', '04', 'Residuos de la termometalurgia del plomo', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100501', '10 05 01', '10', 'Residuos de procesos térmicos', '05', 'Residuos de la termometalurgia del zinc', '01', 'Escorias de la producción primaria y secundaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100504', '10 05 04', '10', 'Residuos de procesos térmicos', '05', 'Residuos de la termometalurgia del zinc', '04', 'Otras partículas y polvos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100509', '10 05 09', '10', 'Residuos de procesos térmicos', '05', 'Residuos de la termometalurgia del zinc', '09', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 05 08', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100511', '10 05 11', '10', 'Residuos de procesos térmicos', '05', 'Residuos de la termometalurgia del zinc', '11', 'Granzas y espumas distintas de las especificadas en el código 10 05 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100599', '10 05 99', '10', 'Residuos de procesos térmicos', '05', 'Residuos de la termometalurgia del zinc', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100601', '10 06 01', '10', 'Residuos de procesos térmicos', '06', 'Residuos de la termometalurgia del cobre', '01', 'Escorias de la producción primaria y secundaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100602', '10 06 02', '10', 'Residuos de procesos térmicos', '06', 'Residuos de la termometalurgia del cobre', '02', 'Granzas y espumas de la producción primaria y secundaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100604', '10 06 04', '10', 'Residuos de procesos térmicos', '06', 'Residuos de la termometalurgia del cobre', '04', 'Otras partículas y polvos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100610', '10 06 10', '10', 'Residuos de procesos térmicos', '06', 'Residuos de la termometalurgia del cobre', '10', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 06 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100699', '10 06 99', '10', 'Residuos de procesos térmicos', '06', 'Residuos de la termometalurgia del cobre', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100701', '10 07 01', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '01', 'Escorias de la producción primaria y secundaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100702', '10 07 02', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '02', 'Granzas y espumas de la producción primaria y secundaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100703', '10 07 03', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '03', 'Residuos sólidos del tratamiento de gases', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100704', '10 07 04', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '04', 'Otras partículas y polvos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100705', '10 07 05', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '05', 'Lodos y tortas de filtración del tratamiento de gases', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100708', '10 07 08', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '08', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 07 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100799', '10 07 99', '10', 'Residuos de procesos térmicos', '07', 'Residuos de la termometalurgia de la plata, oro y platino', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100804', '10 08 04', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '04', 'Partículas y polvo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100809', '10 08 09', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '09', 'Otras escorias', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100811', '10 08 11', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '11', 'Granzas y espumas distintas de las especificadas en el código 10 08 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100813', '10 08 13', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '13', 'Residuos que contienen carbono procedentes de la fabricación de ánodos distintos de los especificados en el código 10 08 12', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100814', '10 08 14', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '14', 'Fragmentos de ánodos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100816', '10 08 16', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '16', 'Partículas procedentes de los efluentes gaseosos distintas de las especificadas en el código 10 08 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100818', '10 08 18', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '18', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 08 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100820', '10 08 20', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '20', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 08 19', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100899', '10 08 99', '10', 'Residuos de procesos térmicos', '08', 'Residuos de la termometalurgia de otros metales no férreos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100903', '10 09 03', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '03', 'Escorias de horno', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100906', '10 09 06', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '06', 'Machos y moldes de fundición sin colada distintos de los especificados en el código 10 09 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100908', '10 09 08', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '08', 'Machos y moldes de fundición con colada distintos de los especificados en el código 10 09 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100910', '10 09 10', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '10', 'Partículas procedentes de los efluentes gaseosos distintas de las especificadas en el código 10 09 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100912', '10 09 12', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '12', 'Otras partículas distintas de las especificadas en el código 10 09 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100914', '10 09 14', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '14', 'Ligantes residuales distintos de los especificados en el código 10 09 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100916', '10 09 16', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '16', 'Residuos de agentes indicadores de fisuración distintos de los especificados en el código 10 09 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('100999', '10 09 99', '10', 'Residuos de procesos térmicos', '09', 'Residuos de la fundición de piezas férreas', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101003', '10 10 03', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '03', 'Escorias de horno', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101006', '10 10 06', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '06', 'Machos y moldes de fundición sin colada distintos de los especificados en el código 10 10 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101008', '10 10 08', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '08', 'Machos y moldes de fundición con colada distintos de los especificados en el código 10 10 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101010', '10 10 10', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '10', 'Partículas procedentes de los efluentes gaseosos, distintas de las especificadas en el código 10 10 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101012', '10 10 12', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '12', 'Otras partículas distintas de las especificadas en el código 10 10 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101014', '10 10 14', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '14', 'Ligantes residuales distintos de los especificados en el código 10 10 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101016', '10 10 16', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '16', 'Residuos de agentes indicadores de fisuración distintos de los especificados en el código 10 10 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101099', '10 10 99', '10', 'Residuos de procesos térmicos', '10', 'Residuos de la fundición de piezas no férreas', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101103', '10 11 03', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '03', 'Residuos de materiales de fibra de vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101105', '10 11 05', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '05', 'Partículas y polvo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101110', '10 11 10', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '10', 'Residuos de la preparación de mezclas antes del proceso de cocción distintos de los especificados en el código 10 11 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101112', '10 11 12', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '12', 'Residuos de vidrio distintos de los especificados en el código 10 11 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101114', '10 11 14', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '14', 'Lodos procedentes del pulido y esmerilado del vidrio, distintos de los especificados en el código 10 11 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101116', '10 11 16', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '16', 'Residuos sólidos del tratamiento de gases de combustión, distintos de los especificados en el código 10 11 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101118', '10 11 18', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '18', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 11 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101120', '10 11 20', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '20', 'Residuos sólidos del tratamiento in situ de efluentes, distintos de los especificados en el código 10 11 19', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101199', '10 11 99', '10', 'Residuos de procesos térmicos', '11', 'Residuos de la fabricación del vidrio y sus derivados', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101201', '10 12 01', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '01', 'Residuos de la preparación de mezclas antes del proceso de cocción', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101203', '10 12 03', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '03', 'Partículas y polvo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101205', '10 12 05', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '05', 'Lodos y tortas de filtración del tratamiento de gases', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101206', '10 12 06', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '06', 'Moldes desechados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101208', '10 12 08', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '08', 'Residuos de cerámica, ladrillos, tejas y materiales de construcción (después del proceso de cocción)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101210', '10 12 10', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '10', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 12 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101212', '10 12 12', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '12', 'Residuos de vidriado distintos de los especificados en el código 10 12 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101213', '10 12 13', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '13', 'Lodos del tratamiento in situ de efluentes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101299', '10 12 99', '10', 'Residuos de procesos térmicos', '12', 'Residuos de la fabricación de productos cerámicos, ladrillos, tejas y materiales de construcción', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101301', '10 13 01', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '01', 'Residuos de la preparación de mezclas antes del proceso de cocción', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101304', '10 13 04', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '04', 'Residuos de calcinación e hidratación de la cal', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101306', '10 13 06', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '06', 'Partículas y polvo (excepto los códigos 10 13 12 y 10 13 13)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101307', '10 13 07', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '07', 'Lodos y tortas de filtración del tratamiento de gases', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101310', '10 13 10', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '10', 'Residuos de la fabricación de fibrocemento distintos de los especificados en el código 10 13 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101311', '10 13 11', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '11', 'Residuos de materiales compuestos a base de cemento distintos de los especificados en los códigos 10 13 09 y 10 13 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101313', '10 13 13', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '13', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 13 12', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101314', '10 13 14', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '14', 'Residuos de hormigón y lodos de hormigón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('101399', '10 13 99', '10', 'Residuos de procesos térmicos', '13', 'Residuos de la fabricación de cemento, cal y yeso y de productos derivados', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110110', '11 01 10', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '01', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales (por ejemplo, procesos de galvanización, procesos de recubrimiento con zinc, procesos de decapado, grabado, fosfatación, desengrasado alcalino y anodización)', '10', 'Lodos y tortas de filtración distintos de los especificados en el código 11 01 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110112', '11 01 12', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '01', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales (por ejemplo, procesos de galvanización, procesos de recubrimiento con zinc, procesos de decapado, grabado, fosfatación, desengrasado alcalino y anodización)', '12', 'Líquidos acuosos de enjuague distintos de los especificados en el código 11 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110114', '11 01 14', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '01', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales (por ejemplo, procesos de galvanización, procesos de recubrimiento con zinc, procesos de decapado, grabado, fosfatación, desengrasado alcalino y anodización)', '14', 'Residuos de desengrasado distintos de los especificados en el código 11 01 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110199', '11 01 99', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '01', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales (por ejemplo, procesos de galvanización, procesos de recubrimiento con zinc, procesos de decapado, grabado, fosfatación, desengrasado alcalino y anodización)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110203', '11 02 03', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '02', 'Residuos de procesos hidrometalúrgicos no férreos', '03', 'Residuos de la producción de ánodos para procesos de electrólisis acuosa', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110206', '11 02 06', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '02', 'Residuos de procesos hidrometalúrgicos no férreos', '06', 'Residuos de procesos de la hidrometalurgia del cobre distintos de los especificados en el código 11 02 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110299', '11 02 99', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '02', 'Residuos de procesos hidrometalúrgicos no férreos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110501', '11 05 01', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '05', 'Residuos de procesos de galvanización en caliente', '01', 'Matas de galvanización', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110502', '11 05 02', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '05', 'Residuos de procesos de galvanización en caliente', '02', 'Cenizas de zinc', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('110599', '11 05 99', '11', 'Residuos del tratamiento químico de superficie y del recubrimiento de metales y otros materiales; residuos de la hidrometalurgia no férrea', '05', 'Residuos de procesos de galvanización en caliente', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120101', '12 01 01', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Limaduras y virutas de metales férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120102', '12 01 02', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '02', 'Polvo y partículas de metales férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120103', '12 01 03', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '03', 'Limaduras y virutas de metales no férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120104', '12 01 04', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '04', 'Polvo y partículas de metales no férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120105', '12 01 05', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '05', 'Virutas y rebabas de plástico', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120113', '12 01 13', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '13', 'Residuos de soldadura', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120115', '12 01 15', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '15', 'Lodos de mecanizado distintos de los especificados en el código 12 01 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120117', '12 01 17', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '17', 'Residuos de granallado o chorreado distintos de los especificados en el código 12 01 16', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120121', '12 01 21', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '21', 'Muelas y materiales de esmerilado usados distintos de los especificados en el código 12 01 20', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('120199', '12 01 99', '12', 'Residuos del moldeado y del tratamiento físico y mecánico de superficie de metales y plásticos', '01', 'Residuos del moldeado y tratamiento físico y mecánico de superficie de metales y plásticos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150101', '15 01 01', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '01', 'Envases de papel y cartón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150102', '15 01 02', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '02', 'Envases de plástico', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150103', '15 01 03', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '03', 'Envases de madera', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150104', '15 01 04', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '04', 'Envases metálicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150105', '15 01 05', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '05', 'Envases compuestos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150106', '15 01 06', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '06', 'Envases mezclados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150107', '15 01 07', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '07', 'Envases de vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150109', '15 01 09', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '01', 'Envases (incluidos los residuos de envases de la recogida selectiva municipal)', '09', 'Envases textiles', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('150203', '15 02 03', '15', 'Residuos de envases; absorbentes, trapos de limpieza, materiales de filtración y ropas de protección no especificados en otra categoría', '02', 'Absorbentes, materiales de filtración, trapos de limpieza y ropas protectoras', '03', 'Absorbentes, materiales de filtración, trapos de limpieza y ropas protectoras distintos de los especificados en el código 15 02 02', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160103', '16 01 03', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '03', 'Neumáticos fuera de uso', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160106', '16 01 06', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '06', 'Vehículos al final de su vida útil que no contengan líquidos ni otros componentes peligrosos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160112', '16 01 12', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '12', 'Zapatas de freno distintas de las especificadas en el código 16 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160115', '16 01 15', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '15', 'Anticongelantes distintos de los especificados en el código 16 01 14', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160116', '16 01 16', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '16', 'Depósitos para gases licuados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160117', '16 01 17', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '17', 'Metales ferrosos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160118', '16 01 18', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '18', 'Metales no ferrosos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160119', '16 01 19', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '19', 'Plástico', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160120', '16 01 20', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '20', 'Vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160122', '16 01 22', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '22', 'Componentes no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160199', '16 01 99', '16', 'Residuos no especificados en otro capítulo de la lista', '01', 'Vehículos de diferentes medios de transporte (incluidas las máquinas no de carretera) al final de su vida útil y residuos del desguace de vehículos al final de su vida útil y del mantenimiento de vehículos (excepto los de los capítulos 13, 14 y los subcapítulos 16 06 y 16 08)', '99', 'Residuos no especificados de otra forma', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160214', '16 02 14', '16', 'Residuos no especificados en otro capítulo de la lista', '02', 'Residuos de equipos eléctricos y electrónicos', '14', 'Equipos desechados distintos de los especificados en los códigos 16 02 09 a 16 02 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160216', '16 02 16', '16', 'Residuos no especificados en otro capítulo de la lista', '02', 'Residuos de equipos eléctricos y electrónicos', '16', 'Componentes retirados de equipos desechados distintos de los especificados en el código 16 02 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160304', '16 03 04', '16', 'Residuos no especificados en otro capítulo de la lista', '03', 'Lotes de productos fuera de especificación y productos no utilizados', '04', 'Residuos inorgánicos distintos de los especificados en el código 16 03 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160306', '16 03 06', '16', 'Residuos no especificados en otro capítulo de la lista', '03', 'Lotes de productos fuera de especificación y productos no utilizados', '06', 'Residuos orgánicos distintos de los especificados en el código 16 03 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160505', '16 05 05', '16', 'Residuos no especificados en otro capítulo de la lista', '05', 'Gases en recipientes a presión y productos químicos desechados', '05', 'Gases en recipientes a presión, distintos de los especificados en el código 16 05 04', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160509', '16 05 09', '16', 'Residuos no especificados en otro capítulo de la lista', '05', 'Gases en recipientes a presión y productos químicos desechados', '09', 'Productos químicos desechados distintos de los especificados en los códigos 16 05 06, 16 05 07 o 16 05 08', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160604', '16 06 04', '16', 'Residuos no especificados en otro capítulo de la lista', '06', 'Pilas y acumuladores', '04', 'Pilas alcalinas (excepto 16 06 03)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160605', '16 06 05', '16', 'Residuos no especificados en otro capítulo de la lista', '06', 'Pilas y acumuladores', '05', 'Otras pilas y acumuladores', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160799', '16 07 99', '16', 'Residuos no especificados en otro capítulo de la lista', '07', 'Residuos de la limpieza de cisternas de transporte y almacenamiento y de la limpieza de cubas (excepto los de los capítulos 05 y 13)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160801', '16 08 01', '16', 'Residuos no especificados en otro capítulo de la lista', '08', 'Catalizadores usados', '01', 'Catalizadores usados que contienen oro, plata, renio, rodio, paladio, iridio o platino (excepto el código 16 08 07)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160803', '16 08 03', '16', 'Residuos no especificados en otro capítulo de la lista', '08', 'Catalizadores usados', '03', 'Catalizadores usados que contienen metales de transición o compuestos de metales de transición no especificados de otra forma', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('160804', '16 08 04', '16', 'Residuos no especificados en otro capítulo de la lista', '08', 'Catalizadores usados', '04', 'Catalizadores usados procedentes del craqueo catalítico en lecho fluido (excepto los del código 16 08 07)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161002', '16 10 02', '16', 'Residuos no especificados en otro capítulo de la lista', '10', 'Residuos líquidos acuosos destinados a plantas de tratamiento externas', '02', 'Residuos líquidos acuosos distintos de los especificados en el código 16 10 01', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161004', '16 10 04', '16', 'Residuos no especificados en otro capítulo de la lista', '10', 'Residuos líquidos acuosos destinados a plantas de tratamiento externas', '04', 'Concentrados acuosos distintos de los especificados en el código 16 10 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161102', '16 11 02', '16', 'Residuos no especificados en otro capítulo de la lista', '11', 'Residuos de revestimientos de hornos y refractarios', '02', 'Revestimientos y refractarios a base de carbono, procedentes de procesos metalúrgicos distintos de los especificados en el código 16 11 01', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161104', '16 11 04', '16', 'Residuos no especificados en otro capítulo de la lista', '11', 'Residuos de revestimientos de hornos y refractarios', '04', 'Otros revestimientos y refractarios procedentes de procesos metalúrgicos, distintos de los especificados en el código 16 11 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161106', '16 11 06', '16', 'Residuos no especificados en otro capítulo de la lista', '11', 'Residuos de revestimientos de hornos y refractarios', '06', 'Revestimientos y refractarios procedentes de procesos no metalúrgicos, distintos de los especificados en el código 16 11 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161201', '16 12 01', '16', 'Residuos no especificados en otro capítulo de la lista', '12', 'Residuos de limpieza de playas, borde costero y sumideros', '01', 'Mezcla de residuos asimilables a domiciliarios', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161202', '16 12 02', '16', 'Residuos no especificados en otro capítulo de la lista', '12', 'Residuos de limpieza de playas, borde costero y sumideros', '02', 'Mezcla de residuos provenientes de actividades de la acuicultura', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('161203', '16 12 03', '16', 'Residuos no especificados en otro capítulo de la lista', '12', 'Residuos de limpieza de playas, borde costero y sumideros', '03', 'Mezcla de residuos provenientes de actividades de pesca', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170101', '17 01 01', '17', 'Residuos de la construcción y demolición', '01', 'Hormigón, ladrillos, tejas y materiales cerámicos', '01', 'Hormigón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170102', '17 01 02', '17', 'Residuos de la construcción y demolición', '01', 'Hormigón, ladrillos, tejas y materiales cerámicos', '02', 'Ladrillos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170103', '17 01 03', '17', 'Residuos de la construcción y demolición', '01', 'Hormigón, ladrillos, tejas y materiales cerámicos', '03', 'Tejas y materiales cerámicos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170107', '17 01 07', '17', 'Residuos de la construcción y demolición', '01', 'Hormigón, ladrillos, tejas y materiales cerámicos', '07', 'Mezclas de hormigón, ladrillos, tejas y materiales cerámicos, distintas de las especificadas en el código 17 01 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170201', '17 02 01', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '01', 'Madera libre de impregnación o pinturas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170202', '17 02 02', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '02', 'Vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170203', '17 02 03', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '03', 'Otros Plástico no especificados en los códigos 17 02 07, 17 02 08, 17 02 09 y 17 02 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170205', '17 02 05', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '05', 'Vidrios espejos o multicapas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170206', '17 02 06', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '06', 'Madera impregnada o pintada (no contiene sustancias peligrosas)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170207', '17 02 07', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '07', 'Plástico PVC (policloruro de vinilo)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170208', '17 02 08', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '08', 'Plástico CPVC (policloruro de vinilo clorado)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170209', '17 02 09', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '09', 'Plástico PPR (polipropileno R)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170210', '17 02 10', '17', 'Residuos de la construcción y demolición', '02', 'Madera, vidrio y plástico', '10', 'Plástico HDPE (polietileno de alta densidad)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170302', '17 03 02', '17', 'Residuos de la construcción y demolición', '03', 'Mezclas bituminosas, alquitrán de hulla y otros productos alquitranados', '02', 'Mezclas bituminosas distintas de las especificadas en el código 17 03 01', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170401', '17 04 01', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '01', 'Cobre, bronce, latón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170402', '17 04 02', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '02', 'Aluminio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170403', '17 04 03', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '03', 'Plomo', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170404', '17 04 04', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '04', 'Zinc', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170405', '17 04 05', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '05', 'Hierro y acero no galvanizados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170406', '17 04 06', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '06', 'Estaño', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170407', '17 04 07', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '07', 'Metales mezclados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170411', '17 04 11', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '11', 'Cables distintos de los especificados en el código 17 04 10', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170412', '17 04 12', '17', 'Residuos de la construcción y demolición', '04', 'Metales (incluidas sus aleaciones)', '12', 'Hierro y acero galvanizados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170504', '17 05 04', '17', 'Residuos de la construcción y demolición', '05', 'Tierra (excluida la excavada de zonas contaminadas), piedras y lodos de drenaje', '04', 'Tierra y piedras distintas de las especificadas en el código 17 05 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170506', '17 05 06', '17', 'Residuos de la construcción y demolición', '05', 'Tierra (excluida la excavada de zonas contaminadas), piedras y lodos de drenaje', '06', 'Lodos de drenaje distintos de los especificados en el código 17 05 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170508', '17 05 08', '17', 'Residuos de la construcción y demolición', '05', 'Tierra (excluida la excavada de zonas contaminadas), piedras y lodos de drenaje', '08', 'Balasto de vías férreas distinto del especificado en el código 17 05 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170604', '17 06 04', '17', 'Residuos de la construcción y demolición', '06', 'Materiales de aislamiento y materiales de construcción que no contienen amianto (asbesto)', '04', 'Materiales de aislamiento distintos de los especificados en los códigos 17 06 01 y 17 06 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170802', '17 08 02', '17', 'Residuos de la construcción y demolición', '08', 'Materiales de construcción a base de yeso', '02', 'Materiales de construcción a base de yeso distintos de los especificados en el código 17 08 01', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('170904', '17 09 04', '17', 'Residuos de la construcción y demolición', '09', 'Otros residuos de construcción y demolición', '04', 'Residuos mezclados de construcción y demolición distintos de los especificados en los códigos 17 09 01, 17 09 02 y 17 09 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180101', '18 01 01', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '01', 'Residuos de maternidades, del diagnóstico, tratamiento o prevención de enfermedades humanas', '01', 'Objetos cortantes y punzantes (excepto el código 18 01 03)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180102', '18 01 02', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '01', 'Residuos de maternidades, del diagnóstico, tratamiento o prevención de enfermedades humanas', '02', 'Restos anatómicos y órganos, incluidos bolsas y bancos de sangre (excepto el código 18 01 03)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180104', '18 01 04', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '01', 'Residuos de maternidades, del diagnóstico, tratamiento o prevención de enfermedades humanas', '04', 'Residuos cuya recogida y eliminación no es objeto de requisitos especiales para prevenir infecciones (por ejemplo, vendajes, vaciados de yeso, ropa blanca, ropa desechable, pañales)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180107', '18 01 07', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '01', 'Residuos de maternidades, del diagnóstico, tratamiento o prevención de enfermedades humanas', '07', 'Productos químicos distintos de los especificados en el código 18 01 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180109', '18 01 09', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '01', 'Residuos de maternidades, del diagnóstico, tratamiento o prevención de enfermedades humanas', '09', 'Medicamentos distintos de los especificados en el código 18 01 08', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180201', '18 02 01', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '02', 'Residuos de la investigación, diagnóstico, tratamiento o prevención de enfermedades de animales', '01', 'Objetos cortantes y punzantes (excepto el código 18 02 02)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180203', '18 02 03', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '02', 'Residuos de la investigación, diagnóstico, tratamiento o prevención de enfermedades de animales', '03', 'Residuos cuya recogida y eliminación no es objeto de requisitos especiales para prevenir infecciones', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180206', '18 02 06', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '02', 'Residuos de la investigación, diagnóstico, tratamiento o prevención de enfermedades de animales', '06', 'Productos químicos distintos de los especificados en el código 18 02 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('180208', '18 02 08', '18', 'Residuos de servicios médicos o veterinarios o de investigación asociada (salvo los residuos de cocina y de restaurante no procedentes directamente de la prestación de cuidados sanitarios)', '02', 'Residuos de la investigación, diagnóstico, tratamiento o prevención de enfermedades de animales', '08', 'Medicamentos distintos de los especificados en el código 18 02 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190102', '19 01 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '02', 'Materiales férreos separados de la ceniza de fondo de horno', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190112', '19 01 12', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '12', 'Cenizas de fondo de horno y escorias distintas de las especificadas en el código 19 01 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190114', '19 01 14', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '14', 'Cenizas volantes distintas de las especificadas en el código 19 01 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190116', '19 01 16', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '16', 'Polvo de caldera distinto del especificado en el código 19 01 15', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190118', '19 01 18', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '18', 'Residuos de pirólisis distintos de los especificados en el código 19 01 17', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190119', '19 01 19', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '19', 'Arenas de lechos fluidizados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190199', '19 01 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '01', 'Residuos de la incineración o pirólisis de residuos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190203', '19 02 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '02', 'Residuos de tratamientos físicoquímicos de residuos (incluidas la descromatación, descianuración y neutralización)', '03', 'Residuos mezclados previamente, compuestos exclusivamente por residuos no peligrosos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190206', '19 02 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '02', 'Residuos de tratamientos físicoquímicos de residuos (incluidas la descromatación, descianuración y neutralización)', '06', 'Lodos de tratamientos físicoquímicos, distintos de los especificados en el código 19 02 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190210', '19 02 10', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '02', 'Residuos de tratamientos físicoquímicos de residuos (incluidas la descromatación, descianuración y neutralización)', '10', 'Residuos combustibles distintos de los especificados en los códigos 19 02 08 y 19 02 09', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190299', '19 02 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '02', 'Residuos de tratamientos físicoquímicos de residuos (incluidas la descromatación, descianuración y neutralización)', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190305', '19 03 05', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '03', 'Residuos estabilizados/solidificados [5]', '05', 'Residuos estabilizados distintos de los especificados en el código 19 03 04', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190307', '19 03 07', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '03', 'Residuos estabilizados/solidificados [5]', '07', 'Residuos solidificados distintos de los especificados en el código 19 03 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190401', '19 04 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '04', 'Residuos vitrificados y residuos de la vitrificación', '01', 'Residuos vitrificados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190404', '19 04 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '04', 'Residuos vitrificados y residuos de la vitrificación', '04', 'Residuos líquidos acuosos del templado de residuos vitrificados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190501', '19 05 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '05', 'Residuos del tratamiento aeróbico de residuos sólidos', '01', 'Fracción no compostada de residuos municipales y asimilados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190502', '19 05 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '05', 'Residuos del tratamiento aeróbico de residuos sólidos', '02', 'Fracción no compostada de residuos de procedencia animal o vegetal', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190503', '19 05 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '05', 'Residuos del tratamiento aeróbico de residuos sólidos', '03', 'Compost fuera de especificación', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190599', '19 05 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '05', 'Residuos del tratamiento aeróbico de residuos sólidos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190603', '19 06 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '06', 'Residuos del tratamiento anaeróbico de residuos', '03', 'Licores del tratamiento anaeróbico de residuos municipales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190604', '19 06 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '06', 'Residuos del tratamiento anaeróbico de residuos', '04', 'Lodos de digestión del tratamiento anaeróbico de residuos municipales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190605', '19 06 05', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '06', 'Residuos del tratamiento anaeróbico de residuos', '05', 'Licores del tratamiento anaeróbico de residuos animales y vegetales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190606', '19 06 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '06', 'Residuos del tratamiento anaeróbico de residuos', '06', 'Lodos de digestión del tratamiento anaeróbico de residuos animales y vegetales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190699', '19 06 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '06', 'Residuos del tratamiento anaeróbico de residuos', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190703', '19 07 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '07', 'Lixiviados de vertedero', '03', 'Lixiviados de vertedero distintos de los especificados en el código 19 07 02', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190801', '19 08 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '01', 'Residuos de cribado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190802', '19 08 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '02', 'Residuos de desarenado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190805', '19 08 05', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '05', 'Lodos del tratamiento de aguas residuales urbanas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190809', '19 08 09', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '09', 'Mezclas de grasas y aceites procedentes de la separación de agua/sustancias aceitosas que contienen sólo aceites y grasa', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190812', '19 08 12', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '12', 'Lodos procedentes del tratamiento biológico de aguas residuales industriales distintos de los especificados en el código 19 08 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190814', '19 08 14', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '14', 'Lodos procedentes de otros tratamientos de aguas residuales industriales, distintos de los especificados en el código 19 08 13', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190899', '19 08 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '08', 'Residuos de plantas de tratamiento de aguas residuales no especificados en otra categoría', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190901', '19 09 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '01', 'Residuos sólidos de la filtración primaria y cribado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190902', '19 09 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '02', 'Lodos de la clarificación del agua', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190903', '19 09 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '03', 'Lodos de descarbonatación', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190904', '19 09 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '04', 'Carbón activo usado', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190905', '19 09 05', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '05', 'Resinas intercambiadoras de iones saturadas o usadas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190906', '19 09 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '06', 'Soluciones y lodos de la regeneración de intercambiadores de iones', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('190999', '19 09 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '09', 'Residuos de la preparación de agua para consumo humano o agua para uso industrial', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191001', '19 10 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '10', 'Residuos procedentes del fragmentado de residuos que contienen metales', '01', 'Residuos de hierro y acero', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191002', '19 10 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '10', 'Residuos procedentes del fragmentado de residuos que contienen metales', '02', 'Residuos no férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191004', '19 10 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '10', 'Residuos procedentes del fragmentado de residuos que contienen metales', '04', 'Fracciones ligeras de fragmentación (fluff-light) y polvo distintas de las especificadas en el código 19 10 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191006', '19 10 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '10', 'Residuos procedentes del fragmentado de residuos que contienen metales', '06', 'Otras fracciones distintas de las especificadas en el código 19 10 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191106', '19 11 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '11', 'Residuos de la regeneración de aceites', '06', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191199', '19 11 99', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '11', 'Residuos de la regeneración de aceites', '99', 'Residuos no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191201', '19 12 01', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '01', 'Papel y cartón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191202', '19 12 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '02', 'Metales férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191203', '19 12 03', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '03', 'Metales no férreos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191204', '19 12 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '04', 'Plástico y caucho', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191205', '19 12 05', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '05', 'Vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191207', '19 12 07', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '07', 'Madera distinta de la especificada en el código 19 12 06', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191208', '19 12 08', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '08', 'Textiles', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191209', '19 12 09', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '09', 'Minerales (por ejemplo, arena, piedras)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191210', '19 12 10', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '10', 'Residuos combustibles (combustible derivado de residuos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191212', '19 12 12', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '12', 'Residuos del tratamiento mecánico de residuos (por ejemplo, clasificación, trituración, compactación, peletización) no especificados en otra categoría', '12', 'Otros residuos (incluidas mezclas de materiales) procedentes del tratamiento mecánico de residuos, distintos de los especificados en el código 19 12 11', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191302', '19 13 02', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '13', 'Residuos de la recuperación de suelos y de aguas subterráneas', '02', 'Residuos sólidos de la recuperación de suelos distintos de los especificados en el código 19 13 01', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191304', '19 13 04', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '13', 'Residuos de la recuperación de suelos y de aguas subterráneas', '04', 'Lodos de la recuperación de suelos distintos de los especificados en el código 19 13 03', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191306', '19 13 06', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '13', 'Residuos de la recuperación de suelos y de aguas subterráneas', '06', 'Lodos de la recuperación de aguas subterráneas distintos de los especificados en el código 19 13 05', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('191308', '19 13 08', '19', 'Residuos de las instalaciones para el tratamiento de residuos, de las plantas externas de tratamiento de aguas residuales y de la preparación de agua para consumo humano y de agua para uso industrial', '13', 'Residuos de la recuperación de suelos y de aguas subterráneas', '08', 'Residuos de líquidos acuosos y concentrados acuosos procedentes de la recuperación de aguas subterráneas, distintos de los especificados en el código 19 13 07', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200101', '20 01 01', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '01', 'Papel y cartón', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200102', '20 01 02', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '02', 'Vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200108', '20 01 08', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '08', 'Residuos biodegradables de cocinas y restaurantes', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200110', '20 01 10', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '10', 'Ropa', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200111', '20 01 11', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '11', 'Tejidos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200125', '20 01 25', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '25', 'Aceites y grasas comestibles', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200128', '20 01 28', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '28', 'Pinturas, tintas, adhesivos y resinas distintos de los especificados en el código 20 01 27', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200130', '20 01 30', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '30', 'Detergentes distintos de los especificados en el código 20 01 29', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200132', '20 01 32', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '32', 'Medicamentos distintos de los especificados en el código 20 01 31', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200134', '20 01 34', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '34', 'Baterías y acumuladores distintos de los especificados en el código 20 01 33', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200136', '20 01 36', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '36', 'Equipos eléctricos y electrónicos desechados distintos de los especificados en los códigos 20 01 21, 20 01 23 y 20 01 35', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200138', '20 01 38', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '38', 'Madera distinta de la especificada en el código 20 01 37', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200139', '20 01 39', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '39', 'Plásticos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200140', '20 01 40', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '40', 'Metales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200141', '20 01 41', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '41', 'Residuos del deshollinado de chimeneas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200199', '20 01 99', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '01', 'Fracciones recogidas selectivamente (excepto las especificadas en el subcapítulo 15 01)', '99', 'Otras fracciones no especificadas en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200201', '20 02 01', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '02', 'Residuos de parques y jardines (incluidos los residuos de cementerios)', '01', 'Residuos biodegradables', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200202', '20 02 02', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '02', 'Residuos de parques y jardines (incluidos los residuos de cementerios)', '02', 'Tierra y piedras', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200203', '20 02 03', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '02', 'Residuos de parques y jardines (incluidos los residuos de cementerios)', '03', 'Otros residuos no biodegradables', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200301', '20 03 01', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '01', 'Mezclas de residuos municipales', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200302', '20 03 02', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '02', 'Residuos de mercados', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200303', '20 03 03', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '03', 'Residuos de limpieza viaria', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200304', '20 03 04', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '04', 'Lodos de fosas sépticas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200306', '20 03 06', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '06', 'Residuos de la limpieza de alcantarillas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200307', '20 03 07', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '07', 'Residuos voluminosos (incluidos muebles)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('200399', '20 03 99', '20', 'Residuos municipales (residuos domésticos y residuos asimilables procedentes de los comercios, industrias e instituciones), incluidas las fracciones recogidas selectivamente', '03', 'Otros residuos municipales', '99', 'Residuos municipales no especificados en otra categoría', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210101', '21 01 01', '21', 'Acuicultura y Pesca', '01', 'Residuos de plantas de procesamiento de peces de acuicultura', '01', 'Residuos orgánicos (ejemplo como vísceras, escamas, carne, espinas, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210102', '21 01 02', '21', 'Acuicultura y Pesca', '01', 'Residuos de plantas de procesamiento de peces de acuicultura', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos, sangre entre otros; e inorgánicos).', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210103', '21 01 03', '21', 'Acuicultura y Pesca', '01', 'Residuos de plantas de procesamiento de peces de acuicultura', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210201', '21 02 01', '21', 'Acuicultura y Pesca', '02', 'Residuos de plantas de procesamiento de moluscos y otras especies de cultivo', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros; incluye mortalidad)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210202', '21 02 02', '21', 'Acuicultura y Pesca', '02', 'Residuos de plantas de procesamiento de moluscos y otras especies de cultivo', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210203', '21 02 03', '21', 'Acuicultura y Pesca', '02', 'Residuos de plantas de procesamiento de moluscos y otras especies de cultivo', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210301', '21 03 01', '21', 'Acuicultura y Pesca', '03', 'Residuos de plantas de procesamiento de algas de cultivo', '01', 'Residuos orgánicos (incluye vegetal, conchas, restos de especies marinas)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210302', '21 03 02', '21', 'Acuicultura y Pesca', '03', 'Residuos de plantas de procesamiento de algas de cultivo', '02', 'Residuos de hidrocoloides (carragenina, alginatos, agar)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210303', '21 03 03', '21', 'Acuicultura y Pesca', '03', 'Residuos de plantas de procesamiento de algas de cultivo', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210401', '21 04 01', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '01', 'Residuos orgánicos (ej: fouling (incrustaciones biológicas), mortalidad, vísceras, eliminación productiva)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210402', '21 04 02', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210403', '21 04 03', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '03', 'Residuos de redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210404', '21 04 04', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto planzas, boyas, flotadores, redes y cabos.', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210405', '21 04 05', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '05', 'Residuos de planzas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210406', '21 04 06', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '06', 'Residuos metálicos (incluye jaulas, pasillos y estructuras del centro de cultivo)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210407', '21 04 07', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '07', 'Residuos orgánicos retenidos (heces, alimento no consumido, y/o lodos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210408', '21 04 08', '21', 'Acuicultura y Pesca', '04', 'Residuos de cultivos de peces', '08', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210501', '21 05 01', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '01', 'Residuos orgánicos (ejemplo como conchas, algas, fouling)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210502', '21 05 02', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210503', '21 05 03', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '03', 'Residuos de redes y cabos (por ejemplo: cuelgas, colectores, línea madre, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210504', '21 05 04', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto boyas, flotadores, redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210505', '21 05 05', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '05', 'Residuos metálicos (incluye linternas, jaulas, pasillos y estructuras del centro de cultivo)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210506', '21 05 06', '21', 'Acuicultura y Pesca', '05', 'Residuos de cultivos de moluscos y otras especies', '06', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210601', '21 06 01', '21', 'Acuicultura y Pesca', '06', 'Residuos de cultivos de algas', '01', 'Residuos orgánicos (ejemplo como conchas, algas, fouling)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210602', '21 06 02', '21', 'Acuicultura y Pesca', '06', 'Residuos de cultivos de algas', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210603', '21 06 03', '21', 'Acuicultura y Pesca', '06', 'Residuos de cultivos de algas', '03', 'Residuos de redes y cabos (incluye líneas de cultivo)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210604', '21 06 04', '21', 'Acuicultura y Pesca', '06', 'Residuos de cultivos de algas', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto boyas, flotadores, redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210605', '21 06 05', '21', 'Acuicultura y Pesca', '06', 'Residuos de cultivos de algas', '05', 'Residuos metálicos (incluye quechas, estructuras entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210701', '21 07 01', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros; incluye mortalidad)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210702', '21 07 02', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210703', '21 07 03', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '03', 'Residuos de redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210704', '21 07 04', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto planzas, boyas, flotadores, redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210705', '21 07 05', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '05', 'Residuos planzas', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210706', '21 07 06', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '06', 'Residuos metálicos (incluye quechas, estructuras, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210707', '21 07 07', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '07', 'Residuos de fibra de vidrio', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210708', '21 07 08', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '08', 'Lodos de lavado, desinfección y limpieza', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210709', '21 07 09', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '09', 'Lodos orgánicos (ejemplo fecas y alimento no consumido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210710', '21 07 10', '21', 'Acuicultura y Pesca', '07', 'Residuos de piscicultura y hatchery', '10', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210801', '21 08 01', '21', 'Acuicultura y Pesca', '08', 'Residuos de extracción de recursos hidrobiológicos (captura y recolección)', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210802', '21 08 02', '21', 'Acuicultura y Pesca', '08', 'Residuos de extracción de recursos hidrobiológicos (captura y recolección)', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210803', '21 08 03', '21', 'Acuicultura y Pesca', '08', 'Residuos de extracción de recursos hidrobiológicos (captura y recolección)', '03', 'Residuos de redes y cabos', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210804', '21 08 04', '21', 'Acuicultura y Pesca', '08', 'Residuos de extracción de recursos hidrobiológicos (captura y recolección)', '04', 'Residuos metálicos (incluye anzuelos, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210901', '21 09 01', '21', 'Acuicultura y Pesca', '09', 'Residuos de plantas de procesamiento de peces de extracción', '01', 'Residuos orgánicos (ejemplo como vísceras, escamas, carne, espinas, entre otros.)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210902', '21 09 02', '21', 'Acuicultura y Pesca', '09', 'Residuos de plantas de procesamiento de peces de extracción', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('210903', '21 09 03', '21', 'Acuicultura y Pesca', '09', 'Residuos de plantas de procesamiento de peces de extracción', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211001', '21 10 01', '21', 'Acuicultura y Pesca', '10', 'Residuos de plantas de procesamiento de algas provenientes de la recolección', '01', 'Residuos orgánicos (incluye vegetal, conchas, restos de especies marinas)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211002', '21 10 02', '21', 'Acuicultura y Pesca', '10', 'Residuos de plantas de procesamiento de algas provenientes de la recolección', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211003', '21 10 03', '21', 'Acuicultura y Pesca', '10', 'Residuos de plantas de procesamiento de algas provenientes de la recolección', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211101', '21 11 01', '21', 'Acuicultura y Pesca', '11', 'Residuos de plantas de procesamiento de moluscos y otras especies provenientes de la extracción', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211102', '21 11 02', '21', 'Acuicultura y Pesca', '11', 'Residuos de plantas de procesamiento de moluscos y otras especies provenientes de la extracción', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211103', '21 11 03', '21', 'Acuicultura y Pesca', '11', 'Residuos de plantas de procesamiento de moluscos y otras especies provenientes de la extracción', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211201', '21 12 01', '21', 'Acuicultura y Pesca', '12', 'Residuos de plantas de procesamiento de crustáceos provenientes de la extracción', '01', 'Residuos orgánicos (ejemplo como conchas, cáscara calcárea, algas, carne, entre otros)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211202', '21 12 02', '21', 'Acuicultura y Pesca', '12', 'Residuos de plantas de procesamiento de crustáceos provenientes de la extracción', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánico)', FALSE);
INSERT INTO public.ler_codes (id, code, chapter_code, chapter_description, subchapter_code, subchapter_description, waste_code, waste_description, is_hazardous)
VALUES ('211203', '21 12 03', '21', 'Acuicultura y Pesca', '12', 'Residuos de plantas de procesamiento de crustáceos provenientes de la extracción', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', FALSE);

-- ==============================================================================
-- SEED DATA: WASTE TREATMENTS (Operaciones de Tratamiento)
-- Fuente: Imágenes oficiales SINADER transcritas
-- ==============================================================================
TRUNCATE TABLE public.waste_treatments CASCADE;

INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (11, '11', 'Relleno sanitario', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (12, '12', 'Vertedero', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (14, '14', 'Monorelleno', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (30, '30', 'Basural', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (32, '32', 'Recepción de Lodos en PTAS', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (33, '33', 'Depósito de Seguridad', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (60, '60', 'Sitio de Escombros de la Construcción', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (65, '65', 'Área de disposición controlada', 'eliminacion', 'Disposición final', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (58, '58', 'Depósito de Cenizas', 'eliminacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (49, '49', 'Residuos Voluminosos', 'eliminacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (56, '56', 'Residuos Municipales', 'eliminacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (4, '4', 'Incineración sin recuperación de energía', 'eliminacion', 'Incineración sin recuperación de energía', 'Incineración sin recuperación de energía');
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (36, '36', 'Pretratamiento de papel, cartón y productos de papel', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (37, '37', 'Pretratamiento vidrio', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (38, '38', 'Pretratamiento de ropa', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (39, '39', 'Pretratamiento de textil, cuero y piel', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (40, '40', 'Pretratamiento de aceites y grasas comestibles', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (41, '41', 'Pretratamiento de pinturas, tintas, adhesivos y resinas que no contienen sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (42, '42', 'Pretratamiento de detergentes que no contienen sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (43, '43', 'Pretratamiento de madera que no contiene sustancias peligrosas', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (44, '44', 'Pretratamiento de Metales', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (45, '45', 'Pretratamiento de plásticos', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (47, '47', 'Pretratamiento de Neumáticos Fuera de Uso', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (50, '50', 'Pretratamiento de Residuos Voluminosos', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (57, '57', 'Aparatos eléctricos y electrónicos', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (61, '61', 'Pretratamiento de caucho y goma', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (64, '64', 'Materiales eléctricos', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (73, '73', 'Residuos Agroalimentarios', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (74, '74', 'Tintas secas y Fertilizantes', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (75, '75', 'Pretratamiento de Equipos de Refrigeración', 'valorizacion', 'Pretratamiento (Centro de acopio)', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (16, '16', 'Reciclaje de papel, cartón y productos de papel', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (17, '17', 'Reciclaje de textiles', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (18, '18', 'Reciclaje de plásticos', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (19, '19', 'Reciclaje de vidrio', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (20, '20', 'Reciclaje de metales', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (22, '22', 'Residuos voluminosos', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (46, '46', 'Reciclaje de Neumáticos Fuera de Uso', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (66, '66', 'Reciclaje de residuos de pastas y/o productos alimenticios para consumo animal', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (76, '76', 'Reciclaje de Aparatos eléctricos y electrónicos', 'valorizacion', 'Reciclaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (24, '24', 'Co-incineración', 'valorizacion', 'Recuperación de energía', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (25, '25', 'Incineración con recuperación de energía', 'valorizacion', 'Recuperación de energía', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (9, '9', 'Recuperación de energía', 'valorizacion', 'Recuperación de energía', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (63, '63', 'Aplicación a suelo', 'valorizacion', 'Recepción de Lodos de PTAS', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (62, '62', 'Recepción de Lodos de PTAS', 'valorizacion', 'Recepción de Lodos de PTAS', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (7, '7', 'Preparación para reutilización', 'valorizacion', 'Preparación para reutilización', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (23, '23', 'Co-procesamiento', 'valorizacion', 'Co-procesamiento', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (27, '27', 'Compostaje', 'valorizacion', 'Compostaje', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (28, '28', 'Lombricultura', 'valorizacion', 'Lombricultura', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (29, '29', 'Degradación Anaeróbica', 'valorizacion', 'Degradación Anaeróbica', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (31, '31', 'Aplicación al Suelo', 'valorizacion', 'Aplicación al Suelo', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (34, '34', 'Reducción de Recursos Hidrobiológicos', 'valorizacion', 'Reducción de Recursos Hidrobiológicos', NULL);
INSERT INTO public.waste_treatments (id, code, name, category, subcategory, description)
VALUES (68, '68', 'Reducción de residuos orgánicos en base a larvas de insectos', 'valorizacion', 'Reducción de residuos orgánicos', NULL);

-- ==============================================================================
-- SEED DATA: SUBSCRIPTION PLANS
-- Planes diferenciados por sector (public/private) y tipo de entidad
-- ==============================================================================
TRUNCATE TABLE public.subscription_plans CASCADE;

INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  'free', 
  'Plan Semilla', 
  'Plan gratuito para pequeñas organizaciones que inician su gestión de residuos', 
  'private', 
  NULL, 
  0, 
  'CLP', 
  '{"users": 1, "establishments": 1, "storage_gb": 1, "monthly_declarations": 10, "custom_indicators": 5}'::jsonb, 
  '{"support": "community", "advanced_analytics": false, "custom_reports": false, "api_access": false, "data_visualization": "basic"}'::jsonb, 
  False, 
  1
);
INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  'pro_small', 
  'Plan Brote', 
  'Para empresas pequeñas y medianas en crecimiento', 
  'private', 
  NULL, 
  50000, 
  'CLP', 
  '{"users": 5, "establishments": 5, "storage_gb": 10, "monthly_declarations": 100, "custom_indicators": 20}'::jsonb, 
  '{"support": "email", "advanced_analytics": true, "custom_reports": true, "api_access": true, "data_visualization": "advanced"}'::jsonb, 
  True, 
  2
);
INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  'pro_large', 
  'Plan Bosque', 
  'Solución integral para grandes empresas generadoras', 
  'private', 
  NULL, 
  150000, 
  'CLP', 
  '{"users": "unlimited", "establishments": "unlimited", "storage_gb": 100, "monthly_declarations": "unlimited", "custom_indicators": "unlimited"}'::jsonb, 
  '{"support": "priority", "advanced_analytics": true, "custom_reports": true, "api_access": true, "whitelabel": true, "sla_uptime": 99.9, "data_visualization": "advanced"}'::jsonb, 
  False, 
  3
);
INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  'municipality', 
  'Plan Municipalidad', 
  'Para gobiernos locales y municipalidades', 
  'public', 
  'municipality', 
  30000, 
  'CLP', 
  '{"users": 10, "establishments": "unlimited", "storage_gb": 20, "monthly_declarations": "unlimited", "custom_indicators": 30}'::jsonb, 
  '{"support": "email", "advanced_analytics": true, "custom_reports": true, "api_access": true, "data_visualization": "basic"}'::jsonb, 
  False, 
  4
);
INSERT INTO public.subscription_plans (
  code, name, description, sector, public_entity_type, 
  price_clp, currency, limits, features, 
  is_recommended, display_order
)
VALUES (
  'gore', 
  'Plan GORE / SEREMI', 
  'Para gobiernos regionales y servicios ministeriales - Visualización agregada de todas las comunas', 
  'public', 
  'gore', 
  200000, 
  'CLP', 
  '{"users": "unlimited", "establishments": "unlimited", "storage_gb": 500, "monthly_declarations": "unlimited", "custom_indicators": "unlimited"}'::jsonb, 
  '{"support": "priority", "advanced_analytics": true, "custom_reports": true, "api_access": true, "data_visualization": "regional_aggregation", "multi_commune_dashboard": true, "sla_uptime": 99.9}'::jsonb, 
  False, 
  5
);