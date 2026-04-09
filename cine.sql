create database cine;
use cine;
create table genero(
	id tinyint not null primary key,
    descripcion varchar(50) not null
);
drop table genero; #drop elimina la tabal genero de la base de datos
create table pelicula(
	codigo integer not null primary key,
    titulo varchar(50),
    duracion tinyint not null,
    idgenero tinyint not null,
    foreign key (idgenero) 
    references genero(id)
    on update cascade
    on delete cascade
);
insert into genero(id,descripcion) values
	(1,'comedia'),
    (2,'infantil'),
    (3,'accion'),
    (4,'terror');
insert into pelicula(codigo,titulo,duracion,idgenero) values
	(100,'zootopia',2,2),
    (101,'rambo',1,3),
    (102,'son como niños',1,1),
    (103,'rey leon',2,2),
    (104,'conjuro',2,4),
    (105,'coco',2,2);
select *
from pelicula;
#	MOSTRAR LAS PELICULAS DE LOS SIGUIENTES GENERO : INFANTIL,ACCION
select codigo,titulo
from pelicula,genero
where idgenero = id and (descripcion='infantil' or descripcion='accion');
#	MOSTRAR TODAS LAS PELICULAS DEL GENERO INFANTIL
select codigo,titulo
from pelicula,genero
where idgenero = id and (descripcion='infantil');
#	MOSTRAR LA CANTIDAD DE PELICULAS DEL GENERO INFANTIL
select count(*) as cantidad_peliculas
from pelicula,genero
where idgenero = id and descripcion='infantil';
#	MOSTRAR LA CANTIDAD DE PELICULAS DE CADA GENERO
SELECT id,descrpcion, COUNT(*)
FROM pelicula,genero
where idgenero=id  group by idgenero; 
#	ANIDADO PARA INFANTIL
select *
from pelicula
where idgenero in (select id from genero where descripcion='infantil');
#	ANIDADO PARA INFANTIL Y ACCION
select *
from pelicula
where idgenero in (select id from genero where descripcion in ('infantil','accion'));