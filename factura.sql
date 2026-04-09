drop database factura;
create database factura;
use factura;
create table producto (
	codigo varchar(50) not null primary key, 
    nombre varchar (50) not null,
    precio float not null
);
insert into producto(codigo,nombre,precio) values 
	( 'p001','coca cola 3 lts',20),
	( 'p002','papel 6 u',12),
    ( 'p003','aceite 1lts',10),
    ( 'p004','coca cola personal',7),
    ( 'p005','azucar 1kg',6),
    ( 'p006','arroz 1kg',10);
create table factura(
	nro integer not null primary key,
    fecha date not null,
    nit integer not null,
    nombre	varchar(40) not null,
    monto float not null
);

insert into factura(nro,fecha,nit,nombre,monto) values 
	( 100,'2026-3-10',111,'joaquin chumacero',67),
	( 101,'2026-3-10',222,'saturnino mamani',60),
    ( 102,'2026-3-11',222,'saturnino mamani',40),
    ( 103,'2026-3-12',222,'saturnino mamani',180);
create table compra(   
	nrof integer not null,
    codigop varchar(4) not null,
    cantidad smallint not null,
    preciov float not null,
    primary key (nrof,codigop),
    foreign key (nrof) references factura(nro)
    on update cascade
    on delete cascade,
    foreign key (codigop) references producto(codigo)
    on update cascade
    on delete cascade
); 
insert into compra(nrof,codigop,cantidad,preciov) values 
	(100,'p004',1,7),
    (100,'p006',2,10),
    (100,'p001',2,20),
    (101,'p001',3,20),
    (102,'p003',2,10),
    (102,'p001',1,20),
    (103,'p001',10,18);
    select *
    from factura;
	
#	mostrar las facturas donde se halla vendido el producto COCACOLA PERSONAL
	select  f.nro,f.fecha,f.nit,f.nombre,f.monto
	from factura f,compra c,producto p
	where f.nro = c.nrof and (c.codigop = p.codigo and (p.nombre = 'coca cola personal')); 

	select *
	from factura
	where nro in (
				select nrof
				from compra
				where codigop in (
								select codigo
								from producto
								where nombre = 'coca cola personal'
								)
				);
#	mostar los productos comprados  por juaquin chumasero,muestre el nro de factura,la fecha,el producto y la cantidad     
	select nro,fecha,nombre,cantidad
	from factura,compra,producto
	where nro = nrof and(codigop = codigo and factura.nombre = 'joaquin chumacero');    

	select f.nro,f.fecha,p.nombre,c.cantidad
    from factura f,compra c,producto p
    where f.nro = c.nrof and (c.codigop = p.codigo and (f.nombre = 'joaquin chumacero'));
#	mostrar cuantas facturas hay
	select count(*) as facturas
	from factura;
#	mostrar la cantidad de factura realizadas por saturnino mamani
	select count(*) as cantidad
	from factura 
	where  nombre = 'saturnino mamani';
#	mostrar el monto total ingresado
	select sum(monto)
	from factura;
#	monto total facturado por saturnnino mamani
	select sum(monto)
	from factura
	where nombre = 'saturnino mamani';
#	mostrar el monto promedio facturado
	select avg(monto)
	from factura;

	select cound(avg(monto),2) as promedio 	/*error*/
	from factura;
#	mostar el monto minimo
	select min(monto)
	from factura;
#	mostar los productos que no se han vendido
	select *
	from producto
	where codigo not in ( 
						select codigop
						from compra
						);
					
