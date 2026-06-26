USE BD2_TPI_G44
GO

-- =======================================================================
-- 1. sp_ReporteVentasPorRango
-- Procedimiento parametrizado para filtrar ventas por fecha.
-- =======================================================================
CREATE PROCEDURE sp_ReporteVentasPorRango
    @FechaInicio DATETIME,
    @FechaFin DATETIME
AS
BEGIN
    SELECT 
        Id_Empleado,
        COUNT(Id_Venta) AS Cantidad_Tickets,
        SUM(Total) AS Recaudacion_Total
    FROM Ventas
    WHERE Fecha_Hora >= @FechaInicio AND Fecha_Hora <= @FechaFin
    GROUP BY Id_Empleado
    ORDER BY Recaudacion_Total DESC;
END;
GO

-- =======================================================================
-- 2. sp_RegistrarVenta
-- Inserta la cabecera de la venta y devuelve el ID generado para el código.
-- =======================================================================
CREATE PROCEDURE sp_RegistrarVenta
    @Id_Empleado INT,
    @Total DECIMAL(12,2)
AS
BEGIN
    INSERT INTO Ventas (Id_Empleado, Fecha_Hora, Total)
    OUTPUT INSERTED.Id_Venta
    VALUES (@Id_Empleado, GETDATE(), @Total);
END;
GO