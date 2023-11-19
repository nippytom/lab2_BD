/*
CLIENTES: Codigo, Rut, Nombres, Apellidos
VENTAS: Codigo_venta, Codigo_cliente, Codigo_producto, Cantidad, Fecha_venta
PRODUCTOS: Codigo, Nombre, Precio
*/

--a) Nombre del cliente que ha gastado menos dinero en compras
SELECT clientes.nombres FROM (SELECT MIN(dinero_gastado) FROM (SELECT SUM(cantidad) * precio AS dinero_gastado FROM ventas JOIN productos ON productos.codigo = ventas.codigo_producto 
GROUP BY codigo_cliente, productos.precio) AS t1) AS t2 JOIN (SELECT codigo_cliente, SUM(cantidad) * precio AS dinero_gastado FROM ventas JOIN productos 
ON productos.codigo = ventas.codigo_producto GROUP BY codigo_cliente, productos.precio) AS t3 ON t3.dinero_gastado = t2.MIN JOIN clientes ON clientes.codigo = t3.codigo_cliente
GROUP BY clientes.nombre;

--b) Codigo y nombre del producto mas vendido en febrero del 2020
SELECT productos.codigo, productos.nombre FROM (SELECT MAX(COUNT) FROM (SELECT COUNT(*) FROM ventas WHERE EXTRACT(MONTH FROM fecha_venta) = 2
AND EXTRACT(YEAR FROM fecha_venta) = 2020 GROUP BY codigo_producto) AS t1) AS t2 JOIN (SELECT codigo_producto, COUNT(*) FROM ventas WHERE EXTRACT(MONTH FROM fecha_venta) = 2
AND EXTRACT(YEAR FROM fecha_venta) = 2020 GROUP BY codigo_producto) AS t3 ON t3.COUNT = t2.MAX JOIN productos ON productos.codigo = t3.codigo_producto GROUP BY productos.codigo, productos.nombre;

--c) Cliente que nunca ha comprado


--d) Productos que superen el precio medio de los productos


--e) Clientes que hayan comprado productos que superen el precio medio de los productos y que producto compraron

