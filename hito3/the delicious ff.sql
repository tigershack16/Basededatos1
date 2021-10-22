create database the_delicious_ff;
use the_delicious_ff;

create table categorias
(
    id_categoria int identity primary key not null,
    tipo varchar(20)
);

create table productos
(
    id_producto int  primary key not null,
    nombre varchar(100),
    stock int not null ,
    precio_venta int not null ,
    precio_compra int not null ,
    id_categoria int not null,
    foreign key (id_categoria) references categorias(id_categoria)
);

create table cliente
(
    id_cliente int identity primary key not null,
    nombres varchar (50) not null,
    apellidos varchar(50) not null,
    direccion varchar(100) not null,
    tipo_cliente varchar(20),
);

create table pedido
(
    id_pedido  int  primary key not null,
    id_cliente int not null,
    foreign key (id_cliente) references cliente (id_cliente)
);

create table detalle_pedido
(
    id_detalle_pedido int identity primary key not null,
    id_pedido int not null,
    foreign key (id_pedido) references pedido (id_pedido),
    id_producto int not null,
    foreign key (id_producto) references productos(id_producto),
    precio_unidad int not null,
    cantidad int not null,
    descuento int not null,
);
insert into categorias (tipo)
                 values('electrodomestico'),
                        ('juguetes'),
                        ('verduras');

insert into productos(id_producto, nombre, stock, precio_venta, precio_compra, id_categoria)
               values(1,'refrigerador', 15,1500,1000,1),
                      (2,'microonda',4,800,500,1),
                      (3,'los vengadores',2,2500,1700,2);


insert into cliente(nombres, apellidos, direccion, tipo_cliente)
            values ('nombre_cliente1','apellidos_cliente1','6 de agosto','gold'),
                 ('nombre_cliente2','apellidos_cliente2','plaza abaroa','vip'),
                 ('nombre_cliente3','apellidos_cliente3','plaza del estudiante','normal'),
                 ('nombre_cliente4','apellidos_cliente4','teatro al aire libre','normal');


insert into pedido (id_pedido, id_cliente)
            values(1,1),
                   (2,2);

insert into detalle_pedido (id_pedido, id_producto, precio_unidad, cantidad, descuento)
                    values (1,1,1800,2,0),
                           (1,2,800,1,0),
                           (2,2,800,1,0);

--mostrar productos nombre y stock con stock mayor igual a 10
select prod.stock, prod.nombre
from productos as prod
where prod.stock > = 10;

--mostrar el nombre del producto y la categoria de los productos pertenecen a la categoria de electrodomesticos
select prod.nombre, cat.tipo
from productos as prod, categorias as cat
where cat.tipo = 'electrodomestico' and
      prod.id_categoria = cat.id_categoria;

--mostrar que productos (nombre) tiene el pedido con id igual a 1
select prod.nombre ,dp.id_pedido, ped.id_pedido
from productos as prod, detalle_pedido as dp, pedido as ped
where dp.id_pedido = 1 and
      ped.id_pedido = dp.id_pedido and
      dp.id_producto = prod.id_producto;


--cuantos count productos tienen el pedido con id igual a 2
select count (prod.stock)
from pedido as ped, detalle_pedido as dp, productos as prod
where ped.id_pedido = 2 and
      ped.id_pedido = dp.id_pedido and
      dp.id_producto = prod.id_producto;

create database suma
use suma
create table valores_para_sumar
(
    valores int not null,
);

insert into valores_para_sumar
            values (1),
                   (1),
                   (1);


select sum (valores)
from valores_para_sumar ;


















