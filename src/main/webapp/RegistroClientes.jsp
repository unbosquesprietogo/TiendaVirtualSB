<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registro de Clientes</title>
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
			if (document.getElementById("txtNIT").value.trim().length == 0) {
				alert("El NIT no puede ser vacío.");
				return false;
			} else if (document.getElementById("txtNombre").value.trim().length == 0) {
				alert("El nombre no puede ser vacío.");
				return false;
			} else if (document.getElementById("txtDireccion").value.trim().length == 0) {
				alert("La dirección no puede ser vacía.");
				return false;
			} else if (document.getElementById("txtTelefono").value.trim().length == 0) {
				alert("El teléfono no puede ser vacío.");
				return false;
			} else {
				return true;
			}
		}

		function sendData() {
			if (!validateFields()) {
				return;
			} else {
				var nit = document.getElementById("txtNIT").value.trim();
				var direccion = document.getElementById("txtDireccion").value.trim();
				var email = document.getElementById("txtEmail").value.trim();
				var nombre = document.getElementById("txtNombre").value.trim();
				var telefono = document.getElementById("txtTelefono").value.trim();

				var http = new XMLHttpRequest();
				var url = '/TiendaVirtualSB/registrarCliente';
				var params = "cedula_cli=" + nit + "&" + "direccion_cli=" + direccion + "&" + "email_cli=" + email + "&" +
						"nombre_cli=" + nombre + "&" + "telefono_cli=" + telefono;
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
	<h1 class="mt-5">Registro de Clientes</h1>
	<div class="table-container"> <!-- Div con otro color que rodea el formulario -->
		<table>
			<tr>
				<td><label for="txtNIT">NIT:</label></td>
				<td><input type="text" id="txtNIT" name="NIT" class="form-control"></td>
			</tr>
			<tr>
				<td><label for="txtDireccion">Dirección:</label></td>
				<td><input type="text" id="txtDireccion" name="direccion" class="form-control"></td>
			</tr>
			<tr>
				<td><label for="txtEmail">Email:</label></td>
				<td><input type="text" id="txtEmail" name="email" class="form-control"></td>
			</tr>
			<tr>
				<td><label for="txtNombre">Nombre:</label></td>
				<td><input type="text" id="txtNombre" name="nombre" class="form-control"></td>
			</tr>
			<tr>
				<td><label for="txtTelefono">Teléfono:</label></td>
				<td><input type="text" id="txtTelefono" name="telefono" class="form-control"></td>
			</tr>
			<tr>
				<td colspan="2">
					<button onclick="sendData()" class="btn btn-primary">Enviar Datos</button>
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
