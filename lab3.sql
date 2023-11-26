


/*
CLIENTES: Codigo, Rut, Nombres, Apellidos
VENTAS: Codigo_venta, Codigo_cliente, Codigo_producto, Cantidad, Fecha_venta
PRODUCTOS: Codigo, Nombre, Precio
*/

\c tienditacesar

--a) Nombre del cliente que ha gastado menos dinero en compras
SELECT clientes.nombres, t2.MIN FROM (SELECT MIN(dinero_gastado) FROM (SELECT SUM(cantidad * precio) AS dinero_gastado FROM ventas JOIN productos ON productos.codigo = ventas.codigo_producto 
GROUP BY codigo_cliente) AS t1) AS t2 JOIN (SELECT codigo_cliente, SUM(cantidad * precio) AS dinero_gastado FROM ventas JOIN productos ON productos.codigo = ventas.codigo_producto 
GROUP BY codigo_cliente) AS t3 ON t3.dinero_gastado = t2.MIN JOIN clientes ON clientes.codigo = t3.codigo_cliente GROUP BY clientes.nombres, t2.MIN;

--b) Codigo y nombre del producto mas vendido en febrero del 2020
SELECT productos.codigo, productos.nombre FROM (SELECT MAX(COUNT) FROM (SELECT COUNT(*) FROM ventas WHERE fecha_venta BETWEEN '2020-02-01' AND '2020-02-29' GROUP BY codigo_producto)
AS t1) AS t2 JOIN (SELECT codigo_producto, COUNT(*) FROM ventas WHERE fecha_venta BETWEEN '2020-02-01' AND '2020-02-29' GROUP BY codigo_producto) AS t3 ON t3.COUNT = t2.MAX
JOIN productos ON productos.codigo = t3.codigo_producto GROUP BY productos.codigo, productos.nombre;

--c) Cliente que nunca ha comprado
SELECT codigo, rut, nombres, apellidos FROM clientes WHERE clientes.codigo NOT IN (SELECT codigo_cliente FROM ventas);

--d) Productos que superen el precio medio de los productos
SELECT codigo, nombre, precio FROM productos WHERE precio > (SELECT AVG(precio) FROM productos);

--e) Clientes que hayan comprado productos que superen el precio medio de los productos y que producto compraron
SELECT clientes.nombres, productos.nombre FROM clientes JOIN ventas ON ventas.codigo_cliente = clientes.codigo JOIN productos ON productos.codigo = ventas.codigo_producto
WHERE precio > (SELECT AVG(precio) FROM productos) GROUP BY clientes.nombres, productos.nombre;