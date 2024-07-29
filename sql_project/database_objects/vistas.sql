USE repuestos;

-- Vista para conocer la cantidad de clientes que han comprado por sucursal con el fin de manejar este KPI para realizar distintas acciones de marketing entre otros.

CREATE VIEW TotalClientesPorSucursal AS
SELECT 
    S.idsucursal,
    S.nombre AS nombre_sucursal,
    COUNT(DISTINCT V.idcliente) AS total_clientes
FROM 
    SUCURSAL S
LEFT JOIN 
    VENTAS V ON S.idsucursal = V.idsucursal
GROUP BY 
    S.idsucursal, S.nombre;


-- Esta vista va a proporcionar un listado de categorias con el numero total de productos por cada categoria con el fin de poder determinar cuales
-- son las categorias de repuestos con menos productos dentro del inventario para tomar acciones como equilibrar la oferta de productos hacia los clientes.

CREATE VIEW ProductosPorCategoria AS
SELECT 
    C.idcategoria,
    C.nombre AS nombre_categoria,
    COUNT(P.idproducto) AS total_productos
FROM 
    CATEGORIA C
LEFT JOIN 
    PRODUCTO P ON C.idcategoria = P.idcategoria
GROUP BY 
    C.idcategoria, C.nombre;




















-- Vista para Cantidad de Reservas por Mesas:
-- Esta vista mostrará la cantidad de reservas realizadas para cada mesa, así como la capacidad total de la mesa.
CREATE VIEW
    ReservasPorMesa AS
SELECT
    MESA.IDMESA,
    MESA.CAPACIDAD,
    COUNT(RESERVA.IDRESERVA) AS TotalReservas
FROM
    MESA
    LEFT JOIN RESERVA ON MESA.IDMESA = RESERVA.IDMESA
GROUP BY
    MESA.IDMESA,
    MESA.CAPACIDAD;

-- Vista para Cantidad de Cancelaciones por Tipo de Reservas:
-- Esta vista mostrará la cantidad de cancelaciones para cada tipo de reserva.
CREATE VIEW
    CancelacionesPorTipoReserva AS
SELECT
    TIPORESERVA.TIPO,
    COUNT(RESERVA.IDRESERVA) AS TotalCancelaciones
FROM
    TIPORESERVA
    LEFT JOIN RESERVA ON TIPORESERVA.IDTIPORESERVA = RESERVA.IDTIPORESERVA
WHERE
    RESERVA.CANCELACION IS NOT NULL
GROUP BY
    TIPORESERVA.TIPO;