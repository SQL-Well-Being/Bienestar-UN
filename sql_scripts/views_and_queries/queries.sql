
-- Muestra cuantos beneficiarios de un programa de gestion (cualquiera) hubo en cada semestre

-- AR: γ ben_periodo_academico; count(*) → 'Cantidad beneficiados' (BENEFICIARIO_PROGRAMA_GESTION)
SELECT ben_periodo_academico, COUNT(*) AS 'Cantidad Beneficiados'
FROM BENEFICIARIO_PROGRAMA_DE_GESTION GROUP BY ben_periodo_academico;


-- Lista las veces que cada Estudiante ha sido beneficiario de algun apoyo socioeconomico, muestra un 0 en caso de nunca haber sido beneficado

-- AR: γ est_per_dni; est_per_dni, COUNT(est_per_dni) → 'Veces Beneficiado' (ESTUDIANTE ⟕ est_per_DNI = ben_est_per_DNI BENEFICIARIO_PROGRAMA_GESTION)
SELECT est_per_DNI, COUNT(ben_id) AS 'Veces Beneficiado' FROM ESTUDIANTE
LEFT JOIN BENEFICIARIO_PROGRAMA_DE_GESTION ON est_per_DNI = ben_est_per_DNI
GROUP BY est_per_DNI;