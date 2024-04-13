-- bienestar_UN.PERSONA
-- Inserciones en la tabla bienestar_UN.PERSONA
-- TODAS LAS SIGUIENTES PERSONAS SON ESTUDIANTES
INSERT INTO bienestar_UN.PERSONA (per_DNI, per_tipo_de_documento, per_fecha_nacimiento, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido, per_correo, per_telefono, per_sexo_biologico)
VALUES 
(111111100, 'CC', '1990-05-15 00:00:00', 'Juan', 'Pablo', 'González', 'Gómez', 'juanpablo@unal.edu.co', 3219876543, 'M'),
(111111101, 'CC', '1985-10-20 00:00:00', 'María', 'Isabel', 'Martínez', 'García', 'mariaisabel@gmail.com', 3001234567, 'F'),
(111111102, 'TI', '2004-04-07 00:00:00', 'Pedro', NULL, 'Sánchez', 'López', 'pedrosanchez@gmail.com', 3109876543, 'M'),
(111111103, 'TI', '2005-04-07 00:00:00', 'Ana', 'Lucía', 'Gutiérrez', 'Hernández', 'analucia@unal.edu.co', 3156789432, 'F'),
(111111104, 'CC', '1993-12-10 00:00:00', 'Carlos', 'Andrés', 'Rodríguez', 'Pérez', 'carlosandres@unal.edu.co', 3008765432, 'M'),
(111111105, 'TI', '2006-04-07 00:00:00', 'Laura', NULL, 'Díaz', 'Ramírez', 'laura@gmail.com', 3187654321, 'F'),
(111111106, 'CC', '1995-02-18 00:00:00', 'Javier', NULL, 'Martínez', 'Suárez', 'javier@unal.edu.co', 3109876543, 'M'),
(111111107, 'TI', '2007-04-07 00:00:00', 'Paula', 'Alejandra', 'García', 'Pérez', 'paulaalejandra@gmail.com', 3176543210, 'F'),
(111111108, 'TI', '2008-04-07 00:00:00', 'Andrés', 'Felipe', 'López', 'González', 'andresfelipe@unal.edu.co', 3009876543, 'M'),
(111111109, 'CC', '1994-06-05 00:00:00', 'Sofía', 'Camila', 'Hernández', 'Muñoz', 'sofiacamila@unal.edu.co', 3128765432, 'F'),
(111111110, 'CC', '1998-08-20 00:00:00', 'Luis', NULL, 'González', 'Rodríguez', 'luis@unal.edu.co', 3008765432, 'M'),
(111111111, 'TI', '2009-04-07 00:00:00', 'Elena', NULL, 'Pérez', 'Martínez', 'elena@gmail.com', 3187654321, 'F'),
(111111112, 'CC', '1996-11-12 00:00:00', 'Gabriel', NULL, 'Hernández', 'Gómez', 'gabriel@unal.edu.co', 3009876543, 'M'),
(111111113, 'TI', '2010-04-07 00:00:00', 'Camila', NULL, 'Rodríguez', 'López', 'camila@gmail.com', 3176543210, 'F'),
(111111114, 'CC', '1999-03-25 00:00:00', 'Alejandro', 'José', 'Gómez', 'Pérez', 'alejandro@unal.edu.co', 3123456789, 'M'),
(111111115, 'TI', '2011-04-07 00:00:00', 'Laura', 'María', 'Ramírez', 'García', 'lauramaria@gmail.com', 3234567890, 'F'),
(111111116, 'CC', '1992-07-30 00:00:00', 'Fernando', NULL, 'Martínez', 'Gómez', 'fernando@unal.edu.co', 3101234567, 'M'),
(111111117, 'TI', '2012-04-07 00:00:00', 'Sara', NULL, 'López', 'Hernández', 'sara@gmail.com', 3187654321, 'F'),
(111111118, 'CC', '1995-02-18 00:00:00', 'Diego', NULL, 'González', 'Martínez', 'diego@unal.edu.co', 3109876543, 'M'),
(111111119, 'TI', '2013-04-07 00:00:00', 'Luisa', NULL, 'Pérez', 'Gómez', 'luisa@gmail.com', 3176543210, 'F');

