USE eventos;
DROP function IF EXISTS `calcular_puntuacion_promedio`;

-- FUNCION 1

DELIMITER $$
USE eventos$$
CREATE FUNCTION calcular_puntuacion_promedio (invitado1 INT, invitado2 INT, invitado3 INT, invitado4 INT)
RETURNS INT
DETERMINISTIC
NO SQL
BEGIN
	DECLARE resultado INT;
	SET resultado = (invitado1 + invitado2 + invitado3 + invitado4) / 4;
RETURN resultado;
END$$

/*
Ejemplo de uso:
SELECT calcular_puntuacion_promedio ('10', '9', '6', '7') AS promedio;
*/

DELIMITER ;

-- FUNCION 2

USE eventos;
DROP function IF EXISTS `horas_trabajadas`;

DELIMITER $$
USE eventos$$
CREATE FUNCTION horas_trabajadas (Inicio_Laboral TIME, Fin_Laboral TIME)
RETURNS TIME
DETERMINISTIC
NO SQL
BEGIN
	DECLARE resultado TIME;
    SET resultado = TIMEDIFF(Inicio_Laboral, Fin_Laboral);
RETURN resultado;
END;$$

/*
Ejemplo de uso:
SELECT horas_trabajadas ('19:30:00', '22:00:00') AS total_laboral;
*/

DELIMITER ;

