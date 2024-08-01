 # CREACION DE UNA BASE DE DATOS PARA LLEVAR UN CONTROL DE GESTION EN TIENDAS DE VENTAS DE REPUESTOS AUTOMOVILISTICOS

## Problema:
Un emprendimiento dedicado a la venta y comercialización de diversos tipos de repuestos automovilísticos enfrenta la necesidad de diseñar una base de datos robusta y eficiente. Esta base de datos debe permitir la organización y el control interno de las ventas, la gestión de clientes, y el seguimiento del inventario en múltiples sucursales de venta al público. La solución debe proporcionar una visibilidad clara y precisa sobre el stock de repuestos, las transacciones realizadas y el comportamiento de los clientes, asegurando una administración eficiente y mejorando la toma de decisiones estratégicas del negocio.

### **Descripción del Problema:**

1. Gestión de Clientes y Empleados: Necesitamos una base de datos que permita registrar la informaciòn de los clientes que realizan compras en cada una de las sucursales de venta al publico 

2. Gestion de inventario por sucursal: La base de datos debe permitir poder consultar en todo momento y en tiempo real el stock de distintos tipos de repuestos que manejen las tiendas

3. Visivilidad de transacciones: La base de datos debe permitirle al negocio poder visiilizar las transacciones de ventas que se realizan con el fin de realizar seguimiento constante de los movimientos en pro de tomar las mejores decisiones para el negocio basado en los datos reales.


### **Objetivo:**


Diseñar e implementar una base de datos relacional que cubra todas las necesidades de gestión y control para diversas sucursales dedicadas a la venta de repuestos automovilísticos. Esta base de datos debe ser eficiente, escalable y de fácil mantenimiento, permitiendo una administración ágil y precisa de las operaciones de ventas y la comercialización de repuestos. Además, debe ofrecer un seguimiento detallado del inventario, registrar las transacciones de ventas y gestionar la información de los clientes, proporcionando así una base sólida para la toma de decisiones estratégicas y operativas, mejorando la eficiencia y efectividad del negocio.

## Descripción de la Base de Datos - Gestión integral de tiendas de repuestos


Esta base de datos está diseñada para gestionar el inventario y transacciones de venta en tiendas de ventas , así como la información relacionada con clientes que realizan compras en cada una de las sucursales. A continuación se detallan los elementos principales de la base de datos:

Tablas:

 1. **CLIENTE:**

      - Almacena información sobre los clientes que realizan compras de repuestos.
      - Atributos: IDCLIENTE, NOMBRE, TELEFONO, CORREO, DIRECCION.


2. **PRODUCTO:**

    - Contiene información sobre los productos o distintos repuestos comercializados.
    - Atributos: IDPRODUCTO, NOMBRE, DESCRIPCION, IDCATEGORIA, PRECIOUNITARIO


3. **CATEGORIA:**

    - Guarda datos sobre los distintos tipos de repuestos que se comercializan en las tiendas.
    - Atributos: IDCATEGORIA, NOMBRE
      

4. **SUCURSAL:**
   
    - Almacena la informaciòn de cada sucursal de venta
    - Atributos: IDSUCURSAL, NOMBRE, DIRECCION
      

5. **INVENTARIO:**

   - Almacena las cantidades y existencias de cada producto en las tiendas.
   - Atributos: IDINVENTARIO, IDSUCURSAL, IDPRODUCTO, CANTIDAD.


7. **VENTAS:**

   - Almacena la informacion relacionada a las ventas de cada una de las tiendas
   - Atributos: IDVENTA, IDCLIENTE, FECHA, IDPRODUCTO, CANTIDAD, IDSUCURSAL
  
  ### **Problemática Resuelta:**

  Esta base de datos permite tener visivilidad primero que nada de stock en tiempo real de repuestos que maneja cada sucursal, asi como tambien permite tener claridad en todo momento de la cantidad y fechas de transacciones de ventas que se realizan ademas de permitir un acceso rapido y eficiente a la informaciòn del negocio. Esta base de datos aborda principalmente lo siguiente:

- **Gestion de inventario:** Otorgando informaciòn precisa y en tiempo real, facilitando las reposiciones y evitando excesos o faltantes de stock
- **Gestion de ventas:** Proporcionando un seguimiento detallado de ventas , facilitando el analisis y la generacion de reportes de rendimiento 
- **Seguimiento de cliente:** Permite el almacenamiento y gestion centralizada de informacion de clientes, mejorando la relacion y estrategias de marketing

En resumen esta base de datos mejorarà la precision, eficiencia, seguridad y capacidad de toma de decisiones en la gestion de tiendas de ventas de respuestos.

# SEGUNDA PARTE DE LA ENTREGA

## Segunda PreEntrga de SQL
* Listado de Vistas más una descripción detallada, su objetivo, y qué tablas las componen.
* Listado de Funciones que incluyan una descripción detallada, el objetivo para la cual fueron creadas y qué datos o tablas manipulan y/o son implementadas.
* Listado de Stored Procedures con una descripción detallada, qué objetivo o beneficio aportan al proyecto, y las tablas que lo componen y/o tablas con las que interactúa
* Listado de Triggers

### Documentacion de Vistas

### Vista: TotalClientesPorSucursal

**Descripción:** Vista para conocer la cantidad de clientes que han comprado por sucursal con el fin de manejar este KPI para realizar distintas acciones de marketing entre otros.

**Columnas:**

**nombre:** Indica el nombre de la sucursal
**idsucursal:** Entrega el numero de sucursal asociada al conteo total de clientes
**total_clientes:** Conteo de clientes unicos asociados a cada sucursal

**Ejemplo de consulta:**

```sql
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
```

### Vista: ProductosPorCategoria

**Descripción:** -- Esta vista va a proporcionar un listado de categorias con el numero total de productos por cada categoria, con el fin de poder determinar cuales
son las categorias de repuestos con menos productos dentro del inventario para tomar acciones como equilibrar la oferta de productos hacia los clientes.

**Columnas:**

**nombre:** Indica el nombre de la categoria
**idcategoria:** Entrega el numero interno de la categoria
**total_productos:** Muestra el numero total de productos asociados a una categoria

**Ejemplo de consulta:**

```sql
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
```
### Documentacion de Triggers

### Trigger: ActualizarVentasPorCliente

**Descripción:** Este trigger permite registrar o actualizar las ventas por cliente en una tabla dedicada cada vez que se realizan nuevas ventas

* **Tabla afectada:** VENTAS_POR_CLIENTE
* **Acción:** INSERT
* **Información registrada:** idcliente, total_ventas

* **Ejemplo:**

* Se inserta una nueva venta
* El trigger verifica si el cliente ya tiene un registro en la tabla VENTAS_POR_CLIENTE
* Si existe en la tabla, se actualiza el total de ventas
* Si no existe el cliente en la tabla, se crea un nuevo registro

### Trigger: BeforeInsertVenta

**Descripción:** Este trigger asigna la fecha actual si no se proporciona una al momento de realizarse una venta.

* **Tabla afectada:** VENTAS
* * **Acción:** INSERT
* **Información registrada:** fecha