-- TODAS LAS SIGUIENTES PERSONAS SON DOCENTES
INSERT INTO bienestar_UN.PERSONA (per_DNI, per_tipo_de_documento, per_fecha_nacimiento, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido, per_direccion, per_correo, per_telefono, per_sexo_biologico) VALUES 
(200000000, 'CC', '1995-04-20 00:00:00', 'Juan', 'Manuel', 'García', 'Pérez', 'Calle 123', 'juan@gmail.com', 3216549870, 'M'),
(200000001, 'CC', '1990-10-03 00:00:00', 'Pedro', 'José', 'Gómez', 'González', 'Avenida 678', 'pedro@gmail.com', 3109876541, 'M'),
(200000002, 'CC', '1987-12-25 00:00:00', 'Andrés', NULL, 'Martínez', 'Gómez', 'Carrera 21', 'andres@gmail.com', 3187654321, 'M'),
(200000003, 'CC', '1976-09-18 00:00:00', 'Carlos', 'Alberto', 'Hernández', 'López', 'Avenida 753', 'carlos@gmail.com', 3209876541, 'M'),
(200000004, 'CC', '1983-06-07 00:00:00', 'Ana', 'María', 'Díaz', 'Pérez', 'Carrera 147', 'ana@gmail.com', 3165487932, 'F'),
(200000005, 'CC', '1993-08-14 00:00:00', 'Javier', 'Andrés', 'Pérez', 'Martínez', 'Calle 753', 'javier@gmail.com', 3159874123, 'M'),
(200000006, 'CC', '1985-05-06 00:00:00', 'Sofía', NULL, 'Ramírez', 'López', 'Carrera 159', 'sofia@gmail.com', 3196547823, 'F'),
(200000007, 'CC', '1980-02-28 00:00:00', 'Diego', NULL, 'Fernández', 'Gómez', 'Carrera 753', 'diego@gmail.com', 3125487963, 'M'),
(200000008, 'CC', '1972-06-30 00:00:00', 'Luisa', NULL, 'Pérez', 'Gómez', 'Carrera 159', 'luisa@gmail.com', 3102589632, 'F'),
(200000009, 'CC', '1976-09-18 00:00:00', 'Carlos', 'Alberto', 'Hernández', 'López', 'Avenida 753', 'carlos@gmail.com', 3209876541, 'M'),
(200000010, 'CC', '1983-06-07 00:00:00', 'Ana', 'María', 'Díaz', 'Pérez', 'Carrera 147', 'ana@gmail.com', 3165487932, 'F'),
(200000011, 'CC', '1993-08-14 00:00:00', 'Javier', 'Andrés', 'Pérez', 'Martínez', 'Calle 753', 'javier@gmail.com', 3159874123, 'M'),
(200000012, 'CC', '1985-05-06 00:00:00', 'Sofía', NULL, 'Ramírez', 'López', 'Carrera 159', 'sofia@gmail.com', 3196547823, 'F'),
(200000013, 'CC', '1980-02-28 00:00:00', 'Diego', NULL, 'Fernández', 'Gómez', 'Carrera 753', 'diego@gmail.com', 3125487963, 'M'),
(200000014, 'CC', '1972-06-30 00:00:00', 'Luisa', NULL, 'Pérez', 'Gómez', 'Carrera 159', 'luisa@gmail.com', 3102589632, 'F'),
(200000015, 'CC', '1983-06-07 00:00:00', 'Ana', 'María', 'Díaz', 'Pérez', 'Carrera 147', 'ana@gmail.com', 3165487932, 'F'),
(200000016, 'CC', '1993-08-14 00:00:00', 'Javier', 'Andrés', 'Pérez', 'Martínez', 'Calle 753', 'javier@gmail.com', 3159874123, 'M'),
(200000017, 'CC', '1985-05-06 00:00:00', 'Sofía', NULL, 'Ramírez', 'López', 'Carrera 159', 'sofia@gmail.com', 3196547823, 'F'),
(200000018, 'CC', '1980-02-28 00:00:00', 'Diego', NULL, 'Fernández', 'Gómez', 'Carrera 753', 'diego@gmail.com', 3125487963, 'M'),
(200000019, 'CC', '1972-06-30 00:00:00', 'Luisa', NULL, 'Pérez', 'Gómez', 'Carrera 159', 'luisa@gmail.com', 3102589632, 'F');

