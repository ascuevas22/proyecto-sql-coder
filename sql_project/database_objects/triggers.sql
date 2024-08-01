USE repuestos;

-- Trigger que permite registrar o actualizar las ventas por cliente en una tabla dedicada cada vez que se realizan nuevas ventas

CREATE TABLE VENTAS_POR_CLIENTE (
    idcliente INT,
    total_ventas INT,
    PRIMARY KEY (idcliente)
);

DELIMITER //

CREATE TRIGGER ActualizarVentasPorCliente
AFTER INSERT ON VENTAS
FOR EACH ROW
BEGIN

    -- Aca se verifica si el cliente ya tiene un registro en la tabla VENTAS_POR_CLIENTE

    IF EXISTS (SELECT 1 FROM VENTAS_POR_CLIENTE WHERE idcliente = NEW.idcliente) THEN

        -- Si existe en la table, se actualiza el total de ventas

        UPDATE VENTAS_POR_CLIENTE
        SET total_ventas = total_ventas + NEW.cantidad
        WHERE idcliente = NEW.idcliente;
    ELSE
        -- Si no existe el cliente en la tabla, se crea un nuevo registro

        INSERT INTO VENTAS_POR_CLIENTE (idcliente, total_ventas)
        VALUES (NEW.idcliente, NEW.cantidad);
    END IF;
END //

DELIMITER ;

-- Trigger que asigna automaticamente la fecha actual a la tabla ventas antes de insertar una nueva venta en la tabla si esta no se proporciona

DELIMITER //

CREATE TRIGGER BeforeInsertVenta
BEFORE INSERT ON VENTAS
FOR EACH ROW
BEGIN
    -- Asignar la fecha actual si no se proporciona una
    
    IF NEW.fecha IS NULL THEN
        SET NEW.fecha = CURDATE();
    END IF;
END//

DELIMITER ;


