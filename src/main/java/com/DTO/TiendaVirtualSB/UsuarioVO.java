package com.DTO.TiendaVirtualSB;

public class UsuarioVO {
    private int id;
    private String usuario;
    private String contraseña;

    private String cedula;

    private String nombre;

    private String apellido;

    public UsuarioVO() {
        // Constructor vacío necesario para algunas operaciones de base de datos
    }

    public UsuarioVO(String usuario, String contraseña) {
        this.usuario = usuario;
        this.contraseña = contraseña;
    }

    public UsuarioVO(String usuario, String contrasenia, String cedula, String nombre, String apellido) {
        this.usuario = usuario;
        this.contraseña = contrasenia;
        this.cedula = cedula;
        this.nombre = nombre;
        this.apellido = apellido;
    }

    // Métodos getter y setter para cada atributo

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    @Override
    public String toString() {
        return "UsuarioVO{" +
                "id=" + id +
                ", usuario='" + usuario + '\'' +
                ", contraseña='" + contraseña + '\'' +
                ", cedula='" + cedula + '\'' +
                ", nombre='" + nombre + '\'' +
                ", apellido='" + apellido + '\'' +
                '}';
    }
}
