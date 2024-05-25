USE bienestar_UN;

-- IMPORTANTE: Ejecutar primero el script de inserciones del Sistema de información "sistema_de_informacion.sql"

-- -----------------------------------------------------
-- Inserción de deportes
-- -----------------------------------------------------

INSERT INTO bienestar_UN.DEPORTE
    (depo_id, depo_nombre)
VALUES 
    (1, 'FUTBOL'),
    (2, 'BALONCESTO'),
    (3, 'VOLEIBOL'),
    (4, 'KARATE'),
    (5, 'TENIS');


-- -----------------------------------------------------
-- Inserción de selecciones deportivas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.SELECCION_DEPORTIVA
    (sel_id, sel_nombre, sel_cupos, sel_categoria, sel_depo_id, sel_doc_per_DNI_entrenador)
VALUES
    (1, 'FUTBOL-MASCULINO', 30, 'M', 1, 200000035),
    (2, 'FUTBOL-FEMENINO', 30, 'F', 1, 200000035),
    (3, 'BALONCESTO-MASCULINO', 30, 'M', 2, 200000036),
    (4, 'BALONCESTO-FEMENINO', 30, 'F',2, 200000036),
    (5, 'VOLEIBOL-FEMENINO', 20, 'F',3, 200000037),
    (6, 'KARATE-FEMENINO', 20, 'F',4, 200000038),
    (7, 'TENIS-MASCULINO', 20, 'M',5, 200000039);


-- -----------------------------------------------------
-- Inserción de convocatorias para selecciones deportivas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA
    (con_sel_descripcion, con_sel_periodo_academico, con_sel_id)
VALUES
    ('Convocatoria para la seleccion masculina de futbol.', '2023-2', 1),
    ('Convocatoria para la seleccion femenina de futbol.', '2023-2', 2),
    ('Convocatoria para la seleccion masculina de baloncesto.', '2023-2', 3),
    ('Convocatoria para la seleccion femenina de baloncesto.', '2023-2', 4),
    ('Convocatoria para la seleccion femenina de voleibol.', '2023-2', 5),
    ('Convocatoria para la seleccion femenina de karate.', '2023-2', 6),
    ('Convocatoria para la seleccion masculina de TENIS.', '2023-2', 7),
    ('Convocatoria para la seleccion masculina de futbol.', '2024-1', 1),
    ('Convocatoria para la seleccion femenina de futbol.', '2024-1', 2),
    ('Convocatoria para la seleccion masculina de baloncesto.', '2024-1', 3),
    ('Convocatoria para la seleccion femenina de baloncesto.', '2024-1', 4),
    ('Convocatoria para la seleccion femenina de voleibol.', '2024-1', 5),
    ('Convocatoria para la seleccion femenina de karate.', '2024-1', 6),
    ('Convocatoria para la seleccion masculina de TENIS.', '2024-1', 7);


-- -----------------------------------------------------
-- Inserción de estudiantes a convocatorias para selecciones deportivas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA
    (con_sel_codigo, est_per_DNI, es_admitido)
VALUES
    (1, 111111114, 1),
    (1, 111111116, 1),
    (1, 111111118, 1),
    (1, 111111121, 1),
    (1, 111111123, 0),
    (1, 111111125, 1),
    (1, 111111127, 1),
    (3, 111111129, 1),
    (3, 111111131, 1),
    (3, 111111133, 1),
    (3, 111111135, 1),
    (3, 111111137, 0),
    (3, 111111138, 1),
    (3, 111111140, 1),
    (7, 111111147, 1),
    (7, 111111150, 1),
    (7, 111111152, 1),
    (7, 111111154, 1),
    (7, 111111156, 0),
    (7, 111111158, 1),
    (2, 111111101, 1),
    (2, 111111103, 1),
    (2, 111111105, 0),
    (2, 111111107, 1),
    (2, 111111109, 1),
    (2, 111111111, 1),
    (2, 111111113, 1),
    (5, 111111115, 1),
    (5, 111111117, 1),
    (5, 111111119, 1),
    (5, 111111120, 1),
    (5, 111111122, 0),
    (5, 111111124, 1),
    (5, 111111126, 1),
    (6, 111111139, 1),
    (6, 111111141, 1),
    (6, 111111142, 1),
    (6, 111111144, 1),
    (6, 111111146, 0),
    (6, 111111148, 1),
    (6, 111111149, 1);


