<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registro de Ventas</title>
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
.container {
    margin-top: 20px;
}
.detalle-group {
    margin-top: 20px;
}
</style>
<script>
function addDetalleGroup() {
    var detalleGroup = document.createElement('div');
    detalleGroup.classList.add('detalle-group');

    var html = `
    <div class="form-group">
    <label for="txtCantidadProducto">Cantidad Producto:</label>
    <input type="text" class="form-control" name="cantidadProducto">
    </div>
    <div class="form-group">
    <label for="txtIdProducto">ID Producto:</label>
    <input type="text" class="form-control" name="idProducto">
    </div>
    <div class="form-group">
    <label for="txtValorTotal">Valor Total:</label>
    <input type="text" class="form-control" name="valorTotal">
    </div>
    <div class="form-group">
    <label for="txtValorVenta">Valor Venta:</label>
    <input type="text" class="form-control" name="valorVenta">
    </div>
    <div class="form-group">
    <label for="txtValorIva">Valor IVA:</label>
    <input type="text" class="form-control" name="valorIva">
    </div>
    `;

    detalleGroup.innerHTML = html;

    document.getElementById('detallesContainer').appendChild(detalleGroup);
}

function sendData() {
    var detalles = [];

var detalleGroups = document.getElementsByClassName('detalle-group');
for (var i = 0; i < detalleGroups.length; i++) {
var detalle = {
"cantidadProducto": detalleGroups[i].querySelector('input[name="cantidadProducto"]').value.trim(),
"idProducto": detalleGroups[i].querySelector('input[name="idProducto"]').value.trim(),
"valorTotal": detalleGroups[i].querySelector('input[name="valorTotal"]').value.trim(),
"valorVenta": detalleGroups[i].querySelector('input[name="valorVenta"]').value.trim(),
"valorIva": detalleGroups[i].querySelector('input[name="valorIva"]').value.trim()
};
detalles.push(detalle);
}

var venta = {
"idVenta": 1,
"cedulaCliente": document.getElementById("txtCedulaCliente").value.trim(),
"cedulaUsuario": document.getElementById("txtCedulaUsuario").value.trim(),
"ivaVenta": parseFloat(document.getElementById("txtIvaVenta").value.trim()),
"totalVenta": parseFloat(document.getElementById("txtTotalVenta").value.trim()),
"valorVenta": parseFloat(document.getElementById("txtValorVenta").value.trim()),
"detalles": detalles
};

var http = new XMLHttpRequest();
var url = '/TiendaVirtualSB/registrarVenta'; // Actualiza 'TiendaVirtualSB' con tu contexto de proyecto
var params = JSON.stringify(venta);
http.open('POST', url, true);

//Send the proper header information along with the request
http.setRequestHeader('Content-type', 'application/json');

http.onreadystatechange = function() {//Call a function when the state changes.
if (http.readyState == 4 && http.status == 200) {
alert(http.responseText);
}
}
http.send(params);
}
</script>
</head>
<body>
<div class="container">
<h1>Registro de Ventas</h1>
<div class="form-group">
<label for="txtCedulaCliente">Cédula Cliente:</label>
<input type="text" id="txtCedulaCliente" class="form-control">
</div>
<div class="form-group">
<label for="txtCedulaUsuario">Cédula Usuario:</label>
<input type="text" id="txtCedulaUsuario" class="form-control">
</div>
<div class="form-group">
<label for="txtIvaVenta">IVA Venta:</label>
<input type="text" id="txtIvaVenta" class="form-control">
</div>
<div class="form-group">
<label for="txtTotalVenta">Total Venta:</label>
<input type="text" id="txtTotalVenta" class="form-control">
</div>
<div class="form-group">
<label for="txtValorVenta">Valor Venta:</label>
<input type="text" id="txtValorVenta" class="form-control">
</div>
    <div class="col-sm-3">
        <a href="/TiendaVirtualSB/" class="btn btn-primary btn-sm ">Regresar</a>
    </div>
<h2>Detalles de Venta</h2>

<div id="detallesContainer">
<!-- Detalles de venta se insertarán aquí dinámicamente -->
</div>

<button type="button" onclick="addDetalleGroup()" class="btn btn-primary">Agregar Detalle</button>

<button onclick="sendData()" class="btn btn-primary">Registrar Venta</button>
</div>
</body>
</html>
