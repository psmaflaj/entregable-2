CREATE TABLE Cliente (
    IDCliente INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Producto (
    IDProducto INT PRIMARY KEY,
    NombreProducto VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

-- Creación de Tablas con Dependencias
CREATE TABLE ContactoCliente (
    IDContacto INT PRIMARY KEY,
    IDCliente INT,
    Email VARCHAR(100),
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Pedido (
    IDPedido INT PRIMARY KEY,
    FechaPedido DATE NOT NULL,
    MontoTotal DECIMAL(10,2) NOT NULL,
    IDCliente INT,
    FOREIGN KEY (IDCliente) REFERENCES Cliente(IDCliente)
);

CREATE TABLE Inventario (
    IDInventario INT PRIMARY KEY,
    IDProducto INT,
    CantidadDisponible INT NOT NULL,
    FechaActualizacion DATE NOT NULL,
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);

CREATE TABLE DetallePedido (
    IDDetalle INT PRIMARY KEY,
    IDPedido INT,
    IDProducto INT,
    Cantidad INT NOT NULL,
    Subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (IDPedido) REFERENCES Pedido(IDPedido),
    FOREIGN KEY (IDProducto) REFERENCES Producto(IDProducto)
);

SELECT * FROM DetallePedido;