-- -----------------------------------------------------
-- Inserción de entrenamientos de selecciones deportivas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (500, '2024-05-20 07:00:00', '2024-05-20 09:00:00', 53),
    (501, '2024-05-20 09:00:00', '2024-05-20 11:00:00', 53),
    (502, '2024-05-21 07:00:00', '2024-05-21 09:00:00', 54),
    (503, '2024-05-21 09:00:00', '2024-05-21 11:00:00', 54),
    (504, '2024-05-27 16:00:00', '2024-05-27 18:00:00', 51),
    (505, '2024-05-29 16:00:00', '2024-05-29 18:00:00', 57),
    (506, '2024-06-04 16:00:00', '2024-06-04 18:00:00', 47);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (500, 'Entrenamiento de la selección masculina de futbol en el Estadio Alfonso López Pumarejo.', 500),
    (501, 'Entrenamiento de la selección femenina de futbol en el Estadio Alfonso López Pumarejo.', 501),
    (502, 'Entrenamiento de la selección masculina de baloncesto en la Concha Acustica.', 502),
    (503, 'Entrenamiento de la selección femenina de baloncesto en la Concha Acustica.', 503),
    (504, 'Entrenamiento de la selección femenina de voleibol en la Cancha de Voleibol.', 504),
    (505, 'Entrenamiento de la selección femenina de karate en el salón 220-A del Polideportivo.', 505),
    (506, 'Entrenamiento de la selección masculina de tenis en la Cancha de Tenis T-2.', 506);

INSERT INTO bienestar_UN.ENTRENAMIENTO_SELECCION 
    (ent_sel_eve_id, sel_id) 
VALUES
    (500, 1),
    (501, 2),
    (502, 3),
    (503, 4),
    (504, 5),
    (505, 6),
    (506, 7);


-- -----------------------------------------------------
-- Inserción de estudiantes a selecciones deportivas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE
    (sel_id, est_per_DNI)
VALUES
    (1, 111111114),
    (1, 111111116),
    (1, 111111118),
    (1, 111111121),
    (1, 111111125),
    (1, 111111127),
    (2, 111111101),
    (2, 111111103),
    (2, 111111107),
    (2, 111111109),
    (2, 111111111),
    (2, 111111113),
    (3, 111111129),
    (3, 111111131),
    (3, 111111133),
    (3, 111111135),
    (3, 111111138),
    (3, 111111140),
    (5, 111111115),
    (5, 111111117),
    (5, 111111119),
    (5, 111111120),
    (5, 111111124),
    (5, 111111126),
    (6, 111111139),
    (6, 111111141),
    (6, 111111142),
    (6, 111111144),
    (6, 111111148),
    (6, 111111149),
    (7, 111111147),
    (7, 111111150),
    (7, 111111152),
    (7, 111111154),
    (7, 111111158);


-- -----------------------------------------------------
-- Inserción de cursos libres
-- -----------------------------------------------------

INSERT INTO bienestar_UN.CURSO_LIBRE 
    (curlib_id, curlib_nombre, curlib_cupos, curlib_descripcion, curlib_doc_per_DNI_profesor) 
VALUES
    (1, 'Introducción al Baloncesto', 25, 'Curso introductorio para aprender los conceptos básicos del baloncesto, incluyendo técnicas de dribbling, tiro y defensa.', 200000036),
    (2, 'Yoga Deportivo', 20, 'Este curso está diseñado para enseñar posturas de yoga enfocadas en mejorar el rendimiento deportivo, la flexibilidad y la recuperación muscular.', 200000039),
    (3, 'Entrenamiento Funcional', 15, 'Aprende a realizar ejercicios de entrenamiento funcional que mejorarán tu fuerza, agilidad y resistencia. Incluye teoría y práctica en el gimnasio.', 200000039),
    (4, 'Running para Principiantes', 30, 'Curso básico para aquellos que desean comenzar a correr, con técnicas de carrera, planes de entrenamiento y consejos para evitar lesiones.', 200000044);


