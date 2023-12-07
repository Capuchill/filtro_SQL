-- Active: 1701732917830@@127.0.0.1@3306@TBM
INSERT INTO BUSES (placa)
VALUES
    ("XVH345"),
    ("XDL965"),
    ("XFG847"),
    ("XRJ452"),
    ("XDF459"),
    ("XET554"),
    ("XKL688"),
    ("XXL757");

INSERT INTO ZONA (nombre) 
VALUES ("Norte"), ("Sur"), ("Oriente"), ("Occidente"), ("Floridablanca"), ("Girón"), ("Piedecuesta");

INSERT INTO RUTA (nombre,tiempo,id_zona)
VALUES ("Universidades","2:00:00",1), 
("Café Madrid","2:15:00",1), 
("Cacique","1:45:00",NULL), 
("Diamantes","1:50:00",4), 
("Terminal","2:00:00",5), 
("Prado","1:30:00",NULL), 
("Cabecera","1:30:00",NULL), 
("Ciudadela","2:00:00",NULL), 
("Punta Estrella","2:30:00",NULL), 
("Niza","2:45:00",5), 
("Autopista","2:15:00",5), 
("Lagos","2:15:00",5), 
("Centro Florida","2:30:00",NULL);

INSERT INTO `ESTACIONES`(nombre)
VALUES ("Colseguros"), ("Clínica Chicamocha"), ("Plaza Guarín"), ("Mega Mall"), ("UIS"), ("UDI"), ("Santo Tomás"), ("Boulevard Santander"), ("Búcaros"), ("Rosita"), ("Puerta del Sol"), ("Cacique"), ("Plaza Satélite"), ("La Sirena"), ("Provenza"), ("Fontana"), ("Gibraltar"), ("Terminal"), ("Mutis"), ("Plaza Real");


INSERT INTO `CONDUCTORES`(nombre,apellido)
VALUES
    ("Andrés Manuel", "López Obrador"),
    ("Nicolás", "Maduro Moros"),
    ("Alberto", "Fernández"),
    ("Luiz Inácio", "Lula da Silva"),
    ("Gabriel", "Boric"),
    ("Miguel", "Díaz-Canel"),
    ("Daniel", "Ortega"),
    ("Gustavo", "Petro Urrego"),
    ("Luis", "Arce"),
    ("Xiomara", "Castro");

INSERT INTO `ESTACIONES_RUTA` (id_ruta, id_estacion) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(3,8),
(3,9),
(3,10),
(3,11),
(3,12),
(4,13),
(4,14),
(4,15),
(5,16),
(5,17),
(8,18),
(8,19),
(8,20);

INSERT INTO `BUSES_CONDUCTOR`(id_conductor,id_bus)
VALUES
(5,1),
(5,3),
(5,5),
(3,5),
(3,6),
(3,1),
(3,3),
(10,3),
(10,5),
(10,4),
(10,7),
(7,7),
(6,7),
(6,7),
(6,6);

INSERT INTO `PROGRAMACION`(id_conductor,id_ruta,dia_programado,id_bus)
VALUES
(5,1,"Lunes",1),
(5,1,"Martes",1),
(5,1,"Miercoles",3),
(5,1,"Jueves",3),
(5,2,"Viernes",5),
(5,2,"Sabado",5),
(5,2,"Domingo",5),
(3,4,"Lunes",5),
(3,4,"Martes",6),
(3,4,"Miercoles",1),
(3,5,"Jueves",1),
(3,5,"Viernes",3),
(3,5,"Sabado",3),
(3,5,"Domingo",3),
(10,10,"Lunes",3),
(10,10,"Martes",3),
(10,10,"Miercoles",5),
(10,10,"Jueves",5),
(10,10,"Viernes",4),
(10,11,"Sabado",7),
(10,11,"Domingo",7),
(7,11,"Lunes",7),
(7,11,"Martes",7),
(6,12,"Miercoles",7),
(6,12,"Jueves",7),
(6,12,"Viernes",7),
(6,12,"Sabado",6),
(6,12,"Domingo",6);

