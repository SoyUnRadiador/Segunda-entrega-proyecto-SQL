DROP DATABASE IF EXISTS eventos;

CREATE DATABASE eventos;

USE eventos;

-- Drop en orden correcto de las tablas

DROP TABLE IF EXISTS patrocinio;
DROP TABLE IF EXISTS contrato;
DROP TABLE IF EXISTS respuesta_encuesta;
DROP TABLE IF EXISTS encuesta;
DROP TABLE IF EXISTS recursos;
DROP TABLE IF EXISTS servicios_extra;
DROP TABLE IF EXISTS asignacion;
DROP TABLE IF EXISTS invitado;
DROP TABLE IF EXISTS entradas;
DROP TABLE IF EXISTS evento;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS proveedor_producto;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS patrocinador;
DROP TABLE IF EXISTS log_nuevo_invitado;
DROP TABLE IF EXISTS log_modificaciones_evento;


CREATE TABLE evento(
	ID_Evento INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Evento VARCHAR(30) NOT NULL
    , Descripcion VARCHAR(200) NULL 
    , Lugar VARCHAR(100) NOT NULL
    , Horario_Inicio TIME
    , Horario_Fin TIME,
    PRIMARY KEY (ID_Evento)
);



CREATE TABLE cliente(
	ID_Cliente INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NULL
    , Telefono INT NOT NULL
    , Correo_Electronico VARCHAR(255) NULL,
    PRIMARY KEY (ID_Cliente)
);



CREATE TABLE contrato (
	ID_Contrato INT NOT NULL AUTO_INCREMENT UNIQUE
    , ID_Cliente INT NOT NULL
    , ID_Evento INT NOT NULL
    , Fecha_Inicio DATE NOT NULL
    , Fecha_Finalizacion DATE NOT NULL
    , Pago decimal(10,2) NOT NULL,
    PRIMARY KEY (ID_Contrato),
    FOREIGN KEY (ID_Cliente) REFERENCES cliente (ID_Cliente),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento)
);



CREATE TABLE servicios_extra(
	ID_Servicio INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , Nombre_Servicio VARCHAR(50) NULL
    , Descripcion VARCHAR(200) NULL,
    PRIMARY KEY (ID_Servicio),
    FOREIGN KEY (ID_Evento) REFERENCES Evento (ID_Evento)
);



CREATE TABLE invitado(
	ID_Invitado INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NOT NULL
    , DNI VARCHAR(12) NOT NULL UNIQUE
    , Edad INT NOT NULL,
    PRIMARY KEY (ID_Invitado)
);



CREATE TABLE entradas(
	ID_Entradas INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , ID_Invitado INT NOT NULL
    , Nombre_Invitado VARCHAR(30) NOT NULL
    , Apellido_Invitado VARCHAR(30) NOT NULL
    , DNI_Invitado VARCHAR(12) NOT NULL UNIQUE
    , Edad INT NOT NULL
    , Tipo_Entrada VARCHAR(30) NOT NULL 
    , Contraseña_Codigo VARCHAR(30) NULL
    , Precio_Entrada DECIMAL(7,2) NULL,
    PRIMARY KEY (ID_Entradas),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento),
    FOREIGN KEY (ID_Invitado) REFERENCES invitado (ID_Invitado)
);



CREATE TABLE empleados(
	ID_Empleados INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NOT NULL
    , Correo_Electronico VARCHAR(255) NULL
    , Telefono INT NOT NULL
    , Disponibilidad CHAR(2) NOT NULL,
    PRIMARY KEY (ID_Empleados)
);



CREATE TABLE asignacion(
	ID_Asignacion INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Empleados INT NOT NULL
    , ID_Evento INT NOT NULL
    , Rol VARCHAR(40) NOT NULL
    , Inicio_Laboral TIME NOT NULL
    , Fin_Laboral TIME NOT NULL,
    PRIMARY KEY (ID_Asignacion),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento),
    FOREIGN KEY (ID_Empleados) REFERENCES empleados (ID_Empleados)
);



CREATE TABLE recursos(
	ID_Recurso INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Recurso VARCHAR(30) NOT NULL
    , Descripcion VARCHAR(200) NULL
    , Cantidad INT NOT NULL
    ,Disponibilidad CHAR(2),
    PRIMARY KEY (ID_Recurso)
);



CREATE TABLE proveedores(
	ID_Proveedor INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Proveedor VARCHAR(30) NOT NULL
    , Contacto INT NOT NULL,
    PRIMARY KEY (ID_Proveedor)
);



CREATE TABLE proveedor_producto(
	ID_Producto_Prov INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Proveedor INT NOT NULL
    , Nombre_Producto VARCHAR(30) NOT NULL
    , Precio DECIMAL(10,2) NOT NULL
    , Stock_Disponible INT NOT NULL,
    PRIMARY KEY (ID_Producto_Prov),
    FOREIGN KEY (ID_Proveedor) REFERENCES proveedores (ID_Proveedor)
);



CREATE TABLE patrocinador(
	ID_Patrocinador INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Patrocinador VARCHAR(30) NOT NULL
    , Contacto INT NOT NULL,
    PRIMARY KEY (ID_Patrocinador)
);



CREATE TABLE patrocinio(
	ID_Patrocinio INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Patrocinador INT NOT NULL
    , Monto INT NOT NULL
    , Condiciones VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_Patrocinio),
    FOREIGN KEY (ID_Patrocinador) REFERENCES patrocinador (ID_Patrocinador)
);



CREATE TABLE encuesta(
	ID_Encuesta INT NOT NULL UNIQUE AUTO_INCREMENT
    , Pregunta VARCHAR(200) NOT NULL,
    PRIMARY KEY (ID_Encuesta)
);



CREATE TABLE respuesta_encuesta(
	ID_Respuesta INT NOT NULL UNIQUE AUTO_INCREMENT
    , ID_Evento INT NOT NULL
    , ID_Invitado INT NOT NULL
    , Puntuacion1 INT NULL
    , Puntuacion2 INT NULL
    , Puntuacion3 INT NULL
    , Puntuacion4 INT NULL,
    PRIMARY KEY (ID_Respuesta),
    FOREIGN KEY (ID_Evento) REFERENCES evento (ID_Evento),
    FOREIGN KEY (ID_Invitado) REFERENCES invitado (ID_Invitado)
);

-- Tablas de auditoria

CREATE TABLE log_nuevo_invitado(
	ID_Nuevo_Invitado INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre VARCHAR(30) NOT NULL
    , Apellido VARCHAR(30) NOT NULL
    , DNI VARCHAR(12) NOT NULL UNIQUE
    , Edad INT NOT NULL
    , Usuario VARCHAR(100) NOT NULL
    , Fecha_Hora_Carga DATETIME NOT NULL,
    PRIMARY KEY (ID_Nuevo_Invitado)
);


CREATE TABLE log_modificaciones_evento(
	ID_modificaciones_evento INT NOT NULL UNIQUE AUTO_INCREMENT
    , Nombre_Evento VARCHAR(30) NOT NULL
    , Lugar_Anterior VARCHAR(100) NOT NULL
    , Lugar_Nuevo VARCHAR(100) NOT NULL
    , Horario_Inicio_Anterior TIME NOT NULL
    , Horario_Inicio_Nuevo TIME NOT NULL
    , Horario_Fin_Anterior TIME NOT NULL
    , Horario_Fin_Nuevo TIME NOT NULL
    , Usuario VARCHAR(100) NOT NULL 
    , Fecha_Hora_Carga DATETIME NOT NULL,
    PRIMARY KEY (ID_modificaciones_evento)
);