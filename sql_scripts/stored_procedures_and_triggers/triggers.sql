USE bienestar_UN;

-- -----------------------------------------------------
-- Acompañamiento integral
-- -----------------------------------------------------

-- Se encarga de eliminar el evento asociado a una cita de asesoria 
DROP TRIGGER IF EXISTS eliminar_cita_asesoria;
DELIMITER $$
CREATE TRIGGER eliminar_cita_asesoria AFTER DELETE ON CITA_DE_ASESORIA
	FOR EACH ROW BEGIN
		-- Borrado de evento
		DELETE FROM EVENTO_GENERAL WHERE eve_id = OLD.cit_ase_eve_id;
    END $$
DELIMITER ;

-- -----------------------------------------------------
-- Gestion y fomento
-- -----------------------------------------------------

-- Verifica que la participacion en convocatoria sea valida
DROP TRIGGER IF EXISTS validar_participacion_convocatoria_gestion;
DELIMITER $$
CREATE TRIGGER validar_participacion_convocatoria_gestion BEFORE INSERT ON ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION
	
    FOR EACH ROW BEGIN
		DECLARE msg VARCHAR(128);
        DECLARE es_activo TINYINT;
        DECLARE convocatoria_activa TINYINT;
        DEClARE convocatoria_abierta TINYINT;
        DECLARE participaciones INT;
        
		SELECT con_gen_activa INTO convocatoria_activa FROM vw_info_convocatorias_gestion WHERE con_esp_id = NEW.con_esp_id;
        SELECT con_gen_abierta INTO convocatoria_activa FROM vw_info_convocatorias_gestion WHERE con_esp_id = NEW.con_esp_id;
        
        SELECT hist_es_activa INTO es_activo FROM vw_info_academica_estudiante WHERE est_per_DNI = NEW.est_per_DNI;
        
        SELECT COUNT(*) INTO participaciones FROM ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION 
			WHERE est_per_DNI = NEW.est_per_DNI AND con_esp_id = NEW.con_esp_id;
		
        IF es_activo = 0 THEN
			SET msg = CONCAT('El estudiante con DNI ', NEW.est_per_DNI, ' no se encuentra activo.');
            SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = msg;
		ELSEIF participaciones > 0 THEN
			SET msg = CONCAT('El estudiante con DNI ', NEW.est_per_DNI, ' ya participa en la convocatoria con id ', NEW.con_esp_id );
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = msg;
		ELSEIF convocatoria_activa = 0 OR convocatoria_abierta = 0 THEN
			SET msg = CONCAT('La convocatoria ya no se encuentra habilitada para participar');
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = msg;
		END IF;
    END $$
DELIMITER ;

-- Detecta cuando un beneficio fué adjudicado y agrega el estudiante a la tabla de beneficiarios 
DROP TRIGGER IF EXISTS actualizar_estado_participacion;
DELIMITER $$
CREATE TRIGGER actualizar_estado_participacion AFTER UPDATE ON ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION
	
	FOR EACH ROW BEGIN
		DECLARE periodo VARCHAR(6);
        DECLARE codigo_gen VARCHAR(50);
        SELECT con_esp_con_gen_codigo INTO codigo_gen FROM CONVOCATORIA_ESPECIFICA WHERE con_esp_id = NEW.con_esp_id;
        SELECT con_gen_periodo_academico INTO periodo FROM CONVOCATORIA_GENERAL WHERE con_gen_codigo = codigo_gen;
        
		IF NEW.con_esp_estado = 'ADJUDICADO' AND OLD.con_esp_estado != 'ADJUDICADO' THEN
			INSERT INTO BENEFICIARIO_PROGRAMA_DE_GESTION
				(ben_periodo_academico, ben_est_per_DNI, con_esp_id)
			VALUES (periodo, NEW.est_per_DNI, NEW.con_Esp_id);
		ELSEIF OLD.con_esp_estado = 'ADJUDICADO' AND NEW.con_esp_estado != 'ADJUDICADO' THEN
			DELETE FROM BENEFICIARIO_PROGRAMA_DE_GESTION WHERE ben_est_per_DNI = NEW.est_per_DNI AND con_esp_id = NEW.con_esp_id;
        END IF;
    END $$
DELIMITER ;

