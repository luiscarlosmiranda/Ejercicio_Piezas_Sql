COMMENT ON TABLE Proveedor IS 'Esta tabla almacena información sobre los proveedores que suministran piezas al negocio. Cada proveedor tiene un código único (codigo_proveedor), así como su nombre, dirección, ciudad y provincia.';
CREATE TABLE Proveedor (
    codigo_proveedor SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    direccion TEXT NOT NULL,
    ciudad TEXT NOT NULL,
    provincia TEXT NOT NULL
);

COMMENT ON TABLE Categoria IS 'Esta tabla almacena información sobre las categorías de las piezas. Cada categoría tiene un código único (codigo_categoria) y un nombre.';
CREATE TABLE Categoria (
    codigo_categoria SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL
);

COMMENT ON TABLE Pieza IS 'Esta tabla almacena información sobre las piezas que el negocio utiliza. Cada pieza tiene un código único (codigo_pieza), así como su nombre, color, precio y el código de la categoría a la que pertenece (codigo_categoria).';
CREATE TABLE Pieza (
    codigo_pieza SERIAL PRIMARY KEY,
    nombre TEXT NOT NULL,
    color TEXT NOT NULL,
    precio NUMERIC NOT NULL,
    codigo_categoria INTEGER REFERENCES Categoria(codigo_categoria)
);


COMMENT ON TABLE Suministro IS 'Esta tabla almacena información sobre los suministros de piezas que el negocio recibe de los proveedores. Cada registro en esta tabla representa un suministro de una pieza (codigo_pieza) por parte de un proveedor (codigo_proveedor) en una fecha específica (fecha). También se almacena la cantidad de piezas suministradas (cantidad).';
CREATE TABLE Suministro (
    codigo_proveedor INTEGER REFERENCES Proveedor(codigo_proveedor),
    codigo_pieza INTEGER REFERENCES Pieza(codigo_pieza),
    fecha DATE NOT NULL,
    cantidad INTEGER NOT NULL,
    PRIMARY KEY (codigo_proveedor, codigo_pieza, fecha)
);

INSERT INTO Proveedor (nombre, direccion, ciudad, provincia)
VALUES ('Proveedor 1', 'Calle 123', 'Ciudad 1', 'Provincia 1');

select * from proveedor where ;
delete  'Proveedor 2', 'Calle 123', 'Ciudad 2', 'Provincia 2';

DELETE FROM Proveedor
WHERE codigo_proveedor = 2;

-- Restablecer la secuencia de la columna codigo_proveedor de la tabla Proveedor
SELECT setval(pg_get_serial_sequence('Proveedor', 'codigo_proveedor'), 1, false);

