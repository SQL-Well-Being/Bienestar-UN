USE bienestar_UN;

INSERT INTO bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL 
	(gru_id, gru_nombre, gru_cupos, gru_doc_per_DNI_director)
VALUES
    (200, "Música Andina", 20, 200000035),
    (201, "Gaitas y Tambores", 20, 200000039),
    (210, "Danza Salsa", 20, 200000035),
    (213, "Teatro Experimental", 20, 200000044),
    (215, "Narración Oral", 20, 200000044);


INSERT INTO bienestar_UN.TALLER_CULTURAL 
	(tall_id, tall_nombre, doc_per_DNI_tallerista)
VALUES
    (1, "Taller de Salsa y Merengue", 200000035),
    (2, "Taller de Danza Árabe", 200000036),
    (3, "Taller de Danza Africana", 200000036),
    (4, "Taller de Formación Actoral", 200000044),
    (5, "Taller de Técnica Vocal", 200000044),
    (6, "Taller de Salsa y Merengue", 200000035),
    (7, "Taller de Danza Árabe", 200000036),
    (8, "Taller de Danza Africana", 200000036),
    (9, "Taller de Formación Actoral", 200000044),
    (10, "Taller de Técnica Vocal", 200000044),
    (11, "Taller de Salsa y Merengue", 200000035),
    (12, "Taller de Danza Árabe", 200000036),
    (13, "Taller de Danza Africana", 200000036),
    (14, "Taller de Formación Actoral", 200000044),
    (15, "Taller de Técnica Vocal", 200000044);
    

INSERT INTO bienestar_UN.CONVOCATORIA_GAI 
	(con_gai_codigo, con_gai_descripcion, con_gai_periodo_academico, con_gai_gru_id)
VALUES
    (1, "Convocatoria para integrar el grupo de Música Andina", "2023-1", 200),
    (2, "Convocatoria para integrar el grupo de Gaitas y Tambores", "2023-1", 201),
    (3, "Convocatoria para integrar el grupo de Danza Salsa", "2023-1", 210),
    (4, "Convocatoria para integrar el grupo de Teatro Experimental", "2023-1", 213),
    (5, "Convocatoria para integrar el grupo de Narración Oral", "2023-1", 215),
    (6, "Convocatoria para integrar el grupo de Música Andina", "2023-2", 200),
    (7, "Convocatoria para integrar el grupo de Gaitas y Tambores", "2023-2", 201),
    (8, "Convocatoria para integrar el grupo de Danza Salsa", "2023-2", 210),
    (9, "Convocatoria para integrar el grupo de Teatro Experimental", "2023-2", 213),
    (10, "Convocatoria para integrar el grupo de Narración Oral", "2023-2", 215),
    (11, "Convocatoria para integrar el grupo de Música Andina", "2024-1", 200),
    (12, "Convocatoria para integrar el grupo de Gaitas y Tambores", "2024-1", 201),
    (13, "Convocatoria para integrar el grupo de Danza Salsa", "2024-1", 210),
    (14, "Convocatoria para integrar el grupo de Teatro Experimental", "2024-1", 213),
    (15, "Convocatoria para integrar el grupo de Narración Oral", "2024-1", 215);


INSERT INTO ESTUDIANTE_ASISTE_A_TALLER_CULTURAL 
	(tall_eve_id, est_per_DNI)
VALUES
    (1, 111111100),
    (1, 111111101),
    (2, 111111102),
    (2, 111111103);


INSERT INTO ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI 
	(con_gai_id, est_per_DNI, es_admitido)
VALUES
    (1, 111111100, 1),
    (1, 111111159, 1),
    (1, 111111158, 0),
    (2, 111111157, 1),
    (2, 111111156, 1),
    (2, 111111155, 0),
    (3, 111111154, 1),
    (3, 111111153, 1),
    (3, 111111152, 1),
    (4, 111111151, 0),
    (4, 111111150, 1),
    (4, 111111149, 0),
    (5, 111111148, 0),
    (5, 111111147, 1),
    (5, 111111146, 1),
    (6, 111111158, 0),
    (6, 111111144, 1),
    (6, 111111143, 1),
    (7, 111111142, 1),
    (7, 111111141, 1),
    (7, 111111140, 1),
    (8, 111111139, 0),
    (8, 111111138, 0),
    (8, 111111137, 1),
    (9, 111111136, 1),
    (9, 111111135, 0),
    (9, 111111134, 1),
    (10, 111111158, 0),
    (10, 111111132, 0),
    (10, 111111131, 0),
    (11, 111111158, 0),
    (11, 111111129, 0),
    (11, 111111128, 0),
    (12, 111111127, 0),
    (12, 111111135, 1),
    (12, 111111126, 1),
    (13, 111111125, 0),
    (13, 111111124, 1),
    (13, 111111123, 0),
    (14, 111111122, 0),
    (14, 111111121, 0),
    (14, 111111120, 1),
    (15, 111111119, 1),
    (15, 111111118, 0),
    (15, 111111117, 1);


INSERT INTO GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE 
	(gru_id, est_per_DNI)
VALUES
    (200, 111111100),
    (200, 111111159),
    (200, 111111144),
    (200, 111111143),
    (201, 111111157),
    (201, 111111156),
    (201, 111111142),
    (201, 111111141),
    (201, 111111140),
    (201, 111111135),
    (201, 111111126),
    (210, 111111154),
    (210, 111111153),
    (210, 111111152),
    (210, 111111137),
    (210, 111111124),
    (213, 111111150),
    (213, 111111136),
    (213, 111111134),
    (213, 111111120),
    (215, 111111117),
    (215, 111111119),
    (215, 111111147),
    (215, 111111146);