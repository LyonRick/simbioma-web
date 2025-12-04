-- ==============================================================================
-- SEED DATA: LER CODES (Lista Europea de Residuos)
-- Adapted to existing Supabase schema
-- ==============================================================================
TRUNCATE TABLE public.ler_codes CASCADE;
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010101', '01', '01', '01', 'Residuos de la extracción de minerales metálicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010102', '01', '01', '02', 'Residuos de la extracción de minerales no metálicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010306', '01', '03', '06', 'Estériles distintos de los mencionados en los códigos 01 03 04 y 01 03 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010308', '01', '03', '08', 'Residuos de polvo y arenilla distintos de los mencionados en el código 01 03 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010309', '01', '03', '09', 'Lodos rojos de la producción de alúmina distintos de los mencionados en el código 01 03 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010399', '01', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010408', '01', '04', '08', 'Residuos de grava y rocas trituradas distintos de los mencionados en el código 01 04 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010409', '01', '04', '09', 'Residuos de arena y arcillas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010410', '01', '04', '10', 'Residuos de polvo y arenilla distintos de los mencionados en el código 01 04 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010411', '01', '04', '11', 'Residuos de la transformación de potasa y sal gema distintos de los mencionados en el código 01 04 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010412', '01', '04', '12', 'Estériles y otros residuos del lavado y limpieza de minerales, distintos de los mencionados en los códigos 01 04 07 y 01 04 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010413', '01', '04', '13', 'Residuos del corte y serrado de piedra distintos de los mencionados en el código 01 04 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010499', '01', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010504', '01', '05', '04', 'Lodos y residuos de perforaciones que contienen agua dulce', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010507', '01', '05', '07', 'Lodos y otros residuos de perforaciones que contienen sales de bario distintos de los mencionados en los códigos 01 05 05 y 01 05 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010508', '01', '05', '08', 'Lodos y otros residuos de perforaciones que contienen cloruros distintos de los mencionados en los códigos 01 05 05 y 01 05 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('010599', '01', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020101', '02', '01', '01', 'Lodos de lavado y limpieza', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020102', '02', '01', '02', 'Residuos de tejidos de animales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020103', '02', '01', '03', 'Residuos de tejidos de vegetales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020104', '02', '01', '04', 'Residuos de plásticos (excepto embalajes)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020106', '02', '01', '06', 'Heces de animales, orina y estiércol (incluida paja podrida) y efluentes recogidos selectivamente y tratados fuera del lugar donde se generan', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020107', '02', '01', '07', 'Residuos de la silvicultura', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020109', '02', '01', '09', 'Residuos agroquímicos distintos de los mencionados en el código 02 01 08', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020110', '02', '01', '10', 'Residuos metálicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020199', '02', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020201', '02', '02', '01', 'Lodos de lavado y limpieza', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020202', '02', '02', '02', 'Residuos de tejidos de animales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020203', '02', '02', '03', 'Materiales inadecuados para el consumo o la elaboración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020204', '02', '02', '04', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020299', '02', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020301', '02', '03', '01', 'Lodos de lavado, limpieza, pelado, centrifugado y separación', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020302', '02', '03', '02', 'Residuos de conservantes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020303', '02', '03', '03', 'Residuos de la extracción con disolventes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020304', '02', '03', '04', 'Materiales inadecuados para el consumo o la elaboración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020305', '02', '03', '05', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020399', '02', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020401', '02', '04', '01', 'Tierra procedente de la limpieza y lavado de la remolacha', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020402', '02', '04', '02', 'Carbonato cálcico fuera de especificación', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020403', '02', '04', '03', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020499', '02', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020501', '02', '05', '01', 'Materiales inadecuados para el consumo o la elaboración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020502', '02', '05', '02', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020599', '02', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020601', '02', '06', '01', 'Materiales inadecuados para el consumo o la elaboración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020602', '02', '06', '02', 'Residuos de conservantes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020603', '02', '06', '03', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020699', '02', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020701', '02', '07', '01', 'Residuos de lavado, limpieza y reducción mecánica de materias primas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020702', '02', '07', '02', 'Residuos de la destilación de alcoholes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020703', '02', '07', '03', 'Residuos del tratamiento químico', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020704', '02', '07', '04', 'Materiales inadecuados para el consumo o la elaboración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020705', '02', '07', '05', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('020799', '02', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030101', '03', '01', '01', 'Residuos de corteza y corcho', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030105', '03', '01', '05', 'Serrín, virutas, recortes, madera, tableros de partículas y chapas distintos de los mencionados en el código 03 01 04', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030199', '03', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030299', '03', '02', '99', 'Conservantes de la madera no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030301', '03', '03', '01', 'Residuos de corteza y madera', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030302', '03', '03', '02', 'Lodos de lejías verdes (procedentes de la recuperación de lejías de cocción)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030305', '03', '03', '05', 'Lodos de destintado procedentes del reciclado de papel', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030307', '03', '03', '07', 'Desechos, separados mecánicamente, de pasta elaborada a partir de residuos de papel y cartón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030308', '03', '03', '08', 'Residuos procedentes de la clasificación de papel y cartón destinados al reciclado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030309', '03', '03', '09', 'Residuos de lodos calizos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030310', '03', '03', '10', 'Desechos de fibras y lodos de fibras, de materiales de carga y de estucado, obtenidos por separación mecánica', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030311', '03', '03', '11', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 03 03 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('030399', '03', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040101', '04', '01', '01', 'Carnazas y serrajes de encalado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040102', '04', '01', '02', 'Residuos de encalado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040104', '04', '01', '04', 'Residuos líquidos de curtición que contienen cromo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040105', '04', '01', '05', 'Residuos líquidos de curtición que no contienen cromo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040106', '04', '01', '06', 'Lodos, en particular los procedentes del tratamiento in situ de efluentes, que contienen cromo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040107', '04', '01', '07', 'Lodos, en particular los procedentes del tratamiento in situ de efluentes, que no contienen cromo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040108', '04', '01', '08', 'Residuos de piel curtida (serrajes, rebajaduras, recortes y polvo de esmerilado) que contienen cromo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040109', '04', '01', '09', 'Residuos de confección y acabado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040199', '04', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040209', '04', '02', '09', 'Residuos de materiales compuestos (textiles impregnados, elastómeros, plastómeros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040210', '04', '02', '10', 'Materia orgánica de productos naturales (por ejemplo grasa, cera)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040215', '04', '02', '15', 'Residuos del acabado distintos de los especificados en el código 04 02 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040217', '04', '02', '17', 'Colorantes y pigmentos distintos de los mencionados en el código 04 02 16', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040220', '04', '02', '20', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 04 02 19', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040221', '04', '02', '21', 'Residuos de fibras textiles no procesadas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040222', '04', '02', '22', 'Residuos de fibras textiles procesadas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('040299', '04', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050110', '05', '01', '10', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 05 01 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050113', '05', '01', '13', 'Lodos procedentes del agua de alimentación de calderas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050114', '05', '01', '14', 'Residuos de columnas de refrigeración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050116', '05', '01', '16', 'Residuos que contienen azufre procedentes de la desulfuración del petróleo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050117', '05', '01', '17', 'Betunes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050199', '05', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050604', '05', '06', '04', 'Residuos de columnas de refrigeración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050699', '05', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050702', '05', '07', '02', 'Residuos que contienen azufre', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('050799', '05', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060199', '06', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060299', '06', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060314', '06', '03', '14', 'Sales sólidas y soluciones distintas de las mencionadas en los códigos 06 03 11 y 06 03 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060316', '06', '03', '16', 'Oxidos metálicos distintos de los mencionados en el código 06 03 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060399', '06', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060499', '06', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060503', '06', '05', '03', 'Lodos del tratamiento in situ de efluentes, distintos de los mencionados en el código 06 05 02', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060603', '06', '06', '03', 'Residuos que contienen sulfuros distintos de los mencionados en el código 06 06 02', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060699', '06', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060799', '06', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060899', '06', '08', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060902', '06', '09', '02', 'Escorias de fósforo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060904', '06', '09', '04', 'Residuos cálcicos de reacción distintos de los mencionados en el código 06 09 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('060999', '06', '09', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('061099', '06', '10', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('061101', '06', '11', '01', 'Residuos cálcicos de reacción procedentes de la producción de dióxido de titanio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('061199', '06', '11', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('061303', '06', '13', '03', 'Negro de carbón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('061399', '06', '13', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070112', '07', '01', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070199', '07', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070212', '07', '02', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 02 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070213', '07', '02', '13', 'Residuos de plástico', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070215', '07', '02', '15', 'Residuos procedentes de aditivos distintos de los especificados en el código 07 02 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070217', '07', '02', '17', 'Residuos que contengan siliconas distintas de las especificadas en el código 07 02 16', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070299', '07', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070312', '07', '03', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 03 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070399', '07', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070412', '07', '04', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 04 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070499', '07', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070512', '07', '05', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 05 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070514', '07', '05', '14', 'Residuos sólidos distintos de los especificados en el código 07 05 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070599', '07', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070612', '07', '06', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 06 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070699', '07', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070712', '07', '07', '12', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 07 07 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('070799', '07', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080112', '08', '01', '12', 'Residuos de pintura y barniz, distintos de los especificados en el código 08 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080114', '08', '01', '14', 'Lodos de pintura y barniz, distintos de los especificados en el código 08 01 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080116', '08', '01', '16', 'Lodos acuosos que contienen pintura o barniz, distintos de los especificados en el código 08 01 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080118', '08', '01', '18', 'Residuos del decapado o eliminación de pintura y barniz, distintos de los especificados en el código 08 01 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080120', '08', '01', '20', 'Suspensiones acuosas que contienen pintura o barniz, distintos de los especificados en el código 08 01 19', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080199', '08', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080201', '08', '02', '01', 'Residuos de arenillas de revestimiento', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080202', '08', '02', '02', 'Lodos acuosos que contienen materiales cerámicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080203', '08', '02', '03', 'Suspensiones acuosas que contienen materiales cerámicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080299', '08', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080307', '08', '03', '07', 'Lodos acuosos que contienen tinta', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080308', '08', '03', '08', 'Residuos líquidos acuosos que contienen tinta', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080313', '08', '03', '13', 'Residuos de tintas distintos de los especificados en el código 08 03 12', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080315', '08', '03', '15', 'Lodos de tinta distintos de los especificados en el código 08 03 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080318', '08', '03', '18', 'Residuos de tóner de impresión, distintos de los especificados en el código 08 03 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080399', '08', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080410', '08', '04', '10', 'Residuos de adhesivos y sellantes, distintos de los especificados en el código 08 04 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080412', '08', '04', '12', 'Lodos de adhesivos y sellantes, distintos de los especificados en el código 08 04 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080414', '08', '04', '14', 'Lodos acuosos que contienen adhesivos o sellantes, distintos de los especificados en el código 08 04 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080416', '08', '04', '16', 'Residuos líquidos acuosos que contienen adhesivos o sellantes, distintos de los especificados en el código 08 04 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('080499', '08', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('090107', '09', '01', '07', 'Películas y papel fotográfico que contienen plata o compuestos de plata', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('090108', '09', '01', '08', 'Películas y papel fotográfico que no contienen plata ni compuestos de plata', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('090110', '09', '01', '10', 'Cámaras de un solo uso sin pilas ni acumuladores', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('090112', '09', '01', '12', 'Cámaras de un solo uso con pilas o acumuladores distintas de las especificadas en el código 09 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('090199', '09', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100101', '10', '01', '01', 'Cenizas del hogar, escorias y polvo de caldera (excepto el polvo de caldera especificado en el código 10 01 04)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100102', '10', '01', '02', 'Cenizas volantes de carbón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100103', '10', '01', '03', 'Cenizas volantes de turba y de madera (no tratada)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100105', '10', '01', '05', 'Residuos cálcicos de reacción, en forma sólida, procedentes de la desulfuración de gases de combustión', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100107', '10', '01', '07', 'Residuos cálcicos de reacción, en forma de lodos, procedentes de la desulfuración de gases de combustión', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100115', '10', '01', '15', 'Cenizas del hogar, escorias y polvo de caldera procedentes de la coincineración, distintos de los especificados en el código 10 01 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100117', '10', '01', '17', 'Cenizas volantes procedentes de la co-incineración distintas de las especificadas en el código 10 01 16', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100119', '10', '01', '19', 'Residuos procedentes de la depuración de gases distintos de los especificados en los códigos 10 01 05, 10 01 07 y 10 01 18', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100121', '10', '01', '21', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código 10 01 20', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100123', '10', '01', '23', 'Lodos acuosos procedentes de la limpieza de calderas, distintos de los especificados en el código 10 01 22', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100124', '10', '01', '24', 'Arenas de lechos fluidizados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100125', '10', '01', '25', 'Residuos procedentes del almacenamiento y preparación de combustible de centrales termoeléctricas de carbón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100126', '10', '01', '26', 'Residuos del tratamiento del agua de refrigeración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100199', '10', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100201', '10', '02', '01', 'Residuos del tratamiento de escorias', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100202', '10', '02', '02', 'Escorias no tratadas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100208', '10', '02', '08', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 02 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100210', '10', '02', '10', 'Cascarilla de laminación', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100212', '10', '02', '12', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 02 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100214', '10', '02', '14', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 02 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100215', '10', '02', '15', 'Otros lodos y tortas de filtración', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100299', '10', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100302', '10', '03', '02', 'Fragmentos de ánodos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100305', '10', '03', '05', 'Residuos de alúmina', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100316', '10', '03', '16', 'Espumas distintas de las especificadas en el código 10 03 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100318', '10', '03', '18', 'Residuos que contienen carbono procedentes de la fabricación de ánodos, distintos de los especificados en el código 10 03 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100320', '10', '03', '20', 'Partículas, procedentes de los efluentes gaseosos, distintas de las especificadas en el código 10 03 19', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100322', '10', '03', '22', 'Otras partículas y polvo (incluido el polvo de molienda) distintos de los especificados en el código 10 03 21', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100324', '10', '03', '24', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 03 23', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100326', '10', '03', '26', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 03 25', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100328', '10', '03', '28', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 03 27', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100330', '10', '03', '30', 'Residuos del tratamiento de escorias salinas y granzas negras distintos de los especificados en el código 10 03 29', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100399', '10', '03', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100410', '10', '04', '10', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 04 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100499', '10', '04', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100501', '10', '05', '01', 'Escorias de la producción primaria y secundaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100504', '10', '05', '04', 'Otras partículas y polvos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100509', '10', '05', '09', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 05 08', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100511', '10', '05', '11', 'Granzas y espumas distintas de las especificadas en el código 10 05 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100599', '10', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100601', '10', '06', '01', 'Escorias de la producción primaria y secundaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100602', '10', '06', '02', 'Granzas y espumas de la producción primaria y secundaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100604', '10', '06', '04', 'Otras partículas y polvos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100610', '10', '06', '10', 'Residuos del tratamiento del agua de refrigeración, distintos de los especificados en el código 10 06 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100699', '10', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100701', '10', '07', '01', 'Escorias de la producción primaria y secundaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100702', '10', '07', '02', 'Granzas y espumas de la producción primaria y secundaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100703', '10', '07', '03', 'Residuos sólidos del tratamiento de gases', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100704', '10', '07', '04', 'Otras partículas y polvos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100705', '10', '07', '05', 'Lodos y tortas de filtración del tratamiento de gases', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100708', '10', '07', '08', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 07 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100799', '10', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100804', '10', '08', '04', 'Partículas y polvo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100809', '10', '08', '09', 'Otras escorias', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100811', '10', '08', '11', 'Granzas y espumas distintas de las especificadas en el código 10 08 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100813', '10', '08', '13', 'Residuos que contienen carbono procedentes de la fabricación de ánodos distintos de los especificados en el código 10 08 12', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100814', '10', '08', '14', 'Fragmentos de ánodos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100816', '10', '08', '16', 'Partículas procedentes de los efluentes gaseosos distintas de las especificadas en el código 10 08 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100818', '10', '08', '18', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 08 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100820', '10', '08', '20', 'Residuos del tratamiento del agua de refrigeración distintos de los especificados en el código 10 08 19', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100899', '10', '08', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100903', '10', '09', '03', 'Escorias de horno', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100906', '10', '09', '06', 'Machos y moldes de fundición sin colada distintos de los especificados en el código 10 09 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100908', '10', '09', '08', 'Machos y moldes de fundición con colada distintos de los especificados en el código 10 09 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100910', '10', '09', '10', 'Partículas procedentes de los efluentes gaseosos distintas de las especificadas en el código 10 09 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100912', '10', '09', '12', 'Otras partículas distintas de las especificadas en el código 10 09 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100914', '10', '09', '14', 'Ligantes residuales distintos de los especificados en el código 10 09 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100916', '10', '09', '16', 'Residuos de agentes indicadores de fisuración distintos de los especificados en el código 10 09 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('100999', '10', '09', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101003', '10', '10', '03', 'Escorias de horno', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101006', '10', '10', '06', 'Machos y moldes de fundición sin colada distintos de los especificados en el código 10 10 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101008', '10', '10', '08', 'Machos y moldes de fundición con colada distintos de los especificados en el código 10 10 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101010', '10', '10', '10', 'Partículas procedentes de los efluentes gaseosos, distintas de las especificadas en el código 10 10 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101012', '10', '10', '12', 'Otras partículas distintas de las especificadas en el código 10 10 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101014', '10', '10', '14', 'Ligantes residuales distintos de los especificados en el código 10 10 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101016', '10', '10', '16', 'Residuos de agentes indicadores de fisuración distintos de los especificados en el código 10 10 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101099', '10', '10', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101103', '10', '11', '03', 'Residuos de materiales de fibra de vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101105', '10', '11', '05', 'Partículas y polvo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101110', '10', '11', '10', 'Residuos de la preparación de mezclas antes del proceso de cocción distintos de los especificados en el código 10 11 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101112', '10', '11', '12', 'Residuos de vidrio distintos de los especificados en el código 10 11 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101114', '10', '11', '14', 'Lodos procedentes del pulido y esmerilado del vidrio, distintos de los especificados en el código 10 11 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101116', '10', '11', '16', 'Residuos sólidos del tratamiento de gases de combustión, distintos de los especificados en el código 10 11 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101118', '10', '11', '18', 'Lodos y tortas de filtración del tratamiento de gases, distintos de los especificados en el código 10 11 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101120', '10', '11', '20', 'Residuos sólidos del tratamiento in situ de efluentes, distintos de los especificados en el código 10 11 19', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101199', '10', '11', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101201', '10', '12', '01', 'Residuos de la preparación de mezclas antes del proceso de cocción', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101203', '10', '12', '03', 'Partículas y polvo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101205', '10', '12', '05', 'Lodos y tortas de filtración del tratamiento de gases', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101206', '10', '12', '06', 'Moldes desechados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101208', '10', '12', '08', 'Residuos de cerámica, ladrillos, tejas y materiales de construcción (después del proceso de cocción)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101210', '10', '12', '10', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 12 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101212', '10', '12', '12', 'Residuos de vidriado distintos de los especificados en el código 10 12 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101213', '10', '12', '13', 'Lodos del tratamiento in situ de efluentes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101299', '10', '12', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101301', '10', '13', '01', 'Residuos de la preparación de mezclas antes del proceso de cocción', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101304', '10', '13', '04', 'Residuos de calcinación e hidratación de la cal', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101306', '10', '13', '06', 'Partículas y polvo (excepto los códigos 10 13 12 y 10 13 13)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101307', '10', '13', '07', 'Lodos y tortas de filtración del tratamiento de gases', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101310', '10', '13', '10', 'Residuos de la fabricación de fibrocemento distintos de los especificados en el código 10 13 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101311', '10', '13', '11', 'Residuos de materiales compuestos a base de cemento distintos de los especificados en los códigos 10 13 09 y 10 13 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101313', '10', '13', '13', 'Residuos sólidos del tratamiento de gases, distintos de los especificados en el código 10 13 12', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101314', '10', '13', '14', 'Residuos de hormigón y lodos de hormigón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('101399', '10', '13', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110110', '11', '01', '10', 'Lodos y tortas de filtración distintos de los especificados en el código 11 01 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110112', '11', '01', '12', 'Líquidos acuosos de enjuague distintos de los especificados en el código 11 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110114', '11', '01', '14', 'Residuos de desengrasado distintos de los especificados en el código 11 01 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110199', '11', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110203', '11', '02', '03', 'Residuos de la producción de ánodos para procesos de electrólisis acuosa', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110206', '11', '02', '06', 'Residuos de procesos de la hidrometalurgia del cobre distintos de los especificados en el código 11 02 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110299', '11', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110501', '11', '05', '01', 'Matas de galvanización', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110502', '11', '05', '02', 'Cenizas de zinc', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('110599', '11', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120101', '12', '01', '01', 'Limaduras y virutas de metales férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120102', '12', '01', '02', 'Polvo y partículas de metales férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120103', '12', '01', '03', 'Limaduras y virutas de metales no férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120104', '12', '01', '04', 'Polvo y partículas de metales no férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120105', '12', '01', '05', 'Virutas y rebabas de plástico', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120113', '12', '01', '13', 'Residuos de soldadura', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120115', '12', '01', '15', 'Lodos de mecanizado distintos de los especificados en el código 12 01 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120117', '12', '01', '17', 'Residuos de granallado o chorreado distintos de los especificados en el código 12 01 16', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120121', '12', '01', '21', 'Muelas y materiales de esmerilado usados distintos de los especificados en el código 12 01 20', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('120199', '12', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150101', '15', '01', '01', 'Envases de papel y cartón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150102', '15', '01', '02', 'Envases de plástico', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150103', '15', '01', '03', 'Envases de madera', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150104', '15', '01', '04', 'Envases metálicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150105', '15', '01', '05', 'Envases compuestos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150106', '15', '01', '06', 'Envases mezclados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150107', '15', '01', '07', 'Envases de vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150109', '15', '01', '09', 'Envases textiles', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('150203', '15', '02', '03', 'Absorbentes, materiales de filtración, trapos de limpieza y ropas protectoras distintos de los especificados en el código 15 02 02', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160103', '16', '01', '03', 'Neumáticos fuera de uso', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160106', '16', '01', '06', 'Vehículos al final de su vida útil que no contengan líquidos ni otros componentes peligrosos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160112', '16', '01', '12', 'Zapatas de freno distintas de las especificadas en el código 16 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160115', '16', '01', '15', 'Anticongelantes distintos de los especificados en el código 16 01 14', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160116', '16', '01', '16', 'Depósitos para gases licuados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160117', '16', '01', '17', 'Metales ferrosos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160118', '16', '01', '18', 'Metales no ferrosos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160119', '16', '01', '19', 'Plástico', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160120', '16', '01', '20', 'Vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160122', '16', '01', '22', 'Componentes no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160199', '16', '01', '99', 'Residuos no especificados de otra forma', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160214', '16', '02', '14', 'Equipos desechados distintos de los especificados en los códigos 16 02 09 a 16 02 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160216', '16', '02', '16', 'Componentes retirados de equipos desechados distintos de los especificados en el código 16 02 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160304', '16', '03', '04', 'Residuos inorgánicos distintos de los especificados en el código 16 03 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160306', '16', '03', '06', 'Residuos orgánicos distintos de los especificados en el código 16 03 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160505', '16', '05', '05', 'Gases en recipientes a presión, distintos de los especificados en el código 16 05 04', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160509', '16', '05', '09', 'Productos químicos desechados distintos de los especificados en los códigos 16 05 06, 16 05 07 o 16 05 08', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160604', '16', '06', '04', 'Pilas alcalinas (excepto 16 06 03)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160605', '16', '06', '05', 'Otras pilas y acumuladores', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160799', '16', '07', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160801', '16', '08', '01', 'Catalizadores usados que contienen oro, plata, renio, rodio, paladio, iridio o platino (excepto el código 16 08 07)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160803', '16', '08', '03', 'Catalizadores usados que contienen metales de transición o compuestos de metales de transición no especificados de otra forma', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('160804', '16', '08', '04', 'Catalizadores usados procedentes del craqueo catalítico en lecho fluido (excepto los del código 16 08 07)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161002', '16', '10', '02', 'Residuos líquidos acuosos distintos de los especificados en el código 16 10 01', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161004', '16', '10', '04', 'Concentrados acuosos distintos de los especificados en el código 16 10 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161102', '16', '11', '02', 'Revestimientos y refractarios a base de carbono, procedentes de procesos metalúrgicos distintos de los especificados en el código 16 11 01', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161104', '16', '11', '04', 'Otros revestimientos y refractarios procedentes de procesos metalúrgicos, distintos de los especificados en el código 16 11 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161106', '16', '11', '06', 'Revestimientos y refractarios procedentes de procesos no metalúrgicos, distintos de los especificados en el código 16 11 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161201', '16', '12', '01', 'Mezcla de residuos asimilables a domiciliarios', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161202', '16', '12', '02', 'Mezcla de residuos provenientes de actividades de la acuicultura', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('161203', '16', '12', '03', 'Mezcla de residuos provenientes de actividades de pesca', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170101', '17', '01', '01', 'Hormigón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170102', '17', '01', '02', 'Ladrillos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170103', '17', '01', '03', 'Tejas y materiales cerámicos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170107', '17', '01', '07', 'Mezclas de hormigón, ladrillos, tejas y materiales cerámicos, distintas de las especificadas en el código 17 01 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170201', '17', '02', '01', 'Madera libre de impregnación o pinturas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170202', '17', '02', '02', 'Vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170203', '17', '02', '03', 'Otros Plástico no especificados en los códigos 17 02 07, 17 02 08, 17 02 09 y 17 02 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170205', '17', '02', '05', 'Vidrios espejos o multicapas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170206', '17', '02', '06', 'Madera impregnada o pintada (no contiene sustancias peligrosas)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170207', '17', '02', '07', 'Plástico PVC (policloruro de vinilo)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170208', '17', '02', '08', 'Plástico CPVC (policloruro de vinilo clorado)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170209', '17', '02', '09', 'Plástico PPR (polipropileno R)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170210', '17', '02', '10', 'Plástico HDPE (polietileno de alta densidad)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170302', '17', '03', '02', 'Mezclas bituminosas distintas de las especificadas en el código 17 03 01', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170401', '17', '04', '01', 'Cobre, bronce, latón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170402', '17', '04', '02', 'Aluminio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170403', '17', '04', '03', 'Plomo', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170404', '17', '04', '04', 'Zinc', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170405', '17', '04', '05', 'Hierro y acero no galvanizados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170406', '17', '04', '06', 'Estaño', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170407', '17', '04', '07', 'Metales mezclados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170411', '17', '04', '11', 'Cables distintos de los especificados en el código 17 04 10', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170412', '17', '04', '12', 'Hierro y acero galvanizados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170504', '17', '05', '04', 'Tierra y piedras distintas de las especificadas en el código 17 05 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170506', '17', '05', '06', 'Lodos de drenaje distintos de los especificados en el código 17 05 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170508', '17', '05', '08', 'Balasto de vías férreas distinto del especificado en el código 17 05 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170604', '17', '06', '04', 'Materiales de aislamiento distintos de los especificados en los códigos 17 06 01 y 17 06 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170802', '17', '08', '02', 'Materiales de construcción a base de yeso distintos de los especificados en el código 17 08 01', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('170904', '17', '09', '04', 'Residuos mezclados de construcción y demolición distintos de los especificados en los códigos 17 09 01, 17 09 02 y 17 09 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180101', '18', '01', '01', 'Objetos cortantes y punzantes (excepto el código 18 01 03)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180102', '18', '01', '02', 'Restos anatómicos y órganos, incluidos bolsas y bancos de sangre (excepto el código 18 01 03)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180104', '18', '01', '04', 'Residuos cuya recogida y eliminación no es objeto de requisitos especiales para prevenir infecciones (por ejemplo, vendajes, vaciados de yeso, ropa blanca, ropa desechable, pañales)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180107', '18', '01', '07', 'Productos químicos distintos de los especificados en el código 18 01 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180109', '18', '01', '09', 'Medicamentos distintos de los especificados en el código 18 01 08', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180201', '18', '02', '01', 'Objetos cortantes y punzantes (excepto el código 18 02 02)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180203', '18', '02', '03', 'Residuos cuya recogida y eliminación no es objeto de requisitos especiales para prevenir infecciones', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180206', '18', '02', '06', 'Productos químicos distintos de los especificados en el código 18 02 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('180208', '18', '02', '08', 'Medicamentos distintos de los especificados en el código 18 02 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190102', '19', '01', '02', 'Materiales férreos separados de la ceniza de fondo de horno', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190112', '19', '01', '12', 'Cenizas de fondo de horno y escorias distintas de las especificadas en el código 19 01 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190114', '19', '01', '14', 'Cenizas volantes distintas de las especificadas en el código 19 01 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190116', '19', '01', '16', 'Polvo de caldera distinto del especificado en el código 19 01 15', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190118', '19', '01', '18', 'Residuos de pirólisis distintos de los especificados en el código 19 01 17', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190119', '19', '01', '19', 'Arenas de lechos fluidizados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190199', '19', '01', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190203', '19', '02', '03', 'Residuos mezclados previamente, compuestos exclusivamente por residuos no peligrosos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190206', '19', '02', '06', 'Lodos de tratamientos físicoquímicos, distintos de los especificados en el código 19 02 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190210', '19', '02', '10', 'Residuos combustibles distintos de los especificados en los códigos 19 02 08 y 19 02 09', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190299', '19', '02', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190305', '19', '03', '05', 'Residuos estabilizados distintos de los especificados en el código 19 03 04', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190307', '19', '03', '07', 'Residuos solidificados distintos de los especificados en el código 19 03 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190401', '19', '04', '01', 'Residuos vitrificados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190404', '19', '04', '04', 'Residuos líquidos acuosos del templado de residuos vitrificados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190501', '19', '05', '01', 'Fracción no compostada de residuos municipales y asimilados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190502', '19', '05', '02', 'Fracción no compostada de residuos de procedencia animal o vegetal', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190503', '19', '05', '03', 'Compost fuera de especificación', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190599', '19', '05', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190603', '19', '06', '03', 'Licores del tratamiento anaeróbico de residuos municipales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190604', '19', '06', '04', 'Lodos de digestión del tratamiento anaeróbico de residuos municipales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190605', '19', '06', '05', 'Licores del tratamiento anaeróbico de residuos animales y vegetales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190606', '19', '06', '06', 'Lodos de digestión del tratamiento anaeróbico de residuos animales y vegetales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190699', '19', '06', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190703', '19', '07', '03', 'Lixiviados de vertedero distintos de los especificados en el código 19 07 02', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190801', '19', '08', '01', 'Residuos de cribado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190802', '19', '08', '02', 'Residuos de desarenado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190805', '19', '08', '05', 'Lodos del tratamiento de aguas residuales urbanas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190809', '19', '08', '09', 'Mezclas de grasas y aceites procedentes de la separación de agua/sustancias aceitosas que contienen sólo aceites y grasa', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190812', '19', '08', '12', 'Lodos procedentes del tratamiento biológico de aguas residuales industriales distintos de los especificados en el código 19 08 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190814', '19', '08', '14', 'Lodos procedentes de otros tratamientos de aguas residuales industriales, distintos de los especificados en el código 19 08 13', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190899', '19', '08', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190901', '19', '09', '01', 'Residuos sólidos de la filtración primaria y cribado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190902', '19', '09', '02', 'Lodos de la clarificación del agua', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190903', '19', '09', '03', 'Lodos de descarbonatación', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190904', '19', '09', '04', 'Carbón activo usado', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190905', '19', '09', '05', 'Resinas intercambiadoras de iones saturadas o usadas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190906', '19', '09', '06', 'Soluciones y lodos de la regeneración de intercambiadores de iones', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('190999', '19', '09', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191001', '19', '10', '01', 'Residuos de hierro y acero', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191002', '19', '10', '02', 'Residuos no férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191004', '19', '10', '04', 'Fracciones ligeras de fragmentación (fluff-light) y polvo distintas de las especificadas en el código 19 10 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191006', '19', '10', '06', 'Otras fracciones distintas de las especificadas en el código 19 10 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191106', '19', '11', '06', 'Lodos del tratamiento in situ de efluentes, distintos de los especificados en el código', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191199', '19', '11', '99', 'Residuos no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191201', '19', '12', '01', 'Papel y cartón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191202', '19', '12', '02', 'Metales férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191203', '19', '12', '03', 'Metales no férreos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191204', '19', '12', '04', 'Plástico y caucho', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191205', '19', '12', '05', 'Vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191207', '19', '12', '07', 'Madera distinta de la especificada en el código 19 12 06', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191208', '19', '12', '08', 'Textiles', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191209', '19', '12', '09', 'Minerales (por ejemplo, arena, piedras)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191210', '19', '12', '10', 'Residuos combustibles (combustible derivado de residuos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191212', '19', '12', '12', 'Otros residuos (incluidas mezclas de materiales) procedentes del tratamiento mecánico de residuos, distintos de los especificados en el código 19 12 11', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191302', '19', '13', '02', 'Residuos sólidos de la recuperación de suelos distintos de los especificados en el código 19 13 01', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191304', '19', '13', '04', 'Lodos de la recuperación de suelos distintos de los especificados en el código 19 13 03', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191306', '19', '13', '06', 'Lodos de la recuperación de aguas subterráneas distintos de los especificados en el código 19 13 05', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('191308', '19', '13', '08', 'Residuos de líquidos acuosos y concentrados acuosos procedentes de la recuperación de aguas subterráneas, distintos de los especificados en el código 19 13 07', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200101', '20', '01', '01', 'Papel y cartón', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200102', '20', '01', '02', 'Vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200108', '20', '01', '08', 'Residuos biodegradables de cocinas y restaurantes', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200110', '20', '01', '10', 'Ropa', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200111', '20', '01', '11', 'Tejidos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200125', '20', '01', '25', 'Aceites y grasas comestibles', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200128', '20', '01', '28', 'Pinturas, tintas, adhesivos y resinas distintos de los especificados en el código 20 01 27', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200130', '20', '01', '30', 'Detergentes distintos de los especificados en el código 20 01 29', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200132', '20', '01', '32', 'Medicamentos distintos de los especificados en el código 20 01 31', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200134', '20', '01', '34', 'Baterías y acumuladores distintos de los especificados en el código 20 01 33', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200136', '20', '01', '36', 'Equipos eléctricos y electrónicos desechados distintos de los especificados en los códigos 20 01 21, 20 01 23 y 20 01 35', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200138', '20', '01', '38', 'Madera distinta de la especificada en el código 20 01 37', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200139', '20', '01', '39', 'Plásticos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200140', '20', '01', '40', 'Metales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200141', '20', '01', '41', 'Residuos del deshollinado de chimeneas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200199', '20', '01', '99', 'Otras fracciones no especificadas en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200201', '20', '02', '01', 'Residuos biodegradables', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200202', '20', '02', '02', 'Tierra y piedras', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200203', '20', '02', '03', 'Otros residuos no biodegradables', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200301', '20', '03', '01', 'Mezclas de residuos municipales', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200302', '20', '03', '02', 'Residuos de mercados', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200303', '20', '03', '03', 'Residuos de limpieza viaria', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200304', '20', '03', '04', 'Lodos de fosas sépticas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200306', '20', '03', '06', 'Residuos de la limpieza de alcantarillas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200307', '20', '03', '07', 'Residuos voluminosos (incluidos muebles)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('200399', '20', '03', '99', 'Residuos municipales no especificados en otra categoría', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210101', '21', '01', '01', 'Residuos orgánicos (ejemplo como vísceras, escamas, carne, espinas, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210102', '21', '01', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos, sangre entre otros; e inorgánicos).', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210103', '21', '01', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210201', '21', '02', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros; incluye mortalidad)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210202', '21', '02', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210203', '21', '02', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210301', '21', '03', '01', 'Residuos orgánicos (incluye vegetal, conchas, restos de especies marinas)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210302', '21', '03', '02', 'Residuos de hidrocoloides (carragenina, alginatos, agar)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210303', '21', '03', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210401', '21', '04', '01', 'Residuos orgánicos (ej: fouling (incrustaciones biológicas), mortalidad, vísceras, eliminación productiva)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210402', '21', '04', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210403', '21', '04', '03', 'Residuos de redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210404', '21', '04', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto planzas, boyas, flotadores, redes y cabos.', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210405', '21', '04', '05', 'Residuos de planzas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210406', '21', '04', '06', 'Residuos metálicos (incluye jaulas, pasillos y estructuras del centro de cultivo)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210407', '21', '04', '07', 'Residuos orgánicos retenidos (heces, alimento no consumido, y/o lodos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210408', '21', '04', '08', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210501', '21', '05', '01', 'Residuos orgánicos (ejemplo como conchas, algas, fouling)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210502', '21', '05', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210503', '21', '05', '03', 'Residuos de redes y cabos (por ejemplo: cuelgas, colectores, línea madre, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210504', '21', '05', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto boyas, flotadores, redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210505', '21', '05', '05', 'Residuos metálicos (incluye linternas, jaulas, pasillos y estructuras del centro de cultivo)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210506', '21', '05', '06', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210601', '21', '06', '01', 'Residuos orgánicos (ejemplo como conchas, algas, fouling)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210602', '21', '06', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210603', '21', '06', '03', 'Residuos de redes y cabos (incluye líneas de cultivo)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210604', '21', '06', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto boyas, flotadores, redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210605', '21', '06', '05', 'Residuos metálicos (incluye quechas, estructuras entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210701', '21', '07', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros; incluye mortalidad)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210702', '21', '07', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210703', '21', '07', '03', 'Residuos de redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210704', '21', '07', '04', 'Residuos de plásticos (HDPE, PEE, PETE, PVC) excepto planzas, boyas, flotadores, redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210705', '21', '07', '05', 'Residuos planzas', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210706', '21', '07', '06', 'Residuos metálicos (incluye quechas, estructuras, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210707', '21', '07', '07', 'Residuos de fibra de vidrio', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210708', '21', '07', '08', 'Lodos de lavado, desinfección y limpieza', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210709', '21', '07', '09', 'Lodos orgánicos (ejemplo fecas y alimento no consumido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210710', '21', '07', '10', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como pellets)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210801', '21', '08', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210802', '21', '08', '02', 'Residuos de boyas y flotadores (incluye poliestireno expandido)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210803', '21', '08', '03', 'Residuos de redes y cabos', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210804', '21', '08', '04', 'Residuos metálicos (incluye anzuelos, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210901', '21', '09', '01', 'Residuos orgánicos (ejemplo como vísceras, escamas, carne, espinas, entre otros.)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210902', '21', '09', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('210903', '21', '09', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211001', '21', '10', '01', 'Residuos orgánicos (incluye vegetal, conchas, restos de especies marinas)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211002', '21', '10', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211003', '21', '10', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211101', '21', '11', '01', 'Residuos orgánicos (ejemplo como conchas, algas, carne, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211102', '21', '11', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánicos)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211103', '21', '11', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211201', '21', '12', '01', 'Residuos orgánicos (ejemplo como conchas, cáscara calcárea, algas, carne, entre otros)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211202', '21', '12', '02', 'Lodos de lavado y limpieza (incluye residuos líquidos orgánicos e inorgánico)', False, 'LER-EU');
INSERT INTO public.ler_codes (code, chapter, subchapter, specific_code, description, is_hazardous, standard)
VALUES ('211203', '21', '12', '03', 'Materiales inadecuados para el consumo o la elaboración (ejemplo como merma)', False, 'LER-EU');

-- ==============================================================================
-- SEED DATA: WASTE TREATMENTS (Operaciones de Eliminación y Valorización)
-- Adapted to existing Supabase schema
-- ==============================================================================
TRUNCATE TABLE public.waste_treatments CASCADE;
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('11', 'Relleno sanitario', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('12', 'Vertedero', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('14', 'Monorelleno', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('30', 'Basural', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('32', 'Recepción de Lodos en PTAS', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('33', 'Depósito de Seguridad', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('60', 'Sitio de Escombros de la Construcción', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('65', 'Área de disposición controlada', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('58', 'Depósito de Cenizas', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('49', 'Residuos Voluminosos', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('56', 'Residuos Municipales', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('4', 'Incineración sin recuperación de energía', 'eliminacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('36', 'Pretratamiento de papel, cartón y productos de papel', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('37', 'Pretratamiento vidrio', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('38', 'Pretratamiento de ropa', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('39', 'Pretratamiento de textil, cuero y piel', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('40', 'Pretratamiento de aceites y grasas comestibles', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('41', 'Pretratamiento de pinturas, tintas, adhesivos y resinas que no contienen sustancias peligrosas', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('42', 'Pretratamiento de detergentes que no contienen sustancias peligrosas', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('43', 'Pretratamiento de madera que no contiene sustancias peligrosas', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('44', 'Pretratamiento de Metales', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('45', 'Pretratamiento de plásticos', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('47', 'Pretratamiento de Neumáticos Fuera de Uso', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('50', 'Pretratamiento de Residuos Voluminosos', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('57', 'Aparatos eléctricos y electrónicos', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('61', 'Pretratamiento de caucho y goma', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('64', 'Materiales eléctricos', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('73', 'Residuos Agroalimentarios', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('74', 'Tintas secas y Fertilizantes', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('75', 'Pretratamiento de Equipos de Refrigeración', 'pretratamiento');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('16', 'Reciclaje de papel, cartón y productos de papel', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('17', 'Reciclaje de textiles', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('18', 'Reciclaje de plásticos', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('19', 'Reciclaje de vidrio', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('20', 'Reciclaje de metales', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('22', 'Residuos voluminosos', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('46', 'Reciclaje de Neumáticos Fuera de Uso', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('66', 'Reciclaje de residuos de pastas y/o productos alimenticios para consumo animal', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('76', 'Reciclaje de Aparatos eléctricos y electrónicos', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('24', 'Co-incineración', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('25', 'Incineración con recuperación de energía', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('9', 'Recuperación de energía', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('63', 'Aplicación a suelo', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('62', 'Recepción de Lodos de PTAS', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('7', 'Preparación para reutilización', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('23', 'Co-procesamiento', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('27', 'Compostaje', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('28', 'Lombricultura', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('29', 'Degradación Anaeróbica', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('31', 'Aplicación al Suelo', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('34', 'Reducción de Recursos Hidrobiológicos', 'valorizacion');
INSERT INTO public.waste_treatments (code, name, category)
VALUES ('68', 'Reducción de residuos orgánicos en base a larvas de insectos', 'valorizacion');

-- ==============================================================================
-- SEED DATA: SUBSCRIPTION PLANS
-- Adapted to existing Supabase schema
-- ==============================================================================
TRUNCATE TABLE public.subscription_plans CASCADE;
INSERT INTO public.subscription_plans (code, name, sector, price, currency, max_custom_indicators, features)
VALUES ('free', 'Plan Semilla', 'public', 0, 'CLP', 5, '{"users": 1, "establishments": 1, "storage_gb": 1, "support": "community", "monthly_declarations": 10}'::jsonb);
INSERT INTO public.subscription_plans (code, name, sector, price, currency, max_custom_indicators, features)
VALUES ('pro', 'Plan Brote', 'private', 50000, 'CLP', 20, '{"users": 5, "establishments": 5, "storage_gb": 10, "support": "email", "monthly_declarations": 100}'::jsonb);
INSERT INTO public.subscription_plans (code, name, sector, price, currency, max_custom_indicators, features)
VALUES ('enterprise', 'Plan Bosque', 'public', 150000, 'CLP', NULL, '{"users": "unlimited", "establishments": "unlimited", "storage_gb": 100, "support": "priority", "monthly_declarations": "unlimited"}'::jsonb);