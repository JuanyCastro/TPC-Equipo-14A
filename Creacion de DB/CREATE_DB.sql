-- 1. Creación de la Base de Datos
CREATE DATABASE BD2_TPI_G44;
GO

USE BD2_TPI_G44;
GO

-- ==========================================
-- 2. CREACIÓN DE TABLAS MAESTRAS (Sin FKs)
-- ==========================================

CREATE TABLE Roles (
    Id_Rol INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Categorias (
    Id_Categoria INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Marcas (
    Id_Marca INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Proveedores (
    Id_Proveedor INT IDENTITY(1,1) PRIMARY KEY,
    Razon_Social VARCHAR(150) NOT NULL,
    CUIT VARCHAR(15) NOT NULL UNIQUE
);

-- ==========================================
-- 3. CREACIÓN DE TABLAS DEPENDIENTES (Con FKs)
-- ==========================================

CREATE TABLE Empleados (
    Id_Empleado INT IDENTITY(1,1) PRIMARY KEY,
    Id_Rol INT NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    DNI VARCHAR(15) NOT NULL UNIQUE,
    Fecha_Ingreso DATETIME NOT NULL DEFAULT GETDATE(),
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Empleados_Roles FOREIGN KEY (Id_Rol) REFERENCES Roles(Id_Rol)
);

CREATE TABLE Articulos (
    Id_Articulo INT IDENTITY(1,1) PRIMARY KEY,
    Id_Categoria INT NOT NULL,
    Id_Marca INT NOT NULL,
    Nombre VARCHAR(150) NOT NULL,
    Precio_Actual DECIMAL(10,2) NOT NULL CHECK (Precio_Actual > 0),
    Porcentaje_IVA DECIMAL(5,2) NOT NULL DEFAULT 21.00, -- Ej: 21.00, 10.50
    Stock_Actual INT NOT NULL DEFAULT 0,
    Stock_Minimo INT NOT NULL DEFAULT 5,
    Activo BIT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Articulos_Categorias FOREIGN KEY (Id_Categoria) REFERENCES Categorias(Id_Categoria),
    CONSTRAINT FK_Articulos_Marcas FOREIGN KEY (Id_Marca) REFERENCES Marcas(Id_Marca)
);

CREATE TABLE Articulos_CodigosBarras (
    Id_Codigo INT IDENTITY(1,1) PRIMARY KEY,
    Id_Articulo INT NOT NULL,
    Codigo_Barras VARCHAR(50) NOT NULL,
    CONSTRAINT FK_Codigos_Articulos FOREIGN KEY (Id_Articulo) REFERENCES Articulos(Id_Articulo),
    CONSTRAINT UQ_Codigo_Barras UNIQUE (Codigo_Barras)
);

-- ==========================================
-- 4. CREACIÓN DE TABLAS TRANSACCIONALES
-- ==========================================

-- 4.1 CIRCUITO DE VENTAS Y FACTURACIÓN
CREATE TABLE Ventas (
    Id_Venta INT IDENTITY(1,1) PRIMARY KEY,
    Id_Empleado INT NOT NULL,
    Fecha_Hora DATETIME NOT NULL DEFAULT GETDATE(),
    Total DECIMAL(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Ventas_Empleados FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id_Empleado)
);

CREATE TABLE DetallesVenta (
    Id_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    Id_Venta INT NOT NULL,
    Id_Articulo INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    Monto_IVA DECIMAL(10,2) NOT NULL, -- Cuánto de ese precio unitario fue impuesto
    CONSTRAINT FK_DetallesVenta_Ventas FOREIGN KEY (Id_Venta) REFERENCES Ventas(Id_Venta),
    CONSTRAINT FK_DetallesVenta_Articulos FOREIGN KEY (Id_Articulo) REFERENCES Articulos(Id_Articulo)
);

CREATE TABLE Facturas (
    Id_Factura INT IDENTITY(1,1) PRIMARY KEY,
    Id_Venta INT NOT NULL UNIQUE, -- Una venta genera una única factura
    Tipo_Comprobante VARCHAR(1) NOT NULL CHECK (Tipo_Comprobante IN ('A', 'B', 'C')),
    Numero_Factura VARCHAR(20) NOT NULL UNIQUE,
    CUIT_Cliente VARCHAR(15) NULL,
    Razon_Social_Cliente VARCHAR(150) NULL,
    Fecha_Emision DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Facturas_Ventas FOREIGN KEY (Id_Venta) REFERENCES Ventas(Id_Venta)
);

-- 4.2 CIRCUITO DE COMPRAS
CREATE TABLE Compras (
    Id_Compra INT IDENTITY(1,1) PRIMARY KEY,
    Id_Proveedor INT NOT NULL,
    Id_Empleado INT NOT NULL, -- Quién registró la compra
    Fecha_Hora DATETIME NOT NULL DEFAULT GETDATE(),
    Total DECIMAL(12,2) NOT NULL DEFAULT 0,
    CONSTRAINT FK_Compras_Proveedores FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores(Id_Proveedor),
    CONSTRAINT FK_Compras_Empleados FOREIGN KEY (Id_Empleado) REFERENCES Empleados(Id_Empleado)
);

CREATE TABLE DetallesCompra (
    Id_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    Id_Compra INT NOT NULL,
    Id_Articulo INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    Precio_Unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_DetallesCompra_Compras FOREIGN KEY (Id_Compra) REFERENCES Compras(Id_Compra),
    CONSTRAINT FK_DetallesCompra_Articulos FOREIGN KEY (Id_Articulo) REFERENCES Articulos(Id_Articulo)
);

-- 4.3 MOVIMIENTOS DE CAJA
CREATE TABLE Caja_Movimientos (
    Id_Movimiento INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_Hora DATETIME NOT NULL DEFAULT GETDATE(),
    Tipo_Movimiento VARCHAR(10) NOT NULL CHECK (Tipo_Movimiento IN ('INGRESO', 'EGRESO')),
    Monto DECIMAL(12,2) NOT NULL CHECK (Monto > 0),
    Concepto VARCHAR(200) NOT NULL,
    Id_Venta INT NULL,   -- Se llena si el ingreso viene de un ticket
    Id_Compra INT NULL,  -- Se llena si el egreso es para pagar a un proveedor
    CONSTRAINT FK_Caja_Ventas FOREIGN KEY (Id_Venta) REFERENCES Ventas(Id_Venta),
    CONSTRAINT FK_Caja_Compras FOREIGN KEY (Id_Compra) REFERENCES Compras(Id_Compra)
);

-- ==========================================
-- 5. CREACIÓN DE TABLAS DE AUDITORÍA
-- ==========================================

CREATE TABLE HistorialPrecios (
    Id_Historial INT IDENTITY(1,1) PRIMARY KEY,
    Id_Articulo INT NOT NULL,
    Precio_Anterior DECIMAL(10,2) NOT NULL,
    Precio_Nuevo DECIMAL(10,2) NOT NULL,
    Fecha_Cambio DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_HistorialPrecios_Articulos FOREIGN KEY (Id_Articulo) REFERENCES Articulos(Id_Articulo)
);
GO