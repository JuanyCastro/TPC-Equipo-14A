USE BD2_TPI_G44
GO

INSERT INTO Roles (Nombre) VALUES ('Cajero'), ('Supervisor'), ('Gerente');
INSERT INTO Categorias (Nombre) VALUES ('Lácteos'), ('Bebidas sin alcohol'), ('Limpieza'), ('Almacén'), ('Carnicería y Embutidos');
INSERT INTO Marcas (Nombre) VALUES ('La Serenísima'), ('Coca-Cola'), ('Arcor'), ('Ayudín'), ('Swift'), ('Marolio'), ('Patricio');
INSERT INTO Proveedores (Razon_Social, CUIT) VALUES ('Distribuidora Norte SA', '30-12345678-9'), ('Alimentos del Sur SRL', '30-98765432-1');

INSERT INTO Empleados (Id_Rol, Nombre, Apellido, DNI, Fecha_Ingreso, Activo)
VALUES 
(1, 'Juan', 'Pérez', '35123456', '2023-01-15', 1),
(1, 'María', 'Gómez', '38234567', '2024-03-10', 1),
(2, 'Carlos', 'López', '31987654', '2020-05-20', 1),
(3, 'Ana', 'Martínez', '28765432', '2018-11-01', 1),
(1, 'Pedro', 'Sánchez', '40123987', '2025-02-01', 0); 

INSERT INTO Articulos (Id_Categoria, Id_Marca, Nombre, Precio_Actual, Porcentaje_IVA, Stock_Actual, Stock_Minimo, Activo)
VALUES
(1, 1, 'Leche Entera Sachet 1L', 1200.50, 10.50, 50, 20, 1),
(1, 1, 'Queso Crema Clásico 300g', 2500.00, 21.00, 15, 10, 1),
(2, 2, 'Gaseosa Cola Regular 2.25L', 2800.00, 21.00, 120, 30, 1),
(2, 2, 'Gaseosa Cola Zero 2.25L', 2800.00, 21.00, 80, 20, 1),
(3, 4, 'Lavandina Clásica 1L', 950.00, 21.00, 40, 15, 1),
(3, 4, 'Detergente Limón 500ml', 1100.00, 21.00, 8, 15, 1), 
(4, 6, 'Fideos Tallarines 500g', 850.00, 21.00, 200, 50, 1),
(4, 6, 'Puré de Tomate 520g', 700.00, 21.00, 150, 40, 1),
(4, 3, 'Galletitas Chocolinas 250g', 1300.00, 21.00, 60, 20, 1),
(5, 5, 'Salchichas de Viena x6', 1800.00, 21.00, 30, 10, 1);

INSERT INTO Articulos_CodigosBarras (Id_Articulo, Codigo_Barras)
VALUES
(1, '7790001001234'), (2, '7790001005678'), (3, '7790002001111'),
(4, '7790002002222'), (5, '7790003003333'), (6, '7790003004444'),
(7, '7790004005555'), (8, '7790004006666'), (9, '7790004007777'),
(10, '7790005008888');

INSERT INTO Ventas (Id_Empleado, Fecha_Hora, Total)
VALUES
(1, '2026-06-08 10:15:00', 8500.00),
(2, '2026-06-08 11:30:00', 4100.00),
(1, '2026-06-08 14:45:00', 12350.50);

INSERT INTO DetallesVenta (Id_Venta, Id_Articulo, Cantidad, Precio_Unitario, Monto_IVA)
VALUES
(1, 3, 2, 2800.00, 588.00), 
(1, 9, 1, 1300.00, 273.00), 
(1, 10, 1, 1600.00, 336.00), 
(2, 7, 2, 850.00, 178.50),  
(2, 1, 2, 1200.50, 126.05), 
(3, 2, 1, 2500.00, 525.00), 
(3, 5, 3, 950.00, 199.50),  
(3, 8, 10, 700.00, 147.00); 

INSERT INTO Caja_Movimientos (Fecha_Hora, Tipo_Movimiento, Monto, Concepto, Id_Venta)
VALUES
('2026-06-08 10:15:00', 'INGRESO', 8500.00, 'Cobro Ticket Mostrador', 1),
('2026-06-08 11:30:00', 'INGRESO', 4100.00, 'Cobro Ticket Mostrador', 2),
('2026-06-08 14:45:00', 'INGRESO', 12350.50, 'Cobro Ticket Mostrador', 3);
GO