-- -----------------------------------------------------
-- Inserción de sesiones de cursos libres
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (400, '2024-05-28 16:00:00', '2024-05-28 18:00:00', 54),
    (401, '2024-05-30 16:00:00', '2024-05-30 18:00:00', 54),
    (402, '2024-05-28 16:00:00', '2024-05-28 18:00:00', 56),
    (403, '2024-05-30 16:00:00', '2024-05-30 18:00:00', 56),
    (404, '2024-05-27 16:00:00', '2024-05-27 18:00:00', 56),
    (405, '2024-05-29 16:00:00', '2024-05-29 18:00:00', 56),
    (406, '2024-06-04 16:00:00', '2024-06-04 18:00:00', 53),
    (407, '2024-06-06 16:00:00', '2024-06-06 18:00:00', 53);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (400, 'Sesión de "Introducción al Baloncesto" en la Concha Acustica.', 400),
    (401, 'Sesión de "Introducción al Baloncesto" en la Concha Acustica.', 401),
    (402, 'Sesión de "Yoga Deportivo" en en el salón 220-B del Polideportivo.', 402),
    (403, 'Sesión de "Yoga Deportivo" en en el salón 220-B del Polideportivo.', 403),
    (404, 'Sesión de "Entrenamiento Funcional" en en el salón 220-B del Polideportivo.', 404),
    (405, 'Sesión de "Entrenamiento Funcional" en en el salón 220-B del Polideportivo.', 405),
    (406, 'Sesión de "Running para Principiantes" en el Estadio Alfonso López Pumarejo.', 406),
    (407, 'Sesión de "Running para Principiantes" en el Estadio Alfonso López Pumarejo.', 407);

INSERT INTO bienestar_UN.SESION_CURSO_LIBRE 
    (ses_curlib_cur_nombre, ses_curlib_id, ses_curlib_eve_id) 
VALUES
    ('Sesión de "Introducción al Baloncesto"', 1, 400),
    ('Sesión de "Introducción al Baloncesto"', 1, 401),
    ('Sesión de "Yoga Deportivo"', 2, 402),
    ('Sesión de "Yoga Deportivo"', 2, 403),
    ('Sesión de "Entrenamiento Funcional"', 3, 404),
    ('Sesión de "Entrenamiento Funcional"', 3, 405),
    ('Sesión de "Running para Principiantes"', 4, 406),
    ('Sesión de "Running para Principiantes"', 4, 407);


-- -----------------------------------------------------
-- Inserción de inscripciones de personas a cursos libres
-- -----------------------------------------------------

INSERT INTO bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE 
    (curlib_id, per_DNI) 
VALUES
    (1, 200000000),
    (1, 200000001),
    (1, 200000002),
    (2, 200000003),
    (2, 111111121),
    (2, 111111122),
    (3, 111111123),
    (3, 111111124),
    (3, 200000020),
    (4, 200000021),
    (4, 200000022),
    (4, 200000023);
    

-- -----------------------------------------------------
-- Inserción de torneos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.TORNEO 
    (tor_id, tor_nombre, tor_depo_id) 
VALUES
    (1, 'Torneo interno de Baloncesto mixto 2023-1', 2),
    (2, 'Torneo interno de Tenis mixto 2024-2', 5);


-- -----------------------------------------------------
-- Inserción de equipos deportivos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.EQUIPO 
    (equi_id, equi_nombre) 
VALUES
    (1, 'Los tigres'),
    (2, 'Los leones'),
    (3, 'Las águilas'),
    (4, 'Las gallinas'),
    (5, 'Tenis - Equipo 1'),
    (6, 'Tenis - Equipo 2'),
    (7, 'Tenis - Equipo 3'),
    (8, 'Tenis - Equipo 4'),
    (9, 'Tenis - Equipo 5'),
    (10, 'Tenis - Equipo 6'),
    (11, 'Tenis - Equipo 7'),
    (12, 'Tenis - Equipo 8');


