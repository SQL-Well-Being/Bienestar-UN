USE bienestar_UN;

-- Area de informacion --

DROP PROCEDURE IF EXISTS obtener_info_academica_estudiante;
DELIMITER $$
CREATE PROCEDURE obtener_info_academica_estudiante(DNI INT)
	-- Obtiene toda la info academica de un estudiante en concreto
	BEGIN
		SELECT * FROM vw_info_academica_estudiante WHERE est_per_DNI = DNI;
    END $$
DELIMITER ;

-- Area de salud --

DROP PROCEDURE IF EXISTS obtener_info_salud_estudiante;
DELIMITER $$
CREATE PROCEDURE obtener_info_salud_estudiante(DNI INT)
	-- Obtiene toda la info de salud de un estudiante en concreto
    BEGIN
		SELECT * FROM vw_info_salud_estudiante WHERE est_per_DNI = DNI;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS cargar_incapacidad;
DELIMITER $$
CREATE PROCEDURE cargar_incapacidad(fecha_inicio DATE, fecha_fin DATE, DNI INT)
	-- Permite registrar una incapacidad medica en el sistema
	BEGIN
		INSERT INTO INCAPACIDAD (inc_fecha_inicio, inc_fecha_fin, inc_est_per_DNI) 
		VALUES (fecha_inicio, fecha_fin, DNI);
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS agendar_cita_individual;
DELIMITER $$
CREATE PROCEDURE agendar_cita_individual(est_DNI INT, fun_DNI INT, tipo_cita VARCHAR(120), fecha DATETIME)
	-- Se encarga de agendar una cita, con su respectiva reservacion de espaci y evento
	BEGIN
		DECLARE id_espacio INT;
		DECLARE id_reservacion INT;
        DECLARE id_evento INT;
        
        -- Seleccion espacio libre
        SELECT esp_id  INTO id_espacio FROM ESPACIO
			WHERE esp_id IN (10,11,12,13,14,15) 
			AND 
			esp_id NOT IN (SELECT res_esp_id FROM RESERVACION
				WHERE 
				(fecha <= res_fecha_inicial AND DATE_ADD(fecha, INTERVAL 30 MINUTE) > res_fecha_inicial)
				OR
				(fecha < res_fecha_fin AND DATE_ADD(fecha, INTERVAL 30 MINUTE) >= res_fecha_fin)
				OR
				(fecha <= res_fecha_inicial AND DATE_ADD(fecha, INTERVAL 30 MINUTE) >= res_fecha_fin)) LIMIT 1;

        IF id_espacio IS NULL THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'No hay espacios disponibles en la fecha y hora solicitadas.';
        END IF;
        
        -- Creacion reservacion
        INSERT INTO RESERVACION(res_fecha_inicial, res_fecha_fin, res_esp_id)
			VALUES (fecha, DATE_ADD(fecha, INTERVAL 30 MINUTE), id_espacio);
		
        SELECT LAST_INSERT_ID() INTO id_reservacion;
        
        -- Creacion evento
        INSERT INTO EVENTO_GENERAL(eve_descripcion, eve_res_id)
			VALUES ('Cita individual', id_reservacion);
            
		SELECT LAST_INSERT_ID() INTO id_evento;
        
        -- Creacion cita
        INSERT INTO CITA_INDIVIDUAL(cit_tipo, cit_est_per_DNI, cit_fun_per_DNI, cit_eve_id)
			VALUES (tipo_cita, est_DNI, fun_DNI, id_evento);

    END $$
DELIMITER ;

-- Area socioeconomica --

DROP PROCEDURE IF EXISTS registrar_participacion_convocatoria_gestion;
DELIMITER $$
CREATE PROCEDURE registrar_participacion_convocatoria_gestion(id_convocatoria_especifica INT, DNI INT)
	-- Agrega un estudiante a la lista de participantes de una convocatoria en especifico
	BEGIN
		INSERT INTO ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION (con_esp_id, est_per_DNI)
        VALUES (id_convocatoria_especifica, DNI);
	END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS actualizar_estado_participacion_convocatoria_gestion;
DELIMITER $$
CREATE PROCEDURE actualizar_estado_participacion_convocatoria_gestion
		(id_convocatoria_especifica INT, DNI INT, estado ENUM("PREADJUDICADO", "ELEGIBLE", "ADJUDICADO", "INVALIDADO", "FORMALIZADO"))
        
        /* 
        Permite cambiar el estado de una participacion en alguna convocatoria 
        bien sea para adjudicar el beneficio o invalidarlo a un estudiante en concreto en una convocatoria en concreto
        */
        
        BEGIN
			UPDATE ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION SET con_esp_estado = estado
			WHERE con_esp_id = id_convocatoria_especifica AND est_per_DNI = DNI;
        END $$
DELIMITER ;

-- Area de acompanamiento integral --

DROP PROCEDURE IF EXISTS agendar_cita_asesoria;
DELIMITER $$
CREATE PROCEDURE agendar_cita_asesoria(tipo ENUM("CRISIS EMOCIONAL", "TRAMITES", "ACADEMICO"), fecha DATETIME, est_DNI INT)
	BEGIN
		DECLARE id_espacio INT;
        DECLARE id_reservacion INT;
        DECLARE id_evento INT;
        
        -- Seleccion espacio libre
		SELECT esp_id  INTO id_espacio FROM ESPACIO
			WHERE esp_id IN (16,17,18) 
            AND 
            esp_id NOT IN (SELECT res_esp_id FROM RESERVACION
				WHERE 
				(fecha <= res_fecha_inicial AND DATE_ADD(fecha, INTERVAL 2 HOUR) > res_fecha_inicial)
				OR
				(fecha < res_fecha_fin AND DATE_ADD(fecha, INTERVAL 2 HOUR) >= res_fecha_fin)
				OR
				(fecha <= res_fecha_inicial AND DATE_ADD(fecha, INTERVAL 2 HOUR) >= res_fecha_fin)) LIMIT 1;
		
        IF id_espacio IS NULL THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'No hay espacios disponibles en la fecha y hora solicitadas.';
        END IF;
        
        -- Creacion reservacion
        INSERT INTO RESERVACION(res_fecha_inicial, res_fecha_fin, res_esp_id)
			VALUES (fecha, DATE_ADD(fecha, INTERVAL 2 HOUR), id_espacio);
		
        SELECT LAST_INSERT_ID() INTO id_reservacion;
        
        -- Creacion evento
        INSERT INTO EVENTO_GENERAL(eve_descripcion, eve_res_id)
			VALUES ('Cita de Asesoria', id_reservacion);
            
		SELECT LAST_INSERT_ID() INTO id_evento;
        
        -- Creacion cita
        INSERT INTO bienestar_UN.CITA_DE_ASESORIA (cit_ase_eve_id, cit_ase_tipo, cit_ase_est_per_DNI) 
			VALUES (id_evento, tipo, est_DNI);
        
    END $$
DELIMITER ;