USE bienestar_UN;

-- -----------------------------------------------------
-- Acompañamiento integral
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_info_cita_asesoria;
CREATE VIEW vw_info_cita_asesoria
	AS
(SELECT cit_ase_eve_id, cit_ase_est_per_DNI, cit_ase_tipo, eve_descripcion AS 'descripcion', DATE(res_fecha_inicial) AS 'fecha', 
	DATE_FORMAT(res_fecha_inicial,  '%H:%i') AS 'hora_inicio',
    DATE_FORMAT(res_fecha_fin, '%H:%i') AS 'hora_fin'
    
	FROM CITA_DE_ASESORIA 
    INNER JOIN EVENTO_GENERAL ON cit_ase_eve_id = eve_id 
    INNER JOIN RESERVACION ON eve_res_id = res_id);

-- -----------------------------------------------------
-- Sistema de Información
-- -----------------------------------------------------

-- 
DROP VIEW IF EXISTS vw_info_academica_estudiante;
CREATE VIEW vw_info_academica_estudiante AS
SELECT hist_codigo, hist_es_activa, pro_codigo, pro_nombre,
	hist_est_per_DNI AS 'est_per_DNI',
       creditos_cursados, creditos_aprobados,
       (ROUND(ponderado/creditos_cursados, 1)) AS 'PAPA', (ROUND(creditos_aprobados*100/pro_numero_de_creditos, 2)) AS 'porcentaje_avance'
	
FROM HISTORIA_ACADEMICA 
INNER JOIN PROGRAMA_CURRICULAR ON hist_pro_codigo = pro_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_cursados'  
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            GROUP BY asic_hist_codigo) AS SUB1 ON hist_codigo = SUB1.asic_hist_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_aprobados'  
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            WHERE asic_nota_final >= 3.0
            GROUP BY asic_hist_codigo) AS SUB2 ON hist_codigo = SUB2.asic_hist_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asic_nota_final * asi_numero_de_creditos) AS 'ponderado' 
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            GROUP BY asic_hist_codigo) AS SUB3 ON hist_codigo = SUB3.asic_hist_codigo;

DROP VIEW IF EXISTS vw_info_estudiante;
CREATE VIEW vw_info_estudiante 
	AS
(SELECT ESTUDIANTE.est_per_DNI, 
	   CONCAT(per_primer_nombre, ' ', IFNULL(per_segundo_nombre, ''), ' ', per_primer_apellido, ' ', per_segundo_apellido) AS est_nombre,
       est_pbm, est_es_peama, est_es_paes, hist_es_activa, hist_codigo, pro_nombre
 FROM
	ESTUDIANTE 
    INNER JOIN vw_info_academica_estudiante ON ESTUDIANTE.est_per_DNI = vw_info_academica_estudiante.est_per_DNI
    INNER JOIN PERSONA ON estudiante.est_per_DNI = per_DNI);

-- 
DROP VIEW IF EXISTS vw_reservaciones_espacios_proxima_semana;
CREATE VIEW vw_reservaciones_espacios_proxima_semana AS
SELECT esp_nombre, edi_nombre, res_fecha_inicial, res_fecha_fin
FROM RESERVACION
INNER JOIN ESPACIO ON res_esp_id = esp_id
INNER JOIN EDIFICIO ON esp_edi_id = edi_id
WHERE res_fecha_inicial BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- -----------------------------------------------------
-- Gestion y fomento socioeconomico
-- -----------------------------------------------------

DROP VIEW IF EXISTS vw_info_convocatorias_gestion;
CREATE VIEW vw_info_convocatorias_gestion
	AS
(SELECT con_esp_id, con_gen_codigo, con_gen_activa, con_gen_abierta, con_gen_periodo_academico, con_gen_tipo, con_esp_nombre, con_esp_descripcion, con_gen_horas_de_corresponsabilidad 
	FROM CONVOCATORIA_GENERAL
    INNER JOIN CONVOCATORIA_ESPECIFICA
    ON con_gen_codigo = con_esp_con_gen_codigo
    ORDER BY con_gen_periodo_academico DESC);

DROP VIEW IF EXISTS vw_info_participaciones_convocatorias_gestion;
CREATE VIEW vw_info_participaciones_convocatorias_gestion
	AS
(SELECT  ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION.con_esp_id, est_per_DNI, 
	CONCAT(per_primer_nombre, ' ', IFNULL(per_segundo_nombre, ''), ' ', per_primer_apellido, ' ', per_segundo_apellido) AS est_nombre, 
    con_gen_codigo, con_gen_activa, con_gen_periodo_academico, con_esp_nombre, con_esp_estado
	FROM ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION
    INNER JOIN vw_info_convocatorias_gestion ON ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION.con_esp_id = vw_info_convocatorias_gestion.con_esp_id
	INNER JOIN PERSONA ON est_per_DNI = per_DNI);


DROP VIEW IF EXISTS vw_info_beneficiarios_gestion;
CREATE VIEW vw_info_beneficiarios_gestion
	AS
