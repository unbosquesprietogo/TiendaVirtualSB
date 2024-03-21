<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Consulta de Clientes</title>
	<!-- Bootstrap CSS -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
	<style>
		/* Custom Styles */
		body {
			padding-top: 50px;
		}
		.container {
			max-width: 600px;
		}
		.form-group {
			margin-bottom: 20px;
		}
		#dvResult {
			margin-top: 20px;
		}
		/* Custom div style */
		.custom-div {
			background-color: #f0f0f0;
			padding: 20px;
			border-radius: 10px;
			border: 1px solid #ccc;
		}
	</style>
	<script>
		function consultar() {
			var nit = document.getElementById("txtNIT").value.trim();
			if (nit.trim() == "") {
				nit = "null";
			}
			var http = new XMLHttpRequest();
			var url = '/TiendaVirtualSB/consultarClientes';
			var params = "nit=" + nit;
			http.open('POST', url, true);
			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');
			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					CreateTableFromJSON(http.responseText);
				}
			}
			http.send(params);
		}

		function CreateTableFromJSON(json_result) {

			const json_arr = JSON.parse(json_result);

			// EXTRACT VALUE FOR HTML HEADER.
			var col = [];
			for (var i = 0; i < json_arr.length; i++) {
				for ( var key in json_arr[i]) {
					if (col.indexOf(key) === -1) {
						col.push(key);
					}
				}
			}

			// CREATE DYNAMIC TABLE.
			var table = document.createElement("table");
			table.classList.add("table", "table-striped", "table-bordered");

			// CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.
			var tr = table.insertRow(-1); // TABLE ROW.

			for (var i = 0; i < col.length; i++) {
				var th = document.createElement("th"); // TABLE HEADER.
				th.innerHTML = col[i];
				tr.appendChild(th);
			}

			// ADD JSON DATA TO THE TABLE AS ROWS.
			for (var i = 0; i < json_arr.length; i++) {

				tr = table.insertRow(-1);

				for (var j = 0; j < col.length; j++) {
					var tabCell = tr.insertCell(-1);
					tabCell.innerHTML = json_arr[i][col[j]];
				}
			}

			// FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
			var divContainer = document.getElementById("dvResult");
			divContainer.innerHTML = "";
			divContainer.appendChild(table);
		}
	</script>
</head>
<body>
<div class="container">
	<h1 class="mt-5">Consulta de Clientes</h1>
	<div class="custom-div"> <!-- Custom div added -->
		<div class="form-group row">
			<label for="txtNIT" class="col-sm-2 col-form-label">NIT:</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="txtNIT" name="NIT">
			</div>
			<div class="col-sm-2">
				<button class="btn btn-primary" onclick="consultar()">Consultar</button>
			</div>
		</div>
	</div>
	<div id="dvResult"></div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
