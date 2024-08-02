USE repuestos;

DROP PROCEDURE IF EXISTS UpdateProductoInventario;
DROP PROCEDURE IF EXISTS RegistrarNuevoCliente;

DELIMITER //

CREATE PROCEDURE UpdateProductoInventario(
    IN product_id INT,
    IN branch_id INT,
    IN new_quantity INT
)
BEGIN
    DECLARE current_stock INT;
    DECLARE total_products INT;

    -- Verificar si el producto y la sucursal existen en la tabla INVENTARIO
    SELECT COUNT(*) INTO total_products
    FROM INVENTARIO
    WHERE idproducto = product_id AND idsucursal = branch_id;

    IF total_products = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto o la sucursal no existen en el inventario';
    ELSE
        -- Verificar que la cantidad nueva no sea negativa
        IF new_quantity < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La cantidad nueva no puede ser negativa';
        ELSE
            -- Actualizar la cantidad en el inventario
            UPDATE INVENTARIO
            SET cantidad = new_quantity
            WHERE idproducto = product_id AND idsucursal = branch_id;
        END IF;
    END IF;
END//

DELIMITER ;


DELIMITER //

CREATE PROCEDURE RegistrarNuevoCliente(
    IN cliente_nombre VARCHAR(255),
    IN cliente_telefono VARCHAR(20),
    IN cliente_email VARCHAR(255),
    IN cliente_direccion VARCHAR(255)
)
BEGIN
    -- Insertar un nuevo cliente en la tabla CLIENTE
    
    INSERT INTO CLIENTE (nombre, telefono, correo, direccion)
    VALUES (cliente_nombre, cliente_telefono, cliente_email, cliente_direccion);
END//

DELIMITER ;

