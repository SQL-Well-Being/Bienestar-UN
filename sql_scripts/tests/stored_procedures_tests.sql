USE bienestar_UN;

-- Prueba participación en convocatoria
SELECT * FROM estudiante_participa_en_convocatoria_gestion;
CALL registrar_participacion_convocatoria_gestion(10, 111111105);
SELECT * FROM estudiante_participa_en_convocatoria_gestion;


-- Prueba estudiante no activo
UPDATE historia_academica SET hist_es_activa = 0 WHERE hist_est_per_DNI = 111111157;
CALL registrar_participacion_convocatoria_gestion(10, 111111157);


-- Prueba actualizacion estado convocatoria
SELECT * FROM beneficiario_programa_de_gestion 
INNER JOIN convocatoria_especifica ON beneficiario_programa_de_gestion.con_esp_id = convocatoria_especifica.con_esp_id;

SELECT * FROM estudiante_participa_en_convocatoria_gestion;
CALL actualizar_estado_participacion_convocatoria_gestion(1, 111111100, 'ADJUDICADO');
SELECT * FROM estudiante_participa_en_convocatoria_gestion;

SELECT * FROM beneficiario_programa_de_gestion 
INNER JOIN convocatoria_especifica ON beneficiario_programa_de_gestion.con_esp_id = convocatoria_especifica.con_esp_id;


-- Prueba agendamiento cita salud
SELECT * FROM CITA_INDIVIDUAL INNER JOIN EVENTO_GENERAL ON cit_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;
CALL agendar_cita_individual(111111109, 'Consulta Nutricional', '2024-05-29 22:35:00');
SELECT * FROM CITA_INDIVIDUAL INNER JOIN EVENTO_GENERAL ON cit_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;

-- Prueba cancelacion cita salud
SELECT * FROM CITA_INDIVIDUAL INNER JOIN EVENTO_GENERAL ON cit_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;
CALL cancelar_cita_individual(312);
SELECT * FROM CITA_INDIVIDUAL INNER JOIN EVENTO_GENERAL ON cit_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;

-- Prueba agendacion cita asesoria
SELECT * FROM CITA_DE_ASESORIA INNER JOIN EVENTO_GENERAL ON cit_ase_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;
CALL agendar_cita_asesoria(111111110, 'TRAMITES', '2024-05-27 15:00:00');
SELECT * FROM CITA_DE_ASESORIA INNER JOIN EVENTO_GENERAL ON cit_ase_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;

-- Prueba cancelacion cita asesoria
SELECT * FROM CITA_DE_ASESORIA INNER JOIN EVENTO_GENERAL ON cit_ase_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;
CALL cancelar_cita_asesoria(320);
SELECT * FROM CITA_DE_ASESORIA INNER JOIN EVENTO_GENERAL ON cit_ase_eve_id = eve_id INNER JOIN RESERVACION ON eve_res_id = res_id;
