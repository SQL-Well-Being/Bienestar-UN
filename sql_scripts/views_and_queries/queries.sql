USE bienestar_UN;

-- -----------------------------------------------------
-- Cultura
-- -----------------------------------------------------

-- Muestra el número de documento del tallerista y cantidad de asistentes de cada taller cultural
-- AR: γ tall_eve_id, tall_nombre, doc_per_DNI_tallerista; COUNT(est_per_DNI) → 'Cantidad de asistentes' (ESTUDIANTE_ASISTE_A_TALLER_CULTURAL ⨝ ESTUDIANTE_ASISTE_A_TALLER_CULTURAL.tall_eve_id = TALLER_CULTURAL.tall_eve_id TALLER_CULTURAL)
SELECT tall_nombre, doc_per_DNI_tallerista, COUNT(*) AS 'Cantidad de asistentes'
FROM ESTUDIANTE_ASISTE_A_TALLER_CULTURAL
INNER JOIN TALLER_CULTURAL ON ESTUDIANTE_ASISTE_A_TALLER_CULTURAL.tall_eve_id = TALLER_CULTURAL.tall_eve_id
GROUP BY ESTUDIANTE_ASISTE_A_TALLER_CULTURAL.tall_eve_id;


-- Muestra los estudiantes que se presentaron más de una vez a una convocatoria de un mismo grupo artístico institucional y en ninguna pasaron
-- AR: σ COUNT(*) > 1 ∧ SUM(es_admitido) = 0 (γ est_per_DNI, per_primer_nombre, per_primer_apellido, gru_nombre; COUNT(*), SUM(es_admitido) (ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI ⨝ est_per_DNI = per_DNI PERSONA ⨝ con_gai_id = con_gai_codigo CONVOCATORIA_GAI ⨝ con_gai_gru_id = gru_id GRUPO_ARTISTICO_INSTITUCIONAL))
SELECT est_per_DNI, per_primer_nombre, per_primer_apellido, gru_nombre , COUNT(*) AS 'Número de participaciones'
FROM ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GAI
INNER JOIN CONVOCATORIA_GAI ON con_gai_id = con_gai_codigo
INNER JOIN PERSONA ON est_per_DNI = per_DNI
INNER JOIN GRUPO_ARTISTICO_INSTITUCIONAL ON con_gai_gru_id = gru_id
GROUP BY est_per_DNI, gru_nombre
HAVING SUM(es_admitido) = 0 AND COUNT(*) > 1;


-- -----------------------------------------------------
-- Acompañamiento integral
-- -----------------------------------------------------

--
-- AR:


-- -----------------------------------------------------
-- Actividad Física y Deporte
-- -----------------------------------------------------

-- Muestra el equipo con más encuentros ganados de cada torneo en el que ya se haya jugado al menos un partido
-- AR:
-- victorias_por_equipo := γ enc_tor_id, enc_equi_gan_id; COUNT(*) → victorias (σ enc_equi_gan_id IS NOT NULL (ENCUENTRO_DEPORTIVO))
-- max_victorias_por_torneo := γ enc_tor_id; MAX(victorias) → max_victorias (victorias_por_equipo)
-- resultado := (victorias_por_equipo ⨝ enc_tor_id = tor_id TORNEO) ⨝ enc_equi_gan_id = equi_id EQUIPO
-- resultado_final := σ victorias = max_victorias (resultado ⨝ victorias_por_equipo.enc_tor_id = max_victorias_por_torneo.enc_tor_id max_victorias_por_torneo)
WITH victorias_por_equipo AS (
    SELECT enc_tor_id, enc_equi_gan_id, COUNT(*) AS victorias
    FROM ENCUENTRO_DEPORTIVO 
    WHERE enc_equi_gan_id IS NOT NULL
    GROUP BY enc_tor_id, enc_equi_gan_id
),
max_victorias_por_torneo AS (
    SELECT enc_tor_id, MAX(victorias) AS max_victorias
    FROM victorias_por_equipo
    GROUP BY enc_tor_id
)
SELECT tor_nombre, equi_nombre
FROM victorias_por_equipo
INNER JOIN TORNEO ON enc_tor_id = tor_id
INNER JOIN EQUIPO ON enc_equi_gan_id = equi_id
INNER JOIN max_victorias_por_torneo 
WHERE victorias = max_victorias;


-- -----------------------------------------------------
-- Gestión y Fomento
-- -----------------------------------------------------

