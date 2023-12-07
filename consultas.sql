-- Active: 1701732917830@@127.0.0.1@3306@TBM

-- 1

SELECT r.nombre,COUNT(er.id_estacion)
FROM `ESTACIONES_RUTA` er
INNER JOIN `RUTA` r ON r.id_ruta = er.id_ruta
GROUP BY r.nombre;

-- 2

SELECT e.nombre 
FROM `ESTACIONES_RUTA` er
INNER JOIN `ESTACIONES` e ON e.id_estacion = er.id_estacion
WHERE id_ruta = 1;

-- 3

SELECT r.nombre
FROM `RUTA` r
WHERE r.id_ruta NOT IN (SELECT id_ruta FROM `PROGRAMACION`);


-- 4

SELECT r.nombre 
FROM  `PROGRAMACION` e
RIGHT JOIN `RUTA` r ON r.id_ruta = e.id_ruta
WHERE e.id_conductor IS NULL;

-- 5

SELECT c.nombre, c.apellido
FROM `CONDUCTORES` c
WHERE c.id_conductor NOT IN (SELECT id_conductor FROM `PROGRAMACION`);


-- 6

SELECT b.placa
FROM `BUSES` b
WHERE b.id_bus NOT IN (SELECT id_bus FROM `PROGRAMACION`);


-- 7

SELECT DISTINCT
z.nombre
from `ZONA` z
left join `RUTA` r on z.id_zona=r.id_zona
WHERE r.id_zona is NULL;


-- 8

SELECT c.nombre, r.nombre, p.dia_programado
FROM `PROGRAMACION` p
INNER JOIN `RUTA` r ON r.id_ruta = p.id_ruta
INNER JOIN `CONDUCTORES` c ON c.id_conductor = p.id_conductor;


-- 9 

SELECT c.nombre, r.nombre, p.dia_programado, r.tiempo
FROM `PROGRAMACION` p
INNER JOIN `RUTA` r ON r.id_ruta = p.id_ruta
INNER JOIN `CONDUCTORES` c ON c.id_conductor = p.id_conductor
WHERE r.tiempo > "2:00:00";


-- 10

SELECT DISTINCT z.nombre,COUNT(r.id_ruta)
FROM `ZONA` z
JOIN `RUTA` r ON r.id_zona= z.id_zona
GROUP BY z.nombre;