-- TODAS LAS SIGUIENTES PERSONAS SON FUNCIONARIOS
INSERT INTO bienestar_UN.PERSONA (per_DNI, per_tipo_de_documento, per_fecha_nacimiento, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido, per_direccion, per_correo, per_telefono, per_sexo_biologico) VALUES 
(200000020, 'CC', '1988-09-15 00:00:00', 'Gabriel', 'Alejandro', 'González', 'Pérez', 'Carrera 753', 'gabriel@gmail.com', 3102589632, 'M'),
(200000021, 'CC', '1975-11-22 00:00:00', 'Verónica', NULL, 'Hernández', 'Gómez', 'Calle 159', 'veronica@gmail.com', 3196547823, 'F'),
(200000022, 'CC', '1992-07-08 00:00:00', 'Fernando', 'José', 'López', 'Martínez', 'Carrera 456', 'fernando@gmail.com', 3125487963, 'M'),
(200000023, 'CC', '1983-04-30 00:00:00', 'Luisa', 'María', 'Martínez', 'García', 'Avenida 963', 'luisamaria@gmail.com', 3165487932, 'F'),
(200000024, 'CC', '1990-12-05 00:00:00', 'Carlos', NULL, 'Gómez', 'López', 'Carrera 987', 'carlos@gmail.com', 3159874123, 'M'),
(200000025, 'CC', '1988-02-18 00:00:00', 'Andrea', 'Carolina', 'Ramírez', 'Hernández', 'Calle 753', 'andrea@gmail.com', 3196547823, 'F'),
(200000026, 'CC', '1979-05-25 00:00:00', 'David', NULL, 'Hernández', 'Gómez', 'Avenida 456', 'david@gmail.com', 3125487963, 'M'),
(200000027, 'CC', '1985-09-10 00:00:00', 'Laura', 'Isabel', 'Gómez', 'Martínez', 'Carrera 852', 'laura@gmail.com', 3165487932, 'F'),
(200000028, 'CC', '1996-08-14 00:00:00', 'Santiago', NULL, 'Martínez', 'Gómez', 'Calle 159', 'santiago@gmail.com', 3159874123, 'M'),
(200000029, 'CC', '1987-04-20 00:00:00', 'María', 'José', 'López', 'Hernández', 'Carrera 987', 'maria@gmail.com', 3196547823, 'F'),
(200000030, 'CC', '1994-11-05 00:00:00', 'Alejandro', 'Andrés', 'Ramírez', 'López', 'Calle 753', 'alejandro@gmail.com', 3196547823, 'M'),
(200000031, 'CC', '1983-06-27 00:00:00', 'Isabella', NULL, 'Gómez', 'Pérez', 'Avenida 456', 'isabella@gmail.com', 3125487963, 'F'),
(200000032, 'CC', '1989-10-18 00:00:00', 'Juan', 'Pablo', 'Hernández', 'Martínez', 'Carrera 852', 'juan@gmail.com', 3165487932, 'M'),
(200000033, 'CC', '1998-03-07 00:00:00', 'Camila', 'Andrea', 'Martínez', 'Gómez', 'Calle 159', 'camila@gmail.com', 3159874123, 'F'),
(200000034, 'CC', '1977-08-23 00:00:00', 'Pedro', NULL, 'Gómez', 'Hernández', 'Carrera 987', 'pedro@gmail.com', 3196547823, 'M');

