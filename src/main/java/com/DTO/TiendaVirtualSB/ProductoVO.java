package com.DTO.TiendaVirtualSB;

public class ProductoVO {
    private int idProducto;
    private double ivaCompra;
    private String nitProveedor;
    private String nombreProducto;
    private double precioCompra;
    private double precioVenta;

    // Constructor vacío
    public ProductoVO() {
    }

    // Constructor con todos los atributos
    public ProductoVO(int idProducto, double ivaCompra, String nitProveedor, String nombreProducto, double precioCompra, double precioVenta) {
        this.idProducto = idProducto;
        this.ivaCompra = ivaCompra;
        this.nitProveedor = nitProveedor;
        this.nombreProducto = nombreProducto;
        this.precioCompra = precioCompra;
        this.precioVenta = precioVenta;
    }

    // Métodos getter y setter para cada atributo

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public double getIvaCompra() {
        return ivaCompra;
    }

    public void setIvaCompra(double ivaCompra) {
        this.ivaCompra = ivaCompra;
    }

    public String getNitProveedor() {
        return nitProveedor;
    }

    public void setNitProveedor(String nitProveedor) {
        this.nitProveedor = nitProveedor;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public double getPrecioCompra() {
        return precioCompra;
    }

    public void setPrecioCompra(double precioCompra) {
        this.precioCompra = precioCompra;
    }

    public double getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(double precioVenta) {
        this.precioVenta = precioVenta;
    }

    // Método toString para representar el objeto como una cadena de texto

    @Override
    public String toString() {
        return "Producto{" +
                "idProducto=" + idProducto +
                ", ivaCompra=" + ivaCompra +
                ", nitProveedor='" + nitProveedor + '\'' +
                ", nombreProducto='" + nombreProducto + '\'' +
                ", precioCompra=" + precioCompra +
                ", precioVenta=" + precioVenta +
                '}';
    }
}

