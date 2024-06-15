USE bienestar_UN;

-- -----------------------------------------------------
-- Acompañamiento integral
-- -----------------------------------------------------

--
DROP PROCEDURE IF EXISTS agendar_cita_asesoria;
DELIMITER $$
CREATE PROCEDURE agendar_cita_asesoria(est_DNI INT, tipo ENUM("CRISIS EMOCIONAL", "TRAMITES", "ACADEMICO"), fecha DATETIME)
	BEGIN
		DECLARE id_espacio INT;
        DECLARE id_reservacion INT;
        DECLARE id_evento INT;
        DECLARE nombre_esp VARCHAR(45);
        DECLARE nombre_est VARCHAR(100);
        
        -- Selección espacio libre
		SELECT esp_id INTO id_espacio FROM ESPACIO
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
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay espacios disponibles en la fecha y hora solicitadas.';
        END IF;
        
		SELECT CONCAT(per_primer_nombre, ' ', per_primer_apellido) INTO nombre_est FROM PERSONA WHERE per_DNI = est_DNI;
        SELECT esp_nombre INTO nombre_esp FROM ESPACIO WHERE esp_id = id_espacio;
        
	START TRANSACTION;
        -- Creación reservacion
        INSERT INTO RESERVACION(res_fecha_inicial, res_fecha_fin, res_esp_id)
		VALUES (fecha, DATE_ADD(fecha, INTERVAL 2 HOUR), id_espacio);
		
        SELECT LAST_INSERT_ID() INTO id_reservacion;
        
        -- Creación evento
        INSERT INTO EVENTO_GENERAL(eve_descripcion, eve_res_id)
		VALUES (CONCAT('Cita de Asesoria en ', nombre_esp, ' para ', nombre_est), id_reservacion);
            
		SELECT LAST_INSERT_ID() INTO id_evento;
        
        -- Creación cita
        INSERT INTO bienestar_UN.CITA_DE_ASESORIA (cit_ase_eve_id, cit_ase_tipo, cit_ase_est_per_DNI) 
		VALUES (id_evento, tipo, est_DNI);
	COMMIT;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_info_cita_asesoria_evento;
DELIMITER $$
CREATE PROCEDURE consultar_info_cita_asesoria_evento(eve_id INT)
	BEGIN
		SELECT * FROM vw_info_cita_asesoria WHERE cit_ase_eve_id = eve_id;
    END $$
DELIMITER ;

-- Se encarga de cancelar una cita de asesoria (la eliminacion de su evento asociado se encuentra implementada en un trigger) 
DROP PROCEDURE IF EXISTS cancelar_cita_asesoria;
DELIMITER $$
CREATE PROCEDURE cancelar_cita_asesoria(id_evento INT)
	BEGIN
		DELETE FROM CITA_DE_ASESORIA WHERE cit_ase_eve_id = id_evento;
    END $$
DELIMITER ;


-- -----------------------------------------------------
-- Actividad Física y Deporte
-- -----------------------------------------------------

-- Permite asignar el equipo ganador de un encuentro deportivo
DROP PROCEDURE IF EXISTS asignar_ganador_encuentro_deportivo;
DELIMITER $$
CREATE PROCEDURE asignar_ganador_encuentro_deportivo(enc_evento_id INT, enc_equipo_gan_id INT)
	BEGIN
		DECLARE ganador_actual INT;

		SELECT enc_equi_gan_id INTO ganador_actual
		FROM ENCUENTRO_DEPORTIVO
		WHERE enc_eve_id = enc_evento_id;

        IF ganador_actual IS NOT NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El encuentro deportivo ya tiene un ganador asignado.';
        END IF;

		UPDATE ENCUENTRO_DEPORTIVO SET enc_equi_gan_id = enc_equipo_gan_id
		WHERE enc_eve_id = enc_evento_id;
	END $$
DELIMITER ;


-- -----------------------------------------------------
-- Cultura
-- -----------------------------------------------------

-- Obtiene todas las convocatorias para un grupo artístico institucional en las que participó un estudiante en un periodo académico determinado
DROP PROCEDURE IF EXISTS obtener_convocatorias_GAI_estudiante_en_un_periodo_academico;
DELIMITER $$
CREATE PROCEDURE obtener_convocatorias_GAI_estudiante_en_un_periodo_academico(DNI INT, periodo VARCHAR(6))
	BEGIN
		SELECT ESTUDIANTE.est_per_DNI, con_gai_periodo_academico, con_gai_descripcion
        FROM ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI 
        INNER JOIN ESTUDIANTE ON ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI.est_per_DNI = ESTUDIANTE.est_per_DNI
        INNER JOIN CONVOCATORIA_GAI ON con_gai_id = con_gai_codigo
        HAVING CONVOCATORIA_GAI.con_gai_periodo_academico = periodo AND ESTUDIANTE.est_per_DNI = DNI;
    END $$
