-- -----------------------------------------------------
-- Schema bienestar_UN
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS bienestar_UN DEFAULT CHARACTER SET utf8 ;
USE bienestar_UN ;

-- In order to uncomment the index definition lines use the following regular expression (without quotation marks):
-- find: "-- \(UNIQUE INDEX\) -- ([^-]*) --" or "-- \(INDEX\) -- ([^-]*) --" 
-- replace: $1

-- -----------------------------------------------------
-- Table bienestar_UN.PERSONAvariable
-- -----------------------------------------------------

DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO ;
DROP TABLE IF EXISTS bienestar_UN.PROYECTO_TIENE_FACULTAD ;
DROP TABLE IF EXISTS bienestar_UN.SESION_CURSO_LIBRE ;
DROP TABLE IF EXISTS bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE ;
DROP TABLE IF EXISTS bienestar_UN.CURSO_LIBRE ;
DROP TABLE IF EXISTS bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO ;
DROP TABLE IF EXISTS bienestar_UN.EQUIPO_TIENE_ESTUDIANTE ;
DROP TABLE IF EXISTS bienestar_UN.EQUIPO ;
DROP TABLE IF EXISTS bienestar_UN.ENCUENTRO_DEPORTIVO ;
DROP TABLE IF EXISTS bienestar_UN.TORNEO ;
DROP TABLE IF EXISTS bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE ;
DROP TABLE IF EXISTS bienestar_UN.SEMILLERO_DEPORTIVO_TIENE_ESTUDIANTE ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SEMILLERO_DEPORTIVO ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA ;
DROP TABLE IF EXISTS bienestar_UN.ENTRENAMIENTO_SELECCION ;
DROP TABLE IF EXISTS bienestar_UN.ENTRENAMIENTO_SEMILLERO ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_SEMILLERO_DEPORTIVO ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA ;
DROP TABLE IF EXISTS bienestar_UN.SEMILLERO_DEPORTIVO ;
DROP TABLE IF EXISTS bienestar_UN.SELECCION_DEPORTIVA ;
DROP TABLE IF EXISTS bienestar_UN.DEPORTE ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_GAI ;
DROP TABLE IF EXISTS bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE ;
DROP TABLE IF EXISTS bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL ;
DROP TABLE IF EXISTS bienestar_UN.TALLER_CULTURAL ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER ;
DROP TABLE IF EXISTS bienestar_UN.CITA_DE_ASESORIA ;
DROP TABLE IF EXISTS bienestar_UN.SESION_DE_ACOMPANAMIENTO ;
DROP TABLE IF EXISTS bienestar_UN.SESION_DE_TALLER ;
DROP TABLE IF EXISTS bienestar_UN.PROYECTO_TIENE_ESTUDIANTES ;
DROP TABLE IF EXISTS bienestar_UN.PARTICIPACION_PGP ;
DROP TABLE IF EXISTS bienestar_UN.PROYECTO ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_PGP ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD ;
DROP TABLE IF EXISTS bienestar_UN.CITA_INDIVIDUAL ;
DROP TABLE IF EXISTS bienestar_UN.SESION_EVENTO_SALUD ;
DROP TABLE IF EXISTS bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD ;
DROP TABLE IF EXISTS bienestar_UN.DISCAPACIDAD ;
DROP TABLE IF EXISTS bienestar_UN.INCAPACIDAD ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_ESPECIFICA ;
DROP TABLE IF EXISTS bienestar_UN.CONVOCATORIA_GENERAL ;
DROP TABLE IF EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO ;
DROP TABLE IF EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_ECONOMICA ;
DROP TABLE IF EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_DE_TRANSPORTE ;
DROP TABLE IF EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_ALIMENTARIA ;
DROP TABLE IF EXISTS bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION ;
DROP TABLE IF EXISTS bienestar_UN.EVENTO_GENERAL ;
DROP TABLE IF EXISTS bienestar_UN.RESERVACION ;
DROP TABLE IF EXISTS bienestar_UN.ESPACIO ;
DROP TABLE IF EXISTS bienestar_UN.EDIFICIO ;
DROP TABLE IF EXISTS bienestar_UN.ASIGNATURA_CURSADA ;
DROP TABLE IF EXISTS bienestar_UN.HISTORIA_ACADEMICA ;
DROP TABLE IF EXISTS bienestar_UN.PROGRAMA_CURRICULAR ;
DROP TABLE IF EXISTS bienestar_UN.ASIGNATURA ;
DROP TABLE IF EXISTS bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR ;
DROP TABLE IF EXISTS bienestar_UN.DOCENTE ;
DROP TABLE IF EXISTS bienestar_UN.DEPARTAMENTO ;
DROP TABLE IF EXISTS bienestar_UN.FACULTAD ;
DROP TABLE IF EXISTS bienestar_UN.FUNCIONARIO ;
DROP TABLE IF EXISTS bienestar_UN.ESTUDIANTE ;
DROP TABLE IF EXISTS bienestar_UN.PERFIL_DE_SALUD ;
DROP TABLE IF EXISTS bienestar_UN.PERSONA ;

CREATE TABLE IF NOT EXISTS bienestar_UN.PERSONA (
  per_DNI INT NOT NULL COMMENT 'DNI o documento nacional de identidad de la persona. Este identifica únicamente a la persona.',
  per_tipo_de_documento ENUM("CC", "TI") NOT NULL DEFAULT 'CC' COMMENT 'Tipo de documento de la persona.',
  per_fecha_nacimiento DATETIME NOT NULL COMMENT 'Fecha de nacimiento de la persona.',
  per_primer_nombre VARCHAR(45) NOT NULL COMMENT 'Primer nombre de la persona, es requerido.',
  per_segundo_nombre VARCHAR(45) NULL COMMENT 'El segundo nombre no es requerido para la creación de la persona.',
  per_primer_apellido VARCHAR(45) NOT NULL COMMENT 'El primer apellido de la persona es requerido para su creación en la base de datos.',
  per_segundo_apellido VARCHAR(45) NULL COMMENT 'El segundo apellido de una persona. No es extrictamente requerido para la creación en la base de datos.',
  per_direccion VARCHAR(45) NULL COMMENT 'Dirección de vivienda de la persona. No requerido.',
  per_correo VARCHAR(100) NOT NULL COMMENT 'Correo electrónico de la persona.',
  per_telefono BIGINT NOT NULL COMMENT 'Número de telefono celular de la persona.',
  per_sexo_biologico ENUM("F", "M") NULL COMMENT 'Sexo biologico de la persona.',
  PRIMARY KEY (per_DNI))

COMMENT = 'El centro de nuestra base de datos. Se define persona como cualquier persona que participe en algún proceso de la universidad, sin importar si es estudiante, docente,o externo.';

-- (UNIQUE INDEX) -- CREATE UNIQUE INDEX telefono_UNIQUE ON bienestar_UN.PERSONA (per_telefono ASC) VISIBLE; --

