USE bienestar_UN;

-- -----------------------------------------------------
-- Cultura
-- -----------------------------------------------------

DROP FUNCTION IF EXISTS obtener_gai_id;
DELIMITER $$
CREATE FUNCTION obtener_gai_id(con_gai_id INT) RETURNS INT DETERMINISTIC
	BEGIN
		DECLARE resultado INT;
        
		SELECT con_gai_gru_id INTO resultado
		FROM bienestar_UN.CONVOCATORIA_GAI
		WHERE con_gai_codigo = con_gai_id
		LIMIT 1;
        
        RETURN resultado;
    END $$
DELIMITER $$;