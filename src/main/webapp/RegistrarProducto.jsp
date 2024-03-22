<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Productos</title>
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
        .table-container {
            background-color: #f0f0f0;
            border-radius: 10px;
            padding: 20px;
            margin: auto;
            width: 50%;
            border: 1px solid #ccc;
        }
        table {
            margin: auto;
            width: 100%;
        }
        td {
            padding: 10px;
        }
    </style>
    <script>
        function validateFields() {
            if (document.getElementById("txtIvaCompra").value.trim().length == 0) {
                alert("El campo IVA Compra no puede estar vacío.");
                return false;
            } else if (document.getElementById("txtNitProveedor").value.trim().length == 0) {
                alert("El campo NIT Proveedor no puede estar vacío.");
                return false;
            } else if (document.getElementById("txtNombreProducto").value.trim().length == 0) {
                alert("El campo Nombre Producto no puede estar vacío.");
                return false;
            } else if (document.getElementById("txtPrecioCompra").value.trim().length == 0) {
                alert("El campo Precio Compra no puede estar vacío.");
                return false;
            } else if (document.getElementById("txtPrecioVenta").value.trim().length == 0) {
                alert("El campo Precio Venta no puede estar vacío.");
                return false;
            } else {
                return true;
            }
        }

        function sendData() {
            if (!validateFields()) {
                return;
            } else {
                var ivaCompra = document.getElementById("txtIvaCompra").value.trim();
                var nitProveedor = document.getElementById("txtNitProveedor").value.trim();
                var nombreProducto = document.getElementById("txtNombreProducto").value.trim();
                var precioCompra = document.getElementById("txtPrecioCompra").value.trim();
                var precioVenta = document.getElementById("txtPrecioVenta").value.trim();

                var http = new XMLHttpRequest();
                var url = '/TiendaVirtualSB/registrarProducto'; // Actualiza 'TuProyecto' con tu contexto de proyecto
                var params = "ivaCompra=" + ivaCompra + "&" + "nitProveedor=" + nitProveedor + "&" + "nombreProducto=" + nombreProducto + "&" +
                    "precioCompra=" + precioCompra + "&" + "precioVenta=" + precioVenta;
                http.open('POST', url, true);

                //Send the proper header information along with the request
                http.setRequestHeader('Content-type',
                    'application/x-www-form-urlencoded');

                http.onreadystatechange = function() {//Call a function when the state changes.
                    if (http.readyState == 4 && http.status == 200) {
                        alert(http.responseText);
                    }
                }
                http.send(params);
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Registro de Productos</h1>

    <div class="table-container"> <!-- Div con otro color que rodea el formulario -->
        <table>
            <tr>
                <td><label for="txtIvaCompra">IVA Compra:</label></td>
                <td><input type="text" id="txtIvaCompra" name="IvaCompra" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="txtNitProveedor">NIT Proveedor:</label></td>
                <td><input type="text" id="txtNitProveedor" name="NitProveedor" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="txtNombreProducto">Nombre Producto:</label></td>
                <td><input type="text" id="txtNombreProducto" name="NombreProducto" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="txtPrecioCompra">Precio Compra:</label></td>
                <td><input type="text" id="txtPrecioCompra" name="PrecioCompra" class="form-control"></td>
            </tr>
            <tr>
                <td><label for="txtPrecioVenta">Precio Venta:</label></td>
                <td><input type="text" id="txtPrecioVenta" name="PrecioVenta" class="form-control"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button onclick="sendData()" class="btn btn-primary">Registrar Producto</button>
                    <input type="reset" name="borrar" id="borrar" value="Restablecer" class="btn btn-secondary"/>
                </td>
            </tr>
        </table>
        <div class="col-sm-3">
            <a href="/TiendaVirtualSB/" class="btn btn-primary btn-sm ">Regresar</a>
        </div>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