-- TODAS LAS SIGUIENTES PERSONAS SON DOCENTES EXTRACURRICULARES
INSERT INTO bienestar_UN.PERSONA (per_DNI, per_tipo_de_documento, per_fecha_nacimiento, per_primer_nombre, per_segundo_nombre, per_primer_apellido, per_segundo_apellido, per_direccion, per_correo, per_telefono, per_sexo_biologico) VALUES 
(200000035, 'CC', '1990-05-12', 'María', 'Fernanda', 'González', 'Pérez', 'Carrera 24', 'maria@gmail.com', 3115487231, 'F'),
(200000036, 'CC', '1988-03-18', 'José', 'Luis', 'Martínez', 'Gómez', 'Calle 45', 'jose@gmail.com', 3156987423, 'M'),
(200000037, 'CC', '1995-09-30', 'Camila', 'Andrea', 'Hernández', 'López', 'Avenida 34', 'camila@gmail.com', 3205487231, 'F'),
(200000038, 'CC', '1982-07-24', 'Juan', 'Esteban', 'Díaz', 'Pérez', 'Carrera 56', 'juan@gmail.com', 3106987423, 'M'),
(200000039, 'CC', '1998-11-14', 'Laura', 'Valentina', 'Ramírez', 'Gómez', 'Calle 78', 'laura@gmail.com', 3185487231, 'F'),
(200000040, 'CC', '1987-01-08', 'Andrés', 'Felipe', 'Fernández', 'López', 'Avenida 90', 'andres@gmail.com', 3146987423, 'M'),
(200000041, 'CC', '1993-04-20', 'Juliana', 'María', 'Gómez', 'Pérez', 'Carrera 23', 'juliana@gmail.com', 3115487231, 'F'),
(200000042, 'CC', '1989-12-01', 'Carlos', 'Alberto', 'Hernández', 'Gómez', 'Calle 56', 'carlos@gmail.com', 3176987423, 'M'),
(200000043, 'CC', '1996-08-05', 'Sara', 'Alejandra', 'Martínez', 'López', 'Avenida 78', 'sara@gmail.com', 3135487231, 'F'),
(200000044, 'CC', '1984-10-30', 'David', 'Andrés', 'Díaz', 'Pérez', 'Carrera 45', 'david@gmail.com', 3196987423, 'M');


-- Inserciones bienestar_UN.PERFIL_DE_SALUD
INSERT INTO bienestar_UN.PERFIL_DE_SALUD (perfsalud_id, perfsalud_peso, perfsalud_RH, perfsalud_estatura) VALUES 
(1, 65.5, 'A+', 1.75),
(2, 70.2, 'B-', 1.80),
(3, 55.8, 'O+', 1.68),
(4, 60.0, 'AB+', 1.72),
(5, 72.9, 'A-', 1.78),
(6, 68.3, 'B+', 1.82),
(7, 75.6, 'O-', 1.70),
(8, 63.4, 'AB-', 1.65),
(9, 70.0, 'A+', 1.75),
(10, 68.7, 'B-', 1.80),
(11, 60.5, 'O+', 1.68),
(12, 70.2, 'AB+', 1.72),
(13, 74.3, 'A-', 1.78),
(14, 68.9, 'B+', 1.82),
(15, 80.2, 'O-', 1.70),
(16, 61.8, 'AB-', 1.65),
(17, 68.0, 'A+', 1.75),
(18, 66.3, 'B-', 1.80),
(19, 58.9, 'O+', 1.68),
(20, 63.2, 'AB+', 1.72);



-- Inserciones: bienestar_UN.ESTUDIANTE
INSERT INTO bienestar_UN.ESTUDIANTE (est_per_DNI, est_PBM, est_es_peama, est_es_paes, est_perfsalud_id) VALUES 
(111111100, 76, 0, 0, 1),
(111111101, 82, 1, 0, 2),
(111111102, 93, 0, 1, 3),
(111111103, 45, 1, 0, 4),
(111111104, 67, 0, 0, 5),
(111111105, 88, 0, 1, 6),
(111111106, 72, 1, 0, 7),
(111111107, 65, 0, 0, 8),
(111111108, 80, 0, 1, 9),
(111111109, 91, 0, 0, 10),
(111111110, 53, 1, 0, 11),
(111111111, 78, 0, 0, 12),
(111111112, 86, 1, 0, 13),
(111111113, 60, 0, 1, 14),
(111111114, 75, 1, 0, 15),
(111111115, 89, 0, 0, 16),
(111111116, 47, 0, 1, 17),
(111111117, 68, 1, 0, 18),
(111111118, 92, 0, 0, 19),
(111111119, 64, 0, 1, 20);

-- INSERCIONES: FUNCIONARIO
INSERT INTO bienestar_UN.FUNCIONARIO (fun_per_id) VALUES 
(200000020),
(200000021),
(200000022),
(200000023),
(200000024),
(200000025),
(200000026),
(200000027),
(200000028),
(200000029),
(200000030),
(200000031),
(200000032),
(200000033),
(200000034);

