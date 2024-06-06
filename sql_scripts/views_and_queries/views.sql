USE bienestar_UN;

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


-- 
DROP VIEW IF EXISTS vw_reservaciones_espacios_proxima_semana;
CREATE VIEW vw_reservaciones_espacios_proxima_semana AS
SELECT esp_nombre, edi_nombre, res_fecha_inicial, res_fecha_fin
FROM RESERVACION
INNER JOIN ESPACIO ON res_esp_id = esp_id
INNER JOIN EDIFICIO ON esp_edi_id = edi_id
WHERE res_fecha_inicial BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY);

-- -----------------------------------------------------
-- Salud
-- -----------------------------------------------------
-- Presenta informacion relevante sobre el perfil de salud de algun estudiante
DROP VIEW IF EXISTS vw_info_salud_estudiante;
CREATE VIEW vw_info_salud_estudiante AS
SELECT est_per_DNI, perfsalud_peso, perfsalud_RH, perfsalud_estatura, perfsalud_discapacidades 
FROM ESTUDIANTE 
INNER JOIN PERFIL_DE_SALUD ON est_perfsalud_id = perfsalud_id
INNER JOIN (SELECT PERFIL_DE_SALUD.perfsalud_id, IFNULL(GROUP_CONCAT(dis_nombre SEPARATOR ' - '), ' ') AS 'perfsalud_discapacidades' 
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