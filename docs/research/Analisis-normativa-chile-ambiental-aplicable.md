# Marco regulatorio ambiental y de sostenibilidad para plataformas SaaS en Chile

Chile posee uno de los ecosistemas regulatorios ambientales más desarrollados de América Latina, con **más de 80 normativas, estándares y certificaciones** aplicables a la gestión de sostenibilidad corporativa y municipal. La convergencia de la Ley Marco de Cambio Climático (21.455), la NCG 461 de la CMF y la Ley REP (20.920) está creando un entorno donde el reporte ambiental digital se vuelve estratégico para el cumplimiento regulatorio. Para una plataforma SaaS como Simbioma, esto representa oportunidades significativas en **automatización de reportes obligatorios, trazabilidad de residuos y consolidación de datos ESG** para sectores de alto ticket como minería, energía y construcción.

## Arquitectura del marco regulatorio chileno

El sistema regulatorio ambiental chileno opera en tres niveles: normativas de cumplimiento obligatorio fiscalizadas principalmente por la **Superintendencia del Medio Ambiente (SMA)** con multas de hasta **10.000 UTA (~$6.500 millones CLP)**; estándares técnicos del Instituto Nacional de Normalización (INN) que operacionalizan los requisitos legales; y certificaciones voluntarias que responden a demandas de mercado y financiamiento verde. La digitalización del cumplimiento está concentrada en el **RETC (Registro de Emisiones y Transferencias de Contaminantes)** y su Ventanilla Única, que integra SINADER, SIDREP, HuellaChile y el nuevo SISREP para Ley REP.

---

## NORMATIVAS OBLIGATORIAS DE ALTA FRECUENCIA DE REPORTE

### Marco institucional y ley base ambiental

| Normativa | Tipo | Descripción | Obligados | Frecuencia | Fiscalizador |
|-----------|------|-------------|-----------|------------|--------------|
| **Ley 19.300** (Bases del Medio Ambiente) | Ley | Marco general del SEIA, normas de calidad y emisión | Proyectos Art. 10 | Por proyecto + continuo | SEA/SMA |
| **DS 40/2012** (Reglamento SEIA) | Decreto Supremo | Procedimientos EIA/DIA, RCA | Proyectos que ingresan a SEIA | 180 días (EIA), 60 días (DIA) | SEA |
| **Ley 21.455** (Cambio Climático) | Ley | Carbono neutralidad 2050, presupuestos de carbono | Ministerios, regiones, municipios, sector privado | Planes sectoriales cada 5 años | MMA/SMA |

### Ley REP y economía circular

| Producto Prioritario | Decreto | Umbral Obligación | Metas 2030 | Frecuencia Reporte | Estado |
|---------------------|---------|-------------------|------------|-------------------|--------|
| **Neumáticos** | DS 8/2019 | Todo productor/importador | 90% recolección | Anual (30 junio) | Vigente |
| **Envases y Embalajes** | DS 12/2020 | >300 kg/año introducidos | 60% reciclaje domiciliario | Anual + mensual SISREP | Vigente (sept 2023) |
| **Aceites Lubricantes** | DS 47/2023 | Productores/importadores | Por definir | Anual | Enero 2027 |
| **RAEE y Pilas** | En desarrollo | Por definir | Por definir | Por definir | Decreto 1S 2025 |
| **Baterías** | Anteproyecto | Por definir | Por definir | Por definir | Consulta 2025 |
| **Textiles** | Por declarar | Por definir | Por definir | Por definir | Declaración 2025 |

### Normas de emisión atmosférica por sector

| Norma | Sector | Contaminantes | Monitoreo | Plataforma Reporte |
|-------|--------|---------------|-----------|-------------------|
| **DS 13/2011** | Centrales termoeléctricas >50 MWt | MP, SO₂, NOx, Hg | CEMS continuo | SISAT |
| **DS 28/2013** | Fundiciones de cobre | SO₂, As, Hg, MP | Continuo | SISAT |
| **DS 29/2013** | Incineración/coincineración | Múltiples | Anual Art. 13 | RETC |
| **DS 38/2020** | Grupos electrógenos | Emisiones diésel | Según RPM | SISAT |
| **DS 37/2012** | Celulosa kraft | Compuestos TRS | Continuo | SISAT |
| **PPDA zonales** | Zonas saturadas (RM, Temuco, etc.) | MP2.5, MP10 | Continuo/periódico | SISAT + Catastros |

