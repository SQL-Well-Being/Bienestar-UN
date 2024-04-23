USE bienestar_UN;
-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_PGP
-- -----------------------------------------------------

-- Inserciones para la tabla CONVOCATORIA_PGP
INSERT INTO bienestar_UN.CONVOCATORIA_PGP (con_pgp_codigo, con_pgp_descripcion, con_pgp_terminos, con_pgp_esta_activo, con_pgp_fecha_inicio, con_pgp_fecha_fin, con_pgp_periodo_academico) VALUES
(2020, 'Convocatoria Programa de gestión de proyectos (PGP)',
'Estos son los términos específicos para la convocatoria de PGP 2020, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
1, '2020-02-01 08:00:00', '2020-03-28 17:00:00', '2020-1'),
(2021, 'Convocatoria Programa de gestión de proyectos (PGP)',
'Estos son los términos específicos para la convocatoria de PGP 2021, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
1, '2021-02-01 08:00:00', '2021-03-20 19:00:00', '2021-1'),
(2022, 'Convocatoria Programa de gestión de proyectos (PGP)',
'Estos son los términos específicos para la convocatoria de PGP 2022, en la cual se buscara financiar los proyectos estudiantiles de la universidad. Se inició el proceso en segundo semestre por problemas administrativos.', 
1, '2022-06-01 08:00:00', '2022-07-30 17:00:00', '2022-2'),
(2023, 'Convocatoria Programa de gestión de proyectos (PGP)',
'Estos son los términos específicos para la convocatoria de PGP 2020, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
1, '2023-02-13 08:00:00', '2023-03-30 17:00:00', '2023-1');


-- -----------------------------------------------------
-- Table bienestar_UN.PROYECTO
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS bienestar_UN.PROYECTO (
  pro_id INT NOT NULL COMMENT 'Primary key del proyecto.',
  pro_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del proyecto.',
  pro_descripcion MEDIUMTEXT NOT NULL COMMENT 'Descripción del proyecto.',
  pro_objetivos MEDIUMTEXT NOT NULL COMMENT 'Lista de objetivos del proyecto.',
  PRIMARY KEY (pro_id))

COMMENT = 'Proyecto armado a partir de mínimo 3 estudiantes de una facultad.';

INSERT INTO bienestar_UN.PROYECTO (pro_id, pro_nombre, pro_descripcion, pro_objetivos) VALUES
(1, 'UNalgoritmo', "Proyecto de estudiantes para incentivar la programación competitiva en la Universidad.", 
"1. Dar clases y tutorías de programación competitiva. 2. Incentivar la participación en competencias oficiales. 3. Guiar a estudiantes en el proceso de aprendizaje. 4. Formar estudiantes de pregrado para que representen a la universidad en ICPC."),
(2, 'RoboticaUN', "Creación de miniproyectos y tutorias de robotica.", 
"1. Dar clases y tutorías de robotica. 2. Implementar proyectos usando arduinos."),
(3, 'Club de debates', "Espacio para la creación y practicas de debates", 
"1. Organizar espacios de debates y oratoria."),
(4, 'MarketingUN', "Club en el que se dicuten las tendencias de marketing digital", 
"1. Difundir el avance de marketing digital.");
