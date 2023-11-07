-- Tomas Leon - 21367682-2
-- Thomas Muñoz - 20750450-5
-- Hugo Rojas - 21333863-3
peneeeeeeeeeeeeeeeeeeeeeeeeeeee


CREATE TABLE Estaciones(
    id_estacion varchar(4) NOT NULL,
    nombre varchar(30) NOT NULL,
    fecha_inauguracion date,
    linea varchar(3) NOT NULL,
    FOREIGN KEY (linea) REFERENCES Lineas(linea),
    color_estacion varchar(5),
    PRIMARY KEY (id_estacion)
);

create table Lineas (
	linea VARCHAR(3) NOT NULL,
	PRIMARY KEY(linea),
	color VARCHAR(20) NOT NULL,
	año date NOT NULL
);
create table Codigos (
	id_codigo VARCHAR(10) NOT NULL,
	PRIMARY KEY(id_codigo),
	descripcion VARCHAR(255) NOT NULL
);

CREATE TABLE Reportadores (
    rut VARCHAR(10) NOT NULL,
    PRIMARY KEY(rut),
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    sueldo INT NOT NULL
);
CREATE TABLE Reporte(
    id_reporte SERIAL NOT NULL,
    PRIMARY KEY(id_reporte),
    id_crea VARCHAR(10) NOT NULL,
    FOREIGN KEY(id_crea) REFERENCES Reportadores(rut) ,
    fecha_hora TIMESTAMP NOT NULL,
    codigo VARCHAR(10) NOT NULL,
    FOREIGN KEY(codigo) REFERENCES Codigos (id_codigo),
    comentario VARCHAR(255) NOT NULL
);
CREATE TABLE reporte_estaciones(
    id_reporte_estaciones SERIAL NOT NULL,
    PRIMARY KEY(id_reporte_estaciones),
    id_reporte int NOT NULL,
    FOREIGN KEY(id_reporte) REFERENCES Reporte(id_reporte),
    id_estacion_afectada VARCHAR(4) NOT NULL,
    FOREIGN KEY(id_estacion_afectada) REFERENCES Estaciones(id_estacion) ,
    fecha_hora timestamp NOT NULL,
    id_crea VARCHAR(10) NOT NULL,
    FOREIGN KEY(id_crea) REFERENCES Reportadores(rut)
);
