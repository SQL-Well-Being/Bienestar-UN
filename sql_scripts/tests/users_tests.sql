USE bienestar_UN;

/*
Prueba leer en la tabla GRUPO_ARTISTICO_INSTITUCIONAL
Los usuarios con el rol 'estudiante' tienen permiso de lectura en esa tabla
*/
SELECT * FROM GRUPO_ARTISTICO_INSTITUCIONAL;


/*
Prueba leer en la tabla DEPORTE
Los usuarios con el rol 'estudiante' no tienen permiso de lectura en esa tabla
*/
SELECT * FROM DEPORTE;


/*
Prueba ejecutar eliminar_reservaciones
Solo los usuarios con el rol 'administrador' tienen permiso de ejecutar ese procedimiento almacenado 
*/
SELECT * FROM RESERVACION;
CALL eliminar_reservaciones('2024-05-20');
SELECT * FROM RESERVACION;
