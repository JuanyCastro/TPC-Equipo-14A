USE BD2_TPI_G44
GO

-- trg_ControlStock: Descuenta la cantidad vendida del stock actual del artículo tras una venta.
CREATE TRIGGER trg_ControlStock
ON DetallesVenta
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET a.Stock_Actual = a.Stock_Actual - i.Cantidad
    FROM Articulos a
    INNER JOIN inserted i ON a.Id_Articulo = i.Id_Articulo;
END;
GO

-- trg_RestaurarStock_Cancelacion: Devuelve la cantidad al stock si se elimina un detalle de venta.
CREATE TRIGGER trg_RestaurarStock_Cancelacion
ON DetallesVenta
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE a
    SET a.Stock_Actual = a.Stock_Actual + d.Cantidad
    FROM Articulos a
    INNER JOIN deleted d ON a.Id_Articulo = d.Id_Articulo;
END;
GO

-- trg_AuditoriaPrecios: Inserta un registro histórico al modificar el precio de un artículo.
CREATE TRIGGER trg_AuditoriaPrecios
ON Articulos
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF UPDATE(Precio_Actual)
    BEGIN
        INSERT INTO HistorialPrecios(Id_Articulo, Precio_Anterior, Precio_Nuevo, Fecha_Cambio)
        SELECT i.Id_Articulo, d.Precio_Actual, i.Precio_Actual, GETDATE()
        FROM inserted i
        INNER JOIN deleted d ON i.Id_Articulo = d.Id_Articulo
        WHERE i.Precio_Actual <> d.Precio_Actual;
    END
END;
GO