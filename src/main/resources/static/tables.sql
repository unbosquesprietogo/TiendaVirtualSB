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

CREATE TABLE productos (
                            id_producto INT AUTO_INCREMENT PRIMARY KEY,
                            ivacompra DECIMAL,
                            nit_prov VARCHAR(50),
                            nombre_producto VARCHAR(255),
                            precio_compra DECIMAL,
                            precio_venta DECIMAL,
                            FOREIGN KEY (nit_prov) REFERENCES proveedores(nit_prov)
);

CREATE TABLE ventas(
                        id_venta INT AUTO_INCREMENT PRIMARY KEY,
                        cedula_cli VARCHAR(50),
                        cedula_usu VARCHAR(50),
                        ivaventa DECIMAL(4,2),
                        total_venta DECIMAL,
                        valor_venta DECIMAL,
                        FOREIGN KEY (cedula_cli) REFERENCES clientes(cedula_cli),
                        FOREIGN KEY (cedula_usu) REFERENCES usuarios(cedula)
);


CREATE TABLE detalle_ventas(
                               id_detalle_venta INT AUTO_INCREMENT PRIMARY KEY,
                               cantidad_producto INT(11),
                               id_producto INT,
                               id_venta INT,
                               valor_total DECIMAL,
                               valor_venta DECIMAL,
                               valor_iva DECIMAL,
                               FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
                               FOREIGN KEY (id_venta) REFERENCES ventas(id_venta)
);

CREATE TABLE usuarios(
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          usuario VARCHAR(50) UNIQUE NOT NULL,
                          contraseña VARCHAR(64) NOT NULL,
                          cedula VARCHAR(50) UNIQUE NOT NULL,
                          nombre VARCHAR(100)  NOT NULL,
                          apellido VARCHAR(100)  NOT NULL
);