-- Muestra cuantos beneficiarios de un programa de gestión (cualquiera) hubo en cada semestre
-- AR: γ ben_periodo_academico; count(*) → 'Cantidad beneficiados' (BENEFICIARIO_PROGRAMA_GESTION)
SELECT ben_periodo_academico, COUNT(*) AS 'Cantidad Beneficiados'
FROM BENEFICIARIO_PROGRAMA_DE_GESTION 
GROUP BY ben_periodo_academico;


-- Lista las veces que cada Estudiante ha sido beneficiario de algun apoyo socioeconómico, muestra un 0 en caso de nunca haber sido beneficado
-- AR: γ est_per_dni; est_per_dni, COUNT(est_per_dni) → 'Veces Beneficiado' (ESTUDIANTE ⟕ est_per_DNI = ben_est_per_DNI BENEFICIARIO_PROGRAMA_GESTION)
SELECT est_per_DNI, COUNT(ben_id) AS 'Veces Beneficiado' 
FROM ESTUDIANTE
LEFT JOIN BENEFICIARIO_PROGRAMA_DE_GESTION ON est_per_DNI = ben_est_per_DNI
GROUP BY est_per_DNI;


-- -----------------------------------------------------
-- Sistema de Información
-- -----------------------------------------------------

-- Información académica completa de todos los estudiantes
-- AR:
SELECT hist_codigo, hist_es_activa, pro_codigo, pro_nombre, 
	   hist_est_per_DNI AS 'est_per_DNI',
       creditos_cursados, creditos_aprobados, 
       (ROUND(ponderado/creditos_cursados, 1)) AS 'PAPA', (ROUND(creditos_aprobados*100/pro_numero_de_creditos, 2)) AS 'porcentaje_avance'
	
FROM HISTORIA_ACADEMICA 
INNER JOIN PROGRAMA_CURRICULAR ON hist_pro_codigo = pro_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_cursados'  
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            GROUP BY asic_hist_codigo) AS SUB1 ON hist_codigo = SUB1.asic_hist_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_aprobados'  
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            WHERE asic_nota_final >= 3.0
            GROUP BY asic_hist_codigo) AS SUB2 ON hist_codigo = SUB2.asic_hist_codigo
    
INNER JOIN (SELECT asic_hist_codigo, SUM(asic_nota_final * asi_numero_de_creditos) AS 'ponderado' 
            FROM ASIGNATURA_CURSADA 
            INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
            GROUP BY asic_hist_codigo) AS SUB3 ON hist_codigo = SUB3.asic_hist_codigo;


-- Lista cuantas discapacidades tiene cada estudiante
-- AR: γ est_per_DNI; count(dis_id) → 'numero_discapacidades' (ESTUDIANTE ⨝ est_perfsalud_id = perfsalud_id PERFIL_DE_SALUD ⟕ PERFIL_DE_SALUD.perfsalud_id = PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.perfsalud_id PERFIL_DE_SALUD_TIENE_DISCAPACIDAD)
SELECT est_per_DNI, COUNT(dis_id) AS 'numero_discapacidades'
FROM ESTUDIANTE 
INNER JOIN PERFIL_DE_SALUD ON est_perfsalud_id = perfsalud_id
LEFT JOIN PERFIL_DE_SALUD_TIENE_DISCAPACIDAD ON PERFIL_DE_SALUD.perfsalud_id = PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.perfsalud_id
GROUP BY est_per_DNI;


-- Lista estudiantes con al menos una discapacidad
-- AR: σ 'numero_discapacidades'>= 1(γ est_per_DNI; count(dis_id)→'numero_discapacidades' (ESTUDIANTE ⨝ est_perfsalud_id = perfsalud_id PERFIL_DE_SALUD ⟕ PERFIL_DE_SALUD.perfsalud_id = PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.perfsalud_id PERFIL_DE_SALUD_TIENE_DISCAPACIDAD))
SELECT est_per_DNI
FROM  ESTUDIANTE 
INNER JOIN PERFIL_DE_SALUD ON est_perfsalud_id = perfsalud_id
LEFT JOIN PERFIL_DE_SALUD_TIENE_DISCAPACIDAD ON PERFIL_DE_SALUD.perfsalud_id = PERFIL_DE_SALUD_TIENE_DISCAPACIDAD.perfsalud_id
GROUP BY est_per_DNI
HAVING COUNT(dis_id) >= 1;
