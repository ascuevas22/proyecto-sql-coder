 # CREACION DE UNA BASE DE DATOS PARA LLEVAR UN CONTROL DE GESTION PARA TIENDAS DE VENTAS DE REPUESTOS AUTOMOVILISTICOS

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

   -Almacena las cantidades y existencias de cada producto en las tienas
   -Atributos: IDINVENTARIO, IDSUCURSAL, IDPRODUCTO, CANTIDAD.


6. **VENTAS:**

Almacena la informacion relacionada a las ventas de cada una de las tiendas
Atributos: IDVENTA, IDCLIENTE, FECHA, IDPRODUCTO, CANTIDAD, IDSUCURSAL
















TIPORESERVA:

Define diferentes tipos de reserva para clasificarlas según su propósito o requisitos específicos.
Atributos: IDTIPORESERVA, TIPO.
RESTAURANTE:

Almacena información sobre los restaurantes disponibles.
Atributos: IDRESTAURANTE, NOMBRE, DIRECCION, TELEFONO.
MESA:

Contiene información sobre las mesas disponibles en cada restaurante.
Atributos: IDMESA, IDRESTAURANTE, CAPACIDAD, DISPONIBLE.
RESERVA:

Registra las reservas realizadas por los clientes.
Atributos: IDRESERVA, IDCLIENTE, IDMESA, IDEMPLEADO, IDTIPORESERVA, FECHA.
Problemática Resuelta:
Esta base de datos permite gestionar eficientemente el proceso de reserva en restaurantes, desde la información de los clientes y empleados hasta la disponibilidad de mesas y el registro de reservas. Algunos aspectos que aborda incluyen:

Registro de clientes y empleados involucrados en el proceso de reserva.
Clasificación de las reservas según su tipo.
Gestión de la disponibilidad de mesas en cada restaurante.
Registro detallado de las reservas realizadas, incluyendo la fecha, cliente, mesa, empleado y tipo de reserva.
En resumen, esta base de datos proporciona una estructura para organizar y gestionar eficientemente las operaciones de reserva en restaurantes, lo que contribuye a mejorar el servicio ofrecido a los clientes y optimizar las operaciones del restaurante. */
