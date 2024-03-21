package com.DAO.TiendaVirtualSB;

import com.DTO.TiendaVirtualSB.ProductoVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    public boolean insertarProducto(ProductoVO producto) {
        Conexion conex = new Conexion();
        try {
            String query = "INSERT INTO productos (ivaCompra, nit_prov, nombre_producto, precio_compra, precio_venta) VALUES (?, ?, ?, ?, ?)";
            try (Connection connection = conex.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setDouble(1, producto.getIvaCompra());
                statement.setString(2, producto.getNitProveedor());
                statement.setString(3, producto.getNombreProducto());
                statement.setDouble(4, producto.getPrecioCompra());
                statement.setDouble(5, producto.getPrecioVenta());
                return statement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ProductoVO> listarProductos(Integer id) {
        List<ProductoVO> productos = new ArrayList<>();
        Conexion conex = new Conexion();
        try {
            String query = "SELECT * FROM productos";

            if (id != null) {
                query +=  "WHERE id_producto = " + id ;
            }
            try (Connection connection = conex.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query);
                 ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    ProductoVO producto = new ProductoVO();
                    producto.setIdProducto(resultSet.getInt("id_producto"));
                    producto.setIvaCompra(resultSet.getDouble("ivaCompra"));
                    producto.setNitProveedor(resultSet.getString("nit_prov"));
                    producto.setNombreProducto(resultSet.getString("nombre_producto"));
                    producto.setPrecioCompra(resultSet.getDouble("precio_compra"));
                    producto.setPrecioVenta(resultSet.getDouble("precio_venta"));
                    productos.add(producto);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }

}