### Efluentes líquidos y recursos hídricos

| Normativa | Cuerpo Receptor | Aplicabilidad | Frecuencia | Fiscalizador |
|-----------|-----------------|---------------|------------|--------------|
| **DS 90/2000** | Aguas superficiales y marinas | Toda fuente emisora | Según RPM aprobado | SMA |
| **DS 609/1998** | Alcantarillado | Industrias conectadas | Según RPM | SISS |
| **DS 46/2002** | Aguas subterráneas | Descargas por infiltración | Según RPM | SMA |
| **DFL 1122** (Código Aguas reformado) | Todos | Titulares derechos de agua | Continuo + patentes | DGA |

### Residuos peligrosos

| Normativa | Umbral | Obligaciones | Sistema Reporte | Fiscalizador |
|-----------|--------|--------------|-----------------|--------------|
| **DS 148/2003** | >6 kg tóxicos agudos o >6 ton otros RESPEL/año | Plan de Manejo, trazabilidad | **SIDREP** | SEREMI Salud/SMA |

---

## REPORTERÍA ESG Y DIVULGACIÓN FINANCIERA

### Normativa CMF obligatoria

| Norma | Obligados | Contenido Principal | Vigencia | Frecuencia |
|-------|-----------|---------------------|----------|------------|
| **NCG 461** | SA abiertas >1M UF activos, bancos, seguros, AGF | Memoria Integrada (9 secciones), métricas **SASB** obligatorias | Desde dic 2022-2024 según tipo | Anual |
| **NCG 519** | Mismos obligados NCG 461 | Adopción **NIIF S1/S2 (ISSB)**, políticas DEI, cuotas género directorios | Ejercicio 2026 (reportes 2027) | Anual |

La NCG 461 establece 9 secciones de reporte: perfil, gobierno corporativo, gestión de riesgos, estrategia, personas, modelo de negocios, proveedores, **indicadores SASB por industria** y hechos relevantes. El enfoque es "reportar o explicar".

### Estándares internacionales de reporte

| Estándar | Categoría Chile | Enfoque | Uso en Chile |
|----------|-----------------|---------|--------------|
| **ISSB (NIIF S1/S2)** | Obligatorio (desde 2026) | Materialidad financiera, 4 pilares TCFD | Adopción vía NCG 519 |
| **SASB** | Obligatorio (NCG 461) | Métricas por industria SICS | Sección 8.2 NCG 461 |
| **GRI Standards 2021** | Voluntario extendido | Doble materialidad, impactos | Codelco desde 2001, amplia adopción |
| **CDP** | Voluntario | Clima, agua, bosques | Participación empresas chilenas |
| **TCFD** | Integrado en normativa | 4 pilares divulgación climática | Base de NCG 461/519 y NIIF S2 |

### Índices y certificaciones ESG

| Índice/Certificación | Administrador | Requisitos | Empresas Chilenas |
|---------------------|---------------|------------|-------------------|
| **DJSI Chile** | S&P/Bolsa Santiago | CSA anual (~600 puntos) | Enel Chile, Copec, otros |
| **S&P IPSA ESG Tilted** | S&P | Criterios ESG + IPSA | ~26 empresas |
| **B Corp** | Sistema B Chile | 80+ puntos evaluación impacto | **269 empresas** (1/3 de Latam) |
| **Bonos Verdes** | Bolsa Santiago | GBP/SBP + verificador tercero | Segmento desde 2018 |

---

## CERTIFICACIONES ISO Y NORMAS TÉCNICAS NCh

### ISO ambientales principales