DELIMITER ;

-- LLenar asistencia taller cultural
DROP PROCEDURE IF EXISTS llenar_asistencia_taller_cultural;
DELIMITER $$
CREATE PROCEDURE llenar_asistencia_taller_cultural(DNI INT, eve_id INT)
	BEGIN
		INSERT INTO ESTUDIANTE_ASISTE_A_TALLER_CULTURAL
			(tall_eve_id, est_per_DNI)
		VALUES
			(eve_id, DNI);
    END $$
DELIMITER ;

--
DROP PROCEDURE IF EXISTS obtener_grupos_artisticos_institucionales;
DELIMITER $$
CREATE PROCEDURE obtener_grupos_artisticos_institucionales()
	BEGIN
		SELECT * FROM vw_info_gai;
    END $$
DELIMITER ;

--
DROP PROCEDURE IF EXISTS obtener_talleres_culturales;
DELIMITER $$
CREATE PROCEDURE obtener_talleres_culturales()
	BEGIN
		SELECT * FROM vw_info_taller_cultural;
    END $$
DELIMITER ;

--
DROP PROCEDURE IF EXISTS obtener_convocatorias_gai;
DELIMITER $$
CREATE PROCEDURE obtener_convocatorias_gai()
	BEGIN
		SELECT * FROM vw_info_convocatoria_gai;
    END $$
DELIMITER ;

--
DROP PROCEDURE IF EXISTS obtener_estudiantes_pertenecen_gai;
DELIMITER $$
CREATE PROCEDURE obtener_estudiantes_pertenecen_gai(grupo_id INT)
	BEGIN
		SELECT * FROM vw_info_estudiantes_pertenecen_gai WHERE grupo_id = gru_id;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS obtener_estudiantes_asistieron_taller_cultural;
DELIMITER $$
CREATE PROCEDURE obtener_estudiantes_asistieron_taller_cultural(taller_id INT)
	BEGIN
		SELECT * FROM vw_info_estudiantes_asistencia_taller_cultural WHERE tall_eve_id = taller_id;
    END $$
DELIMITER ;

-- -----------------------------------------------------
-- Gestion y Fomento socioeconomico
-- -----------------------------------------------------

-- Agrega un estudiante a la lista de participantes de una convocatoria en especifico
DROP PROCEDURE IF EXISTS registrar_participacion_convocatoria_gestion;
DELIMITER $$
CREATE PROCEDURE registrar_participacion_convocatoria_gestion(DNI INT, id_convocatoria_especifica INT)
	BEGIN
		INSERT INTO ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION (con_esp_id, est_per_DNI)
        VALUES (id_convocatoria_especifica, DNI);
	END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS  consultar_convocatorias_gestion_periodo;
DELIMITER $$
CREATE PROCEDURE consultar_convocatorias_gestion_periodo(periodo_academico VARCHAR(6), solo_abiertas TINYINT)
	BEGIN
		IF solo_abiertas = 1 THEN
			SELECT * FROM vw_info_convocatorias_gestion WHERE con_gen_periodo_academico = periodo_academico AND con_gen_abierta = 1;
        ELSE
			SELECT * FROM vw_info_convocatorias_gestion WHERE con_gen_periodo_academico = periodo_academico;
        END IF;
    END $$
DELIMITER ;
--
DROP PROCEDURE IF EXISTS consultar_beneficios_estudiante;
DELIMITER $$
CREATE PROCEDURE consultar_beneficios_estudiante(DNI INT)
	BEGIN
		SELECT * FROM vw_info_beneficiarios_gestion WHERE ben_est_per_DNI = DNI;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_beneficiarios_convocatoria;
DELIMITER $$
CREATE PROCEDURE consultar_beneficiarios_convocatoria(con_id INT)
	BEGIN
		SELECT * FROM vw_info_beneficiarios_gestion WHERE con_esp_id = con_id;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_beneficiarios;
DELIMITER $$
CREATE PROCEDURE consultar_beneficiarios(solo_activas TINYINT)
	BEGIN
		IF solo_activas = 1 THEN
			SELECT * FROM vw_info_beneficiarios_gestion WHERE con_gen_activa = 1;
		ELSE
			SELECT * FROM vw_info_beneficiarios_gestion;
		END IF;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS  consultar_convocatorias_gestion_id;
DELIMITER $$
CREATE PROCEDURE consultar_convocatorias_gestion_id(esp_id INT, solo_activas TINYINT)
	BEGIN
		IF solo_activas = 1 THEN
			SELECT * FROM vw_info_convocatorias_gestion WHERE con_esp_id = esp_id AND con_gen_activa = 1;
        ELSE
			SELECT * FROM vw_info_convocatorias_gestion WHERE con_esp_id = esp_id;
        END IF;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_participaciones_convocatorias_gestion_periodo;
