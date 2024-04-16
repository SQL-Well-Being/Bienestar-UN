
-- Muestra cuantos beneficiarios de un programa de gestion (cualquiera) hubo en cada semestre

-- AR: γ ben_periodo_academico; count(*) → 'Cantidad beneficiados' (BENEFICIARIO_PROGRAMA_GESTION)
SELECT ben_periodo_academico, COUNT(*) AS 'Cantidad Beneficiados'
FROM BENEFICIARIO_PROGRAMA_DE_GESTION GROUP BY ben_periodo_academico;


-- Lista las veces que cada Estudiante ha sido beneficiario de algun apoyo socioeconomico, muestra un 0 en caso de nunca haber sido beneficado

-- AR: γ est_per_dni; est_per_dni, COUNT(est_per_dni) → 'Veces Beneficiado' (ESTUDIANTE ⟕ est_per_DNI = ben_est_per_DNI BENEFICIARIO_PROGRAMA_GESTION)
SELECT est_per_DNI, COUNT(ben_id) AS 'Veces Beneficiado' FROM ESTUDIANTE
LEFT JOIN BENEFICIARIO_PROGRAMA_DE_GESTION ON est_per_DNI = ben_est_per_DNI
GROUP BY est_per_DNI;

-- Informacion academica completa de todos los estudiantes

SELECT hist_codigo, hist_es_activa, hist_pro_codigo, pro_nombre, 
	   hist_est_per_DNI, 
       creditos_cursados, creditos_aprobados, 
       (ROUND(ponderado/creditos_cursados, 1)) AS 'P.A.P.A', (ROUND(creditos_aprobados*100/pro_numero_de_creditos, 2)) AS 'porcentaje_avance'
	
    FROM
    
    HISTORIA_ACADEMICA 
    INNER JOIN PROGRAMA_CURRICULAR ON hist_pro_codigo = pro_codigo
    
    INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_cursados'  FROM 
	ASIGNATURA_CURSADA INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
	GROUP BY asic_hist_codigo) AS SUB1 ON hist_codigo = SUB1.asic_hist_codigo
    
    INNER JOIN (SELECT asic_hist_codigo, SUM(asi_numero_de_creditos) AS 'creditos_aprobados'  FROM 
	ASIGNATURA_CURSADA INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
    WHERE asic_nota_final >= 3.0
	GROUP BY asic_hist_codigo) AS SUB2 ON hist_codigo = SUB2.asic_hist_codigo
    
    INNER JOIN (SELECT asic_hist_codigo, SUM(asic_nota_final * asi_numero_de_creditos) AS 'ponderado'  FROM 
	ASIGNATURA_CURSADA INNER JOIN ASIGNATURA ON asic_asi_codigo = asi_codigo
	GROUP BY asic_hist_codigo) AS SUB3  ON hist_codigo = SUB3.asic_hist_codigo;