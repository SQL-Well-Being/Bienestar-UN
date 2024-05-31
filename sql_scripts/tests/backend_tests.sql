USE bienestar_UN;

DELIMITER $$
CREATE PROCEDURE obtener_convocatorias_selecciones_deportivas()
	BEGIN
		SELECT * FROM convocatoria_seleccion_deportiva;
    END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE obtener_convocatoria_selecciones_deportivas(id INT)
	BEGIN
		SELECT * FROM convocatoria_seleccion_deportiva WHERE con_sel_codigo = id;
    END $$
DELIMITER ;

DROP ROLE IF EXISTS 'role_test_1';
CREATE ROLE 'role_test_1';
GRANT EXECUTE ON PROCEDURE obtener_convocatorias_selecciones_deportivas TO 'role_test_1';
GRANT EXECUTE ON PROCEDURE obtener_convocatoria_selecciones_deportivas TO 'role_test_1';

DROP ROLE IF EXISTS 'role_test_2';
CREATE ROLE 'role_test_2';
GRANT EXECUTE ON PROCEDURE obtener_convocatoria_selecciones_deportivas TO 'role_test_2';

DROP USER IF EXISTS 'user_test_1'@'localhost';
CREATE USER 'user_test_1'@'localhost' IDENTIFIED BY 'password';
GRANT 'role_test_1' TO 'user_test_1'@'localhost';
SET DEFAULT ROLE 'role_test_1' TO 'user_test_1'@'localhost';

DROP USER IF EXISTS 'user_test_2'@'localhost';
CREATE USER 'user_test_2'@'localhost' IDENTIFIED BY 'password';
GRANT 'role_test_2' TO 'user_test_2'@'localhost';
SET DEFAULT ROLE 'role_test_2' TO 'user_test_2'@'localhost';