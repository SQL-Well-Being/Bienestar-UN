USE bienestar_UN;

-- Creacion y asignacion de permisos para funcionario bienestar ---

DROP ROLE IF EXISTS 'funcionario_bienestar';
CREATE ROLE 'funcionario_bienestar';

GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_ASISTE_A_TALLER_CULTURAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_ACOMPANAMIENTO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PROYECTO_TIENE_FACULTAD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SESION_CURSO_LIBRE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PERSONA_INSCRIBE_CURSO_LIBRE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CURSO_LIBRE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ENCUENTRO_DEPORTIVO_TIENE_EQUIPO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.EQUIPO_TIENE_ESTUDIANTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.EQUIPO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ENCUENTRO_DEPORTIVO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.TORNEO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SELECCION_DEPORTIVA_TIENE_ESTUDIANTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_SELECCION_DEPORTIVA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ENTRENAMIENTO_SELECCION TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CONVOCATORIA_SELECCION_DEPORTIVA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SELECCION_DEPORTIVA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.DEPORTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CONVOCATORIA_GAI TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL_TIENE_ESTUDIANTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.GRUPO_ARTISTICO_INSTITUCIONAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.TALLER_CULTURAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_DE_TALLER TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CITA_DE_ASESORIA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SESION_DE_ACOMPANAMIENTO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SESION_DE_TALLER TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PROYECTO_TIENE_ESTUDIANTES TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PARTICIPACION_PGP TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PROYECTO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CONVOCATORIA_PGP TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_ASISTE_A_SESION_EVENTO_SALUD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CITA_INDIVIDUAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.SESION_EVENTO_SALUD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PERFIL_DE_SALUD_TIENE_DISCAPACIDAD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.DISCAPACIDAD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.INCAPACIDAD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.BENEFICIARIO_DE_GESTION_DE_ALOJAMIENTO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.BENEFICIARIO_DE_GESTION_ECONOMICA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.BENEFICIARIO_DE_GESTION_DE_TRANSPORTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.BENEFICIARIO_DE_GESTION_ALIMENTARIA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CONVOCATORIA_ESPECIFICA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.CONVOCATORIA_GENERAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.EVENTO_GENERAL TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.RESERVACION TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESPACIO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.EDIFICIO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ASIGNATURA_CURSADA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.HISTORIA_ACADEMICA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PROGRAMA_CURRICULAR TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ASIGNATURA TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.DOCENTE_ACTIVIDAD_EXTRACURRICULAR TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.DOCENTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.DEPARTAMENTO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.FACULTAD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.FUNCIONARIO TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.ESTUDIANTE TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PERFIL_DE_SALUD TO  'funcionario_bienestar';
GRANT SELECT, INSERT, UPDATE ON bienestar_UN.PERSONA TO  'funcionario_bienestar';

GRANT EXECUTE ON PROCEDURE bienestar_UN.obtener_info_academica_estudiante TO  'funcionario_bienestar';
GRANT EXECUTE ON PROCEDURE bienestar_UN.obtener_info_salud_estudiante TO  'funcionario_bienestar';
GRANT EXECUTE ON PROCEDURE bienestar_UN.cargar_incapacidad TO  'funcionario_bienestar';
GRANT EXECUTE ON PROCEDURE bienestar_UN.registrar_participacion_convocatoria_gestion TO  'funcionario_bienestar';
GRANT EXECUTE ON PROCEDURE bienestar_UN.actualizar_estado_participacion_convocatoria_gestion TO  'funcionario_bienestar';
GRANT EXECUTE ON PROCEDURE bienestar_UN.agendar_cita_individual TO  'funcionario_bienestar';

-- Creacion y asignacion de permisos para administrador ---
DROP ROLE IF EXISTS 'administrador';
CREATE ROLE 'administrador';

GRANT ALL ON bienestar_UN.* TO 'administrador';

-- Creacion y asignacion de permisos para estudiante --
DROP ROLE IF EXISTS 'estudiante';
CREATE ROLE 'estudiante';