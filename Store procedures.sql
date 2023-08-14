-- Estore procedure 1

USE eventos;
DROP procedure IF EXISTS obtener_invitados_ordenados;

DELIMITER $$
USE eventos$$
CREATE PROCEDURE obtener_invitados_ordenados(IN ordenamiento VARCHAR(10))
BEGIN
    
    IF ordenamiento = 'Nombre' THEN
        SELECT * FROM invitado ORDER BY Nombre;
    ELSE
    IF ordenamiento = 'Apellido' THEN
        SELECT * FROM invitado ORDER BY Apellido;
	END IF;
    END IF;
END;$$

/*Funcion: Ordena a los invitados por medio del Nombre o Apellido
Ejemplo de uso:
call eventos.obtener_invitados_ordenados('Nombre');
call eventos.obtener_invitados_ordenados('Apellido');
*/
DELIMITER ;


-- Estore procedure 2


USE eventos;
DROP procedure IF EXISTS mover_asignacion_empleado;

DELIMITER $$
USE eventos$$
CREATE PROCEDURE mover_asignacion_empleado 
(
    IN id_empleado INT,
    IN id_evento_actual INT,
    IN id_nuevo_evento INT,
    IN nuevo_rol VARCHAR(20)
)
BEGIN
    IF EXISTS (SELECT 1 FROM asignacion WHERE ID_Empleados = id_empleado AND ID_Evento = id_evento_actual)
    THEN
        IF EXISTS (SELECT 1 FROM evento WHERE ID_Evento = id_nuevo_evento)
        THEN
            UPDATE asignacion
            SET ID_Evento = id_nuevo_evento, Rol = nuevo_rol
            WHERE ID_Empleados = id_empleado AND ID_Evento = id_evento_actual;
        END IF;
    END IF;
END;$$

/*Funcion: Cambia la asignacion de los empleados a un nuevo rol y evento
Ejemplo de uso:
call eventos.mover_asignacion_empleado(1, 1, 2, 'mesera');
*/

DELIMITER ;
