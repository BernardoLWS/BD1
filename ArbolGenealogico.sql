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
drop table persona;
insert into persona(id,nombre,sexo,idpadre,idmadre) values 
	(1,'Joaquin Chumacero','m',null,null),
    (2,'Ana Colque','f',null,null),
    (3,'Pedro Chumacero Colque','m',1,2),
    (4,'Priscila Aguilera','f',null,null),
    (5,'Joaquin Chumacero Aguilera','m',1,4),
    (6,'Carla Mendez','f',null,null),
    (7,'Joaquin Jr Chumacero Mendez','m',5,6),
    (8,'Fabiola Chumacero Mendez','f',5,6),
    (9,'Maria Fernandez','f',null,null),
    (10,'Carlos Chumacero Fernandez','m',5,9);
/*	mostrar el id y nombre del padre de joaquin chumacero aguilera	*/
select padre.id,padre.nombre
from persona hijo,persona padre
where hijo.nombre = 'Joaquin Chumacero Aguilera' and padre.id = hijo.idpadre;
/*	mostrar los nombres de sus hijos de joaquin chumacero aguilera	*/
select hijo.id,hijo.nombre
from persona hijo,persona padre,persona madre
where hijo.idpadre = padre.id and hijo.idmadre = madre.id and padre.nombre = 'Joaquin Chumacero Aguilera';
/*	mostrar el abuelo paterno de joaquin jr chumacero mendez	*/    
select abuelo.id, abuelo.nombre
from persona padre, persona hijo, persona abuelo
where hijo.idpadre = padre.id and padre.idpadre = abuelo.id and hijo.nombre = 'Joaquin Jr Chumacero Mendez';
/*	mostrar la madre de Joaquin Jr Chumacero Mendez	*/
select madre.id , madre.nombre
from persona madre , persona hijo
where hijo.idmadre = madre.id and hijo.nombre = 'Joaquin Jr Chumacero Mendez';
/*	mostrar todos los nietos de joaquin chumacero 	*/
select nietos.id ,nietos.nombre
from persona nietos,persona padre,persona abuelo
where nietos.idpadre = padre.id and padre.idpadre = abuelo.id and abuelo.nombre = 'Joaquin Chumacero';
/*	mostrar los hermanos de Carlos Chumacero Fernandez	*/
select hermanos.id , hermanos.nombre
from persona hermanos , persona padre
where hermanos.idpadre = padre.id and padre.nombre = 'Joaquin Chumacero Aguilera'and hermanos.nombre <> 'Carlos Chumacero Fernandez';
