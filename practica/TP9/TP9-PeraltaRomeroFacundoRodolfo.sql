-- ejercicio 1

create database ajedrez;


create table asociacion(CUIT int primary key not null,
direccion varchar(100),
denominacion varchar(100) not null,
declarada bool,
provincia varchar(100) not null,
tipo varchar(100) not null
);

create table proyecto(id_proyec int not null,
CUIT int not null,
primary key(id_proyec,CUIT),
constraint fkcuit0 foreign key(CUIT) references asociacion(CUIT) on delete no action on update cascade,
objetivos varchar(100),
beneficiarios varchar(100) 
);



create table socio(CUIL int primary key not null,
nombre varchar(100) not null,
direccion varchar(100) not null,
provincia varchar(100) not null,
cuota float,
fecha_alta date
);

alter table socio add column CUIT int not null , add constraint fkcuit1 foreign key(CUIT) references asociacion(CUIT) on delete no action on update cascade  ;

create table apadrina(CUIL int not null,
id_proyec int not null,
CUIT int not null,
primary key(CUIL,id_proyec,CUIT),
constraint fkcuil0 foreign key(CUIL) references socio(CUIL)on delete no action on update cascade,
constraint fkproyec foreign key(id_proyec,CUIT) references proyecto(id_proyec,CUIT)on delete no action on update cascade
);


create table voluntario(CUIL int not null primary key,
nombre varchar(100) not null,
direccion varchar(100) not null,
provincia varchar(100) not null,
profesion varchar(100) not null,
edad int not null,
CUIT int not null,
constraint fkcuit2 foreign key(CUIT) references asociacion(CUIT)
);

create table tarea(CUIL int not null,
tarea varchar(200),
primary key(CUIL,tarea),
constraint fkcuil1 foreign key(CUIL) references voluntario(CUIL)
);


create table contratado(CUIL int not null primary key,
nombre varchar(100) not null,
direccion varchar(100) not null,
provincia varchar(100) not null,
cargo varchar(100),
sueldo int unsigned,
fecha_inicio date not null,
fecha_fin date,
CUIT int not null,
constraint fkcuit3 foreign key(CUIT) references asociacion(CUIT)
);

create table manda(CUIL_V int not null,
CUIL_C int not null,
primary key(CUIL_V,CUIL_C),
constraint fkcuil2 foreign key(CUIL_V) references voluntario(CUIL),
constraint fkcuil3 foreign key(CUIL_C) references contratado(CUIL)
);

-- ejercicio 2


alter table venta MODIFY column importe  float not null default 0.00, 
MODIFY column gasto_envio float default 0.00,
modify column total float default 0.00 not null;

alter table detalle_venta modify column cantidad int check(cantidad>0);

alter table prestamo add column estado_multa varchar(8);

alter table persona modify column domicilio varchar(100) not null;

alter table autor modify column autor varchar(100) unique;

alter table origen modify column origen varchar(100) unique;

alter table editorial modify column editorial varchar(100) unique;

alter table pago add column importe float not null;
update pago set importe =(
select precio
from membresia
where pago.id_membresia=membresia.id_membresia
);

ALTER TABLE articulo DROP FOREIGN KEY Refgenero1;

ALTER TABLE articulo 
ADD CONSTRAINT Refgenero1 
FOREIGN KEY (id_genero) REFERENCES genero(id_genero)
ON DELETE no action
ON UPDATE CASCADE;


insert into genero (id_genero, genero) values(42, 'sin genero');
update articulo set id_genero=42 where id_genero is null;
alter table articulo modify column id_genero int not null;


-- ejercicio 3

create table proveedor(
id_proveedor int not null primary key,
nombre varchar(100) not null,
dni varchar(8) unique not null,
domicilio varchar(100) not null,
telefono varchar(10) unique
);

alter table articulo add column id_proveedor int;
alter table articulo add constraint fkproveedor foreign key (id_proveedor) references proveedor(id_proveedor);


-- ejercicio 5
create table parentesco(id_parentesco int primary key auto_increment,
parentesco varchar(100)
);

insert into parentesco (parentesco) values('Hijo/a'),('Padre/madre'),('Esposo/a');

update familiar set parentesco=(
select id_parentesco
from parentesco
where parentesco.parentesco=familiar.parentesco
);
alter table familiar modify column parentesco int not null;
alter table familiar add constraint fkparen foreign key (parentesco) references parentesco(id_parentesco);


-- ejercicio 6

create table tipo(id_tipo int primary key auto_increment,
tipo varchar(100)
);

insert into tipo (tipo) values('autor'),('director');

update autor set tipo=(
select id_tipo
from tipo
where tipo.tipo=autor.tipo
);
alter table autor modify column tipo int not null;
alter table autor add constraint fktipo1 foreign key (tipo) references tipo(id_tipo);

create table tipoE(id_tipoE int primary key auto_increment,
tipo varchar(100)
);

insert into tipoE (tipo) values('editorial'),('productora');

update editorial set tipo=(
select id_tipoE
from tipoE
where tipoE.tipo=editorial.tipo
);
alter table editorial modify column tipo int not null;
alter table editorial add constraint fktipoE foreign key (tipo) references tipoE(id_tipoE);



-- ejercicio 7

create table deudores( id_deudor int primary key auto_increment,
nombre varchar(100) not null,
domicilio varchar(100) not null,
ciudad varchar(100) not null,
montoTotal float not null
);


insert into deudores (nombre, domicilio, ciudad, montoTotal)
select nombre, domicilio, ciudad, sum(multa)+sum(monto) as montoTotal
from socio
inner join prestamo using(id_socio)
inner join ciudad using(id_ciudad)
join persona on id_socio=id_persona
where multa is not null
group by nombre, domicilio, ciudad;