-- Facultades
INSERT INTO bienestar_UN.FACULTAD (fac_id, fac_nombre) VALUES 
(1, 'Facultad de Ingeniería'),
(2, 'Facultad de Artes'),
(3, 'Facultad de Ciencias Agrarias'),
(4, 'Facultad de Enfermería'),
(5, 'Facultad de Derecho, Ciencias Políticas y Sociales'),
(6, 'Facultad de Ciencias Humanas'),
(7, 'Facultad de Ciencias'),
(8, 'Facultad de Ciencias Económicas'),
(9, 'Facultad de Medicina'),
(10, 'Facultad de Odontología'),
(11, 'Facultad de Medicina Veterinaria y de Zootecnia');

-- Departamentos: Facultad de Ingeniería
INSERT INTO bienestar_UN.DEPARTAMENTO (dep_id, dep_nombre, dep_fac_id) VALUES 
(1, 'Departamento de Ingeniería Civil y Agrícola', 1),
(2, 'Departamento de Ingeniería de Sistemas e Industrial', 1),
(3, 'Departamento de Ingeniería Eléctrica y Electrónica', 1),
(4, 'Departamento de Ingeniería Mecánica y Mecatrónica', 1),
(5, 'Departamento de Ingeniería Química y Ambiental', 1),
(6, 'Instituto de Investigación y Extensión', 1);


-- DOCENTES ACADÉMICOS DE LA FACULTAD DE INGENIERÍA:
-- TODAS LAS SIGUIENTES PERSONAS SON DOCENTES
INSERT INTO bienestar_UN.DOCENTE (doc_per_DNI, doc_biografia, doc_dep_id) VALUES 
(200000000, 'Ingeniero civil con experiencia en proyectos de infraestructura vial.', 1),
(200000001, 'Experto en sistemas de información empresarial con más de 10 años de experiencia en consultoría tecnológica.', 2),
(200000002, 'Ingeniero eléctrico especializado en sistemas de control automático.', 3),
(200000003, 'Ingeniero mecánico con experiencia en diseño y manufactura de componentes mecánicos.', 4),
(200000004, 'Ingeniera química con experiencia en procesos de tratamiento de aguas residuales.', 5),
(200000005, 'Experto en sistemas de información empresarial con más de 10 años de experiencia en consultoría tecnológica.', 2),
(200000006, 'Ingeniera eléctrica con interés en investigación de sistemas de energía renovable.', 3),
(200000007, 'Ingeniero mecánico con experiencia en diseño y manufactura de componentes mecánicos.', 4),
(200000008, 'Ingeniera química con experiencia en procesos de tratamiento de aguas residuales.', 5),
(200000009, 'Ingeniero civil con experiencia en proyectos de infraestructura vial.', 1),
(200000010, 'Experto en sistemas de información empresarial con más de 10 años de experiencia en consultoría tecnológica.', 2),
(200000011, 'Ingeniero eléctrico especializado en sistemas de control automático.', 3),
(200000012, 'Ingeniero mecánico con experiencia en diseño y manufactura de componentes mecánicos.', 4),
(200000013, 'Ingeniera química con experiencia en procesos de tratamiento de aguas residuales.', 5),
(200000014, 'Experto en sistemas de información empresarial con más de 10 años de experiencia en consultoría tecnológica.', 2),
(200000015, 'Ingeniera eléctrica con interés en investigación de sistemas de energía renovable.', 3),
(200000016, 'Ingeniero mecánico con experiencia en diseño y manufactura de componentes mecánicos.', 4),
(200000017, 'Ingeniera química con experiencia en procesos de tratamiento de aguas residuales.', 5),
(200000018, 'Ingeniero civil con experiencia en proyectos de infraestructura vial.', 1),
(200000019, 'Experto en sistemas de información empresarial con más de 10 años de experiencia en consultoría tecnológica.', 2);


-- DOCENTES ACTIVIDADES EXTRACURRICULARES
INSERT INTO bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (doc_per_id) VALUES 
(200000035),
(200000036),
(200000037),
(200000038),
(200000039),
(200000040),
(200000041),
(200000042),
(200000043),
(200000044);

