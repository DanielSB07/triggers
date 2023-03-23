create database supermercado;
use supermercado;

create table productos (
  idProducto int not null auto_increment,
  nombreProducto varchar(50) not null,
  valorVenta int not null,
  primary key (idProducto)
);

create table tipoProducto (
  idTipoProducto int not null auto_increment,
  nombreTipoProducto varchar(50) not null,
  primary key (idTipoProducto)
);

create table inventario (
  idProducto int not null,
  cantidad int not null,
  valor int not null,
  foreign key (idProducto) references productos(idProducto)
);

create table ventas (
  idVenta int not null auto_increment,
  idProducto int not null,
  nombreProducto varchar(50) not null,
  cantidad int not null,
  precioProducto int not null,
  primary key (idVenta),
  foreign key (idProducto) references productos(idProducto)
);

insert into productos(idProducto, nombreProducto, valorVenta) values (10, 'manzana', 1000);
insert into productos(idProducto, nombreProducto, valorVenta) values (11, 'naranja', 1500);
insert into productos(idProducto, nombreProducto, valorVenta) values (20, 'lechuga', 1300);
insert into productos(idProducto, nombreProducto, valorVenta) values (21, 'espinaca', 900);

insert into tipoProducto(nombreTipoProducto) values ('frutas');
insert into tipoProducto(nombreTipoProducto) values ('verduras');

insert into inventario(idProducto, cantidad, valor) values (10, 5, 5000);
insert into inventario(idProducto, cantidad, valor) values (11, 20, 30000);
insert into inventario(idProducto, cantidad, valor) values (20, 2, 2600);
insert into inventario(idProducto, cantidad, valor) values (21, 3, 2700);

insert into ventas(idVenta, idProducto, nombreProducto, cantidad, precioProducto) values (100, 10, 'manzana', 1, 1000);
insert into ventas(idVenta, idProducto, nombreProducto, cantidad, precioProducto) values (110, 11, 'naranja', 1, 1500);
insert into ventas(idVenta, idProducto, nombreProducto, cantidad, precioProducto) values (200, 20, 'lechuga', 1, 1300);
insert into ventas(idVenta, idProducto, nombreProducto, cantidad, precioProducto) values (210, 21, 'espinaca', 1, 000);

-- select * from productos;
-- select * from tipoProducto;
-- select * from inventario;
-- select * from ventas;

delimiter !
CREATE TRIGGER actualizar_inventario
AFTER INSERT ON ventas
FOR EACH ROW
BEGIN
    UPDATE inventario
    SET cantidad = cantidad - NEW.cantidad
    WHERE idProducto = NEW.idProducto;
END!
delimiter ;

insert into ventas(idVenta, idProducto, nombreProducto, cantidad, precioProducto) values (102, 10, 'manzana', 20, 20000);

select * from ventas;
