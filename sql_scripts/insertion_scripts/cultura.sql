USE bienestar_UN;

-- IMPORTANTE: Ejecutar primero el script de inserciones del Sistema de información "sistema_de_informacion.sql"

-- -----------------------------------------------------
-- Inserción de grupos artísticos institucionales
-- -----------------------------------------------------

INSERT INTO bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL 
	(gru_id, gru_nombre, gru_cupos, gru_doc_per_DNI_director)
VALUES
    (200, 'Música Andina', 20, 200000035),
    (201, 'Gaitas y Tambores', 20, 200000039),
    (210, 'Danza Salsa', 20, 200000035),
    (213, 'Teatro Experimental', 20, 200000044),
    (215, 'Narración Oral', 20, 200000044); 


-- -----------------------------------------------------
-- Inserción de talleres culturales
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (900, '2024-05-20 14:00:00', '2024-05-20 16:00:00', 56),
    (901, '2024-05-21 14:00:00', '2024-05-21 16:00:00', 56),
    (902, '2024-05-22 14:00:00', '2024-05-22 16:00:00', 56),
    (903, '2024-05-23 14:00:00', '2024-05-23 16:00:00', 56),
    (904, '2024-06-01 11:00:00', '2024-06-01 13:00:00', 56);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (900, 'Taller de Salsa y Merengue en el salón 220-B del Polideportivo.', 900),
    (901, 'Taller de Formación Actoral en el salón 220-B del Polideportivo.', 901),
    (902, 'Taller de Técnica Vocal en el salón 220-B del Polideportivo.', 902),
    (903, 'Evento "Danza para la vida" en el salón 220-B del Polideportivo.', 903),
    (904, 'Evento "Pintatón por el medio" en el salón 220-B del Polideportivo.', 904);

INSERT INTO bienestar_UN.TALLER_CULTURAL 
	(tall_eve_id, tall_nombre, doc_per_DNI_tallerista)
VALUES
    (900, 'Taller de Salsa y Merengue', 200000035),
    (901, 'Taller de Formación Actoral', 200000044),
    (902, 'Taller de Técnica Vocal', 200000044),
    (903, 'Danza para la vida', 200000035),
    (904, 'Pintatón por el medio ambiente', 200000043);


-- -----------------------------------------------------
-- Inserción de convocatorias para grupos artísticos institucionales
-- -----------------------------------------------------

INSERT INTO bienestar_UN.CONVOCATORIA_GAI 
	(con_gai_codigo, con_gai_descripcion, con_gai_periodo_academico, con_gai_gru_id)
VALUES
    (1, 'Convocatoria para integrar el grupo de Música Andina', '2023-1', 200),
    (2, 'Convocatoria para integrar el grupo de Gaitas y Tambores', '2023-1', 201),
    (3, 'Convocatoria para integrar el grupo de Danza Salsa', '2023-1', 210),
    (4, 'Convocatoria para integrar el grupo de Teatro Experimental', '2023-1', 213),
    (5, 'Convocatoria para integrar el grupo de Narración Oral', '2023-1', 215),
    (6, 'Convocatoria para integrar el grupo de Música Andina', '2023-2', 200),
    (7, 'Convocatoria para integrar el grupo de Gaitas y Tambores', '2023-2', 201),
    (8, 'Convocatoria para integrar el grupo de Danza Salsa', '2023-2', 210),
    (9, 'Convocatoria para integrar el grupo de Teatro Experimental', '2023-2', 213),
    (10, 'Convocatoria para integrar el grupo de Narración Oral', '2023-2', 215),
    (11, 'Convocatoria para integrar el grupo de Música Andina', '2024-1', 200),
    (12, 'Convocatoria para integrar el grupo de Gaitas y Tambores', '2024-1', 201),
    (13, 'Convocatoria para integrar el grupo de Danza Salsa', '2024-1', 210),
    (14, 'Convocatoria para integrar el grupo de Teatro Experimental', '2024-1', 213),
    (15, 'Convocatoria para integrar el grupo de Narración Oral', '2024-1', 215);


-- -----------------------------------------------------
-- Inserción de asistencias de estudiantes a talleres culturales
-- -----------------------------------------------------

INSERT INTO ESTUDIANTE_ASISTE_A_TALLER_CULTURAL 
	(tall_eve_id, est_per_DNI)
VALUES
    (900, 111111101),
    (900, 111111102),
    (901, 111111100),
    (901, 111111101),
    (902, 111111103),
    (902, 111111104),
    (903, 111111102),
    (903, 111111104),
    (904, 111111103),
    (904, 111111104);


-- -----------------------------------------------------
-- Inserción de estudiantes a convocatorias para grupos artísticos institucionales
-- -----------------------------------------------------

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


-- -----------------------------------------------------
-- Inserción de estudiantes a grupos artísticos institucionales 
-- -----------------------------------------------------

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
