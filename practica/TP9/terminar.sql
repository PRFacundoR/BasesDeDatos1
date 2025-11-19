create database ajedrez;
create table asociacion(CUIT int primary key ,
direccion varchar(100) unique,
denominacion int,
declarada bool,
provincia varchar(100),
tipo varchar(100)
);

create table proyecto(id_proyec int not null,
CUIT int not null,
primary key(id_proyec,CUIT),
constraint fkcuit foreign key(CUIT) references asociacion(CUIT) on delete no action on update cascade,
objetivos varchar(100),
beneficiarios varchar(100) 
);



create table socio(CUIL int primary key,
nombre varchar(100),
direccion varchar(100),
provincia varchar(100),
cuota float,
fecha_alta date
);

alter table socio add column CUIT int not null , add constraint fkcuit1 foreign key(CUIT) references asociacion(CUIT) on delete no action on update cascade  ;

create table apadrina(CUIL int not null,
id_proyec int not null,
CUIT int not null,
primary key(CUIL,id_proyec,CUIT),
constraint fkcuil foreign key(CUIL) references socio(CUIL)on delete no action on update cascade,
constraint fkproyec foreign key(id_proyec,CUIT) references proyecto(id_proyec,CUIT)on delete no action on update cascade
);