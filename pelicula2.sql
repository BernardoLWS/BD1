create database practica;
use practica;

create table genero(
id tinyint  not null primary key,descripcion varchar(50)not null);

insert into genero value(1,'comedia');
insert into genero value(2,'infantil');
insert into genero value(3,'accion');
insert into genero value(4,'terror');

create table pelicula(
codigo integer not null primary key,
titulo varchar(50) not null,
durcion tinyint not null,
idgenero tinyint not null,
foreign key(idgenero)references genero(id)
on update cascade
on delete cascade
);
insert into pelicula value(100,'zootopia',2,2);
insert into pelicula value(101,'rambo',3,3);
insert into pelicula value(102,'son como niños',3,1);
insert into pelicula value(103,'rey leon',2,2);
insert into pelicula value(104,'conjuro',2,4);
insert into pelicula value(105,'busqueda implacable',3,3);
insert into pelicula value(106,'coco',2,2);
