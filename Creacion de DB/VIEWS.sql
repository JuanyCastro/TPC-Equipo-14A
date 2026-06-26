USE BD2_TPI_G44
GO

--vw_StockCritico: Muestra los artículos cuyo stock actual ha caído por debajo del nivel mínimo.
CREATE VIEW vw_StockCritico AS
SELECT 
    A.Id_Articulo,
    (SELECT TOP 1 Codigo_Barras FROM Articulos_CodigosBarras WHERE Id_Articulo = A.Id_Articulo) AS Codigo_Barras,
    A.Nombre AS Producto,
    A.Stock_Actual,
    A.Stock_Minimo
FROM Articulos A
WHERE A.Stock_Actual < A.Stock_Minimo AND A.Activo = 1;
GO

--vw_CatalogoPublico: Muestra el listado completo de productos disponibles.
CREATE VIEW vw_CatalogoPublico AS
SELECT 
    (SELECT TOP 1 Codigo_Barras FROM Articulos_CodigosBarras WHERE Id_Articulo = a.Id_Articulo) AS Codigo_Barras,
    a.Nombre AS Producto,
    c.Nombre AS Categoria,
    m.Nombre AS Marca,
    a.Precio_Actual
FROM Articulos a
INNER JOIN Categorias c ON a.Id_Categoria = c.Id_Categoria
INNER JOIN Marcas m ON a.Id_Marca = m.Id_Marca
WHERE a.Activo = 1;
GO

--vw_RendimientoCajeros: Muestra un resumen de la actividad comercial de cada empleado.
CREATE VIEW vw_RendimientoCajeros AS
SELECT 
    v.Id_Empleado,
    dbo.fn_NombreCompletoEmpleado(v.Id_Empleado) AS Nombre_Cajero,
    COUNT(v.Id_Venta) AS Cantidad_Tickets,
    SUM(v.Total) AS Monto_Total_Facturado
FROM Ventas v
GROUP BY v.Id_Empleado;
GO