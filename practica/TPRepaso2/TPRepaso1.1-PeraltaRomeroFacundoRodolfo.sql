create table empleado_sinF(id_empleado int not null primary key,
nombre varchar(100) not null,
dni varchar(8) not null,
funcion varchar(45) not null,
domicilio varchar(100),
fecha_alta date not null);

create table socio_tuc(id_socio int primary key not null,
nombre varchar(100) not null,
dni varchar(8) not null,
ciudad varchar(100) not null,
provincia varchar(100) not null);

alter table empleado_sinF add column sueldo float check(sueldo>1000), modify column dni varchar(8) not null unique;

insert into empleado_sinf (id_empleado, nombre, dni, funcion,domicilio,fecha_alta)
select id_empleado, persona.nombre,persona.dni,funcion,domicilio,fecha_alta
from empleado
inner join persona on persona.id_persona=empleado.id_empleado
inner join funcion using(id_funcion)
left join familiar using(id_empleado)
where familiar.dni is null;

insert into socio_tuc(id_socio, nombre, dni, ciudad, provincia)
select id_socio, nombre, dni, ciudad, provincia
from socio
inner join persona on persona.id_persona=socio.id_socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
where provincia='tucuman';


-- 2)i)

select id_articulo, titulo, venta.fecha, p.nombre, pe.nombre
from venta
inner join socio using(id_socio)
inner join empleado using(id_empleado)
inner join persona p on p.id_persona=socio.id_socio
inner join persona pe on pe.id_persona=empleado.id_empleado
inner join detalle_venta using(id_venta)
inner join articulo using(id_articulo)
where  id_articulo not in ( 
select id_articulo
from socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join prestamo using(id_socio)
where provincia in ('cordoba','tucuman','santiago del estero') and inicio_prestamo between '2019-01-01' and '2020-12-31' 
)
order by fecha desc, titulo asc;

-- ii)

select persona.id_persona, nombre, dni, domicilio, telefono, COALESCE(socio.id_socio, 'es empleado') AS id_socio, COALESCE(empleado.id_empleado, 'es socio') AS id_empleado
FROM persona
LEFT JOIN socio on persona.id_persona=socio.id_socio
LEFT JOIN empleado on persona.id_persona=empleado.id_empleado;


-- iii)
delete familiar from familiar
where id_empleado=(
select id_empleado
from venta
inner join detalle_venta using(id_venta)
inner join articulo using(id_articulo)
where titulo='Cien años de soledad' and id_socio in
(select id_socio
from socio
inner join pago using(id_socio)
inner join membresia using(id_membresia)
where membresia = 'oro' and anio=2020 and mes IN ('1','2','3','4','5','6','7','8','9','10','11','12')
));

-- iv)
update articulo set precio=precio*1.10
where id_articulo in
(select id_articulo
from detalle_venta venta
group by id_articulo
having sum(cantidad)>=30);