DELIMITER $$
CREATE PROCEDURE consultar_participaciones_convocatorias_gestion_periodo(periodo_academico VARCHAR(6), est_DNI INT)
	BEGIN
		IF est_DNI IS NOT NULL THEN
			SELECT * FROM vw_info_participaciones_convocatorias_gestion WHERE con_gen_periodo_academico = periodo_academico AND est_per_DNI = est_DNI;
        ELSE
			SELECT * FROM vw_info_participaciones_convocatorias_gestion WHERE con_gen_periodo_academico = periodo_academico;
        END IF;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_participaciones_convocatorias_gestion_id;
DELIMITER $$
CREATE PROCEDURE consultar_participaciones_convocatorias_gestion_id(esp_id INT, est_DNI INT)
	BEGIN
		IF est_DNI IS NOT NULL THEN
			SELECT * FROM vw_info_participaciones_convocatorias_gestion WHERE con_esp_id = esp_id AND est_per_DNI = est_DNI;
        ELSE
			SELECT * FROM vw_info_participaciones_convocatorias_gestion WHERE con_esp_id = esp_id;
        END IF;
    END $$
DELIMITER ;


/* 
Permite cambiar el estado de una participacion en alguna convocatoria 
bien sea para adjudicar el beneficio o invalidarlo a un estudiante en concreto en una convocatoria en concreto
*/
DROP PROCEDURE IF EXISTS actualizar_estado_participacion_convocatoria_gestion;
DELIMITER $$
CREATE PROCEDURE actualizar_estado_participacion_convocatoria_gestion(id_convocatoria_especifica INT, DNI INT, estado ENUM("PREADJUDICADO", "ELEGIBLE", "ADJUDICADO", "INVALIDADO", "FORMALIZADO"))
    BEGIN
		UPDATE ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION SET con_esp_estado = estado
		WHERE con_esp_id = id_convocatoria_especifica AND est_per_DNI = DNI;
    END $$
DELIMITER ;


-- -----------------------------------------------------
-- Salud
-- -----------------------------------------------------

-- Se encarga de agendar una cita, con su respectiva reservacion de espacio y evento
DROP PROCEDURE IF EXISTS agendar_cita_individual;
DELIMITER $$
CREATE PROCEDURE agendar_cita_individual(est_DNI INT, tipo_cita VARCHAR(120), fecha DATETIME)
	BEGIN
		DECLARE id_espacio INT;
		DECLARE id_reservacion INT;
        DECLARE id_evento INT;
        DECLARE nombre_est VARCHAR(100);
        DECLARE nombre_esp VARCHAR(45);
        
        -- Selección espacio libre
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
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay espacios disponibles en la fecha y hora solicitadas.';
        END IF;
        
        SELECT CONCAT(per_primer_nombre, ' ', per_primer_apellido) INTO nombre_est FROM PERSONA WHERE per_DNI = est_DNI;
        SELECT esp_nombre INTO nombre_esp FROM ESPACIO WHERE esp_id = id_espacio;
        
	START TRANSACTION;
        -- Creación reservación
        INSERT INTO RESERVACION(res_fecha_inicial, res_fecha_fin, res_esp_id)
		VALUES (fecha, DATE_ADD(fecha, INTERVAL 30 MINUTE), id_espacio);
		
        SELECT LAST_INSERT_ID() INTO id_reservacion;
        
        -- Creación evento
        INSERT INTO EVENTO_GENERAL (eve_descripcion, eve_res_id)
		VALUES (CONCAT('Cita individual en ', nombre_esp, ' para ', nombre_est), id_reservacion);
            
		SELECT LAST_INSERT_ID() INTO id_evento;
        
        -- Creación cita
        INSERT INTO CITA_INDIVIDUAL(cit_tipo, cit_est_per_DNI, cit_eve_id)
		VALUES (tipo_cita, est_DNI, id_evento);
	
    COMMIT;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_info_cita_individual_evento;
DELIMITER $$
CREATE PROCEDURE consultar_info_cita_individual_evento(id_evento INT)
	BEGIN
		SELECT * FROM vw_info_cita_individual_salud WHERE cit_eve_id = id_evento;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_info_citas_individuales;
DELIMITER $$
CREATE PROCEDURE consultar_info_citas_individuales(est_DNI INT)
	BEGIN
		IF est_DNI IS NULL THEN
			SELECT * FROM vw_info_cita_individual_salud;
        ELSE
			SELECT * FROM vw_info_cita_individual_salud WHERE cit_est_per_DNI = est_DNI;
        END IF;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS consultar_info_proximas_citas_individuales;
