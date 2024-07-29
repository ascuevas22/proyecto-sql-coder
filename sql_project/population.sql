USE repuestos;

-- Importacion de datos a la tabla clientes mediante .csv
SET GLOBAL local_infile = true;

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/clientes.csv'
INTO TABLE CLIENTE
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(nombre,telefono,correo,direccion);

-- Categoria 15 records
-- INGRESAR DATOS POR MEDIO DE COMANDO INSERT INTO
INSERT INTO CATEGORIA (NOMBRE) VALUES
('Frenos'),
('Suspension'),
('Motor'),
('Transmision'),
('Escape'),
('Sistema de enfriamiento'),
('Electrico'),
('Direccion'),
('Iluminacion'),
('Interior')
('Carroceria'),
('Filtros'),
('Combustible'),
('Neumaticos y ruedas')
('Aire acondicionado y calefeccion');


-- Ingreso de Productos 20 records
INSERT INTO PRODUCTO (nombre,marca,idcategoria,preciounitario) VALUES
('pastillas de freno delanteras','valeo','1',15000),
('amortiguadores traseros','ngk','2',50000),
('bujias de iridio','bosch','3',12000),
('kit de embrague','denso','4',60000),
('sensor de oxigeno','mahle','5',18000),
('tapa de radiador','ngk','6',12000),
('regulador de voltaje','acdelco','7',15000),
('liquido de direccion','acdelco','8',8000),
('luces antiniebla','valeo','9',20000),
('volante deportivo','ngk','10',30000),
('parachoques delantero','seco','11',100000),
('filtro de aire','acdelco','12',25000),
('inyector de combustible','ngk','13',22000),
('llanta 18 pulgadas','goodyear','14',50000),
('compresor de aire acondicionado','acdelco','15',200000),
('valvula neumatico cromada','firestone','14',12300),
('filtro de aceite de transmision','denso','12',22000),
('spoiler trasero','ngk','11',300000),
('bombilla h7','ngk','9',8000),
('liquido de frenos dot4','acdelco','1',6000);



-- Ingreso de Sucursales 5 records
INSERT INTO SUCURSAL (nombre,direccion) VALUES
('Santiago centro','avenida matta 256'),
('Las condes','pedro de valdivia 54'),
('La florida','departamental 80'),
('Pudahuel','santa rosa 1125'),
('Maipu','el algarrobal 12 ');


-- Importacion de datos a la tabla inventario mediante .csv

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/inventario.csv'
INTO TABLE INVENTARIO
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(idsucursal,idproducto,cantidad);

-- Importacion de datos a la tabla ventas mediante .csv

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/ventas.csv'
INTO TABLE VENTAS
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(idcliente,fecha,idproducto,cantidad,idsucursal);




























-- Importacion de datos a la tabla clientes mediante .csv

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/empleados.csv'
INTO TABLE EMPLEADO
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,TELEFONO,CORREO,IDRESTAURANTE);


-- MESA 100 records

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/empleados.csv'
INTO TABLE EMPLEADO
FIELDS TERMINATED BY ','  ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(NOMBRE,TELEFONO,CORREO,IDRESTAURANTE);



-- MESAS

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/mesas.csv'
INTO TABLE MESA
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(IDRESTAURANTE,CAPACIDAD,DISPONIBLE);

-- RESERVA

LOAD DATA  LOCAL INFILE '/sql_project/data_csv/reservas.csv'
INTO TABLE RESERVA
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
-- COLUMNAS QUE ME INTERESA INGESTAR
(IDCLIENTE, IDMESA, IDEMPLEADO, IDTIPORESERVA, FECHA, @CANCELACION, HORARIO_RESERVA)
SET CANCELACION = NULLIF(@CANCELACION, '');