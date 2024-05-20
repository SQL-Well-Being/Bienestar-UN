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
DROP PROCEDURE IF EXISTS cargar_incapacidad;
DELIMITER $$
CREATE PROCEDURE cargar_incapacidad(fecha_inicio DATE, fecha_fin DATE, DNI INT)
	-- Permite registrar una incapacidad medica en el sistema
	BEGIN
		INSERT INTO INCAPACIDAD (inc_fecha_inicio, inc_fecha_fin, inc_est_per_DNI) 
		VALUES (fecha_inicio, fecha_fin, DNI);
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