DROP DATABASE IF EXISTS DBSINIESTROS;
CREATE DATABASE IF NOT EXISTS DBSINIESTROS;

USE DBSINIESTROS;

DROP TABLE IF EXISTS Homicidios;
CREATE TABLE IF NOT EXISTS Homicidios (
	Id VARCHAR(50),
	Victimas INT,
    Sexo VARCHAR(50),
    Edad INT,
    Rol VARCHAR(50),
    Victima VARCHAR(50),
    Acusado VARCHAR(50),
    Fecha DATE,
    Semestre INT,
    Franja_Horaria INT,
    Lugar_Del_Hecho VARCHAR(150),
    Tipo_De_Calle VARCHAR(50),
    Calle VARCHAR(75),
    Direccion VARCHAR(150),
    Altura_Cruce VARCHAR(75),
    Comuna INT,
    Longitud DECIMAL(23,20),
    Latitud DECIMAL(23,20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PI_02\\homicidios.csv'
INTO TABLE Homicidios
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' IGNORE 1 
LINES (Id,
	Victimas,
    Sexo,
    Edad,
    Rol,
    Victima,
    Acusado,
    Fecha,
    Semestre,
    Franja_Horaria,
    Lugar_Del_Hecho,
    Tipo_De_Calle,
    Calle,
    Direccion,
    Altura_Cruce,
    Comuna,
    Longitud,
    Latitud);

SELECT * FROM Homicidios;

DROP TABLE IF EXISTS Lesiones;
CREATE TABLE IF NOT EXISTS Lesiones (
	Id VARCHAR(50),
	Victimas INT,
    Sexo VARCHAR(50),
    Edad_Victima INT,
    Participantes VARCHAR(50),
    Victima VARCHAR(50),
    Acusado VARCHAR(50),
    Vehiculo_Victima VARCHAR(50),
    Fecha DATE,
    Semestre INT,
    Franja_Horaria INT,
    Direccion VARCHAR(250),
    Tipo_De_Calle VARCHAR(50), 
    Altura_Cruce VARCHAR(75),
    Comuna INT,
    Longitud DECIMAL(23,20),
    Latitud DECIMAL(23,20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PI_02\\lesiones.csv'
INTO TABLE Lesiones
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' IGNORE 1 
LINES (Id,
	Victimas,
    Sexo,
    Edad_Victima,
    Participantes,
    Victima,
    Acusado,
    Vehiculo_Victima,
    Fecha,
    Semestre,
    Franja_Horaria,
    Direccion,
    Tipo_De_Calle, 
    Altura_Cruce,
    Comuna,
    Longitud,
    Latitud);

SELECT * FROM Homicidios;

DROP TABLE IF EXISTS Comunas;
CREATE TABLE IF NOT EXISTS Comunas (
	Comuna INT,
	Barrios VARCHAR(200),
    Geometria LONGTEXT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PI_02\\comunas.csv'
INTO TABLE Comunas
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';' OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n' IGNORE 1 
LINES (Comuna,
	Barrios,
    Geometria);

SELECT * FROM Comunas;