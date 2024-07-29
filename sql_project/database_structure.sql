DROP DATABASE IF EXISTS repuestos;
CREATE DATABASE repuestos;

USE repuestos;

-- Crear tabla CLIENTE

CREATE TABLE CLIENTE (
    idcliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(255),
    direccion VARCHAR(255),
   
    PRIMARY KEY (idcliente)
);

-- Crear tabla CATEGORIA

CREATE TABLE CATEGORIA (
    idcategoria INT AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (idcategoria)
);

-- Crear tabla PRODUCTO

CREATE TABLE PRODUCTO (
    idproducto INT AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    marca TEXT,
    idcategoria INT,
    preciounitario DECIMAL(10, 2),
    
    PRIMARY KEY (idproducto)
);

-- Crear tabla SUCURSAL

CREATE TABLE SUCURSAL (
    idsucursal INT AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    
    PRIMARY KEY (idsucursal)
);

-- Crear tabla INVENTARIO

CREATE TABLE INVENTARIO (
    idinventario INT AUTO_INCREMENT,
    idsucursal INT,
    idproducto INT,
    cantidad INT,
    
    PRIMARY KEY (idinventario)
);

-- Crear tabla VENTAS

CREATE TABLE VENTAS (
    idventa INT NOT NULL AUTO_INCREMENT,
    idcliente INT,
    fecha DATE,
    idproducto INT,
    cantidad INT,
    idsucursal INT,
    
    PRIMARY KEY (idventa)
);

-- Definicion de FK o clave foraneas

-- Producto

ALTER TABLE PRODUCTO ADD CONSTRAINT FK_PRODUCTO_CATEGORIA
	FOREIGN KEY (idcategoria) REFERENCES CATEGORIA(idcategoria);

-- Inventario

ALTER TABLE INVENTARIO
	ADD CONSTRAINT FK_INVENTARIO_SUCURSAL
	FOREIGN KEY (idsucursal) REFERENCES SUCURSAL(idsucursal);

ALTER TABLE INVENTARIO
	ADD CONSTRAINT FK_INVENTARIO_PRODUCTO
	FOREIGN KEY (idproducto) REFERENCES PRODUCTO(idproducto);

-- Ventas 

ALTER TABLE VENTAS
	ADD CONSTRAINT FK_VENTAS_CLIENTE
	FOREIGN KEY (idcliente) REFERENCES CLIENTE(idcliente);

ALTER TABLE VENTAS
	ADD CONSTRAINT FK_VENTAS_PRODUCTO
	FOREIGN KEY (idproducto) REFERENCES PRODUCTO(idproducto);

ALTER TABLE VENTAS
	ADD CONSTRAINT FK_VENTAS_SUCURSAL
	FOREIGN KEY (idsucursal) REFERENCES SUCURSAL(idsucursal);
	
	
