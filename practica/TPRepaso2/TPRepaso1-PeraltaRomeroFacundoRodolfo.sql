--  i
select id_socio, p2.nombre, id_empleado, p1.nombre, titulo
from venta
inner join socio using(id_socio)
inner join empleado using(id_empleado)
inner join persona p1 on p1.id_persona=id_empleado
inner join persona p2 on p2.id_persona=id_socio
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join detalle_venta using(id_venta)
inner join articulo using(id_articulo)
where provincia in ('cordoba','tucuman','santiago del estero') and fecha between '2019-01-01'and '2020-12-31'
order by titulo asc ,p2.nombre asc;


-- ii

select persona.nombre, funcion, count(familiar.id_empleado) as cantidad_familiar, p.parentesco
from empleado
inner join persona on id_persona=id_empleado
inner join funcion using(id_funcion)
left join familiar using(id_empleado)
left join parentesco p on p.id_parentesco=familiar.parentesco
group by  persona.nombre, funcion,p.parentesco
order by persona.nombre asc, p.parentesco asc;


-- iii
select nombre, count(DISTINCT id_venta) as total_de_compras, COALESCE(SUM(cantidad), 0) as articulos_comprados
from socio
inner join persona on id_persona=id_socio
left join venta using(id_socio)
left join detalle_venta using(id_venta)
left join articulo using(id_articulo)
group by nombre
ORDER BY total_de_compras DESC, articulos_comprados DESC;

-- iv

UPDATE empleado
SET sueldo = sueldo * 1.10
WHERE id_empleado NOT IN (
    SELECT DISTINCT id_empleado
    FROM venta
);
UPDATE empleado
SET sueldo = sueldo * 1.10
where id_empleado in(SELECT /*DISTINCT*/ id_empleado
    FROM venta
    inner join detalle_venta using(id_venta)
    inner join articulo using(id_articulo)
    where titulo='carmilla'
);

-- v
create view info_venta1  as(
select id_venta as numero_de_venta, p.nombre AS soci,concat(ciudad,',',provincia) as domicilio,  pe.nombre as emplead, 
sueldo, funcion, fecha, total,envio, gasto_envio, fecha_envio, timestampdiff(day,fecha,fecha_envio) as plazo_de_entrega
from venta
inner join socio using(id_socio)
inner join ciudad using(id_ciudad)
inner join provincia using(id_provincia)
inner join empleado using(id_empleado)
inner join funcion using(id_funcion)
inner join persona p on p.id_persona=socio.id_socio
inner join persona pe on pe.id_persona=empleado.id_empleado
inner join envio using(id_envio)
group by numero_de_venta,soci,emplead,sueldo,funcion,fecha,total, envio,gasto_envio,fecha_envio
order by fecha);


-- 2) a)

create database consultorio;

create table obra_social(id_ObraSocial integer not null primary key,
obraSocial varchar(50) not null,
telefono varchar(15) null
);

create table paciente(id_paciente integer not null primary key,
paciente varchar(40) not null,
dni integer not null unique,
fecha_nac date null /*check(fecha_nac<= CURDATE())*/,
id_ObraSocial integer null,
constraint fk_idObraS foreign key(id_obraSocial) references obra_social(id_ObraSocial) on delete set null on update cascade
);


create table diagnostico(
id_diagnostico integer not null primary key,
diagnostico varchar(100) not null
);

create table medico(
id_medico integer not null primary key,
Nombre varchar(100) not null,
Especializacion varchar(100) not null,
matricula integer not null
);

/*create table consulta(
id_paciente integer  null,
id_medico integer null,
fecha date not null check(fecha<=CURDATE()),
primary key(id_paciente, id_medico,fecha),
constraint fk_paciente foreign key(id_paciente) references paciente(id_paciente) on delete set null on update cascade,
constraint fk_medico foreign key(id_medico) references medico(id_medico) on delete set null on update cascade,
pagado numeric(24,2) null default 0,
id_diagnostico integer null,
constraint fk_diagnostico foreign key(id_diagnostico) references diagnostico(id_diagnostico) on delete set null on update cascade
);*/

/* consulta bien hecha*/
create table consulta(
    id_consulta int auto_increment primary key,
    
    id_paciente integer null,
    id_medico integer null,
    fecha date not null/* check(fecha <= CURDATE())*/,

    pagado numeric(24,2) default 0,
    id_diagnostico integer null,

    constraint fk_paciente foreign key(id_paciente)

        references paciente(id_paciente)
        on delete set null on update cascade,

    constraint fk_medico foreign key(id_medico)
        references medico(id_medico)
        on delete set null on update cascade,

    constraint fk_diagnostico foreign key(id_diagnostico)
        references diagnostico(id_diagnostico)
        on delete set null on update cascade
);

