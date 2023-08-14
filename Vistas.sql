USE eventos;

-- Vista 1

DROP VIEW IF EXISTS eventos.vista_patrocinadores_pagos;

CREATE VIEW vista_patrocinadores_pagos AS
SELECT p.Nombre_Patrocinador AS nombre_patrocinador, pa.Monto AS monto_pago_empresa
FROM patrocinador p
JOIN patrocinio pa ON p.ID_Patrocinador = pa.ID_Patrocinador
UNION ALL
SELECT 'Total' AS nombre_patrocinador, SUM(pa.Monto) AS monto_pago_empresa
FROM patrocinio pa;

/*Funcion: Muestra el nombre de los patrocinadores y el pago que realizan por aceptar sus terminos,
despues realiza la suma de los pagos para generar un total de los ingresos.

Ejemplo de uso:
SELECT * FROM eventos.vista_patrocinadores_pagos;
*/

-- Vista 2

DROP VIEW IF EXISTS eventos.vista_invitados_encuesta_pregunta1;

CREATE VIEW vista_invitados_encuesta_pregunta1 AS
SELECT n.Nombre AS nombre_invitado, e.Nombre_Evento AS evento, p.Puntuacion1 AS valoracion
FROM invitado n
JOIN respuesta_encuesta p ON n.ID_Invitado = p.ID_Invitado
JOIN evento e ON e.ID_Evento = p.ID_Evento;

/*Funcion: Muestra los nombres de los invitados, el evento al que asistieron y la puntuacion dada de dicho evento
sobre la pregunta 1.

Ejemplo de uso:
SELECT * FROM eventos.vista_invitados_encuesta_pregunta1;
*/

-- Vista 3

DROP VIEW IF EXISTS eventos.vista_invitados_encuesta_pregunta2;

CREATE VIEW vista_invitados_encuesta_pregunta2 AS
SELECT n.Nombre AS nombre_invitado, e.Nombre_Evento AS evento, p.Puntuacion2 AS valoracion
FROM invitado n
JOIN respuesta_encuesta p ON n.ID_Invitado = p.ID_Invitado
JOIN evento e ON e.ID_Evento = p.ID_Evento;

/*Funcion: Muestra los nombres de los invitados, el evento al que asistieron y la puntuacion dada de dicho evento
sobre la pregunta 2.

Ejemplo de uso:
SELECT * FROM eventos.vista_invitados_encuesta_pregunta2;
*/

-- Vista 4

DROP VIEW IF EXISTS eventos.vista_invitados_encuesta_pregunta3;

CREATE VIEW vista_invitados_encuesta_pregunta3 AS
SELECT n.Nombre AS nombre_invitado, e.Nombre_Evento AS evento, p.Puntuacion3 AS valoracion
FROM invitado n
JOIN respuesta_encuesta p ON n.ID_Invitado = p.ID_Invitado
JOIN evento e ON e.ID_Evento = p.ID_Evento;

/*Funcion: Muestra los nombres de los invitados, el evento al que asistieron y la puntuacion dada de dicho evento
sobre la pregunta 3.

Ejemplo de uso:
SELECT * FROM eventos.vista_invitados_encuesta_pregunta3;
*/

-- Vista 5

DROP VIEW IF EXISTS eventos.vista_invitados_encuesta_pregunta4;

CREATE VIEW vista_invitados_encuesta_pregunta4 AS
SELECT n.Nombre AS nombre_invitado, e.Nombre_Evento AS evento, p.Puntuacion4 AS valoracion
FROM invitado n
JOIN respuesta_encuesta p ON n.ID_Invitado = p.ID_Invitado
JOIN evento e ON e.ID_Evento = p.ID_Evento;

/*Funcion: Muestra los nombres de los invitados, el evento al que asistieron y la puntuacion dada de dicho evento
sobre la pregunta 4.

Ejemplo de uso:
SELECT * FROM eventos.vista_invitados_encuesta_pregunta4;
*/

-- Vista 6

DROP VIEW IF EXISTS eventos.empleados_roles;

CREATE VIEW empleados_roles AS
SELECT n.Nombre AS Nombre_Empleado, n.Apellido AS apellido_empleado, r.Rol AS rol, e.Nombre_Evento AS evento
FROM empleados n
JOIN asignacion r ON n.ID_Empleados = r.ID_Empleados
JOIN evento e ON e.ID_Evento = r.ID_Evento;

/*Funcion: Muestra el nombre y apellido del empleado tambien su rol y al evento al que participaron.

Ejemplo de uso:
SELECT * FROM eventos.empleados_roles;
*/




