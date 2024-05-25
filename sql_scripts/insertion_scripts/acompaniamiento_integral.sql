USE bienestar_UN;

-- -----------------------------------------------------
-- Inserción de convocatorias PGP
-- -----------------------------------------------------

INSERT INTO bienestar_UN.CONVOCATORIA_PGP 
    (con_pgp_codigo, con_pgp_descripcion, con_pgp_terminos, con_pgp_esta_activo, con_pgp_fecha_inicio, con_pgp_fecha_fin, con_pgp_periodo_academico) 
VALUES
    (2020, 'Convocatoria Programa de gestión de proyectos (PGP)',
    'Estos son los términos específicos para la convocatoria de PGP 2020, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
    1, '2020-02-01 08:00:00', '2020-03-28 17:00:00', '2020-1'
    ),
    (2021, 'Convocatoria Programa de gestión de proyectos (PGP)',
    'Estos son los términos específicos para la convocatoria de PGP 2021, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
    1, '2021-02-01 08:00:00', '2021-03-20 19:00:00', '2021-1'
    ),
    (2022, 'Convocatoria Programa de gestión de proyectos (PGP)',
    'Estos son los términos específicos para la convocatoria de PGP 2022, en la cual se buscara financiar los proyectos estudiantiles de la universidad. Se inició el proceso en segundo semestre por problemas administrativos.', 
    1, '2022-06-01 08:00:00', '2022-07-30 17:00:00', '2022-2'
    ),
    (2023, 'Convocatoria Programa de gestión de proyectos (PGP)',
    'Estos son los términos específicos para la convocatoria de PGP 2020, en la cual se buscara financiar los proyectos estudiantiles de la universidad.', 
    1, '2023-02-13 08:00:00', '2023-03-30 17:00:00', '2023-1');


-- -----------------------------------------------------
-- Inserción de proyectos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.PROYECTO 
    (pro_id, pro_nombre, pro_descripcion, pro_objetivos) 
VALUES
    (1, 'UNalgoritmo', "Proyecto de estudiantes para incentivar la programación competitiva en la Universidad.", 
    "1. Dar clases y tutorías de programación competitiva. 2. Incentivar la participación en competencias oficiales. 3. Guiar a estudiantes en el proceso de aprendizaje. 4. Formar estudiantes de pregrado para que representen a la universidad en ICPC."
    ),
    (2, 'RoboticaUN', "Creación de miniproyectos y tutorias de robotica.", 
    "1. Dar clases y tutorías de robotica. 2. Implementar proyectos usando arduinos."
    ),
    (3, 'Club de debates', "Espacio para la creación y practicas de debates", 
    "1. Organizar espacios de debates y oratoria."
    ),
    (4, 'MarketingUN', "Club en el que se dicuten las tendencias de marketing digital", 
    "1. Difundir el avance de marketing digital."
    ),
    (5, 'BioUN', 'Proyecto para realizar investigaciones en biología molecular.', 
    '1. Realizar experimentos y análisis en biología molecular. 2. Contribuir al avance científico en el campo de la biología.'
    ),
    (6, 'AppUN', 'Desarrollo de aplicaciones móviles para resolver problemas sociales.', 
    '1. Desarrollar aplicaciones móviles útiles para la sociedad. 2. Aprender y aplicar conceptos avanzados de programación móvil.'
    ),
    (7, 'FotoUN', 'Espacio para aprender técnicas avanzadas de fotografía.', 
    '1. Realizar prácticas fotográficas en diferentes escenarios. 2. Compartir conocimientos sobre composición y edición fotográfica.'
    ),
    (8, 'EmprendeUN', 'Fomento del espíritu emprendedor entre los estudiantes.', 
    '1. Organizar charlas y talleres sobre emprendimiento. 2. Facilitar la creación y desarrollo de startups por parte de los estudiantes.');


-- -----------------------------------------------------
-- Inserción de estudiantes a proyectos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.PROYECTO_TIENE_ESTUDIANTES 
    (pro_id, est_per_DNI) 
VALUES
    -- Proyecto 1 (UNalgoritmo) con 4 estudiantes
    (1, 111111100), (1, 111111101), (1, 111111102), (1, 111111103),
    -- Proyecto 2 (RoboticaUN) con 5 estudiantes
    (2, 111111104), (2, 111111105), (2, 111111106), (2, 111111107), (2, 111111108),
    -- Proyecto 3 (Club de debates) con 6 estudiantes
    (3, 111111109), (3, 111111110), (3, 111111111), (3, 111111112), (3, 111111113), (3, 111111114),
    -- Proyecto 4 (MarketingUN) con 7 estudiantes
    (4, 111111115), (4, 111111116), (4, 111111117), (4, 111111118), (4, 111111119), (4, 111111120), (4, 111111121),
    -- Proyecto 5 (BioUN) con 3 estudiantes
    (5, 111111122), (5, 111111123), (5, 111111124),
    -- Proyecto 6 (AppUN) con 3 estudiantes
    (6, 111111125), (6, 111111126), (6, 111111127), (6, 111111128),
    -- Proyecto 7 (FotoUN) con 5 estudiantes
    (7, 111111129), (7, 111111130), (7, 111111131), (7, 111111132), (7, 111111133),
    -- Proyecto 8 (EmprendeUN) con 6 estudiantes
    (8, 111111134), (8, 111111135), (8, 111111136), (8, 111111137), (8, 111111138), (8, 111111139);


-- -----------------------------------------------------
-- Inserción de participaciones en PGP
-- -----------------------------------------------------

