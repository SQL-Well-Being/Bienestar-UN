USE bienestar_UN;

-- IMPORTANTE: Ejecutar primero el script de inserciones del Sistema de información "sistema_de_informacion.sql"

-- -----------------------------------------------------
-- Inserción de discapacidades
-- -----------------------------------------------------

INSERT INTO bienestar_UN.DISCAPACIDAD 
    (dis_id, dis_nombre) 
VALUES 
    (1, 'Discapacidad visual, como ceguera o baja visión.'),
    (2, 'Discapacidad auditiva, incluyendo sordera o pérdida de audición.'),
    (3, 'Discapacidad física, como parálisis o amputaciones.'),
    (4, 'Discapacidad intelectual, que afecta las habilidades cognitivas y de aprendizaje.'),
    (5, 'Trastorno del espectro autista, que afecta la comunicación y el comportamiento social.'),
    (6, 'Discapacidad del habla, que dificulta la comunicación verbal.'),
    (7, 'Discapacidad emocional, que impacta la regulación emocional y el bienestar psicológico.');


-- -----------------------------------------------------
-- Inserción de discapacidades a perfiles de salud
-- -----------------------------------------------------

INSERT INTO bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD 
    (dis_id, perfsalud_id) 
VALUES
    (1, 5),
    (2, 10),
    (3, 15),
    (4, 20),
    (5, 25),
    (6, 30),
    (7, 35);


-- -----------------------------------------------------
-- Inserción de incapacidades de personas
-- -----------------------------------------------------

INSERT INTO bienestar_UN.INCAPACIDAD 
    (inc_fecha_inicio, inc_fecha_fin, inc_est_per_DNI) 
VALUES
    ('2023-01-10 00:00:00', '2023-01-20 00:00:00', 111111100),
    ('2023-02-05 00:00:00', '2023-02-15 00:00:00', 111111101),
    ('2023-03-12 00:00:00', '2023-03-22 00:00:00', 111111102),
    ('2023-04-18 00:00:00', '2023-04-28 00:00:00', 111111103),
    ('2023-05-25 00:00:00', '2023-06-04 00:00:00', 111111100),
    ('2023-06-30 00:00:00', '2023-07-10 00:00:00', 111111103),
    ('2023-07-15 00:00:00', '2023-07-25 00:00:00', 111111100),
    ('2023-08-20 00:00:00', '2023-08-30 00:00:00', 111111122),
    ('2023-09-10 00:00:00', '2023-09-20 00:00:00', 111111130),
    ('2023-10-05 00:00:00', '2023-10-15 00:00:00', 111111140),
    ('2023-11-12 00:00:00', '2023-11-22 00:00:00', 111111100);


-- -----------------------------------------------------
-- Inserción de eventos de salud
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id) 
VALUES
    (200, '2024-04-15 08:00:00', '2024-04-15 10:00:00', 44),
    (201, '2024-04-17 10:00:00', '2024-04-17 12:00:00', 45),
    (202, '2024-04-19 13:00:00', '2024-04-19 15:00:00', 46),
    (203, '2024-04-20 14:00:00', '2024-04-20 16:00:00', 55),
    (204, '2024-04-22 10:00:00', '2024-04-22 18:00:00', 54),
    (205, '2024-04-24 09:00:00', '2024-04-24 11:00:00', 44);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id) 
VALUES
    (200, 'Taller de Nutrición y Alimentación Saludable para Estudiantes Universitarios en el auditorio A de la facultad de ingeniería.', 200),
    (201, 'Charla sobre Estrategias para Manejar el Estrés y la Ansiedad en la Vida Universitaria, invitados especiales del exterior.', 201),
    (202, 'Sesión de Ejercicios de Respiración y Relajación para Mejorar la Salud Mental, se llevará a cabo por parte de la sección de Bienestar de la Universidad.', 202),
    (203, 'Conferencia sobre Importancia de la Actividad Física Regular en la Prevención de Enfermedades.', 203),
    (204, 'Sesión de donación de sangre, por parte de la alcadia de Bogotá. Se invita a los estudiantes de sede a donar.', 204),
    (205, 'Sesión de Consulta Médica Gratuita para Estudiantes Universitarios.', 205);

INSERT INTO bienestar_UN.SESION_EVENTO_SALUD 
    (ses_salud_eve_id, ses_salud_nombre) 
VALUES
    (200, 'Taller de Nutrición y Alimentación Saludable para Estudiantes Universitarios'),
    (201, 'Charla sobre Estrategias para Manejar el Estrés y la Ansiedad en la Vida Universitaria'),
    (202, 'Sesión de Ejercicios de Respiración y Relajación para Mejorar la Salud Mental'),
    (203, 'Conferencia sobre Importancia de la Actividad Física Regular en la Prevención de Enfermedades'),
    (204, 'Sesión de donación de sangre'),
    (205, 'Sesión de Consulta Médica Gratuita para Estudiantes Universitarios');


-- -----------------------------------------------------
-- Inserción de citas de salud individuales
-- -----------------------------------------------------

INSERT INTO bienestar_UN.RESERVACION 
    (res_id, res_fecha_inicial, res_fecha_fin, res_esp_id)
