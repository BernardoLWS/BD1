create database Malla_Informatica;
use Malla_Informatica;

create table Materias (
	sigla varchar(7) not null,
    nombre varchar(50) not null,
    semestre int not null,
    primary key (sigla)
);
insert into Materias(sigla,nombre,semestre) values
	('MAT101','Calculo 1',1)
;
create table Pre_requisito(
	sigla_M varchar (7) not null,
    sigla_M_Pre varchar(7) not null,
    primary key (sigla_M,sigla_M_Pre),
    foreign key Materias(sigla_M) references Materias(sigla),
    foreign key Materias(sigla_M_Pre) references Materias(sigla)
);