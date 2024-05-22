USE bienestar_UN;

INSERT INTO bienestar_UN.CONVOCATORIA_GENERAL
    (con_gen_tipo, con_gen_periodo_academico, con_gen_horas_de_corresponsabilidad)
VALUES
    ("AL", "2024-1", 16),
    ("AJ", "2024-1", 40),
    ("TR", "2024-1", 16),
    ("E", "2024-1", 32),
    ("AL", "2023-2", 15),
    ("AJ", "2023-2", 42),
    ("TR", "2023-2", 12),
    ("E", "2023-2", 32);

INSERT INTO bienestar_UN.CONVOCATORIA_ESPECIFICA
    (con_esp_nombre, con_esp_descripcion, con_esp_con_gen_codigo)
VALUES
    ("Programa de Gestion Alimentaria - DESAYUNO", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) desayuno.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - ALMUERZO", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) almuerzo.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - CENA", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) cena",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - DESAYUNO", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) desayuno.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - ALMUERZO", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) almuerzo.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - CENA", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) cena",
    "PGAL-2024-1"
    ),
    ("Programa Gestion Alojamiento - CRU",
    ": Cupo de alojamiento para hombres y mujeres solteros/as sin hijos/as, en habitaciones compartidas por hasta 3 estudiantes. Bano
    compartido hasta 5 estudiantes. Sujeto al manual de convivencia del alojamiento",
    "PGAJ-2024-1"
    ),
    ("Programa Gestion Alojamiento - San Rafael",
    "Cupo de alojamiento para mujeres solteras, en estado de embarazo o madres solteras con un/a solo hijo/a menor de 5 anios. En
    habitación individual y cuna. Bano compartido por hasta 5 estudiantes Sujeto al manual de convivencia del alojamiento",
    "PGAJ-2024-1"
    ),
    ("Programa Gestion Alojamiento - The Spot",
    "Spot: Cupo de alojamiento para hombres y mujeres solteros/as sin hijos/as. En habitaciones compartidas hasta 2 estudiantes. Bano compartido por hasta 2
    estudiantes. Sujeto al manual de convivencia del alojamiento.",
    "PGAJ-2024-1"
    ),
    ("Programa Gestion Transporte",
    "Consiste en recargas de unidades de transporte a la tarjeta personalizada “Tullave”, para cubrir el desplazamiento
    diario (ida y vuelta) hacia el campus de la Universidad", 
    "PGTR-2024-1"
    ),
    ("Programa Gestion Economica",
    "Se otorga un porcentaje de salario minimo mensual",
    "PGE-2024-1");


INSERT INTO bienestar_UN.ESTUDIANTE_PARTICIPA_EN_CONVOCATORIA_GESTION
    (con_esp_id, est_per_DNI, con_esp_estado)
VALUES
    (1, 111111100, "ELEGIBLE"),
    (1, 111111101, "ADJUDICADO"),
    (2, 111111102, "ADJUDICADO"),
    (2, 111111103, "ADJUDICADO"),
    (2,111111104, "ELEGIBLE" ),
    (3, 111111105, "ADJUDICADO" ),
    (4,111111106, "ADJUDICADO" ),
    (4, 111111107, "ELEGIBLE"),
    (7, 111111107, "ADJUDICADO"),
    (7, 111111103, "ADJUDICADO"),
    (8, 111111104, "ELEGIBLE"),
    (8, 111111108, "ADJUDICADO"),
    (9, 111111102, "ELEGIBLE");


-- Registro de Beneficiarios

INSERT INTO bienestar_UN.BENEFICIARIO_PROGRAMA_DE_GESTION
    (ben_periodo_academico, ben_est_per_DNI, con_esp_id)
VALUES
    ("2023-2", 111111101, 1),
    ("2023-2", 111111102, 2),
    ( "2023-2", 111111103, 2),
    ( "2023-2", 111111105, 3),
    ( "2023-2", 111111106, 4),
    ( "2024-1", 111111103, 7),
    ( "2024-1", 111111107, 7),
    ( "2024-1", 111111108, 8);