(SELECT ben_id, ben_est_per_DNI, 
	CONCAT(per_primer_nombre, ' ', IFNULL(per_segundo_nombre, ''), ' ', per_primer_apellido, ' ', per_segundo_apellido) AS est_nombre, 
	CONVOCATORIA_ESPECIFICA.con_esp_id, con_esp_con_gen_codigo, con_gen_activa, con_esp_nombre, ben_periodo_academico  
	FROM BENEFICIARIO_PROGRAMA_DE_GESTION
	INNER JOIN CONVOCATORIA_ESPECIFICA ON BENEFICIARIO_PROGRAMA_DE_GESTION.con_esp_id = CONVOCATORIA_ESPECIFICA.con_esp_id
    INNER JOIN CONVOCATORIA_GENERAL ON con_esp_con_gen_codigo = con_gen_codigo
    INNER JOIN PERSONA ON ben_est_per_DNI = per_DNI
    ORDER BY ben_periodo_academico DESC);

-- -----------------------------------------------------
-- Salud
-- -----------------------------------------------------

-- Presenta informacion relevante sobre el perfil de salud de algun estudiante
DROP VIEW IF EXISTS vw_info_salud_estudiante;
CREATE VIEW vw_info_salud_estudiante AS
SELECT est_per_DNI, PERFIL_DE_SALUD.perfsalud_id, perfsalud_peso, perfsalud_RH, perfsalud_estatura, perfsalud_discapacidades, perfsalud_id_discapacidades 
FROM ESTUDIANTE 
INNER JOIN PERFIL_DE_SALUD ON est_perfsalud_id = perfsalud_id
INNER JOIN (SELECT PERFIL_DE_SALUD.perfsalud_id, GROUP_CONCAT(dis_nombre SEPARATOR ' - ') AS 'perfsalud_discapacidades',
		GROUP_CONCAT(DISCAPACIDAD.dis_id SEPARATOR ',') AS 'perfsalud_id_discapacidades'
	     FROM PERFIL_DE_SALUD
	     LEFT JOIN PERFIL_DE_SALUD_TIENE_DISCAPACIDAD ON PERFIL_DE_SALUD.perfsalud_id = PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.perfsalud_id
	     LEFT JOIN DISCAPACIDAD ON PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.dis_id = DISCAPACIDAD.dis_id
            GROUP BY PERFIL_DE_SALUD.perfsalud_id) AS tab1 ON PERFIL_DE_SALUD.perfsalud_id = tab1.perfsalud_id;
            
-- Permite ver informacion relevante sobre las citas individuales
DROP VIEW IF EXISTS vw_info_cita_individual_salud;
CREATE VIEW vw_info_cita_individual_salud
	AS
(SELECT cit_eve_id, cit_est_per_DNI, cit_tipo, eve_descripcion AS 'descripcion', DATE(res_fecha_inicial) AS 'fecha', 
	DATE_FORMAT(res_fecha_inicial,  '%H:%i') AS 'hora_inicio',
    DATE_FORMAT(res_fecha_fin, '%H:%i') AS 'hora_fin'
    
	FROM CITA_INDIVIDUAL 
    INNER JOIN EVENTO_GENERAL ON cit_eve_id = eve_id 
    INNER JOIN RESERVACION ON eve_res_id = res_id);
    

-- -----------------------------------------------------
-- Cultura
-- -----------------------------------------------------

-- Permite ver la información de los talleres culturales
DROP VIEW IF EXISTS vw_info_taller_cultural;
CREATE VIEW vw_info_taller_cultural AS
SELECT tall_eve_id, tall_nombre, per_primer_nombre, per_primer_apellido, res_fecha_inicial, res_fecha_fin, esp_nombre, edi_nombre
FROM TALLER_CULTURAL
INNER JOIN PERSONA ON doc_per_DNI_tallerista = per_dni
INNER JOIN RESERVACION ON tall_eve_id = res_id
INNER JOIN ESPACIO ON res_esp_id = esp_id
INNER JOIN EDIFICIO ON esp_edi_id = edi_id;

-- Permite ver la información de los grupos artísticos institucionales
DROP VIEW IF EXISTS vw_info_gai;
CREATE VIEW vw_info_gai AS
SELECT gru_id, gru_nombre, per_primer_nombre, per_primer_apellido
FROM GRUPO_ARTISTICO_INSTITUCIONAL
INNER JOIN PERSONA ON gru_doc_per_DNI_director = per_dni;

-- Permite ver la información de las convocatorias de los grupos artísticos institucionales
DROP VIEW IF EXISTS vw_info_convocatoria_gai;
CREATE VIEW vw_info_convocatoria_gai AS
SELECT con_gai_codigo, con_gai_descripcion, con_gai_periodo_academico, gru_nombre
FROM CONVOCATORIA_GAI
INNER JOIN GRUPO_ARTISTICO_INSTITUCIONAL ON gru_id = con_gai_gru_id;

-- Permite ver la información de los estudiantes que pertenecen a los grupos artísticos institucionales
DROP VIEW IF EXISTS vw_info_estudiantes_pertenecen_gai;
CREATE VIEW vw_info_estudiantes_pertenecen_gai AS
SELECT grupo_artistico_institucional.gru_id, gru_nombre, est_per_DNI, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido
FROM grupo_artistico_institucional_tiene_estudiante
INNER JOIN GRUPO_ARTISTICO_INSTITUCIONAL
INNER JOIN PERSONA ON est_per_dni = per_dni;

-- Permite ver la información de los estudiantes que asistieron a un taller cultural
DROP VIEW IF EXISTS vw_info_estudiantes_asistencia_taller_cultural;
CREATE VIEW vw_info_estudiantes_asistencia_taller_cultural AS
SELECT tall_eve_id, est_per_DNI, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido
FROM estudiante_asiste_a_taller_cultural
INNER JOIN PERSONA ON est_per_dni = per_dni;