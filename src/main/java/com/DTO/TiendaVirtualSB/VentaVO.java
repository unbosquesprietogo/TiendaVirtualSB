package com.DTO.TiendaVirtualSB;

import java.util.List;

public class VentaVO {
	private int idVenta;
	private String cedulaCliente;
	private String cedulaUsuario;
	private double ivaVenta;
	private double totalVenta;
	private double valorVenta;
	private List<DetalleVentaVO> detalles;

	// Constructor vacío
	public VentaVO() {
	}

	// Constructor con todos los atributos

	public VentaVO(String cedulaCliente, String cedulaUsuario, double ivaVenta, double totalVenta, double valorVenta, List<DetalleVentaVO> detalles) {
		this.cedulaCliente = cedulaCliente;
		this.cedulaUsuario = cedulaUsuario;
		this.ivaVenta = ivaVenta;
		this.totalVenta = totalVenta;
		this.valorVenta = valorVenta;
		this.detalles = detalles;
	}


	// Métodos getter y setter para cada atributo

	public int getIdVenta() {
		return idVenta;
	}

	public void setIdVenta(int idVenta) {
		this.idVenta = idVenta;
	}

	public String getCedulaCliente() {
		return cedulaCliente;
	}

	public void setCedulaCliente(String cedulaCliente) {
		this.cedulaCliente = cedulaCliente;
	}

	public String getCedulaUsuario() {
		return cedulaUsuario;
	}

	public void setCedulaUsuario(String cedulaUsuario) {
		this.cedulaUsuario = cedulaUsuario;
	}

	public double getIvaVenta() {
		return ivaVenta;
	}

	public void setIvaVenta(double ivaVenta) {
		this.ivaVenta = ivaVenta;
	}

	public double getTotalVenta() {
		return totalVenta;
	}

	public void setTotalVenta(double totalVenta) {
		this.totalVenta = totalVenta;
	}

	public double getValorVenta() {
		return valorVenta;
	}

	public void setValorVenta(double valorVenta) {
		this.valorVenta = valorVenta;
	}

	// Método toString para representar el objeto como una cadena de texto

	public void setDetalles(List<DetalleVentaVO> detalles) {
		this.detalles = detalles;
	}

	public List<DetalleVentaVO> getDetalles() {
		return detalles;
	}
	@Override
	public String toString() {
		return "Venta{" +
				"idVenta=" + idVenta +
				", cedulaCliente='" + cedulaCliente + '\'' +
				", cedulaUsuario='" + cedulaUsuario + '\'' +
				", ivaVenta=" + ivaVenta +
				", totalVenta=" + totalVenta +
				", valorVenta=" + valorVenta +
				'}';
	}


}
