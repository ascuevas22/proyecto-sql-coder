
USE repuestos;


DROP FUNCTION IF EXISTS ObtenerCategoriaNombre;
DROP FUNCTION IF EXISTS ObtenerPrecioProducto;

-- Función para obtener el nombre de una categoria

DELIMITER //

CREATE FUNCTION ObtenerCategoriaNombre(category_id INT) 
RETURNS VARCHAR (255)
    
DETERMINISTIC
READS SQL DATA
    
BEGIN
    DECLARE category_name VARCHAR(255);

    SELECT nombre INTO category_name
    FROM CATEGORIA
    WHERE idcategoria = category_id;

    RETURN category_name;
END//

DELIMITER ;


-- Funcion para obtener el precio unitario de un producto

DELIMITER //

CREATE FUNCTION ObtenerPrecioProducto(product_id INT)
RETURNS DECIMAL(10, 2)
    
DETERMINISTIC
READS SQL DATA
    
BEGIN
    DECLARE price DECIMAL(10, 2);

    SELECT preciounitario INTO price
    FROM PRODUCTO
    WHERE idproducto = product_id;

    RETURN price;
END//

DELIMITER ;