DELIMITER $$
CREATE PROCEDURE consultar_info_proximas_citas_individuales(est_DNI INT)
	BEGIN
		IF est_DNI IS NULL THEN
			SELECT * FROM vw_info_cita_individual_salud WHERE fecha >= CURDATE();
        ELSE
			SELECT * FROM vw_info_cita_individual_salud WHERE cit_est_per_DNI = est_DNI AND fecha >= CURDATE();
        END IF;
    END $$
DELIMITER ;

-- Se encarga de cancelar una cita (la eliminacion de su evento asociada esta implementada en un trigger)
DROP PROCEDURE IF EXISTS cancelar_cita_individual;
DELIMITER $$
CREATE PROCEDURE cancelar_cita_individual(id_evento INT)
	BEGIN
		DELETE FROM CITA_INDIVIDUAL WHERE cit_eve_id=id_evento;
    END $$
DELIMITER ;


-- Obtiene toda la info de salud de un estudiante en concreto
DROP PROCEDURE IF EXISTS obtener_info_salud_estudiante;
DELIMITER $$
CREATE PROCEDURE obtener_info_salud_estudiante(DNI INT)
    BEGIN
		SELECT * FROM vw_info_salud_estudiante WHERE est_per_DNI = DNI;
    END $$
DELIMITER ;


-- Permite registrar una incapacidad medica en el sistema
DROP PROCEDURE IF EXISTS cargar_incapacidad;
DELIMITER $$
CREATE PROCEDURE cargar_incapacidad(DNI INT, fecha_inicio DATE, fecha_fin DATE)
	BEGIN
		INSERT INTO INCAPACIDAD (inc_fecha_inicio, inc_fecha_fin, inc_est_per_DNI) 
		VALUES (fecha_inicio, fecha_fin, DNI);
    END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS consultar_info_incapacidades;
DELIMITER $$
CREATE PROCEDURE consultar_info_incapacidades(est_DNI INT)
	BEGIN
		IF est_DNI IS NOT NULL THEN
			SELECT * FROM INCAPACIDAD WHERE inc_est_per_DNI = est_DNI;
        ELSE
			SELECT * FROM INCAPACIDAD;
        END IF;
    END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS agregar_discapacidad;
DELIMITER $$
CREATE PROCEDURE agregar_discapacidad(id_dis INT, id_perf INT)
	BEGIN
		INSERT INTO PERFIL_DE_SALUD_TIENE_DISCAPACIDAD(dis_id, perfsalud_id) VALUES (id_dis, id_perf);
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS remover_discapacidad;
DELIMITER $$
CREATE PROCEDURE remover_discapacidad(id_dis INT, id_perf INT)
	BEGIN
		DELETE FROM PERFIL_DE_SALUD_TIENE_DISCAPACIDAD WHERE dis_id = id_dis AND perfsalud_id = id_perf;
    END $$
DELIMITER ;

DROP PROCEDURE IF EXISTS discapacidades_perfil;
DELIMITER $$
CREATE PROCEDURE discapacidades_perfil(id INT)
	BEGIN
		SELECT perfsalud_id_discapacidades FROM vw_info_salud_estudiante WHERE perfsalud_id = id;
    END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS actualizar_perfil_salud;
DELIMITER $$
CREATE PROCEDURE actualizar_perfil_salud(id INT, peso DECIMAL(5,3), RH VARCHAR(4), estatura DECIMAL(4,3))
	BEGIN
		UPDATE PERFIL_DE_SALUD SET perfsalud_peso=peso, perfsalud_RH=RH, perfsalud_estatura=estatura WHERE perfsalud_id = id;
    END $$
DELIMITER ;

-- -----------------------------------------------------
-- Sistema de Información
-- -----------------------------------------------------

-- Obtiene toda la info academica de un estudiante en concreto
DROP PROCEDURE IF EXISTS obtener_info_academica_estudiante;
DELIMITER $$
CREATE PROCEDURE obtener_info_academica_estudiante(DNI INT)
	BEGIN
		SELECT * FROM vw_info_academica_estudiante WHERE est_per_DNI = DNI;
    END $$
DELIMITER ;


-- Elimina las reservaciones anteriores a un día determinado
DROP PROCEDURE IF EXISTS eliminar_reservaciones;
DELIMITER $$
CREATE PROCEDURE eliminar_reservaciones(dia DATE)
BEGIN
    IF dia >= CURDATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se pueden eliminar reservaciones antes del día actual.';
    END IF;
    
    DELETE FROM RESERVACION
	WHERE res_fecha_inicial < dia;
END $$
DELIMITER ;