| ISO | NCh Homóloga | Tipo | Descripción | Costo Aprox. | Adopción Chile |
|-----|--------------|------|-------------|--------------|----------------|
| **ISO 14001:2015** | NCh-ISO 14001:2015 | Certificable | Sistema Gestión Ambiental | USD 3.500-4.500+ (pyme) | Alta |
| **ISO 14064-1:2019** | NCh-ISO 14064-1:2019 | Verificable | Inventario GEI organizacional | Variable | Alta (HuellaChile) |
| **ISO 50001:2018** | NCh-ISO 50001 | Certificable | Sistema Gestión Energía | Cofinanciamiento AgenciaSE 70% | **48+ empresas, 105 instalaciones** |
| **ISO 14046:2014** | - | Verificable | Huella hídrica | 2-6 meses estudio | Creciente |
| **ISO 14067:2018** | NCh-ISO 14067 | Verificable | Huella carbono productos | 6-12 semanas | Creciente (HuellaChile) |
| **ISO 14040/14044** | NCh-ISO 14040/14044 | Metodológica | Análisis Ciclo de Vida | 6 semanas-6 meses | Exportadores, construcción |

### NCh específicas para economía circular

| NCh | Descripción | Aplicación |
|-----|-------------|------------|
| **NCh 3322:2013** | Colores contenedores residuos | Separación en origen |
| **NCh 3562:2019** | Gestión RCD (construcción/demolición) | Sector construcción |
| **NCh 3376:2015** | Puntos verdes/limpios | Infraestructura reciclaje |
| **NCh 3401-3407** | Plásticos reciclados (PE, PP, PET, etc.) | Valorización plásticos |
| **NCh-ISO 18601-18606** | Envases y medio ambiente | Cumplimiento Ley REP |

---

## REGULACIONES POR SECTOR PRIORITARIO

### Minería (mayor potencial de ticket)

| Normativa/Estándar | Tipo | Aplicabilidad | Frecuencia | Relación ESG |
|--------------------|------|---------------|------------|--------------|
| **DS 132** (Reglamento Seguridad Minera) | Obligatorio | Toda faena extractiva | Continuo | S/G |
| **Ley 20.551** (Cierre Faenas) | Obligatorio | >5.000 tpm | Actualización cada 5 años | E/S |
| **DS 28/2013** (Fundiciones) | Obligatorio | Fundiciones cobre | Continuo + anual | E |
| **DS 248/2007** (Relaves) | Obligatorio | Faenas con relaves | Continuo | E/S |
| **ICMM 10 Principios** | Voluntario (miembros) | Codelco, Anglo, BHP, etc. | Anual + validación 3 años | E/S/G |
| **TSM** | Voluntario | Consejo Minero | Anual verificado | E/S/G |
| **Copper Mark** | Voluntario | Minas/fundiciones Cu | Cada 3 años | E/S/G (33 criterios) |
| **GISTM** (Relaves) | Voluntario/exigido por mercados | Grandes mineras | Implementación progresiva | E/S |

**Dato clave**: Más del **30% del cobre mundial** proviene de faenas con certificación Copper Mark, con fuerte presencia chilena (Codelco 100%, Anglo American, Antofagasta Minerals, BHP).

### Energía

| Normativa/Estándar | Tipo | Descripción | Estado |
|--------------------|------|-------------|--------|
| **Ley 20.257/20.698** (ERNC 20/25) | Obligatorio | Meta 20% ERNC al 2025 | Superada (~3x) |
| **Ley 21.305** (Eficiencia Energética) | Obligatorio | SGE para CCGE (>50 Tcal/año), CEV obligatorio | Vigente 2021 |
| **Ley 20.571/21.118** (Gen. Distribuida) | Marco voluntario | Net Billing hasta 300 kW | Vigente |
| **Estrategia H2V** | Marco orientador | H2V más barato del mundo 2030 | Plan Acción 2023-2030 |
| **ISO 50001** | Voluntario incentivado | SGE certificable | 48+ empresas Chile |

### Construcción

| Normativa/Estándar | Tipo | Aplicabilidad | Estado |
|--------------------|------|---------------|--------|
| **Art. 4.1.10 OGUC** | Obligatorio | Aislación térmica viviendas nuevas | Vigente (7 zonas) |
| **CEV** | Obligatorio (publicidad) | Viviendas nuevas, escala A+-G | **Obligatorio desde Ley 21.305** |
| **CES** | Voluntario | Edificios uso público | 30-100 pts, vigencia 5 años |
| **CVS** | Voluntario | Viviendas, coordinado MINVU | 41 proyectos registrados |
| **LEED** | Voluntario internacional | Edificaciones comerciales | **409 edificios, 2.2M m² certificados** |
| **EDGE** | Voluntario internacional | Mercados emergentes, 20% ahorro | Creciente |
| **NCh 3562:2019** | Voluntario (por ahora) | Gestión RCD (~34% residuos país) | Reglamento Minsal en desarrollo |

