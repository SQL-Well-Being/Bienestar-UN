USE bienestar_UN;

DROP VIEW IF EXISTS vw_info_academica_estudiante;

CREATE VIEW vw_info_academica_estudiante 
    AS
(SELECT hist_codigo, hist_es_activa, pro_codigo, pro_nombre, 
	   hist_est_per_DNI AS 'est_per_DNI',
       creditos_cursados, creditos_aprobados, 
       (ROUND(ponderado/creditos_cursados, 1)) AS 'PAPA', (ROUND(creditos_aprobados*100/pro_numero_de_creditos, 2)) AS 'porcentaje_avance'
	
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
	GROUP BY asic_hist_codigo) AS SUB3  ON hist_codigo = SUB3.asic_hist_codigo);