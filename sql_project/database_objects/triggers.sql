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



























CREATE TABLE 
    LOG_CAMBIOS (
        id_log          INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    ,   tabla_afectada  VARCHAR (50)
    ,   accion          VARCHAR(50)
    ,   fecha           DATETIME
    ,   idcliente       INT
    ,   usuario         VARCHAR(50)
    );



DELIMITER //

CREATE TRIGGER after_insert_trigger
AFTER INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha,idcliente,usuario)
    VALUES ('CLIENTE', 'INSERT', NOW() , NEW.IDCLIENTE,USER());
END //

DELIMITER ;



--  Trigger para almacenar registros modificados si la reserva se cancela

DELIMITER //

CREATE TRIGGER after_update_cancelacion_trigger
AFTER UPDATE ON RESERVA
FOR EACH ROW
BEGIN
    IF OLD.CANCELACION IS NULL AND NEW.CANCELACION IS NOT NULL THEN
        INSERT INTO LOG_CAMBIOS (tabla_afectada, accion, fecha,idcliente,usuario)
        VALUES ('RESERVA', 'CANCELACION', NOW());
    END IF;
END //

DELIMITER ;


-- Trigger para verificar si el correo electrónico de un cliente es único al insertar un nuevo cliente

DELIMITER //

CREATE TRIGGER before_insert_cliente_trigger
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
    DECLARE correo_count INT;
    
    SELECT COUNT(*) INTO correo_count
        FROM CLIENTE
    WHERE CORREO = NEW.CORREO;
    
    IF correo_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    END IF;
END //

DELIMITER ;


-- Trigger para verificar si un cliente ya tiene una reserva hecha en la misma hora y mesa y que no esté cancelada:


DELIMITER //

CREATE TRIGGER before_insert_reserva_trigger
BEFORE INSERT ON RESERVA
FOR EACH ROW
BEGIN
    DECLARE reserva_count INT;
    
    SELECT COUNT(*) INTO reserva_count
        FROM RESERVA
    WHERE IDCLIENTE = NEW.IDCLIENTE
        AND IDMESA = NEW.IDMESA
        AND FECHA = NEW.FECHA
        AND CANCELACION IS NULL;
        
    IF reserva_count > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente ya tiene una reserva en la misma hora y mesa.';
    END IF;
END //

DELIMITER ;