### Retail y comercio

| Normativa | Tipo | Descripción | Fiscalizador |
|-----------|------|-------------|--------------|
| **Ley 21.368** (PUSU) | Obligatorio | Plásticos un solo uso, botellas | Municipalidades |
| **Ley 21.100** | Obligatorio | Prohibición bolsas plásticas | Municipalidades |
| **DS 12/2020** (Ley REP Envases) | Obligatorio | Metas recolección/valorización | SMA |

### Agricultura y agroindustria

| Normativa/Certificación | Tipo | Descripción |
|------------------------|------|-------------|
| **Res. 243/2025 SAG** | Obligatorio (ene 2026) | Tenencia y aplicación plaguicidas, credencial SAG |
| **GlobalG.A.P.** | Voluntario | BPA para exportación |
| **Certificación Orgánica** | Voluntario | SAG/USDA/EU |
| **Rainforest Alliance** | Voluntario | Agricultura sostenible |

### Pesca y acuicultura

| Normativa/Certificación | Tipo | Descripción |
|------------------------|------|-------------|
| **DS 320/2001** | Obligatorio | Reglamento ambiental acuicultura, INFA |
| **MSC** | Voluntario | Pesca sostenible (langostino, camarón nailon Chile) |
| **ASC** | Voluntario | Acuicultura responsable |
| **BAP** | Voluntario | Mejores prácticas acuicultura |

### Transporte y logística

| Normativa | Tipo | Descripción | Vigencia |
|-----------|------|-------------|----------|
| **DS 40/2019** (Euro 6 livianos) | Obligatorio | Reducción 56% NOx/MP | Vigente |
| **DS 50/2023** (Euro 6 pesados) | Obligatorio | Camiones y buses | **Enero 2026** |
| **Estrategia Electromovilidad** | Marco orientador | 100% ventas cero emisiones 2035 | Activa |

### Servicios financieros

| Normativa/Iniciativa | Tipo | Estado |
|---------------------|------|--------|
| **NCG 461/519 CMF** | Obligatorio | Divulgación ESG para regulados |
| **Taxonomía Verde** | En desarrollo | Primera sesión Comité 2025 |
| **Bonos Verdes Soberanos** | Voluntario | Chile primer emisor en América |

---

## PLATAFORMAS DIGITALES DE REPORTE OBLIGATORIO

| Plataforma | Base Legal | Obligados | Frecuencia | URL |
|------------|-----------|-----------|------------|-----|
| **RETC/Ventanilla Única** | DS 1/2013 | Toda fuente regulada | Octubre (DJA) | portalvu.mma.gob.cl |
| **SINADER** | DS 1/2013 Art. 25-27 | >12 ton residuos/año | Mensual + anual (30 marzo) | portalvu.mma.gob.cl/sinader |
| **SIDREP** | DS 148/2003 | Generadores RESPEL | Por transferencia | MINSAL |
| **SISREP** | Ley 20.920 | Sistemas Gestión REP | Desde enero 2025 | MMA |
| **HuellaChile** | Voluntario (Art. 30 Ley 21.455) | Cualquier organización | Anual | huellachile.mma.gob.cl |
| **SISAT** | Normas de emisión | Fuentes reguladas | Continuo/periódico | SMA |

---

## CALENDARIO REGULATORIO 2025-2027

### 2025
- **Enero**: SISREP operativo para Ley REP
- **Abril**: Nuevo plazo SINADER (Res. 01779/2025)
- **1S**: Decreto RAEE/Pilas ante Consejo de Ministros
- **2025**: Consulta pública baterías, declaración textiles
- **Noviembre**: NDC 2025 aprobada (95 MtCO₂e 2030, 90 MtCO₂e 2035)

