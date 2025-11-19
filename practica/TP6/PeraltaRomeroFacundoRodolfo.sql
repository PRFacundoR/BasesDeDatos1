-- a
SELECT * FROM membresia;

-- b
select * FROM pago;

-- c
select genero 
from articulo 
inner join genero using(id_genero);

-- d
select envio
from venta
inner join envio using(id_envio)
where  venta.fecha between '2010-01-01' and '2020-12-31';

-- e
select nombre, domicilio
from articulo
inner join prestamo using(id_articulo) 
inner join socio using(id_socio)
join persona on socio.id_socio=persona.id_persona
where titulo ="caos";

-- f
select id_ciudad, ciudad
from ciudad
order by ciudad desc;

-- g
select fecha, importe, gasto_envio, total
from venta
where total>12000;

-- h
select * 
from prestamo
where fecha_devolucion is null;

-- i
select nombre, dni, sueldo, funcion
from empleado
join persona on empleado.id_empleado=persona.id_persona
inner join funcion using(id_funcion);

-- j

select P.nombre as Empleado, F.nombre as Familiar, F.parentesco
from empleado E
inner join familiar F using(id_empleado)
join persona P on E.id_empleado=P.id_persona
ORDER BY P.nombre,F.nombre;


-- k

select * 
from articulo
inner join genero using(id_genero)
where genero="Comedia" or genero="Drama" or genero="Fantasia";

-- l

select nombre, fecha, importe
from socio
inner join venta using(id_socio)
join persona on id_persona=id_socio
where fecha between '2021-01-01' and '2021-12-31';

-- m

select nombre, titulo, genero, inicio_prestamo 
from socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join prestamo using(id_socio)
inner join articulo using(id_articulo)
inner join genero using(id_genero)
join persona on id_persona=id_socio
where provincia="Tucumán" and genero like '%Accion%' and inicio_prestamo between '2020-07-01' and '2020-12-31';

-- n

select nombre
from persona
where nombre like '%Marcela%';

-- o

select id_editorial, editorial
from editorial
inner join articulo using(id_editorial)
inner join origen using(id_origen)
where origen != "Argentina" or origen != "España";

-- p

select * , precio*1.25 as incremento
from membresia;

-- q

select total,  importe + gasto_envio*0.8 as totalDesc
from venta
where fecha between '2021-12-01' and '2021-12-31';

-- r

select id_socio, nombre, fin_prestamo, monto, multa
from socio
join persona on id_persona=id_socio
inner join prestamo using (id_socio)
where fecha_devolucion is null
order by multa desc;

-- s

select nombre, titulo, telefono
from socio
join persona on id_persona=id_socio
inner join prestamo using (id_socio)
inner join articulo using (id_articulo)
where fecha_devolucion is null
order by multa desc;


-- t

select id_articulo, titulo, genero, fecha
from articulo
inner join detalle_venta using(id_articulo)
inner join venta using(id_venta)
inner join genero using(id_genero)
where fecha<'2018-06-01' or fecha>'2020-12-31'
order by fecha;

-- u 

select nombre, telefono,domicilio, ciudad, provincia
from socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join venta using(id_socio)
join persona on id_socio=id_persona
where entregado!="entregado" and provincia="Córdoba" or provincia="Salta" or provincia="Tucumán";