VALUES
    (300, '2024-04-15 09:00:00', '2024-04-15 09:30:00', 10),
    (301, '2024-04-15 10:00:00', '2024-04-15 10:30:00', 10),
    (302, '2024-04-15 11:00:00', '2024-04-15 11:30:00', 10),
    (303, '2024-04-16 09:00:00', '2024-04-16 09:30:00', 11),
    (304, '2024-04-16 10:00:00', '2024-04-16 10:30:00', 11),
    (305, '2024-04-16 11:00:00', '2024-04-16 11:30:00', 11),
    (306, '2024-04-17 09:00:00', '2024-04-17 09:30:00', 12),
    (307, '2024-04-17 10:00:00', '2024-04-17 10:30:00', 12),
    (308, '2024-04-17 11:00:00', '2024-04-17 11:30:00', 12),
    (309, '2024-04-18 09:00:00', '2024-04-18 09:30:00', 13),
    (310, '2024-04-18 10:00:00', '2024-04-18 10:30:00', 13),
    (311, '2024-04-18 11:00:00', '2024-04-18 11:30:00', 13);

INSERT INTO bienestar_UN.EVENTO_GENERAL 
    (eve_id, eve_descripcion, eve_res_id)
VALUES
    (300, 'Cita individual en consultorio A para Juan Pablo González Gómez a las 09:00 am', 300),
    (301, 'Cita individual en consultorio A para María Isabel Martínez García a las 10:00 am', 301),
    (302, 'Cita individual en consultorio A para Pedro Sánchez López a las 11:00 am', 302),
    (303, 'Cita individual en consultorio B para Ana Lucía Gutiérrez Hernández a las 09:00 am', 303),
    (304, 'Cita individual en consultorio B para Carlos Andrés Rodríguez Pérez a las 10:00 am', 304),
    (305, 'Cita individual en consultorio B para Laura Díaz Ramírez a las 11:00 am', 305),
    (306, 'Cita individual en consultorio C para Javier Martínez Suárez a las 09:00 am', 306),
    (307, 'Cita individual en consultorio C para Paula Alejandra García Pérez a las 10:00 am', 307),
    (308, 'Cita individual en consultorio C para Andrés Felipe López González a las 11:00 am', 308),
    (309, 'Cita individual en consultorio D para Sofía Camila Hernández Muñoz a las 09:00 am', 309),
    (310, 'Cita individual en consultorio D para Luis González Rodríguez a las 10:00 am', 310),
    (311, 'Cita individual en consultorio D para Elena Pérez Martínez a las 11:00 am', 311);

INSERT INTO bienestar_UN.CITA_INDIVIDUAL 
    (cit_tipo, cit_est_per_DNI, cit_fun_per_DNI, cit_eve_id)
VALUES
    ('Examen médico', 111111100, 200000020, 300),
    ('Consulta médica', 111111101, 200000021, 301),
    ('Consulta psicológica', 111111102, 200000022, 302),
    ('Consulta médica', 111111103, 200000023, 303),
    ('Consulta nutricional', 111111104, 200000024, 304),
    ('Consulta médica', 111111105, 200000025, 305),
    ('Examen médico', 111111106, 200000026, 306),
    ('Consulta médica', 111111107, 200000027, 307),
    ('Consulta psicológica', 111111108, 200000028, 308),
    ('Consulta médica', 111111109, 200000029, 309),
    ('Consulta nutricional', 111111110, 200000030, 310),
    ('Consulta médica', 111111111, 200000031, 311);


-- -----------------------------------------------------
-- Inserción de asistencias de estudiantes a eventos de salud
-- -----------------------------------------------------

INSERT INTO bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD 
    (ses_salud_ses_id, est_per_DNI) 
VALUES
    (200, 111111100),
    (200, 111111101),
    (200, 111111102),
    (201, 111111103),
    (201, 111111104),
    (201, 111111105),
    (202, 111111106),
    (202, 111111107),
    (202, 111111108),
    (203, 111111109),
    (203, 111111110),
    (203, 111111111),
    (204, 111111112),
    (204, 111111113),
    (204, 111111114),
    (205, 111111115),
    (205, 111111116),
    (205, 111111117),
    (200, 111111118),
    (200, 111111119),
    (200, 111111120),
    (201, 111111121),
    (201, 111111122),
    (201, 111111123),
    (202, 111111124),
    (202, 111111125),
    (202, 111111126),
    (203, 111111127),
    (203, 111111128),
    (203, 111111129),
    (204, 111111130),
    (204, 111111131),
    (204, 111111132),
    (205, 111111133),
    (205, 111111134),
    (205, 111111135),
    (200, 111111136),
    (200, 111111137),
    (200, 111111138),
    (201, 111111139),
    (201, 111111140),
    (201, 111111141),
    (202, 111111142),
    (202, 111111143),
    (202, 111111144),
    (203, 111111145),
    (203, 111111146),
    (203, 111111147),
    (204, 111111148),
    (204, 111111149),
    (204, 111111150),
    (205, 111111151),
    (205, 111111152),
    (205, 111111153),
    (200, 111111154),
    (200, 111111155),
    (200, 111111156),
    (201, 111111157),
    (201, 111111158),
    (201, 111111159),
    (202, 111111100),
    (202, 111111101),
    (202, 111111102),
    (203, 111111103),
    (203, 111111104),
    (203, 111111105),
    (204, 111111106),
    (204, 111111107),
    (204, 111111108),
    (205, 111111109),
    (205, 111111110),
    (205, 111111111),
    (200, 111111112),
    (200, 111111113),
    (200, 111111114),
    (201, 111111115),
    (201, 111111116),
    (201, 111111117),
    (202, 111111118),
    (202, 111111119),
    (202, 111111120),
    (203, 111111121),
    (203, 111111122),
    (203, 111111123),
    (204, 111111124),
    (204, 111111125),
    (204, 111111126),
    (205, 111111127),
    (205, 111111128),
    (205, 111111129),
    (200, 111111130),
    (200, 111111131),
    (200, 111111132),
    (201, 111111133),
    (201, 111111134),
    (201, 111111135);