### 2026
- **Enero**: Vigencia norma **Euro 6 vehículos pesados**
- **Enero**: Vigencia **Res. 243 SAG** (plaguicidas)
- **Enero**: Vigencia metas **Aceites Lubricantes** Ley REP
- **2026**: PARCC en 16 regiones, PACCC todas las comunas
- **Ejercicio 2026**: Adopción **NIIF S1/S2 (ISSB)** vía NCG 519

### 2027
- **Reportes 2027**: Primeros informes bajo estándares ISSB
- **Avance**: Implementación Taxonomía Verde
- **Consolidación**: Nuevos productos prioritarios Ley REP

---

## Acuerdos de Producción Limpia y programas voluntarios de alto impacto

Los **APL (Acuerdos de Producción Limpia)** administrados por la ASCC representan convenios público-privados con vigencia de 3 años y auditorías anuales. Sectores con APL vigentes incluyen construcción (gestión RCD), educación superior (90 instalaciones), refrigeración, agropecuario (32 acuerdos históricos) y retail. El programa fue la **primera NAMA del mundo reconocida por ONU** (2012).

El programa **HuellaChile** ha entregado más de **2.600 sellos** desde 2013, con 688 sellos solo en 2024. La Ley Marco de Cambio Climático (Art. 30) lo transforma en "Sistema de Certificación Voluntaria de GEI y Uso del Agua". La meta NDC 2025 establece que las emisiones reportadas en HuellaChile representen el **20% del inventario nacional** al 2030.

---

## Sanciones y régimen de cumplimiento SMA

| Gravedad | Multa Máxima | Ejemplos |
|----------|--------------|----------|
| Leve | 1.000 UTA (~$650M CLP) | Incumplimientos menores |
| Grave | 5.000 UTA (~$3.250M CLP) | Incumplimientos reiterados |
| Gravísima | 10.000 UTA (~$6.500M CLP) | Ejecución sin RCA, daño ambiental |

**Atenuantes**: Autodenuncia primera vez (exención total), segunda vez (75% rebaja), tercera vez (50% rebaja). Pago anticipado en 5 días: 25% descuento.

---

## Oportunidades estratégicas para plataforma SaaS

La convergencia regulatoria chilena crea oportunidades específicas para Simbioma en: **automatización de declaraciones RETC/SINADER/SISREP** que actualmente requieren ingreso manual; **trazabilidad de residuos** para cumplimiento Ley REP con integración a sistemas de gestión (ReSimple, otros GRANSIC); **consolidación de métricas SASB** por industria SICS para cumplimiento NCG 461; **cálculo automático de huella de carbono** alineado con ISO 14064 y HuellaChile; y **preparación para ISSB/NIIF S1-S2** que será obligatorio desde ejercicio 2026.

Los sectores de mayor ticket potencial son **minería** (múltiples normativas obligatorias + certificaciones internacionales como Copper Mark), **energía** (cumplimiento Ley 21.305 para CCGE + estrategia H2V), **construcción** (convergencia CEV obligatorio + CES/LEED voluntario + gestión RCD), y **retail gran formato** (Ley REP envases + PUSU). El mercado municipal presenta oportunidad con la obligación de **PACCC en todas las comunas** al 2026 bajo Ley Marco de Cambio Climático.

---

## Fuentes oficiales principales

| Entidad | Portal | Ámbito |
|---------|--------|--------|
| Ministerio del Medio Ambiente | mma.gob.cl | Política ambiental general |
| SMA | portal.sma.gob.cl | Fiscalización y sanciones |
| SEA | sea.gob.cl | Evaluación de impacto ambiental |
| RETC | retc.mma.gob.cl | Reportes ambientales |
| HuellaChile | huellachile.mma.gob.cl | Huella de carbono |
| Economía Circular | economiacircular.mma.gob.cl | Ley REP |
| CMF | cmfchile.cl | Divulgación ESG financiera |
| INN | inn.cl | Normas técnicas NCh |
| AgenciaSE | agenciase.org | Eficiencia energética |
| SERNAGEOMIN | sernageomin.cl | Minería |
| Cambio Climático | cambioclimatico.mma.gob.cl | NDC y Ley Marco |
| Bolsa de Santiago | bolsadesantiago.com | Índices sostenibilidad |
| BCN LeyChile | bcn.cl/leychile | Legislación vigente |