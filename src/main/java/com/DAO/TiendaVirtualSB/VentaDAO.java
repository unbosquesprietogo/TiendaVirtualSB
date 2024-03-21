package com.DAO.TiendaVirtualSB;
import com.DTO.TiendaVirtualSB.DetalleVentaVO;
import com.DTO.TiendaVirtualSB.VentaVO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentaDAO {

	public boolean insertarVentaConDetalles(VentaVO venta, List<DetalleVentaVO> detalles) {
		Conexion conex = new Conexion();
		Connection connection = null;
		PreparedStatement ventaStatement = null;
		PreparedStatement detalleStatement = null;
		ResultSet generatedKeys = null;
		try {
			// Iniciar la transacción
			connection = conex.getConnection();
			connection.setAutoCommit(false);

			// Insertar la venta
			String ventaQuery = "INSERT INTO ventas (cedula_cli, cedula_usu, ivaventa, total_venta, valor_venta) VALUES (?, ?, ?, ?, ?)";
			ventaStatement = connection.prepareStatement(ventaQuery, PreparedStatement.RETURN_GENERATED_KEYS);
			ventaStatement.setString(1, venta.getCedulaCliente());
			ventaStatement.setString(2, venta.getCedulaUsuario());
			ventaStatement.setDouble(3, venta.getIvaVenta());
			ventaStatement.setDouble(4, venta.getTotalVenta());
			ventaStatement.setDouble(5, venta.getValorVenta());

			int affectedRows = ventaStatement.executeUpdate();

			if (affectedRows == 0) {
				throw new SQLException("No se pudo insertar la venta.");
			}

			// Obtener el ID generado para la venta
			generatedKeys = ventaStatement.getGeneratedKeys();
			int ventaId;
			if (generatedKeys.next()) {
				ventaId = generatedKeys.getInt(1);
			} else {
				throw new SQLException("No se pudo obtener el ID de la venta generada.");
			}

			// Insertar los detalles de la venta
			String detalleQuery = "INSERT INTO detalle_ventas (cantidad_producto, id_producto, id_venta, valor_total, valor_venta, valor_iva) VALUES (?, ?, ?, ?, ?, ?)";
			detalleStatement = connection.prepareStatement(detalleQuery);
			for (DetalleVentaVO detalle : detalles) {
				detalleStatement.setInt(1, detalle.getCantidadProducto());
				detalleStatement.setInt(2, detalle.getIdProducto());
				detalleStatement.setInt(3, ventaId);
				detalleStatement.setDouble(4, detalle.getValorTotal());
				detalleStatement.setDouble(5, detalle.getValorVenta());
				detalleStatement.setDouble(6, detalle.getValorIva());
				detalleStatement.addBatch();
			}

			detalleStatement.executeBatch();

			// Commit la transacción
			connection.commit();
			return true;
		} catch (SQLException e) {
			// Rollback en caso de error
			try {
				if (connection != null) {
					connection.rollback();
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
			e.printStackTrace();
			return false;
		} finally {
			// Cerrar los recursos
			try {
				if (generatedKeys != null) {
					generatedKeys.close();
				}
				if (ventaStatement != null) {
					ventaStatement.close();
				}
				if (detalleStatement != null) {
					detalleStatement.close();
				}
				if (connection != null) {
					connection.setAutoCommit(true);
					connection.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public VentaVO consultarVentaConDetalles(int idVenta) {
		Conexion conex = new Conexion();
		VentaVO venta = null;
		List<DetalleVentaVO> detalles = new ArrayList<>();
		try (Connection connection = conex.getConnection()) {
			String ventaQuery = "SELECT * FROM ventas WHERE id_venta = ?";
			try (PreparedStatement ventaStatement = connection.prepareStatement(ventaQuery)) {
				ventaStatement.setInt(1, idVenta);
				try (ResultSet ventaResult = ventaStatement.executeQuery()) {
					if (ventaResult.next()) {
						venta = new VentaVO();
						venta.setIdVenta(ventaResult.getInt("id_venta"));
						venta.setCedulaCliente(ventaResult.getString("cedula_cli"));
						venta.setCedulaUsuario(ventaResult.getString("cedula_usu"));
						venta.setIvaVenta(ventaResult.getDouble("ivaventa"));
						venta.setTotalVenta(ventaResult.getDouble("total_venta"));
						venta.setValorVenta(ventaResult.getDouble("valor_venta"));
					}
				}
			}

			if (venta != null) {
				String detalleQuery = "SELECT * FROM detalle_ventas WHERE id_venta = ?";
				try (PreparedStatement detalleStatement = connection.prepareStatement(detalleQuery)) {
					detalleStatement.setInt(1, idVenta);
					try (ResultSet detalleResult = detalleStatement.executeQuery()) {
						while (detalleResult.next()) {
							DetalleVentaVO detalle = new DetalleVentaVO();
							detalle.setIdDetalleVenta(detalleResult.getInt("id_detalle_venta"));
							detalle.setCantidadProducto(detalleResult.getInt("cantidad_producto"));
							detalle.setIdProducto(detalleResult.getInt("id_producto"));
							detalle.setIdVenta(detalleResult.getInt("id_venta"));
							detalle.setValorTotal(detalleResult.getDouble("valor_total"));
							detalle.setValorVenta(detalleResult.getDouble("valor_venta"));
							detalle.setValorIva(detalleResult.getDouble("valor_iva"));
							detalles.add(detalle);
						}
					}
				}
				venta.setDetalles(detalles);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return venta;
	}
}
