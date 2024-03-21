create database dbgrupo12;

use dbgrupo12;

CREATE TABLE clientes (
                          cedula_cli VARCHAR(50) PRIMARY KEY,
                          direccion_cli VARCHAR(255),
                          email_cli VARCHAR(100),
                          nombre_cli VARCHAR(100),
                          telefono_cli VARCHAR(20)
);

CREATE TABLE proveedores (
                             nit_prov VARCHAR(50) PRIMARY KEY,
                             ciudad_prov VARCHAR(255),
                             direccion_prov VARCHAR(255),
                             nombre_prov VARCHAR(100),
                             telefono_prov VARCHAR(20)
);

CREATE TABLE ventas (
                        id_venta SERIAL PRIMARY KEY,
                        codigo_producto VARCHAR(50),
                        cantidad INT,
                        NIT_cliente VARCHAR(50)
);


