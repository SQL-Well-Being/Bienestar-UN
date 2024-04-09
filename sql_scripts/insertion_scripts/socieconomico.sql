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
    ("Programa de Gestion Alimentaria - Desayuno", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) desayuno.",
    "PGAL-2024-1"
    ),
    ("Programa de Gestion Alimentaria - Almuerzo", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) almuerzo.",
    "PGAL-2024-1"
    ),
    ("Programa de Gestion Alimentaria - Cena", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) cena",
    "PGAL-2024-1"
    ),
    ("Programa de Gestion Alimentaria - Desayuno", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) desayuno.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - Almuerzo", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) almuerzo.",
    "PGAL-2023-2"
    ),
    ("Programa de Gestion Alimentaria - Cena", 
    "Consiste en un apoyo en especie que se otorga paracubrir el 100% del valor de un (1) cena",
    "PGAL-2023-2"
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
    "Spot: Cupo de alojamiento para hombres y mujeres solteros/as sin hijos/as. En habitaciones compartidas hasta 2 estudiantes. Baño compartido por hasta 2
    estudiantes. Sujeto al manual de convivencia del alojamiento.",
    "PGAJ-2024-1"
    ),
    ("Programa Gestion Transporte",
    "Consiste en recargas de unidades de transporte a la tarjeta personalizada “Tullave”, para cubrir el desplazamiento
    diario (ida y vuelta) hacia el campus de la Universidad", 
    "PGTR-2024-1"
    );