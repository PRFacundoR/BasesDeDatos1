

-- b)

alter table pelicula add column id_origen int not null,  add constraint fkidorigen foreign key(id_origen) references origen(id_origen);

-- b)

insert productora (id_productora, productora)
select id_editorial, editorial
from editorial
where tipo=2;

insert into pelicula (id_director,id_productora,titulo,anio, precio,id_origen) 
select id_autor,id_editorial, titulo,anio, precio, id_origen
from articulo
inner join editorial using(id_editorial)
inner join tipoe on tipoe.id_tipoE=editorial.tipo
where tipoe.tipo='productora'
;

insert into pelicula(id_productora)
select id_productora
from productora;



-- 2)i
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
-- ii)
select id_socio, nombre, id_membresia, membresia, count(id_membresia) as cantMembresia, sum(precio) as total
from socio
inner join persona on persona.id_persona=socio.id_socio
left join pago using(id_socio)
left join membresia using(id_membresia)
group by id_socio, nombre, id_membresia, membresia
having COALESCE(SUM(membresia.precio), 0) < 10000;

/*SELECT
    socio.id_socio AS id_socio,
    COALESCE(persona.nombre, 'sin datos') AS nombre,
    COALESCE(membresia.id_membresia, 'sin datos') AS id_membresia,
    COALESCE(membresia.membresia, 'sin datos') AS membresia,
    COUNT(pago.id_membresia) AS cantidad_membresias,
    COALESCE(SUM(membresia.precio), 0) AS total_pagado
FROM socio
INNER JOIN persona
    ON persona.id_persona = socio.id_socio
LEFT JOIN pago
    ON pago.id_socio = socio.id_socio
LEFT JOIN membresia
    ON membresia.id_membresia = pago.id_membresia
GROUP BY
    socio.id_socio,
    persona.nombre,
    membresia.id_membresia,
    membresia.membresia
HAVING
    COALESCE(SUM(membresia.precio), 0) < 10000
ORDER BY
    cantidad_membresias DESC;*/
    
-- iii)

SELECT p.provincia, COUNT(s.id_socio) AS cantidad
FROM socio s
INNER JOIN ciudad c USING(id_ciudad)
INNER JOIN provincia p USING(id_provincia)
WHERE s.id_socio NOT IN (
    SELECT id_socio
    FROM prestamo
)
AND s.id_socio NOT IN (
    SELECT id_socio
    FROM venta
)
GROUP BY p.provincia
HAVING cantidad > 20
ORDER BY cantidad, p.provincia;

UPDATE empleado
SET sueldo = sueldo * 1.10
WHERE id_empleado  IN (

    -- empleados que hicieron alguna venta
    SELECT DISTINCT id_empleado
    FROM venta

    UNION

    -- empleados que vendieron artículo 10
   SELECT id_empleado
    FROM venta
    inner join detalle_venta using(id_venta)
    inner join articulo using(id_articulo)
    where titulo='carmilla'
);
UPDATE empleado
SET sueldo = sueldo * 1.10
WHERE id_empleado IN (

    SELECT id_empleado
    FROM (
        -- Grupo 1: empleados que nunca vendieron nada
        SELECT id_empleado
        FROM empleado
        WHERE id_empleado NOT IN (
            SELECT DISTINCT id_empleado
            FROM venta
        )

        UNION

        -- Grupo 2: empleados que vendieron Carmilla
        SELECT DISTINCT venta.id_empleado
        FROM venta
        INNER JOIN detalle_venta USING(id_venta)
        INNER JOIN articulo USING(id_articulo)
        WHERE titulo = 'Carmilla'
    ) AS t
);
