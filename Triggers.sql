-- 1º TRIGGER
DROP TRIGGER IF EXISTS eventos.tr_before_insert_invitado;

DELIMITER $$
USE eventos$$
CREATE DEFINER=root@localhost TRIGGER tr_before_insert_invitado BEFORE INSERT ON invitado FOR EACH ROW
BEGIN
    DECLARE cantidad INT;
    SELECT COUNT(*) INTO cantidad
    FROM invitado
    WHERE Nombre = NEW.Nombre AND Apellido = NEW.Apellido;
    IF cantidad > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: El nombre y apellido ya existen en la tabla invitado.';
    ELSE
        INSERT INTO log_nuevo_invitado (Nombre, Apellido, DNI, Edad, Usuario, Fecha_Hora_Carga)
        VALUES (NEW.Nombre, NEW.Apellido, NEW.DNI, NEW.Edad, USER(), NOW());
    END IF;
END;$$
DELIMITER ;

/* Funcion: Al agregar un nuevo invitado, el trigger se asegurara de que su nombre y apellido no 
se hayen repetidos en la tabla invitados impidiendo que dichos datos se suban, y si esto no es asi los datos se subiran 
a la tabla invitados y log_nuevo_invitado de forma correcta.

Ejemplo de uso:
INSERT INTO invitado (Nombre, Apellido, DNI, Edad)
VALUES
('Gustavo', 'Morales', '44693060', '20');
*/

-- 2º TRIGGER

DROP TRIGGER IF EXISTS eventos.evento_after_update;

DELIMITER $$
USE eventos$$
CREATE DEFINER = CURRENT_USER TRIGGER eventos.evento_after_update
AFTER UPDATE ON evento 
FOR EACH ROW
BEGIN
	IF NEW.Horario_Inicio != OLD.Horario_Inicio OR NEW.Horario_Fin != OLD.Horario_Fin OR NEW.Lugar != OLD.Lugar
    THEN
		INSERT INTO log_modificaciones_evento(Nombre_Evento, Lugar_Anterior, Lugar_Nuevo, Horario_Inicio_Anterior, Horario_Inicio_Nuevo, Horario_Fin_Anterior, Horario_Fin_Nuevo, Usuario, Fecha_Hora_Carga)
        VALUES
        (OLD.Nombre_Evento, OLD.Lugar, NEW.Lugar, OLD.Horario_Inicio, NEW.Horario_Inicio, OLD.Horario_Fin, NEW.Horario_Fin, USER(), NOW());
	END IF;
END;$$
DELIMITER ;

/* Funcion: Al utilizar un update en la tabla de evento que cambien el lugar, fecha de inicio o fecha de fin.
El trigger se activara guardando el anterior resultado que se quiso modificar y tambien el nuevo, ademas de 
el usuario que realizo dicho cambio como tambien el dia y horario en el que se ejecuto dicha funcion.

Ejemplo de uso:
UPDATE evento
SET Horario_Inicio = '16:00:00'
WHERE Nombre_Evento = 'Concierto';
*/