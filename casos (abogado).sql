create database casos;
use casos;
create table cliente (
	ci int primary key ,
    nombre varchar (50) not null,
    direccion varchar(50) not null
);	select* from cliente;
insert into cliente (ci,nombre,direccion) values
	(111,'Juaquin Chumacero','urb.las palmas'),
    (222,'Saturnino Mamani','calle junin 200'),
    (333,'Fabiola Mendez','Calle landivar'); 
create table abogado(
	ci int primary key ,
    nombre varchar(50) not null,
    direccion varchar(50) not null,
    telefono varchar(8) not null
);	select* from abogado;
insert into abogado (ci,nombre,direccion,telefono) values
	(444,'Carlos Camacho','urb.las palmas','76368835'),
    (555,'Patricia Aguilera','calle junin','61341801'),
    (777,'Felipe Garcia','Calle minero','79045348');
create table asunto(
	nroexp int primary key,
    descripcion varchar(30) not null,
    fechai varchar (10) not null,
    fechaf varchar ( 10) not null,
    estado varchar (7) not null,
    cicliente int not null,
    foreign key (cicliente) references cliente(ci)
); 	select* from asunto;
insert into asunto (nroexp,descripcion,fechai,fechaf,estado,cicliente) values
	(100,'asistencia familiar','10/1/2026','','tramite',222),
    (101,'robo','15/1/2026','','tramite','111'),
    (102,'pelea','15/1/2026','','tramite',333);
create table lleva(
    nroexp int not null, 
	foreign key (nroexp) references asunto(nroexp),
    ciabogado int not null,
    foreign key (ciabogado) references abogado(ci),
    fechasig varchar(10) not null
);  select* from lleva; drop table  lleva; 
insert into lleva (nroexp,ciabogado,fechasig) values
	(100,777,'10/1/2026'),
    (101,555,'15/1/2026'),
    (102,444,'15/1/2026'); 

