USE BD2_TPI_G44
GO

-- fn_NombreCompletoEmpleado: Función escalar que concatena el apellido y nombre.
CREATE FUNCTION fn_NombreCompletoEmpleado (@Id INT)
RETURNS VARCHAR(200)
AS
BEGIN
    DECLARE @NombreCompleto VARCHAR(200);

    SELECT @NombreCompleto = Apellido + ', ' + Nombre 
    FROM Empleados 
    WHERE Id_Empleado = @Id;
    
    RETURN ISNULL(@NombreCompleto, '');
END;
GO