-- (UNIQUE INDEX) -- CREATE UNIQUE INDEX correo_UNIQUE ON bienestar_UN.PERSONA (per_correo ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.PERFIL_DE_SALUD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PERFIL_DE_SALUD (
  perfsalud_id INT NOT NULL,
  perfsalud_peso DECIMAL(5, 3) NOT NULL COMMENT 'Peso del estudiante al realizar el proceso de perfil de salud.',
  perfsalud_RH VARCHAR(4) NOT NULL COMMENT 'Tipo de sangre.',
  perfsalud_estatura DECIMAL(4, 3) NOT NULL COMMENT 'Estatura del estudiante en metros.',
  PRIMARY KEY (perfsalud_id))

COMMENT = 'Perfil de salud de un estudiante.';


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE (
  est_per_DNI INT NOT NULL COMMENT 'Relación de herencia con persona.',
  est_PBM INT UNSIGNED NOT NULL COMMENT 'PMB asignado de la persona. La información de este atributo es tomado de la sección de registro de la universidad.',
  est_es_peama TINYINT NOT NULL DEFAULT 0 COMMENT 'Booleano indicando si el estudiante pertence a peama.',
  est_es_paes TINYINT NOT NULL DEFAULT 0 COMMENT 'Booleano indicando si el estudiante pertenece al programa PAES.',
  est_perfsalud_id INT NOT NULL COMMENT 'Relacion con el perfil ',
  PRIMARY KEY (est_per_DNI),
  CONSTRAINT fk_ESTUDIANTE_PERSONA
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ESTUDIANTE_PERFIL_DE_SALUD1
    FOREIGN KEY (est_perfsalud_id)
    REFERENCES bienestar_UN.PERFIL_DE_SALUD (perfsalud_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Una persona que estudia algún programa académico en la universidad.';

-- (INDEX) -- CREATE INDEX fk_ESTUDIANTE_PERFIL_DE_SALUD1_idx ON bienestar_UN.ESTUDIANTE (est_perfsalud_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.FUNCIONARIO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.FUNCIONARIO (
  fun_per_id INT NOT NULL,
  PRIMARY KEY (fun_per_id),
  CONSTRAINT fk_FUNCIONARIO_PERSONA1
    FOREIGN KEY (fun_per_id)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Cualquier persona vinculada laboralmente con la universidad que no es docente.';


-- -----------------------------------------------------
-- Table bienestar_UN.FACULTAD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.FACULTAD (
  fac_id INT NOT NULL,
  fac_nombre VARCHAR(200) NOT NULL COMMENT 'Nombre de facultad.',
  PRIMARY KEY (fac_id))

COMMENT = 'Facultad que incluye departamentos de un área de conocimiento.';


-- -----------------------------------------------------
-- Table bienestar_UN.DEPARTAMENTO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.DEPARTAMENTO (
  dep_id INT NOT NULL,
  dep_nombre VARCHAR(300) NOT NULL,
  dep_fac_id INT NOT NULL COMMENT 'Facultad relacionada.',
  PRIMARY KEY (dep_id),
  CONSTRAINT fk_DEPARTAMENTO_FACULTAD1
    FOREIGN KEY (dep_fac_id)
    REFERENCES bienestar_UN.FACULTAD (fac_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Departamento relacionado a alguna facultad.';

-- (INDEX) -- CREATE INDEX fk_DEPARTAMENTO_FACULTAD1_idx ON bienestar_UN.DEPARTAMENTO (dep_fac_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.DOCENTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.DOCENTE (
  doc_per_DNI INT NOT NULL,
  doc_biografia MEDIUMTEXT NULL COMMENT 'Biografía del docente, incluyendo estudios y carrera.',
  doc_dep_id INT NOT NULL COMMENT 'Vinculación  a algún departamento.',
  PRIMARY KEY (doc_per_DNI),
  CONSTRAINT fk_DOCENTE_PERSONA1
    FOREIGN KEY (doc_per_DNI)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DOCENTE_DEPARTAMENTO1
    FOREIGN KEY (doc_dep_id)
    REFERENCES bienestar_UN.DEPARTAMENTO (dep_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Docente vinculado a la parte académica de la universidad.';

-- (INDEX) -- CREATE INDEX fk_DOCENTE_DEPARTAMENTO1_idx ON bienestar_UN.DOCENTE (doc_dep_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (
  doc_per_id INT NOT NULL,
  PRIMARY KEY (doc_per_id),
  CONSTRAINT fk_DOCENTE_ACTIVIDAD_EXTRACURRICULAR_PERSONA1
    FOREIGN KEY (doc_per_id)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Docente que dirige actividades extracurriculares, como deportes y grupos culturales.';


-- -----------------------------------------------------
-- Table bienestar_UN.ASIGNATURA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ASIGNATURA (
  asi_codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  asi_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre de asignatura.',
  asi_numero_de_creditos INT UNSIGNED NOT NULL COMMENT 'Número de creditos que aporta la asignatura a la historia académica.',
  asi_dep_id INT NULL COMMENT 'Departamento vinculado.',
  PRIMARY KEY (asi_codigo),
  CONSTRAINT fk_ASIGNATURA_DEPARTAMENTO1
    FOREIGN KEY (asi_dep_id)
    REFERENCES bienestar_UN.DEPARTAMENTO (dep_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Asignatura ofertada por  un departamento. Afecta el progreso en la historia académica de un estudiante.';

-- (INDEX) -- CREATE INDEX fk_ASIGNATURA_DEPARTAMENTO1_idx ON bienestar_UN.ASIGNATURA (asi_dep_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.PROGRAMA_CURRICULAR
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PROGRAMA_CURRICULAR (
  pro_codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
  pro_nombre VARCHAR(45) NULL COMMENT 'Nombre del programa curricular.',
  pro_numero_de_creditos INT UNSIGNED NOT NULL COMMENT 'Número de créditos necesarios para finalizar el programa.',
  pro_dep_id INT NOT NULL COMMENT 'Departamento vinculado.',
  PRIMARY KEY (pro_codigo),
  CONSTRAINT fk_PROGRAMA_CURRICULAR_DEPARTAMENTO1
    FOREIGN KEY (pro_dep_id)
    REFERENCES bienestar_UN.DEPARTAMENTO (dep_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Programa curricular ofertado por un departamento.';

-- (INDEX) -- CREATE INDEX fk_PROGRAMA_CURRICULAR_DEPARTAMENTO1_idx ON bienestar_UN.PROGRAMA_CURRICULAR (pro_dep_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.HISTORIA_ACADEMICA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.HISTORIA_ACADEMICA (
  hist_codigo INT NOT NULL COMMENT 'Codigo de la historia académica.',
 -- hist_porcentaje_avance DECIMAL(2) GENERATED ALWAYS AS ()  COMMENT 'Porcentaje calculado de avance.',
  -- hist_porcentaje_avance DECIMAL(2)  NOT NULL DEFAULT 0 COMMENT 'Porcentaje calculado de avance.',
  -- hist_papa DECIMAL(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Promedio academico ponderado acumulado.',
  hist_es_activa TINYINT NOT NULL DEFAULT 1 COMMENT 'Booleano: El estudiante se encuentra cursando el programa o no.',
  hist_pro_codigo INT UNSIGNED NOT NULL COMMENT 'Relación al programa curricular.',
  hist_est_per_DNI INT NOT NULL COMMENT 'Relacion al estudiante.', 
  PRIMARY KEY (hist_codigo),
  CONSTRAINT fk_HISTORIA_ACADEMICA_PROGRAMA_CURRICULAR1
    FOREIGN KEY (hist_pro_codigo)
    REFERENCES bienestar_UN.PROGRAMA_CURRICULAR (pro_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_HISORIA_ACADEMICA_ESTUDIANTE1
    FOREIGN KEY (hist_est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Historia académica específica a un estudiante.';

-- (INDEX) -- CREATE INDEX fk_HISTORIA_ACADEMICA_PROGRAMA_CURRICULAR1_idx ON bienestar_UN.HISTORIA_ACADEMICA (hist_pro_codigo ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ASIGNATURA_CURSADA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ASIGNATURA_CURSADA (
  asic_id INT NOT NULL,
  asic_nota_final DECIMAL(2, 1) NOT NULL COMMENT 'Nota final registrada en el sistema.',
  asic_periodo_academico VARCHAR(6) NOT NULL COMMENT 'Periodo académico en la que el estudiante curso la asignatura.',
  asic_hist_codigo INT NOT NULL COMMENT 'Relación a la historia académica del estudiante.',
  asic_asi_codigo INT UNSIGNED NOT NULL COMMENT 'Código de la asignatura que se cursó.',
  PRIMARY KEY (asic_id),
  CONSTRAINT fk_ASIGNATURA_CURSADA_HISTORIA_ACADEMICA1
    FOREIGN KEY (asic_hist_codigo)
    REFERENCES bienestar_UN.HISTORIA_ACADEMICA (hist_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ASIGNATURA_CURSADA_ASIGNATURA1
    FOREIGN KEY (asic_asi_codigo)
    REFERENCES bienestar_UN.ASIGNATURA (asi_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'El registro de una asignatura cursada por un estudiante, específicando su nota.';

-- (INDEX) -- CREATE INDEX fk_ASIGNATURA_CURSADA_HISTORIA_ACADEMICA1_idx ON bienestar_UN.ASIGNATURA_CURSADA (asic_hist_codigo ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_ASIGNATURA_CURSADA_ASIGNATURA1_idx ON bienestar_UN.ASIGNATURA_CURSADA (asic_asi_codigo ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.EDIFICIO
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS bienestar_UN.EDIFICIO (
  edi_id VARCHAR(45) NOT NULL,
  edi_nombre VARCHAR(320) COMMENT 'Nombre del edificio.',
  edi_direccion VARCHAR(450) NOT NULL COMMENT 'Dirección del edificio.',
  PRIMARY KEY (edi_id))

COMMENT = 'Infraestructura de la universidad en la que se realizan actividades.';


-- -----------------------------------------------------
-- Table bienestar_UN.ESPACIO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESPACIO (
  esp_id INT NOT NULL,
  esp_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del espacio.',
  esp_capacidad INT NOT NULL COMMENT 'Capacidad de personas del espacio.',
  esp_edi_id VARCHAR(45) NULL COMMENT 'Relación con edificio. No necesaria para la existencia del espacio. Ejemplo: La plaza central.',
  PRIMARY KEY (esp_id),
  CONSTRAINT fk_ESPACIO_EDIFICIO1
    FOREIGN KEY (esp_edi_id)
    REFERENCES bienestar_UN.EDIFICIO (edi_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Espacio de la universidad, puede estar relacionado a un edificio o no.';

-- (INDEX) -- CREATE INDEX fk_ESPACIO_EDIFICIO1_idx ON bienestar_UN.ESPACIO (esp_edi_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.RESERVACION
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.RESERVACION (
  res_id INT NOT NULL,
  res_fecha_inicial DATETIME NOT NULL,
  res_fecha_fin DATETIME NOT NULL,
  res_esp_id INT NOT NULL,
  PRIMARY KEY (res_id),
  CONSTRAINT fk_RESERVACION_EDIFICIO1
    FOREIGN KEY (res_esp_id)
    REFERENCES bienestar_UN.ESPACIO (esp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Reservación de un espacio universitario, en el que se específica el espacio, fecha inicial y fecha final en el que esta reservado un espacio.';

-- (INDEX) -- CREATE INDEX fk_RESERVACION_EDIFICIO1_idx ON bienestar_UN.RESERVACION (res_esp_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.EVENTO_GENERAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.EVENTO_GENERAL (
  eve_id INT NOT NULL,
  eve_descripcion MEDIUMTEXT NULL COMMENT 'Descripción del evento.',
  eve_res_id INT NOT NULL COMMENT 'Reservación de espacio asignada.',
  PRIMARY KEY (eve_id),
  CONSTRAINT fk_EVENTO_GENERAL_RESERVACION1
    FOREIGN KEY (eve_res_id)
    REFERENCES bienestar_UN.RESERVACION (res_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'La relación en donde se almacenan todos los eventos en los que es necesario la asignación de un espacio en una fecha específica. Todos los demás eventos se relacionan con un evento general.';

-- (INDEX) -- CREATE INDEX fk_EVENTO_GENERAL_RESERVACION1_idx ON bienestar_UN.EVENTO_GENERAL (eve_res_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (
  ben_id INT NOT NULL,
  ben_periodo_academico VARCHAR(6) NOT NULL COMMENT 'Periodo academico en el que el beneficio es brindado al estudiante.',
  ben_est_per_DNI INT NOT NULL COMMENT 'DNI del estudiante beneficiario.',
  PRIMARY KEY (ben_id),
  CONSTRAINT fk_BENEFICIARIO_PROGRAMA_DE_GESTION_ESTUDIANTE1
    FOREIGN KEY (ben_est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Guarda a los estudiantes beneficiarios en un periodo académico.';

-- (INDEX) -- CREATE INDEX fk_BENEFICIARIO_PROGRAMA_DE_GESTION_ESTUDIANTE1_idx ON bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (ben_est_per_DNI ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.BENEFICIARIO_DE_GESTION_ALIMENTARIA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_ALIMENTARIA (
  ben_alim_tipo ENUM("DESAYUNO", "ALMUERZO", "CENA") NOT NULL COMMENT 'Tipo de beneficio de alimento brindado.',
  ben_alim_id INT NOT NULL,
  PRIMARY KEY (ben_alim_id),
  CONSTRAINT fk_BENEFICIARIO_DE_GESTION_ALIMENTARIA_BENEFICIARIO_PROGRAMA_1
    FOREIGN KEY (ben_alim_id)
    REFERENCES bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (ben_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Beneficio especifico de gestión alimentaria, relación debil con respecto a Beneficiario programa gestión.';


-- -----------------------------------------------------
-- Table bienestar_UN.BENEFICIARIO_DE_GESTION_DE_TRANSPORTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_DE_TRANSPORTE (
  ben_tran_numero_tarjeta_sitp VARCHAR(16) NOT NULL COMMENT 'Número de tarjeta del sitp del beneficiario.',
  ben_tran_id INT NOT NULL,
  PRIMARY KEY (ben_tran_id),
  CONSTRAINT fk_BENEFICIARIO_DE_GESTION_DE_TRANSPORTE_BENEFICIARIO_PROGRAM1
    FOREIGN KEY (ben_tran_id)
    REFERENCES bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (ben_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Beneficiario de gestión de transporte, debil con respecto a Beneficiario Programa de gestión.';


-- -----------------------------------------------------
-- Table bienestar_UN.BENEFICIARIO_DE_GESTION_ECONOMICA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_ECONOMICA (
  ben_eco_porcentaje_salario_minimo DECIMAL(2) NOT NULL COMMENT 'Porcentaje de salario minimo otorgado al estudiante.',
  ben_eco_id INT NOT NULL,
  PRIMARY KEY (ben_eco_id),
  CONSTRAINT fk_BENEFICIARIO_DE_GESTION_ECONOMICA_BENEFICIARIO_PROGRAMA_DE1
    FOREIGN KEY (ben_eco_id)
    REFERENCES bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (ben_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Se le da un porcentaje de salario mínimo a los beneficiarios.';


-- -----------------------------------------------------
-- Table bienestar_UN.BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO (
  ben_aloj_entidad_prestadora VARCHAR(120) NOT NULL COMMENT 'Entidad prestadora del servicio.',
  ben_aloj_direccion_de_residencia VARCHAR(45) NULL COMMENT 'Dirección de la residencia brindada al estudiante.',
  ben_aloj_id INT NOT NULL,
  PRIMARY KEY (ben_aloj_id),
  CONSTRAINT fk_BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO_BENEFICIARIO_PROGRA1
    FOREIGN KEY (ben_aloj_id)
    REFERENCES bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION (ben_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Se le otorga una residencia estudiantil externa al estudiante.';


-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_GENERAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CONVOCATORIA_GENERAL (
  con_gen_codigo VARCHAR(13) GENERATED ALWAYS AS (CONCAT("PG", con_gen_tipo, "-", con_gen_periodo_academico)) STORED COMMENT 'Id de la tabla Convocatoria general.',
  con_gen_tipo ENUM("AL", "AJ", "TR", "E") NOT NULL COMMENT 'Tipo del programa de gestion (Alimentacion, alojamiento, transporte, economica)',
  con_gen_periodo_academico VARCHAR(6) NOT NULL COMMENT 'El periodo académico del cual la convocatoria hace parte.',
  con_gen_horas_de_corresponsabilidad INT NOT NULL COMMENT 'Las horas de corresponsabilidad las cuales los estudiantes beneficiarios deben cumplir.',
  PRIMARY KEY (con_gen_codigo))

COMMENT = 'Es el tipo de convocatoria que lanza la universidad, que a su vez puede tener convocatorias específicas en las que los estudiantes pueden participar.';


-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_ESPECIFICA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CONVOCATORIA_ESPECIFICA (
  con_esp_id INT NOT NULL AUTO_INCREMENT,
  con_esp_nombre VARCHAR(100) NOT NULL COMMENT 'Nombre de convocatoría específica.',
  con_esp_descripcion LONGTEXT NOT NULL COMMENT 'Descripción de convocatoria específica.',
  con_esp_con_gen_codigo VARCHAR(50) NOT NULL COMMENT 'Foreign key a la convocatoria general.',
  PRIMARY KEY (con_esp_id),
  CONSTRAINT fk_CONVOCATORIA_ESPECIFICA_CONVOCATORIA_GENERAL1
    FOREIGN KEY (con_esp_con_gen_codigo)
    REFERENCES bienestar_UN.CONVOCATORIA_GENERAL (con_gen_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'La subdivisión de la convocatoria general, que determina las características del apoyo.';

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_ESPECIFICA_CONVOCATORIA_GENERAL1_idx ON bienestar_UN.CONVOCATORIA_ESPECIFICA (con_esp_con_gen_codigo ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION (
  con_esp_id INT NOT NULL COMMENT 'ID de la convocatoría específica.',
  est_per_DNI INT NOT NULL COMMENT 'DNI del estudiante.',
  con_esp_estado ENUM("PREADJUDICADO", "ELEGIBLE", "ADJUDICADO", "INVALIDADO", "FORMALIZADO") NOT NULL DEFAULT 'ELEGIBLE' COMMENT 'Estado de la participación.',
  PRIMARY KEY (con_esp_id, est_per_DNI),
  
  CONSTRAINT fk_CONVOCATORIA_ESPECIFICA_has_ESTUDIANTE_CONVOCATORIA_ESPECI1
    FOREIGN KEY (con_esp_id)
    REFERENCES bienestar_UN.CONVOCATORIA_ESPECIFICA (con_esp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CONVOCATORIA_ESPECIFICA_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
COMMENT = 'Participación del estudiante en convocatoría específica. Relación muchos a muchos.';

-- -----------------------------------------------------
-- Table bienestar_UN.INCAPACIDAD
-- -----------------------------------------------------c

CREATE TABLE IF NOT EXISTS bienestar_UN.INCAPACIDAD (
  inc_id INT NOT NULL,
  inc_fecha_inicio DATETIME NULL COMMENT 'Fecha de inicio de la incapacidad.',
  inc_fecha_fin DATETIME NULL COMMENT 'Fecha final de la incapacidad del estudiante.',
  inc_est_per_DNI INT NOT NULL COMMENT 'Foreign key al estudiante.',
  PRIMARY KEY (inc_id),
  CONSTRAINT fk_INCAPACIDAD_ESTUDIANTE1
    FOREIGN KEY (inc_est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Incapacidad de un estudiante en un periodo de tiempo definido.';

-- (INDEX) -- CREATE INDEX fk_INCAPACIDAD_ESTUDIANTE1_idx ON bienestar_UN.INCAPACIDAD (inc_est_per_DNI ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.DISCAPACIDAD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.DISCAPACIDAD (
  dis_id INT NOT NULL,
  dis_nombre VARCHAR(300) NOT NULL COMMENT 'Nombre de la discapacidad.',
  PRIMARY KEY (dis_id))

COMMENT = 'Tipo de discapacidad.';


-- -----------------------------------------------------
-- Table bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD (
  dis_id INT NOT NULL COMMENT 'Foreign key a la discapacidad.',
  perfsalud_id INT NOT NULL COMMENT 'Foreign key al perfil de salud.',
  PRIMARY KEY (dis_id, perfsalud_id),
  CONSTRAINT fk_DISCAPACIDAD_has_PERFIL_DE_SALUD_DISCAPACIDAD1
    FOREIGN KEY (dis_id)
    REFERENCES bienestar_UN.DISCAPACIDAD (dis_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_DISCAPACIDAD_has_PERFIL_DE_SALUD_PERFIL_DE_SALUD1
    FOREIGN KEY (perfsalud_id)
    REFERENCES bienestar_UN.PERFIL_DE_SALUD (perfsalud_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre discapacidad y perfil de salud.';

-- (INDEX) -- CREATE INDEX fk_DISCAPACIDAD_has_PERFIL_DE_SALUD_PERFIL_DE_SALUD1_idx ON bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD (perfsalud_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_DISCAPACIDAD_has_PERFIL_DE_SALUD_DISCAPACIDAD1_idx ON bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD (dis_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.SESION_EVENTO_SALUD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SESION_EVENTO_SALUD (
  ses_salud_eve_id INT NOT NULL COMMENT 'Primary key del evento salud.',
  ses_salud_nombre VARCHAR(200) NOT NULL COMMENT 'Nombre del evento de salud.',
  PRIMARY KEY (ses_salud_eve_id),
  CONSTRAINT fk_SESION_EVENTO_SALUD_EVENTO_GENERAL1
    FOREIGN KEY (ses_salud_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Sesión evento en salud grupal.';


-- -----------------------------------------------------
-- Table bienestar_UN.CITA_INDIVIDUAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CITA_INDIVIDUAL (
  cit_tipo VARCHAR(120) NOT NULL COMMENT 'Tipo de cita.',
  cit_est_per_DNI INT NOT NULL COMMENT 'Foreign key al estudiante.',
  cit_fun_per_DNI INT NOT NULL COMMENT 'Foreign key al funcionario que realiza la cita individual.',
  cit_eve_id INT NOT NULL,
  PRIMARY KEY (cit_eve_id),
  CONSTRAINT fk_CITA_INDIVIDUAL_ESTUDIANTE1
    FOREIGN KEY (cit_est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CITA_INDIVIDUAL_FUNCIONARIO1
    FOREIGN KEY (cit_fun_per_DNI)
    REFERENCES bienestar_UN.FUNCIONARIO (fun_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CITA_INDIVIDUAL_EVENTO_GENERAL1
    FOREIGN KEY (cit_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Cita individual asignada a un estudiante.';

-- (INDEX) -- CREATE INDEX fk_CITA_INDIVIDUAL_ESTUDIANTE1_idx ON bienestar_UN.CITA_INDIVIDUAL (cit_est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_CITA_INDIVIDUAL_FUNCIONARIO1_idx ON bienestar_UN.CITA_INDIVIDUAL (cit_fun_per_DNI ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD (
  ses_salud_ses_id INT NOT NULL COMMENT 'Foreign key al evento.',
  est_per_DNI INT NOT NULL COMMENT 'Foreign key al estudiante',
  PRIMARY KEY (ses_salud_ses_id, est_per_DNI),
  CONSTRAINT fk_SESION_EVENTO_SALUD_has_ESTUDIANTE_SESION_EVENTO_SALUD1
    FOREIGN KEY (ses_salud_ses_id)
    REFERENCES bienestar_UN.SESION_EVENTO_SALUD (ses_salud_eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_EVENTO_SALUD_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Asistencia del estudiante a evento salud.';

-- (INDEX) -- CREATE INDEX fk_SESION_EVENTO_SALUD_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_EVENTO_SALUD_has_ESTUDIANTE_SESION_EVENTO_SALUD1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD (ses_salud_ses_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_PGP
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CONVOCATORIA_PGP (
  con_pgp_codigo INT NOT NULL COMMENT 'Codigo de la convocatoria PGP.',
  con_pgp_descripcion MEDIUMTEXT NOT NULL,
  con_pgp_terminos MEDIUMTEXT NOT NULL COMMENT 'Terminos específicos de la convocatoria.',
  con_pgp_esta_activo TINYINT NOT NULL DEFAULT 0 COMMENT 'Estado de la convocatoria general, Activa, o no Activa.',
  con_pgp_fecha_inicio DATETIME NOT NULL,
  con_pgp_fecha_fin DATETIME NOT NULL,
  con_pgp_periodo_academico VARCHAR(6) NOT NULL COMMENT 'Periodo académico en la que sale la convocatoria.',
  PRIMARY KEY (con_pgp_codigo))

COMMENT = 'Convocatoria al programa de gestión de proyectos en un periodo académico definido.';


-- -----------------------------------------------------
-- Table bienestar_UN.PROYECTO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PROYECTO (
  pro_id INT NOT NULL COMMENT 'Primary key del proyecto.',
  pro_nombre VARCHAR(100) NOT NULL COMMENT 'Nombre del proyecto.',
  pro_descripcion MEDIUMTEXT NOT NULL COMMENT 'Descripción del proyecto.',
  pro_objetivos MEDIUMTEXT NOT NULL COMMENT 'Lista de objetivos del proyecto.',
  PRIMARY KEY (pro_id))

COMMENT = 'Proyecto armado a partir de mínimo 3 estudiantes de una facultad.';


-- -----------------------------------------------------
-- Table bienestar_UN.PARTICIPACION_PGP
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PARTICIPACION_PGP (
  par_pgp_pro_id INT NOT NULL COMMENT 'Foreign key al proyecto.',
  par_pgp_con_pgp_codigo INT NOT NULL COMMENT 'Foreign key a la convocatoria.',
  par_pgp_esta_aprobado TINYINT NOT NULL DEFAULT 0 COMMENT 'Estado: Aprobado o no aprobado.',
  par_pgp_presupuesto DECIMAL(10, 1) NOT NULL COMMENT 'Presupuesto aprobado para el proyecto.',
  PRIMARY KEY (par_pgp_pro_id, par_pgp_con_pgp_codigo),
  CONSTRAINT fk_PARTICIPACION_PGP_PROYECTO1
    FOREIGN KEY (par_pgp_pro_id)
    REFERENCES bienestar_UN.PROYECTO (pro_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PARTICIPACION_PGP_CONVOCATORIA_PGP1
    FOREIGN KEY (par_pgp_con_pgp_codigo)
    REFERENCES bienestar_UN.CONVOCATORIA_PGP (con_pgp_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 
COMMENT = 'Participación por parte de un proyecto en PGP, relación debil.';

-- (INDEX) -- CREATE INDEX fk_PARTICIPACION_PGP_CONVOCATORIA_PGP1_idx ON bienestar_UN.PARTICIPACION_PGP (par_pgp_con_pgp_codigo ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.PROYECTO_TIENE_ESTUDIANTES
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PROYECTO_TIENE_ESTUDIANTES (
  pro_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (pro_id, est_per_DNI),
  CONSTRAINT fk_PROYECTO_has_ESTUDIANTE_PROYECTO1
    FOREIGN KEY (pro_id)
    REFERENCES bienestar_UN.PROYECTO (pro_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PROYECTO_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre estudiantes y proyectos.';

-- (INDEX) -- CREATE INDEX fk_PROYECTO_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.PROYECTO_TIENE_ESTUDIANTES (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_PROYECTO_has_ESTUDIANTE_PROYECTO1_idx ON bienestar_UN.PROYECTO_TIENE_ESTUDIANTES (pro_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.SESION_DE_TALLER
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SESION_DE_TALLER (
  ses_taller_nombre VARCHAR(250) NOT NULL DEFAULT 0 COMMENT 'Nombre del taller.',
  ses_taller_eve_id INT NOT NULL,
  ses_taller_per_tallerista_DNI INT NOT NULL COMMENT 'Tallerista encargado de la sesión.',
  PRIMARY KEY (ses_taller_eve_id),
  CONSTRAINT fk_SESION_DE_TALLER_EVENTO_GENERAL1
    FOREIGN KEY (ses_taller_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_DE_TALLER_PERSONA1
    FOREIGN KEY (ses_taller_per_tallerista_DNI)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Sesión dada a la comunidad, en la que pueden participar varios estudiantes.';

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_EVENTO_GENERAL1_idx ON bienestar_UN.SESION_DE_TALLER (ses_taller_eve_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_PERSONA1_idx ON bienestar_UN.SESION_DE_TALLER (ses_taller_per_tallerista_DNI ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.SESION_DE_ACOMPANAMIENTO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SESION_DE_ACOMPANAMIENTO (
  -- ses_acom_nombre VARCHAR(45) GENERATED ALWAYS AS ()  COMMENT 'Nombre autogenerado.',
  ses_acom_nombre VARCHAR(100) COMMENT 'Nombre autogenerado.',
  ses_acom_eve_id INT NOT NULL COMMENT 'Evento primary key.',
  ses_acom_fun_per_DNI_encargado INT NOT NULL COMMENT 'Foreign key al funcionario encargado.',
  PRIMARY KEY (ses_acom_eve_id),
  CONSTRAINT fk_SESION_DE_TALLER_EVENTO_GENERAL10
    FOREIGN KEY (ses_acom_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_DE_ACOMPANAMIENTO_FUNCIONARIO1
    FOREIGN KEY (ses_acom_fun_per_DNI_encargado)
    REFERENCES bienestar_UN.FUNCIONARIO (fun_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Sesión de acompañamiento pedida por un estudiante 1 a 1 con un funcionaria.';

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_EVENTO_GENERAL1_idx ON bienestar_UN.SESION_DE_ACOMPANAMIENTO (ses_acom_eve_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_DE_ACOMPANAMIENTO_FUNCIONARIO1_idx ON bienestar_UN.SESION_DE_ACOMPANAMIENTO (ses_acom_fun_per_DNI_encargado ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.CITA_DE_ASESORIA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CITA_DE_ASESORIA (
  -- cit_ase_nombre VARCHAR(45) GENERATED ALWAYS AS ()  COMMENT 'Nombre autogenerado.',
  cit_ase_nombre VARCHAR(100) COMMENT 'Nombre autogenerado.',
  cit_ase_eve_id INT NOT NULL COMMENT 'Primary key al evento.',
  cit_ase_tipo ENUM("CRISIS EMOCIONAL", "TRAMITES", "ACADEMICO") NOT NULL COMMENT 'Tipo de la cita de asesoria.',
  cit_ase_est_per_DNI INT NOT NULL COMMENT 'Foreign key al estudiante.',
  PRIMARY KEY (cit_ase_eve_id),
  CONSTRAINT fk_SESION_DE_TALLER_EVENTO_GENERAL100
    FOREIGN KEY (cit_ase_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CITA_DE_ASESORIA_ESTUDIANTE1
    FOREIGN KEY (cit_ase_est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Cita de asesoría pedida por un estudiante sobre tramites de la universidad, relaciona a un evento general.';

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_EVENTO_GENERAL1_idx ON bienestar_UN.CITA_DE_ASESORIA (cit_ase_eve_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_CITA_DE_ASESORIA_ESTUDIANTE1_idx ON bienestar_UN.CITA_DE_ASESORIA (cit_ase_est_per_DNI ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER (
  ses_eve_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (ses_eve_id, est_per_DNI),
  CONSTRAINT fk_SESION_DE_TALLER_has_ESTUDIANTE_SESION_DE_TALLER1
    FOREIGN KEY (ses_eve_id)
    REFERENCES bienestar_UN.SESION_DE_TALLER (ses_taller_eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_DE_TALLER_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos, asistencia del estudiante a la sesión taller.';

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_DE_TALLER_has_ESTUDIANTE_SESION_DE_TALLER1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER (ses_eve_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.TALLER_CULTURAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.TALLER_CULTURAL (
  tall_nombre VARCHAR(200) NOT NULL COMMENT 'Nombre del taller.',
  tall_eve_id INT NOT NULL COMMENT 'Primary key del evento del taller.',
  doc_per_DNI_tallerista INT NOT NULL COMMENT 'Foreign key del tallerista.',
  PRIMARY KEY (tall_eve_id),
  CONSTRAINT fk_TALLER_CULTURA_EVENTO_GENERAL1
    FOREIGN KEY (tall_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_TALLER_CULTURA_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1
    FOREIGN KEY (doc_per_DNI_tallerista)
    REFERENCES bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (doc_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Taller cultural realizado por un tallerista. Hereda de evento general.';

-- (INDEX) -- CREATE INDEX fk_TALLER_CULTURA_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1_idx ON bienestar_UN.TALLER_CULTURAL (doc_per_DNI_tallerista ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL (
  gru_id INT NOT NULL COMMENT 'Estructuras',
  gru_nombre VARCHAR(220) NOT NULL COMMENT 'Nombre del grupo.',
  gru_cupos INT UNSIGNED NOT NULL COMMENT 'Número de cupos disponibles en el grupo artístico.',
  gru_doc_per_DNI_director INT NOT NULL COMMENT 'Director del proyecto.',
  PRIMARY KEY (gru_id, gru_doc_per_DNI_director),
  CONSTRAINT fk_GRUPO_ARTISTICO_INSTITUCIONAL_DOCENTE_ACTIVIDAD_EXTRACURRI1
    FOREIGN KEY (gru_doc_per_DNI_director)
    REFERENCES bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (doc_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Un grupo artistico tiene un director y varios estudiantes participando.';

-- (INDEX) -- CREATE INDEX fk_GRUPO_ARTISTICO_INSTITUCIONAL_DOCENTE_ACTIVIDAD_EXTRACUR_idx ON bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL (gru_doc_per_DNI_director ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE (
  gru_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (gru_id, est_per_DNI),
  CONSTRAINT fk_GRUPO_ARTISTICO_INSTITUCIONAL_has_ESTUDIANTE_GRUPO_ARTISTI1
    FOREIGN KEY (gru_id)
    REFERENCES bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL (gru_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_GRUPO_ARTISTICO_INSTITUCIONAL_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre el grupo artístico y estudiantes.';

-- (INDEX) -- CREATE INDEX fk_GRUPO_ARTISTICO_INSTITUCIONAL_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_GRUPO_ARTISTICO_INSTITUCIONAL_has_ESTUDIANTE_GRUPO_ARTIS_idx ON bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE (gru_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_GAI
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CONVOCATORIA_GAI (
  con_gai_codigo INT NOT NULL,
  con_gai_descripcion MEDIUMTEXT NOT NULL,
  con_gai_periodo_academico VARCHAR(6) NOT NULL COMMENT 'Periodo académico donde ocurre la convocatoria.',
  con_gai_gru_id INT NOT NULL COMMENT 'Relación al grupo artístico institucional.',
  PRIMARY KEY (con_gai_codigo),
  CONSTRAINT fk_CONVOCATORIA_GAI_GRUPO_ARTISTICO_INSTITUCIONAL1
    FOREIGN KEY (con_gai_gru_id)
    REFERENCES bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL (gru_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Convocatoria a Grupo artistico institucional.';

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_GAI_GRUPO_ARTISTICO_INSTITUCIONAL1_idx ON bienestar_UN.CONVOCATORIA_GAI (con_gai_gru_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI (
  con_gai_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  es_admitido TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (con_gai_id, est_per_DNI),
  CONSTRAINT fk_CONVOCATORIA_GAI_has_ESTUDIANTE_CONVOCATORIA_GAI1
    FOREIGN KEY (con_gai_id)
    REFERENCES bienestar_UN.CONVOCATORIA_GAI (con_gai_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CONVOCATORIA_GAI_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre estudiante y convocatoria.';

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_GAI_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_GAI_has_ESTUDIANTE_CONVOCATORIA_GAI1_idx ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA (con_gai_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.DEPORTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.DEPORTE (
  depo_id INT NOT NULL COMMENT 'Primary key del deporte.',
  depo_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del deporte.',
  PRIMARY KEY (depo_id))

COMMENT = 'Deporte practicado por estudiantes.';


-- -----------------------------------------------------
-- Table bienestar_UN.SELECCION_DEPORTIVA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SELECCION_DEPORTIVA (
  sel_id INT NOT NULL,
  sel_nombre VARCHAR(45) NOT NULL,
  sel_cupos INT NOT NULL,
  sel_categoria ENUM("M", "F") NOT NULL,
  sel_depo_id INT NOT NULL,
  sel_doc_per_DNI_entrenador INT NOT NULL,
  PRIMARY KEY (sel_id),
  CONSTRAINT fk_SELECCION_DEPORTIVA_DEPORTE1
    FOREIGN KEY (sel_depo_id)
    REFERENCES bienestar_UN.DEPORTE (depo_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SELECCION_DEPORTIVA_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1
    FOREIGN KEY (sel_doc_per_DNI_entrenador)
    REFERENCES bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (doc_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Selección deportiva que representa a la universidad en algún deporte.';

-- (INDEX) -- CREATE INDEX fk_SELECCION_DEPORTIVA_DEPORTE1_idx ON bienestar_UN.SELECCION_DEPORTIVA (sel_depo_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SELECCION_DEPORTIVA_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1_idx ON bienestar_UN.SELECCION_DEPORTIVA (sel_doc_per_DNI_entrenador ASC) VISIBLE; --

-- -----------------------------------------------------
-- Table bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA (
  con_sel_codigo INT NOT NULL AUTO_INCREMENT,
  con_sel_descripcion MEDIUMTEXT NOT NULL,
  con_sel_periodo_academico VARCHAR(6) NOT NULL,
  con_sel_id INT NOT NULL,
  PRIMARY KEY (con_sel_codigo),
  CONSTRAINT fk_CONVOCATORIA_SELECCION_DEPORTIVA_SELECCION_DEPORTIVA1
    FOREIGN KEY (con_sel_id)
    REFERENCES bienestar_UN.SELECCION_DEPORTIVA (sel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Convocatoria especifica para aplicar a selección deportiva.';

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_SELECCION_DEPORTIVA_SELECCION_DEPORTIVA1_idx ON bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA (con_sel_sel_id ASC) VISIBLE; --

-- -----------------------------------------------------
-- Table bienestar_UN.ENTRENAMIENTO_SELECCION
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ENTRENAMIENTO_SELECCION (
  ent_sel_eve_id INT NOT NULL,
  sel_id INT NOT NULL,
  PRIMARY KEY (ent_sel_eve_id),
  CONSTRAINT fk_ENTRENAMIENTO_SELECCION_EVENTO_GENERAL1
    FOREIGN KEY (ent_sel_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ENTRENAMIENTO_SELECCION_SELECCION_DEPORTIVA1
    FOREIGN KEY (sel_id)
    REFERENCES bienestar_UN.SELECCION_DEPORTIVA (sel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Evento de entrenamiento de una selección.';

-- (INDEX) -- CREATE INDEX fk_ENTRENAMIENTO_SELECCION_SELECCION_DEPORTIVA1_idx ON bienestar_UN.ENTRENAMIENTO_SELECCION (sel_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA (
  con_sel_codigo INT NOT NULL,
  est_per_DNI INT NOT NULL,
  es_admitido TINYINT NULL DEFAULT 0,
  PRIMARY KEY (con_sel_codigo, est_per_DNI),
  CONSTRAINT fk_CONVOCATORIA_SELECCION_DEPORTIVA_has_ESTUDIANTE_CONVOCATOR1
    FOREIGN KEY (con_sel_codigo)
    REFERENCES bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA (con_sel_codigo)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CONVOCATORIA_SELECCION_DEPORTIVA_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Tabla pivote entre seleccion deportiva y estudiante.';

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_SELECCION_DEPORTIVA_has_ESTUDIANTE_ESTUDIAN_idx ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_CONVOCATORIA_SELECCION_DEPORTIVA_has_ESTUDIANTE_CONVOCAT_idx ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA (con_sel_sel_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE (
  sel_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (sel_id, est_per_DNI),
  CONSTRAINT fk_SELECCION_DEPORTIVA_has_ESTUDIANTE_SELECCION_DEPORTIVA1
    FOREIGN KEY (sel_id)
    REFERENCES bienestar_UN.SELECCION_DEPORTIVA (sel_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SELECCION_DEPORTIVA_TIENE_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre estudiante y selección deportiva.';

-- (INDEX) -- CREATE INDEX fk_SELECCION_DEPORTIVA_has_ESTUDIANTE_SELECCION_DEPORTIVA1_idx ON bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE (sel_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SELECCION_DEPORTIVA_TIENE_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE (est_per_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.TORNEO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.TORNEO (
  tor_id INT NOT NULL,
  tor_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del torneo.',
  tor_depo_id INT NOT NULL COMMENT 'Deporte del torneo.',
  PRIMARY KEY (tor_id),
  CONSTRAINT fk_TORNEO_DEPORTE1
    FOREIGN KEY (tor_depo_id)
    REFERENCES bienestar_UN.DEPORTE (depo_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Torneo realizado en un deporte específico.';

-- (INDEX) -- CREATE INDEX fk_TORNEO_DEPORTE1_idx ON bienestar_UN.TORNEO (tor_depo_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ENCUENTRO_DEPORTIVO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ENCUENTRO_DEPORTIVO (
  enc_resultado VARCHAR(45) NOT NULL COMMENT 'Resultado del encuentro.',
  enc_eve_id INT NOT NULL,
  enc_tor_id INT NOT NULL COMMENT 'Torneo donde ocurre el encuentro.',
  PRIMARY KEY (enc_eve_id),
  CONSTRAINT fk_ENCUENTRO_DEPORTIVO_EVENTO_GENERAL1
    FOREIGN KEY (enc_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ENCUENTRO_DEPORTIVO_TORNEO1
    FOREIGN KEY (enc_tor_id)
    REFERENCES bienestar_UN.TORNEO (tor_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Evento deportivo entre dos equipos.';

-- (INDEX) -- CREATE INDEX fk_ENCUENTRO_DEPORTIVO_TORNEO1_idx ON bienestar_UN.ENCUENTRO_DEPORTIVO (enc_tor_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.EQUIPO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.EQUIPO (
  equi_id INT NOT NULL,
  equi_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del equipo.',
  PRIMARY KEY (equi_id))

COMMENT = 'Equipo representando a una selección.';


-- -----------------------------------------------------
-- Table bienestar_UN.EQUIPO_TIENE_ESTUDIANTE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.EQUIPO_TIENE_ESTUDIANTE (
  equi_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (equi_id, est_per_DNI),
  CONSTRAINT fk_EQUIPO_has_ESTUDIANTE_EQUIPO1
    FOREIGN KEY (equi_id)
    REFERENCES bienestar_UN.EQUIPO (equi_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_EQUIPO_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre estudiantes y equipo.';

-- (INDEX) -- CREATE INDEX fk_EQUIPO_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.EQUIPO_TIENE_ESTUDIANTE (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_EQUIPO_has_ESTUDIANTE_EQUIPO1_idx ON bienestar_UN.EQUIPO_TIENE_ESTUDIANTE (equi_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO (
  equi_id INT NOT NULL,
  enc_eve_id INT NOT NULL,
  PRIMARY KEY (equi_id, enc_eve_id),
  CONSTRAINT fk_ENCUENTRO_DEPORTIVO_has_EQUIPO_EQUIPO1
    FOREIGN KEY (equi_id)
    REFERENCES bienestar_UN.EQUIPO (equi_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_ENCUENTRO_DEPORTIVO_TIENE_EQUIPO_ENCUENTRO_DEPORTIVO1
    FOREIGN KEY (enc_eve_id)
    REFERENCES bienestar_UN.ENCUENTRO_DEPORTIVO (enc_eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Registra los equipos que participan en un encuentro deportivo.';

-- (INDEX) -- CREATE INDEX fk_ENCUENTRO_DEPORTIVO_has_EQUIPO_EQUIPO1_idx ON bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO (equi_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_ENCUENTRO_DEPORTIVO_TIENE_EQUIPO_ENCUENTRO_DEPORTIVO1_idx ON bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO (enc_eve_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.CURSO_LIBRE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.CURSO_LIBRE (
  curlib_id INT NOT NULL,
  curlib_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre del curso libre.',
  curlib_cupos INT UNSIGNED NOT NULL COMMENT 'Cupos disponibles en el curso libre.',
  curlib_descripcion MEDIUMTEXT NOT NULL COMMENT 'Descripción del curso libre.',
  curlib_doc_per_DNI_profesor INT NOT NULL COMMENT 'DNI del profesor encargado.',
  PRIMARY KEY (curlib_id),
  CONSTRAINT fk_CURSO_LIBRE_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1
    FOREIGN KEY (curlib_doc_per_DNI_profesor)
    REFERENCES bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR (doc_per_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'El curso libre se oferta a cualquier persona sin importar si es estudiante o no.';

-- (INDEX) -- CREATE INDEX fk_CURSO_LIBRE_DOCENTE_ACTIVIDAD_EXTRACURRICULAR1_idx ON bienestar_UN.CURSO_LIBRE (curlib_doc_per_DNI_profesor ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE (
  curlib_id INT NOT NULL,
  per_DNI INT NOT NULL,
  PRIMARY KEY (curlib_id, per_DNI),
  CONSTRAINT fk_CURSO_LIBRE_has_PERSONA_CURSO_LIBRE1
    FOREIGN KEY (curlib_id)
    REFERENCES bienestar_UN.CURSO_LIBRE (curlib_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_CURSO_LIBRE_has_PERSONA_PERSONA1
    FOREIGN KEY (per_DNI)
    REFERENCES bienestar_UN.PERSONA (per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos curso libre.';

-- (INDEX) -- CREATE INDEX fk_CURSO_LIBRE_has_PERSONA_PERSONA1_idx ON bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE (per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_CURSO_LIBRE_has_PERSONA_CURSO_LIBRE1_idx ON bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE (curlib_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.SESION_CURSO_LIBRE
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.SESION_CURSO_LIBRE (
  ses_curlib_cur_nombre VARCHAR(45) NOT NULL COMMENT 'Nombre de la sesión.',
  ses_curlib_id INT NOT NULL COMMENT 'Curso libre relacionado.',
  ses_curlib_eve_id INT NOT NULL COMMENT 'Id del evento general.',
  PRIMARY KEY (ses_curlib_cur_nombre, ses_curlib_id, ses_curlib_eve_id),
  CONSTRAINT fk_SESION_CURSO_LIBRE_CURSO_LIBRE1
    FOREIGN KEY (ses_curlib_id)
    REFERENCES bienestar_UN.CURSO_LIBRE (curlib_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_CURSO_LIBRE_EVENTO_GENERAL1
    FOREIGN KEY (ses_curlib_eve_id)
    REFERENCES bienestar_UN.EVENTO_GENERAL (eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Evento singular involucrando un curso libre. Relación debil';

-- (INDEX) -- CREATE INDEX fk_SESION_CURSO_LIBRE_CURSO_LIBRE1_idx ON bienestar_UN.SESION_CURSO_LIBRE (ses_curlib_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_CURSO_LIBRE_EVENTO_GENERAL1_idx ON bienestar_UN.SESION_CURSO_LIBRE (ses_curlib_eve_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.PROYECTO_TIENE_FACULTAD
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.PROYECTO_TIENE_FACULTAD (
  pro_id INT NOT NULL,
  fac_id INT NOT NULL,
  PRIMARY KEY (pro_id, fac_id),
  CONSTRAINT fk_PROYECTO_has_FACULTAD_PROYECTO2
    FOREIGN KEY (pro_id)
    REFERENCES bienestar_UN.PROYECTO (pro_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_PROYECTO_has_FACULTAD_FACULTAD2
    FOREIGN KEY (fac_id)
    REFERENCES bienestar_UN.FACULTAD (fac_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre el proyecto y la facultad.';

-- (INDEX) -- CREATE INDEX fk_PROYECTO_has_FACULTAD_FACULTAD2_idx ON bienestar_UN.PROYECTO_TIENE_FACULTAD (fac_id ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_PROYECTO_has_FACULTAD_PROYECTO2_idx ON bienestar_UN.PROYECTO_TIENE_FACULTAD (pro_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO (
  ses_acom_eve_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (ses_acom_eve_id, est_per_DNI),
  CONSTRAINT fk_SESION_DE_ACOMPANAMIENTO_has_ESTUDIANTE_SESION_DE_ACOMPANA1
    FOREIGN KEY (ses_acom_eve_id)
    REFERENCES bienestar_UN.SESION_DE_ACOMPANAMIENTO (ses_acom_eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_SESION_DE_ACOMPANAMIENTO_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre sesión de acompañamiento de estudiantes.';

-- (INDEX) -- CREATE INDEX fk_SESION_DE_ACOMPANAMIENTO_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_SESION_DE_ACOMPANAMIENTO_has_ESTUDIANTE_SESION_DE_ACOMPA_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO (ses_acom_eve_id ASC) VISIBLE; --


-- -----------------------------------------------------
-- Table bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL (
  tall_eve_id INT NOT NULL,
  est_per_DNI INT NOT NULL,
  PRIMARY KEY (tall_eve_id, est_per_DNI),
  CONSTRAINT fk_TALLER_CULTURAL_has_ESTUDIANTE_TALLER_CULTURAL1
    FOREIGN KEY (tall_eve_id)
    REFERENCES bienestar_UN.TALLER_CULTURAL (tall_eve_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_TALLER_CULTURAL_has_ESTUDIANTE_ESTUDIANTE1
    FOREIGN KEY (est_per_DNI)
    REFERENCES bienestar_UN.ESTUDIANTE (est_per_DNI)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)

COMMENT = 'Relación muchos a muchos entre estudiante y taller cultural.';

-- (INDEX) -- CREATE INDEX fk_TALLER_CULTURAL_has_ESTUDIANTE_ESTUDIANTE1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL (est_per_DNI ASC) VISIBLE; --

-- (INDEX) -- CREATE INDEX fk_TALLER_CULTURAL_has_ESTUDIANTE_TALLER_CULTURAL1_idx ON bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL (tall_eve_id ASC) VISIBLE; --
