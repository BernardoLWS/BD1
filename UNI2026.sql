/*DROP DATABASE UNI2026 ;*/  
CREATE DATABASE UNI2026;
USE UNI2026;
CREATE TABLE ALUMNO(
REGISTRO INTEGER NOT NULL PRIMARY KEY,
NOMBRE VARCHAR (50) NOT NULL,
TELEFONO INTEGER,
DIRECCION VARCHAR(60),
SEXO CHAR NOT NULL,
ESTADO_CIVIL CHAR NOT NULL,
FECHANAC DATE NOT NULL
);
/*		Insertar alumnos a UNI2026		*/
insert into ALUMNO values(111,'juaquialumnoestudianten chucacero',7402030,'urb. los claveles','m','s','2000/01/10');
insert into ALUMNO values(222,'Saturnino mamani',3637843,'calle junin 300','m','c','1998/11/09');
insert into ALUMNO values(333,'fabiola mendez',7217777,'calle landivar 200','f','s','2006/12/15');
insert into ALUMNO values(444,'Carlos camacho',null,'urb. azul','m','s','2000/02/20');/*PONER NULL*/
/*		MOSTRAR EL REGISTRO Y NOMBRE DE TODODS LOS ALUMNOS		 */
SELECT REGISTRO,NOMBRE,telefono,direccion,sexo,estado_civil,fechanac,grupoSanguineo
FROM ALUMNO;
/*		MOTRAR TODOS LOS ALUMNOS VARONES		*/
SELECT *
FROM ALUMNO 
WHERE SEXO='m';
/*		MOSTRAR TODOS LOS ALUMNOS VARONES SOLTEROS		*/
SELECT *
FROM ALUMNO 
WHERE SEXO='m' AND ESTADO_CIVIL='s';
/*		MOSTRAR TODOS ALUMNOS DONDE SU NOMBRE COMIENZA CON C		*/
SELECT *
FROM ALUMNO 
WHERE NOMBRE LIKE 'C%';
/*		MOSTRAR TODOS LOS ALUMNOS QUE TIENEN TELEFONO		*/
SELECT *
FROM ALUMNO 
WHERE TELEFONO is not null;
/*		MOSTRAR TODOS LOS ALUMNOS QUE TIENEN no TELEFONO		*/
SELECT *
FROM ALUMNO 
WHERE TELEFONO is null;
/*		mostrar todos los alumnos q tienen telefono y son casados		*/
SELECT *   
FROM ALUMNO
WHERE TELEFONO IS NOT NULL and ESTADO_CIVIL='c';
/*	MOSTRAR LA CANTIDAD DE ALUMNOS	 */ 
select count(*) as cantAlumnos
from Alumno;
/*	MOSTRAR LA CANTIDADA DE ALUMNOS SOLTEROS   */
select count(*) as cantAlumnos
from Alumno
where estado_civil = 's';
/*		cambiar el nombre de un estudiante		*/
update alumno
 set nombre = "juaquin chumsero"
 where registro = 111;
/*		borrar a un alumno    */
delete from alumno
where registro = 222;
/*		borrar la tabla alumno	*/
drop table alumno;
/*		eliminar base de datos	*/
drop database UNI2026;
/*	adicionar un atributo con el nombreGrupoSanguineo,de tipo alfabetico de 4 caracteres	*/
  alter table Alumno add column grupoSanguineo char(4);
  /*	agrega grupo sanguineo a un alumno	*/
  update alumno
  set grupoSanguineo = 'O+'
  where registro = 111;
  /*	mostrar la cantidad de alumnos vrones y mujeres	*/
  select sexo,count(*) as cantidad
  from alumno
  group by sexo;
  /*	mostrar pero con estado civil	*/
  select sexo,estado_civil,count(*) as cantidad
  from alumno
  group by sexo,estado_civil;