-- -----------------------------------------------------
-- Inserción de personas a equipos deportivos 
-- -----------------------------------------------------

INSERT INTO bienestar_UN.EQUIPO_TIENE_ESTUDIANTE 
    (equi_id, est_per_DNI) 
VALUES
    (1, 111111100),
    (1, 111111101),
    (1, 111111102),
    (1, 111111103),
    (1, 111111104),
    (2, 111111105),
    (2, 111111106),
    (2, 111111107),
    (2, 111111108),
    (2, 111111109),
    (3, 111111150),
    (3, 111111149),
    (3, 111111148),
    (3, 111111147),
    (3, 111111146),
    (4, 111111145),
    (4, 111111144),
    (4, 111111143),
    (4, 111111142),
    (4, 111111141),
    (5, 111111140),
    (5, 111111130),
    (5, 111111139),
    (5, 111111138),
    (6, 111111120),
    (7, 111111122),
    (8, 111111124),
    (9, 111111126),
    (10, 111111128),
    (11, 111111112),
    (12, 111111117);


-- -----------------------------------------------------
-- Inserción de encuentros deportivos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (600, '2024-05-07 16:00:00', '2024-05-07 18:00:00', 54),
    (601, '2024-05-08 16:00:00', '2024-05-08 18:00:00', 54),
    (602, '2024-05-10 16:00:00', '2024-05-10 18:00:00', 54),
    (603, '2024-09-03 14:00:00', '2024-09-03 16:00:00', 49),
    (604, '2024-09-03 14:00:00', '2024-09-03 16:00:00', 48),
    (605, '2024-09-04 16:00:00', '2024-09-04 18:00:00', 49),
    (606, '2024-09-04 16:00:00', '2024-09-04 18:00:00', 48),
    (607, '2024-09-17 14:00:00', '2024-09-17 16:00:00', 48),
    (608, '2024-09-18 14:00:00', '2024-09-18 16:00:00', 48),
    (609, '2024-09-23 14:00:00', '2024-09-23 16:00:00', 48);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (600, 'Semifinal #1 del Torneo interno de Baloncesto mixto 2023-1 en la Concha Acustica.', 600),
    (601, 'Semifinal #2 del Torneo interno de Baloncesto mixto 2023-1 en la Concha Acustica.', 601),
    (602, 'Final del Torneo interno de Baloncesto mixto 2023-1 en la Concha Acustica.', 602),
    (603, 'Cuartos de final #1 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 603),
    (604, 'Cuartos de final #2 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 604),
    (605, 'Cuartos de final #3 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 605),
    (606, 'Cuartos de final #4 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 606),
    (607, 'Semifinal #1 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 607),
    (608, 'Semifinal #2 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 608),
    (609, 'Final #1 del Torneo interno de Tenis mixto 2024-2 en la Cancha de Tenis .', 609);

INSERT INTO bienestar_UN.ENCUENTRO_DEPORTIVO 
    (enc_eve_id, enc_tor_id, enc_equi_gan_id)
VALUES
    (600, 1, 2), 
    (601, 1, 3), 
    (602, 1, 2), 
    (603, 2, NULL),
    (604, 2, NULL),
    (605, 2, NULL),
    (606, 2, NULL),
    (607, 2, NULL),
    (608, 2, NULL),
    (609, 2, NULL);


-- -----------------------------------------------------
-- Inserción de equipos a encuentros deportivos
-- -----------------------------------------------------

INSERT INTO bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO 
    (equi_id, enc_eve_id) 
VALUES
    (1, 600),
    (2, 600),
    (3, 601),
    (4, 601),
    (2, 602),
    (3, 602),
    (5, 603),
    (6, 603),
    (7, 604),
    (8, 604),
    (9, 605),
    (10, 605),
    (11, 606),
    (12, 606);
