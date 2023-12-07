# DASE DE DATOS TBM

### MODELO RELACIONAL 

<img src='./Captura desde 2023-12-06 21-59-18.png'>

1. Cantidad de Paradas por Ruta
~~~sql
SELECT r.nombre,COUNT(er.id_estacion)
FROM `ESTACIONES_RUTA` er
INNER JOIN `RUTA` r ON r.id_ruta = er.id_ruta
GROUP BY r.nombre;
~~~
2. Nombre de las Paradas de la Ruta Universidades
~~~sql
SELECT e.nombre 
FROM `ESTACIONES_RUTA` er
INNER JOIN `ESTACIONES` e ON e.id_estacion = er.id_estacion
WHERE id_ruta = 1;
~~~

3.Nombres de las Rutas No Programadas
~~~sql
SELECT r.nombre
FROM `RUTA` r
WHERE r.id_ruta NOT IN (SELECT id_ruta FROM `PROGRAMACION`);
~~~
4.Rutas Programadas sin Conductor Asignado
~~~sql
SELECT r.nombre 
FROM  `PROGRAMACION` e
RIGHT JOIN `RUTA` r ON r.id_ruta = e.id_ruta
WHERE e.id_conductor IS NULL;
~~~

5.Conductores No Asignados a la Programación
~~~sql
SELECT c.nombre, c.apellido
FROM `CONDUCTORES` c
WHERE c.id_conductor NOT IN (SELECT id_conductor FROM `PROGRAMACION`);
~~~

6.Buses No asignados a la Programación
~~~sql
SELECT b.placa
FROM `BUSES` b
WHERE b.id_bus NOT IN (SELECT id_bus FROM `PROGRAMACION`);
~~~
7.Buses No asignados a la Programación
~~~sql
SELECT DISTINCT
z.nombre
from `ZONA` z
left join `RUTA` r on z.id_zona=r.id_zona
WHERE r.id_zona is NULL;
~~~
8.Programación asignada a cada conductor (Conductor, Ruta y Día)
~~~sql
SELECT c.nombre, r.nombre, p.dia_programado
FROM `PROGRAMACION` p
INNER JOIN `RUTA` r ON r.id_ruta = p.id_ruta
INNER JOIN `CONDUCTORES` c ON c.id_conductor = p.id_conductor;
~~~

9.Programación asignada a conductores que hacen rutas de más de dos horas
~~~sql
SELECT c.nombre, r.nombre, p.dia_programado, r.tiempo
FROM `PROGRAMACION` p
INNER JOIN `RUTA` r ON r.id_ruta = p.id_ruta
INNER JOIN `CONDUCTORES` c ON c.id_conductor = p.id_conductor
WHERE r.tiempo > "2:00:00";

~~~

10.Nombres de Zonas y cantidad de rutas que tienen programadas (Contar)
~~~sql
SELECT DISTINCT z.nombre,COUNT(r.id_ruta)
FROM `ZONA` z
JOIN `RUTA` r ON r.id_zona= z.id_zona
GROUP BY z.nombre;

~~~