-- Se encarga de agregar el nuevo beneficiario a la tabla de beneficio especifico a la que pertenece 
DROP TRIGGER IF EXISTS clasificar_beneficiario;
DELIMITER $$
CREATE TRIGGER clasificar_beneficiario AFTER INSERT ON BENEFICIARIO_PROGRAMA_DE_GESTION 
	FOR EACH ROW BEGIN
		DECLARE codigo_general VARCHAR(50);
        DECLARE nombre_esp VARCHAR(100);
		DECLARE tipo_beneficio ENUM("AL", "AJ", "TR", "E");
        
        SELECT con_esp_nombre INTO nombre_esp FROM CONVOCATORIA_ESPECIFICA WHERE con_esp_id = NEW.con_esp_id;
        SELECT con_esp_con_gen_codigo INTO codigo_general FROM CONVOCATORIA_ESPECIFICA WHERE con_esp_id = NEW.con_esp_id;
        SELECT con_gen_tipo INTO tipo_beneficio FROM CONVOCATORIA_GENERAL WHERE con_gen_codigo = codigo_general;
        
        IF tipo_beneficio = 'AL' THEN
			INSERT INTO BENEFICIARIO_DE_GESTION_ALIMENTARIA
				(ben_alim_id, ben_alim_tipo)
			VALUES (NEW.ben_id, UPPER( TRIM( SUBSTRING_INDEX(nombre_esp, '-', -1) ) ) );
		ELSEIF tipo_beneficio = 'AJ' THEN
			INSERT INTO BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO
				(ben_aloj_id, ben_aloj_entidad_prestadora)
			VALUES (NEW.ben_id, TRIM(SUBSTRING_INDEX(nombre_esp, '-', -1)) );
		ELSEIF tipo_beneficio = 'TR' THEN
			INSERT INTO BENEFICIARIO_DE_GESTION_DE_TRANSPORTE
				(ben_tran_numero_tarjeta_sitp, ben_tran_id)
			VALUES (CONVERT(NEW.ben_est_per_DNI, char), NEW.ben_id);
		ELSEIF tipo_beneficio = 'E' THEN
			INSERT INTO BENEFICIARIO_DE_GESTION_ECONOMICA
				(ben_eco_porcentaje_salario_minimo, ben_eco_id)
			VALUES (70, NEW.ben_id);
		END IF;

    END $$
DELIMITER ;


-- -----------------------------------------------------
-- Salud
-- -----------------------------------------------------

-- Se encarga de borrar evento asociado a una cita indidual
DROP TRIGGER IF EXISTS eliminar_cita_individual;
DELIMITER $$
CREATE TRIGGER eliminar_cita_individual AFTER DELETE ON CITA_INDIVIDUAL
	FOR EACH ROW BEGIN
        -- Borrado de evento
        DELETE FROM EVENTO_GENERAL WHERE eve_id = OLD.cit_eve_id;
    END $$
DELIMITER ;


-- -----------------------------------------------------
-- Sistema de informacion
-- -----------------------------------------------------

-- Se encarga de borrar la reservacion asociada a un evento en especifico
DROP TRIGGER IF EXISTS eliminar_evento;
DELIMITER $$
CREATE TRIGGER eliminar_evento AFTER DELETE ON EVENTO_GENERAL
	FOR EACH ROW BEGIN
        -- Borrado de reservacion de espacio
        DELETE FROM RESERVACION WHERE res_id = OLD.eve_res_id;
    END $$
DELIMITER ;


-- -----------------------------------------------------
-- Cultura
-- -----------------------------------------------------

-- Detecta si un estudiante fue admitido a un grupo artístico y lo agrega
DROP TRIGGER IF EXISTS agregar_estudiante_a_gai;
DELIMITER $$
CREATE TRIGGER agregar_estudiante_a_gai AFTER UPDATE ON ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI
	FOR EACH ROW BEGIN
		DECLARE grupo_id INT;
        SET grupo_id = obtener_gai_id(NEW.con_gai_id);

		IF NEW.es_admitido = 1 AND OLD.es_admitido = 0 THEN
			INSERT INTO GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE
				(gru_id, est_per_DNI)
			VALUES (grupo_id, NEW.est_per_DNI);
		END IF;
    END $$
DELIMITER ;