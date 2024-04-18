USE bienestar_UN;

INSERT INTO bienestar_UN.DEPORTE
    (depo_id, depo_nombre)
VALUES 
    (1, "FUTBOL"),
    (2, "BALONCESTO"),
    (3, "VOLEIBOL"),
    (4, "KARATE"),
    (5, "TENIS");


-- Selecciones deportivas

INSERT INTO bienestar_UN.SELECCION_DEPORTIVA
    (sel_id, sel_nombre, sel_cupos, sel_categoria, sel_depo_id, sel_doc_per_DNI_entrenador)
VALUES
    (1, "FUTBOL-MASCULINO", 30, "M", 1, 200000035),
    (2, "FUTBOL-FEMENINO", 30, "F", 1, 200000035),
    (3, "BALONCESTO-MASCULINO", 30, "M", 2, 200000036),
    (4, "BALONCESTO-FEMENINO", 30, "F",2, 200000036),
    (5, "VOLEIBOL-FEMENINO", 20, "F",3, 200000037),
    (6, "KARATE-FEMENINO", 20, "F",4, 200000038),
    (7, "TENIS-MASCULINO", 20, "M",5, 200000039);


-- Convocatorias selecciones

INSERT INTO bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA
    (con_sel_descripcion, con_sel_periodo_academico, con_sel_id)
VALUES
    ("Convocatoria para la seleccion masculina de futbol.", "2023-2", 1),
    ("Convocatoria para la seleccion femenina de futbol.", "2023-2", 2),
    ("Convocatoria para la seleccion masculina de baloncesto.", "2023-2", 3),
    ("Convocatoria para la seleccion femenina de baloncesto.", "2023-2", 4),
    ("Convocatoria para la seleccion femenina de voleibol.", "2023-2", 5),
    ("Convocatoria para la seleccion femenina de karate.", "2023-2", 6),
    ("Convocatoria para la seleccion masculina de TENIS.", "2023-2", 7),

    ("Convocatoria para la seleccion masculina de futbol.", "2024-1", 1),
    ("Convocatoria para la seleccion femenina de futbol.", "2024-1", 2),
    ("Convocatoria para la seleccion masculina de baloncesto.", "2024-1", 3),
    ("Convocatoria para la seleccion femenina de baloncesto.", "2024-1", 4),
    ("Convocatoria para la seleccion femenina de voleibol.", "2024-1", 5),
    ("Convocatoria para la seleccion femenina de karate.", "2024-1", 6),
    ("Convocatoria para la seleccion masculina de TENIS.", "2024-1", 7);


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
