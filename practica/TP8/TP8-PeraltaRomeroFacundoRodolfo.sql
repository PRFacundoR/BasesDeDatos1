-- a

select persona.nombre as empleado, familiar.nombre as nombreF, parentesco 
from empleado
left join familiar using(id_empleado)
join persona on id_empleado=id_persona;

-- b
select coalesce(titulo,'sin titulo') as titulo, coalesce(precio,'sin precio') as precio, coalesce(autor,'sin autor') as autor, coalesce(editorial,'sin editorial') as editorial ,coalesce(origen, 'sin origen') as origen,coalesce(genero,'sin genero') as genero
from articulo
left join autor using(id_autor)
left join editorial using(id_editorial)
left join genero using(id_genero)
left join origen using(id_origen);

-- c
select funcion, count(id_empleado) as cantidadEmpleado
from empleado
left join funcion using(id_funcion)
group by funcion;

-- d

select count(familiar.id_empleado) as cantidadFamiliar, persona.nombre
from empleado
left join familiar using(id_empleado)
join persona on id_empleado=id_persona
group by persona.nombre;

-- e

select envio, count(venta.id_envio) as cantidad
from envio
left join venta using(id_envio)
group by envio;

-- punto 2

-- a
select * 
from autor
where autor in ('BeynonDavies Paul','Macon Dolores','Juan Carlos Orós');

select *
from editorial
where editorial in ('Editorial Reverté','Molino','RC libros');

select *
from genero
where genero='informática';

select MAX(Id_articulo) as maximo
from articulo;

insert into genero (id_genero, genero) values(42, 'informática');
insert into editorial (id_editorial, editorial, tipo) 
values(84,'Editorial Reverté','Editorial'),(85,'Molino','Productora'), (86,'RC libros', 'Prodcutora');
insert into autor(id_autor, autor,tipo) values(149,'BeynonDavies Paul',''),(150,'Macon Dolores',''),(151,'Juan Carlos Orós','');

insert into articulo (id_articulo, id_autor, id_editorial, id_genero, titulo, duracion_paginas, anio, precio,id_origen) 
values(393,149,84,42,'Sistemas de Bases de Datos',686,2010,24954,11),
(394,150,85,42,'Bases de datos. Casos prácticos desde el análisis a la implementación',492,2012,15432,9),
(395,151,86,42,'PYTHON. Curso práctico de formación',280,2022, 9581, 9);


-- b
create table  CantidadPrestamos as
select titulo, editorial, origen, count(prestamo.id_articulo) as cantPrestamos
from articulo
inner join editorial using(id_editorial)
inner join origen using(id_origen)
inner join prestamo using(id_articulo)
group by titulo, editorial, origen
having cantPrestamos<15;


-- c
ALTER TABLE prestamo
MODIFY fin_prestamo DATE NULL;

INSERT INTO prestamo (id_socio, id_articulo, inicio_prestamo, fecha_devolucion)
SELECT s.id_socio, a.id_articulo, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 1 MONTH)
FROM socio s
JOIN ciudad c USING(id_ciudad)
JOIN articulo a ON a.titulo = 'La Hojarasca'
WHERE c.ciudad = 'Reta';



-- C

DELETE FROM envio where envio='Aerobox';
-- d

alter table venta drop constraint fkenv;
alter table venta add constraint fkenv foreign key(id_envio) references envio (id_envio) on delete cascade on update cascade;
alter table detalle_venta drop constraint fkven;
alter table detalle_venta add constraint fkven foreign key(id_venta) references venta(id_venta) on delete cascade on update cascade;
DELETE FROM envio where envio='Andreani'; 

-- e
DELETE FROM ciudad where ciudad='Casabindo' or ciudad='La Toma' or ciudad='San Jose de Feliciano';

-- f

delete from venta where fecha='2020-09-18';

-- g
delete prestamo from prestamo 
inner join socio using(id_socio)
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
where provincia='Córdoba' and fecha_devolucion is null and fin_prestamo between '2021-01-01' and '2021-01-31';

-- h

update empleado set sueldo=case 
when sueldo<100000 then sueldo+sueldo*1.15
WHEN sueldo >= 100000 THEN sueldo+sueldo * 1.20 end;

-- i

update venta set entregado='devuelto' where entregado='no atiende';


-- j 
/*
update prestamo set multa=multa*0.5
where id_socio in (
select id_socio 
from socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join prestamo using(id_socio)
where provincia='Buenos Aires' and multa is not null);
*/

update prestamo p
inner join socio s on s.id_socio= p.id_socio
join ciudad c on c.id_ciudad=s.id_ciudad
join provincia pr on pr.id_provincia=c.id_provincia
set multa=multa*0.5
where provincia='Buenos Aires' and multa is not null;

-- k

select *
from empleado
join funcion using(id_funcion)
where funcion='Auxiliar';
