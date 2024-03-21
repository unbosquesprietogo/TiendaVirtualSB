package com.DTO.TiendaVirtualSB;

public class DetalleVentaVO {
    private int idDetalleVenta;
    private int cantidadProducto;
    private int idProducto;
    private int idVenta;
    private double valorTotal;
    private double valorVenta;
    private double valorIva;

    // Constructor vacío
    public DetalleVentaVO() {
    }

    // Constructor con todos los atributos
    public DetalleVentaVO(int idDetalleVenta, int cantidadProducto, int idProducto, int idVenta, double valorTotal, double valorVenta, double valorIva) {
        this.idDetalleVenta = idDetalleVenta;
        this.cantidadProducto = cantidadProducto;
        this.idProducto = idProducto;
        this.idVenta = idVenta;
        this.valorTotal = valorTotal;
        this.valorVenta = valorVenta;
        this.valorIva = valorIva;
    }

    // Métodos getter y setter para cada atributo

    public int getIdDetalleVenta() {
        return idDetalleVenta;
    }

    public void setIdDetalleVenta(int idDetalleVenta) {
        this.idDetalleVenta = idDetalleVenta;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public void setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public double getValorTotal() {
        return valorTotal;
    }

    public void setValorTotal(double valorTotal) {
        this.valorTotal = valorTotal;
    }

    public double getValorVenta() {
        return valorVenta;
    }

    public void setValorVenta(double valorVenta) {
        this.valorVenta = valorVenta;
    }

    public double getValorIva() {
        return valorIva;
    }

    public void setValorIva(double valorIva) {
        this.valorIva = valorIva;
    }

    // Método toString para representar el objeto como una cadena de texto

    @Override
    public String toString() {
        return "DetalleVenta{" +
                "idDetalleVenta=" + idDetalleVenta +
                ", cantidadProducto=" + cantidadProducto +
                ", idProducto=" + idProducto +
                ", idVenta=" + idVenta +
                ", valorTotal=" + valorTotal +
                ", valorVenta=" + valorVenta +
                ", valorIva=" + valorIva +
                '}';
    }
}
