<%--
  Created by IntelliJ IDEA.
  User: sanpr
  Date: 21/03/2024
  Time: 12:40 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Custom Styles */
    body {
      padding-top: 50px;
      text-align: center;
    }
    h1 {
      margin-bottom: 30px;
    }
    form {
      margin: auto;
      width: 50%;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 5px;
    }
    button {
      padding: 10px 20px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
  <script>
    function login() {
      var usuario = document.getElementById("usuario").value.trim();
      var contraseña = document.getElementById("contraseña").value.trim();

      if (usuario === "" || contraseña === "") {
        alert("Por favor ingresa un usuario y contraseña.");
        return;
      }

      var http = new XMLHttpRequest();
      var url = '/TiendaVirtualSB/consultarUsuario';
      var params = "usuario=" + usuario + "&contraseña=" + contraseña;
      http.open('POST', url, true);
      http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
      http.onreadystatechange = function() {
        if (http.readyState == 4 && http.status == 200) {
          var respuesta = JSON.parse(http.responseText);
          if (respuesta === true) {
            alert("Inicio de sesión exitoso.");
            window.location.href = "/TiendaVirtualSB/index.html";
          } else {
            alert("Credenciales incorrectas. Por favor, intenta de nuevo.");
          }
        }
      }
      http.send(params);
    }
  </script>
</head>
<body>
<div class="container">
  <h1 class="mt-5">Login</h1>
  <div class="form-container"> <!-- Div que rodea el formulario -->
    <form>
      <div class="form-group">
        <label for="usuario">Usuario:</label>
        <input type="text" id="usuario" name="usuario" class="form-control">
      </div>
      <div class="form-group">
        <label for="contraseña">Contraseña:</label>
        <input type="password" id="contraseña" name="contraseña" class="form-control">
      </div>
      <button type="button" onclick="login()" class="btn btn-primary">Iniciar sesión</button>
    </form>
  </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
