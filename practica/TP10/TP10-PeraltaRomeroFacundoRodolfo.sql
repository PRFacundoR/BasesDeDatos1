-- Subconsultas
-- a

select ciudad, provincia
from ciudad
inner join provincia using(id_provincia)
where ciudad not in(
select ciudad
from ciudad
inner join socio using(id_ciudad)
inner join venta using(id_socio)
);

-- b 

select envio
from envio
where envio not in(
select envio
from envio
inner join venta using(id_envio));



-- c
select autor, titulo
from articulo
inner join autor using(id_autor)
where titulo not in (
select titulo
from articulo
inner join prestamo using(id_articulo)
where inicio_prestamo between '2021-11-01' and '2021-11-30');


-- d
select id_venta, id_socio, p1.nombre, id_empleado, p2.nombre, fecha, importe
from venta
inner join socio using(id_socio)
inner join empleado using(id_empleado)
inner join persona p1 on p1.id_persona=id_socio
inner join persona p2 on p2.id_persona=id_empleado
where importe> (select round(avg(importe),4) from venta)
order by importe desc, fecha desc, p1.nombre desc;

-- e
select provincia
from provincia
inner join ciudad using(id_provincia)
inner join socio using(id_ciudad)
inner join venta using(id_socio)
inner join detalle_venta using(id_venta)
inner join articulo using(id_articulo)
where id_autor=(select id_autor
from autor
inner join articulo using(id_autor)
where titulo='Dracula');


-- f

select persona.nombre, count(familiar.id_empleado) as cantidadParientes
from empleado
inner join familiar using(id_empleado)
inner join persona on persona.id_persona=empleado.id_empleado
group by persona.nombre
having cantidadParientes = (
select  count(familiar.id_empleado) as cantidadParientes1 
from empleado
inner join familiar using(id_empleado) 
inner join persona on persona.id_persona=empleado.id_empleado
group by persona.nombre
order by cantidadParientes1 desc  limit 1)
order by persona.nombre asc;


-- g
select count(id_socio) as cantidad,id_socio, nombre
from socio
inner join venta using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
group by id_socio, nombre
having cantidad>(
select count(id_socio)
from socio
inner join venta using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
where nombre= 'Saravia Silvia');


-- h
select id_empleado, nombre, funcion, sueldo, fecha_alta, TIMESTAMPDIFF(YEAR, fecha_alta,curdate()) as antiguedad
from empleado
inner join funcion using(id_funcion)
inner join persona on persona.id_persona=empleado.id_empleado
where fecha_alta > (select fecha_alta
from empleado
inner join persona on persona.id_persona=empleado.id_empleado
where nombre='Valdivia Nadia')
order by antiguedad desc;

-- i 
select id_empleado, nombre, funcion, sum(total) as montoTotal
from empleado
inner join funcion using(id_funcion)
inner join venta using(id_empleado)
inner join persona on persona.id_persona=empleado.id_empleado
group by id_empleado, nombre, funcion
having montoTotal>(
select sum(total) as montoTotal1
from socio
inner join venta using(id_socio)
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join persona on persona.id_persona=socio.id_socio
where provincia='Salta'
)*0.05;

-- j
select nombre
from socio
inner join prestamo using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
where id_socio not in(
select id_socio
from socio
inner join venta using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
);

-- k

SELECT p.nombre, v.fecha, v.total AS importe, 'venta' AS operacion
FROM venta v
INNER JOIN socio s USING(id_socio)
INNER JOIN persona p ON p.id_persona = s.id_socio
WHERE v.fecha = '2021-03-15'

UNION ALL


SELECT p.nombre, pr.inicio_prestamo AS fecha,  monto as importe, 'prestamo' AS operacion
FROM prestamo pr
INNER JOIN socio s USING(id_socio)
INNER JOIN persona p ON p.id_persona = s.id_socio
WHERE pr.inicio_prestamo = '2021-03-15'
ORDER BY nombre;


-- l

SELECT
    a.titulo,
    a.anio,
    a.precio,
    g_prom.promedio_por_genero
FROM
    articulo AS a
    INNER JOIN genero AS g USING(id_genero)
    INNER JOIN (
        SELECT
            id_genero,
            AVG(precio) AS promedio_por_genero
        FROM
            articulo
        GROUP BY
            id_genero
    ) AS g_prom USING(id_genero)
WHERE
    g.genero IN ('misterio', 'Comedia', 'ficción');



-- m

update membresia 
set precio=precio+0.20*(
select precio_promedio 
from(
select avg(precio) AS precio_promedio 
from membresia
) AS tabla_temporal ) 
where membresia in('bronce', 'plata', 'básico');


-- n

update venta
set importe=importe+2000
where id_envio=(select id_envio from(
select id_envio
from envio
inner join venta using(id_envio)
where fecha='2021-03-25') as aux);



-- o

delete from funcion
where funcion not in(select funcion from
(select funcion
from funcion
inner join empleado using(id_funcion)
) as eliminar
);


-- p

delete from prestamo
where inicio_prestamo< (
select fecha
from venta
inner join socio using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
where nombre='Tejada Gabriela Claudia'
);


-- vistas
-- a
create view info_venta as (
select nombre, titulo, detalle_venta.precio, fecha, fecha_envio, entregado
from articulo
inner join detalle_venta using(id_articulo)
inner join venta using(id_venta)
inner join socio using(id_socio)
inner join persona on persona.id_persona=socio.id_socio
where entregado='entregado' and fecha between '2021-01-01' and '2021-12-31');
 
 
 -- b
create view info_prestamo as(
select nombre, ciudad, provincia, titulo, autor, genero, origen, editorial, monto, multa, 
inicio_prestamo,fin_prestamo ,fecha_devolucion, TIMESTAMPDIFF(day, inicio_prestamo,fin_prestamo) as CantidadDiasPrestamo, TIMESTAMPDIFF(day, inicio_prestamo, fecha_devolucion) as CantDiasRealPrestamo
from articulo
inner join autor using(id_autor)
inner join genero using(id_genero)
inner join editorial using(id_editorial)
inner join origen using(id_origen)
inner join prestamo using(id_articulo)
inner join socio using(id_socio)
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join persona on persona.id_persona=socio.id_socio);


select nombre, titulo, coalesce(CantDiasRealPrestamo, 'No devuelto') as CantDiasRealPrestamo
from info_prestamo;
