create database ArbolGenealogico;
use ArbolGenealogico;
create table persona(
	id int auto_increment primary key,
    nombre varchar(100) not null,
    sexo char(1) not null,
    idmadre int,
    idpadre int,
    constraint fk_madre
	foreign key (idmadre) references persona(id)
	on update cascade
	on delete set null,
	check (sexo in ('m','f'))
);  select* from persona;
insert into persona(id,nombre,sexo,idpadre,idmadre) values 
	(1,'Joaquin Chumacero','m',null,null),
    (2,'Ana Colque','f',null,null),
    (3,'Pedro Chumacero Colque','m',1,2),
    (4,'Priscila Aguiulera','f',null,null),
    (5,'Joaquin Chumacero Aguilera','m',1,4),
    (6,'Carla Mendez','f',null,null),
    (7,'Joaquin Jr Chumacero Mendez','m',1,6),
    (8,'Fabiola Chumacero Mendez','f',5,6),
    (9,'Maria Fernandez','f',null,null),
    (10,'Carlos Chumacero Fernandez','m',5,9);
select *
from persona
where idpadre = 1 and idmadre = 2;
    