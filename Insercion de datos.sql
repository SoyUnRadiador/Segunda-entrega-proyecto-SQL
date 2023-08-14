USE eventos;

INSERT INTO evento(Nombre_Evento, Descripcion, Lugar, Horario_Inicio, Horario_Fin)
VALUES 
('Cumpleaños de 15', NULL, 'Janos San Martin', '19:30:00', '22:00:00'),
('Casamiento', 'Con lluvia se pospone el evento', 'Quinta Los Janos', '13:00:00', '16:00:00'),
('Concierto', 'Invitacion de parte de la empresa', 'Cafe Janos', '17:00:00', '19:00:00');


INSERT INTO cliente(Nombre, Apellido, Telefono, Correo_Electronico)
VALUES
('Adrian', 'Rivaduro', '1158392022', 'adrianduro56@gmail.com'),
('Santiago', 'Gordomez', '1148292200', NULL),
('Leonardo', 'Nevera', '114892020', 'Leonardovera@gmail.com');


INSERT INTO contrato(ID_Cliente, ID_Evento, Fecha_Inicio, Fecha_Finalizacion, Pago)
VALUES
('1', '1', '2023-07-23', '2023-07-23', '330000.00'),
('2', '2', '2023-07-18', '2023-07-18', '500000.00'),
('3', '3', '2023-07-28', '2023-07-28', '0.00');


INSERT INTO invitado(Nombre, Apellido, DNI, Edad)
VALUES
('Valentilin', 'Muñon', '46493067', '16'),
('Guillermo', 'Bocha', '44893467', '20'),
('Martin', 'Panzarreta', '44812936', '20'),
('Dante', 'Leonardo', '42938273', '25'),
('Tomas', 'Conter', '41684493', '30'),
('Valentino', 'Colasanto', '44382940', '21');


INSERT INTO entradas(ID_Evento, ID_Invitado, Nombre_Invitado, Apellido_Invitado, DNI_Invitado, Edad, Tipo_Entrada, Contraseña_Codigo, Precio_Entrada)
VALUES
('1', '1', 'Valentilin', 'Muñon', '46493067', '16', 'Invitacion en lista', NULL, NULL),
('1', '2', 'Guillermo', 'Bocha', '44893467', '20', 'Invitacion en lista', NULL, NULL),
('2', '3', 'Martin', 'Panzarreta', '44812936', '20', 'Invitacion en lista', NULL, NULL),
('2', '4', 'Dante', 'Leonardo', '42938273', '25', 'Invitacion en lista', NULL, NULL),
('3', '5', 'Tomas', 'Conter', '41684493', '30', 'Ticket', 'QR' , '2000.00'),
('3', '6', 'Valentino', 'Colasanto', '44382940', '21', 'Ticket', 'QR' , '2000.00');


INSERT INTO empleados(Nombre, Apellido, Correo_Electronico, Telefono, Disponibilidad)
VALUE
('Maria', 'Pelaez', 'MariaPelaez@gmail.com', '1118376524', 'SI' ),
('Nieves', 'Osuna', NULL, '1168455425', 'SI' ),
('Pascuala', 'Del-Rio', 'pascualadelrio@gmail.com', '1158320597', 'NO' ),
('Virgínia', 'Infante', 'virginiainfante@gmail.com', '1146708979', 'NO' ),
('Gemma', 'Molinero', 'gemmamolinero@gmail.com', '1158184930', 'SI' ),
('Catalina', 'Ramiro', 'catalinaramiro@gmail.com', '1196511736', 'SI' );


INSERT INTO asignacion(ID_Empleados, ID_Evento, Rol, Inicio_Laboral, Fin_Laboral)
VALUES
('1', '1', 'Cocinero', '19:30:00', '22:00:00'),
('2', '1', 'Mesero', '19:30:00', '22:00:00'),
('3', '2','Cocinero', '13:00:00', '19:00:00'),
('4', '2','Organizador', '13:00:00', '19:00:00'),
('5', '3','Cocinero', '13:00:00', '19:00:00'),
('6', '3','Mesero', '17:00:00', '19:00:00');


INSERT INTO encuesta(Pregunta)
VALUES
('¿Que tanto te gusto el evento?'),
('¿Que tanto te gusto la organizacion del evento?'),
('¿Que tanto te gusto la atencion de nuestros empleados?'),
('¿Que tanto te gusto el establecimiento?');


INSERT INTO respuesta_encuesta (ID_Evento, ID_Invitado, Puntuacion1, Puntuacion2, Puntuacion3, Puntuacion4)
VALUES
('1', '1', '10', '10', '9', '9'),
('1', '2', '9', '8', '9', '8'),
('2', '3', NULL, NULL, NULL, NULL),
('2', '4', '6', '5', '9', '8'),
('3', '5', '7', '8', '9', '8'),
('3', '6', NULL, NULL, NULL, NULL);


INSERT INTO patrocinador(Nombre_Patrocinador, Contacto)
values
('Cocacola', '1107694661'),
('Corona', '1181769398'),
('Pedidosya', '1102957962');


INSERT INTO patrocinio(ID_Patrocinador, Monto, Condiciones)
VALUES
('1', '30000.00', 'Espacios publicitarios y servicios exclusivos de mesa en base a la marca'),
('2', '30000.00', 'Espacios publicitarios y servicios exclusivos de mesa en base a la marca'),
('3', '10000.00', 'Espacios publicitarios');

INSERT INTO proveedores(Nombre_Proveedor, Contacto)
VALUES
('Frigorifico-MC', '1169737977'),
('Unilever', '1183473779');


INSERT INTO proveedor_producto(ID_Proveedor, Nombre_Producto, Precio, Stock_Disponible)
VALUES
('1', 'Asado', '3000.00', '30'),
('1', 'Bife de chorizo', '3900.00', '10'),
('1', 'Lomo', '3400.00', '13'),
('2', 'Savora', '3625.00', '200'),
('2', 'Cif', '3800', '120'),
('2', 'Fanacoa', '2950', '480');

INSERT INTO servicios_extra(ID_Evento, Nombre_Servicio, Descripcion)
VALUES
('1', 'Show de baile', NULL),
('2', 'Alquiler de coche', 'Mercedes Benz 300S'),
('3', NULL, NULL);

INSERT INTO recursos(Nombre_Recurso, Descripcion, Cantidad, Disponibilidad)
VALUES
('Chebrolet clasic', 'Uso exclusivo del personal', '1', 'SI'),
('Fiat Ducato', 'Uso exclusivo del personal', '1', 'SI'),
('Maquina De Humo Gadnic', NULL, '3', 'SI'),
('Maquina de haz de luz', NULL, '3', 'SI');






