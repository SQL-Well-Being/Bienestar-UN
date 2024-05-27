USE bienestar_UN;

-- IMPORTANTE: Ejecutar primero el script de creación de roles "roles.sql"

-- Usuario para el rol 'administrador'
DROP USER IF EXISTS 'usuario_administrador'@'localhost';
CREATE USER 'usuario_administrador'@'localhost' IDENTIFIED BY 'password';
GRANT 'administrador' TO 'usuario_administrador'@'localhost';

-- Usuario para el rol 'funcionario_bienestar'
DROP USER IF EXISTS 'usuario_funcionario'@'localhost';
CREATE USER 'usuario_funcionario'@'localhost' IDENTIFIED BY 'password';
GRANT 'funcionario_bienestar' TO 'usuario_funcionario'@'localhost';

-- Usuario para el rol 'estudiante'
DROP USER IF EXISTS 'usuario_estudiante'@'localhost';
CREATE USER 'usuario_estudiante'@'localhost' IDENTIFIED BY 'password';
GRANT 'estudiante' TO 'usuario_estudiante'@'localhost';