INSERT INTO bienestar_UN.PARTICIPACION_PGP 
    (par_pgp_pro_id, par_pgp_con_pgp_codigo, par_pgp_esta_aprobado, par_pgp_presupuesto) 
VALUES
    (1, 2020, 1, 3900000),
    (1, 2021, 1, 3900000),
    (1, 2022, 1, 3900000),
    (2, 2020, 1, 900000),
    (3, 2021, 0, 0),
    (4, 2022, 1, 752000),
    (5, 2020, 0, 0),
    (5, 2023, 1, 1000000),
    (6, 2023, 1, 2000000),
    (7, 2023, 1, 1750000),
    (8, 2023, 0, 0);


-- -----------------------------------------------------
-- Inserción de sesiones de taller
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (101, '2024-04-15 09:00:00', '2024-04-15 12:00:00', 44),
    (102, '2024-04-20 14:00:00', '2024-04-20 17:00:00', 45),
    (103, '2024-04-25 10:00:00', '2024-04-25 13:00:00', 45),
    (104, '2024-05-01 08:00:00', '2024-05-01 11:00:00', 44),
    (105, '2024-05-05 15:00:00', '2024-05-05 18:00:00', 45);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (101, 'Exposición de Fotografía', 101),
    (102, 'Taller de Escritura Creativa', 102),
    (103, 'Clase de Yoga', 103),
    (104, 'Hackathon de Programación', 104),
    (105, 'Demostración de Cocina Saludable', 105);

INSERT INTO bienestar_UN.SESION_DE_TALLER 
    (ses_taller_nombre, ses_taller_eve_id, ses_taller_per_tallerista_DNI) 
VALUES
    ('Taller de Fotografía Digital', 101, 111111101),
    ('Taller de Escritura Creativa', 102, 111111108),
    ('Taller de Yoga', 103, 111111114),
    ('Taller de Programación Básica', 104, 111111126),
    ('Taller de Cocina Saludable', 105, 111111136);


-- -----------------------------------------------------
-- Inserción de sesiones de acompañamiento
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (106, '2024-04-15 09:00:00', '2024-04-15 11:00:00', 16),
    (107, '2024-04-16 10:00:00', '2024-04-16 12:00:00', 17),
    (108, '2024-04-17 11:00:00', '2024-04-17 13:00:00', 18),
    (109, '2024-04-18 12:00:00', '2024-04-18 14:00:00', 16),
    (110, '2024-04-19 13:00:00', '2024-04-19 15:00:00', 17);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (106, 'Sesión de Acompañamiento 1', 106),
    (107, 'Sesión de Acompañamiento 2', 107),
    (108, 'Sesión de Acompañamiento 3', 108),
    (109, 'Sesión de Acompañamiento 4', 109),
    (110, 'Sesión de Acompañamiento 5', 110);

INSERT INTO bienestar_UN.SESION_DE_ACOMPANAMIENTO 
    (ses_acom_nombre, ses_acom_eve_id, ses_acom_fun_per_DNI_encargado) 
VALUES
    ('Sesión de Acompañamiento 1', 106, 200000020),
    ('Sesión de Acompañamiento 2', 107, 200000021),
    ('Sesión de Acompañamiento 3', 108, 200000020),
    ('Sesión de Acompañamiento 4', 109, 200000020),
    ('Sesión de Acompañamiento 5', 110, 200000023);


-- -----------------------------------------------------
-- Inserción de citas de asesoría
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (111, '2024-04-13 09:00:00', '2024-04-13 11:00:00', 16),
    (112, '2024-04-14 10:00:00', '2024-04-14 12:00:00', 17),
    (113, '2024-04-15 11:00:00', '2024-04-15 13:00:00', 18),
    (114, '2024-04-16 12:00:00', '2024-04-16 14:00:00', 16),
    (115, '2024-04-17 13:00:00', '2024-04-17 15:00:00', 17);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (111, 'Cita de Asesoría 6', 111),
    (112, 'Cita de Asesoría 7', 112),
    (113, 'Cita de Asesoría 8', 113),
    (114, 'Cita de Asesoría 9', 114),
    (115, 'Cita de Asesoría 10', 115);

INSERT INTO bienestar_UN.CITA_DE_ASESORIA 
    (cit_ase_nombre, cit_ase_eve_id, cit_ase_tipo, cit_ase_est_per_DNI) 
VALUES
    ('Asesoría Estudiante 1', 111, 'ACADEMICO', 111111147),
    ('Asesoría Estudiante 2', 112, 'CRISIS EMOCIONAL', 111111149),
    ('Asesoría Estudiante 3', 113, 'TRAMITES', 111111150),
    ('Asesoría Estudiante 4', 114, 'ACADEMICO', 111111132),
    ('Asesoría Estudiante 5', 115, 'CRISIS EMOCIONAL', 111111143);


-- -----------------------------------------------------
-- Inserción de asistencias de estudiantes a sesiones de taller
-- -----------------------------------------------------

INSERT INTO bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER 
    (ses_eve_id, est_per_DNI) 
VALUES
    (101, 111111140),
    (101, 111111141),
    (101, 111111142),
    (101, 111111143),
    (101, 111111144),
    (102, 111111145),
    (102, 111111146),
    (102, 111111147),
    (102, 111111148),
    (102, 111111149),
    (103, 111111150),
    (103, 111111151),
    (103, 111111152),
    (103, 111111153),
    (103, 111111154),
    (104, 111111155),
    (104, 111111156),
    (104, 111111157),
    (104, 111111158),
    (104, 111111159);
