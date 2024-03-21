package com.DAO.TiendaVirtualSB;

import com.DTO.TiendaVirtualSB.UsuarioVO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;

public class UsuarioDAO {

    private static final String PRIVATE_KEY = "586E3272357538782F413F4428472B4B6250655368566B597033733676397924";

    public boolean registrarUsuario(UsuarioVO usuario) {
        Conexion conex = new Conexion();
        try {
            String contraseñaEncriptada = encriptarContraseña(usuario.getContraseña());
            String query = "INSERT INTO usuarios (usuario, contraseña, cedula, nombre, apellido) VALUES (?, ?, ?, ?, ?)";
            try (Connection connection = conex.getConnection();
                 PreparedStatement statement = connection.prepareStatement(query)) {
                statement.setString(1, usuario.getUsuario());
                statement.setString(2, contraseñaEncriptada);
                statement.setString(3, usuario.getCedula());
                statement.setString(4, usuario.getNombre());
                statement.setString(5, usuario.getApellido());
                return statement.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conex.desconectar();
        }
        return false;
    }
    public boolean login(UsuarioVO usuario) {
        Conexion conex = new Conexion();
        String contraseñaEncriptada = encriptarContraseña(usuario.getContraseña());
        String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contraseña = ?";
        try {
            try (Connection connection = conex.getConnection();
                 PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, usuario.getUsuario());
                statement.setString(2, contraseñaEncriptada);
                try (ResultSet resultSet = statement.executeQuery()) {
                    return resultSet.next();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            conex.desconectar();
        }
        return false;
    }


    private String encriptarContraseña(String contraseña) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest((contraseña + PRIVATE_KEY).getBytes());
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }
}
