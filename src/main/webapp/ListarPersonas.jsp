<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registered Users</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css">
    <style>
        /* Custom Styles */
        body {
            padding-top: 50px;
            text-align: center;
        }
        h1 {
            margin-bottom: 30px;
        }
        table {
            width: 100%;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#tabla').DataTable();
            $.ajax({
                type: "POST",
                url: "http://localhost:8080/TiendaVirtualApp/listarPersonas",
                dataType: "json",
                success: function(data) {
                    $.each(data, function(i, item) {
                        var tr = $('<tr>');
                        tr.append($('<td>').text(item.cedula_cli));
                        tr.append($('<td>').text(item.direccion_cli));
                        tr.append($('<td>').text(item.email_cli));
                        tr.append($('<td>').text(item.nombre_cli));
                        tr.append($('<td>').text(item.telefono_cli));
                        $('#myTable').append(tr);
                    });
                }
            });
        });
    </script>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Registered Users</h1>
    <table id="tabla" class="table table-striped">
        <thead>
        <tr>
            <th>Cédula</th>
            <th>Dirección</th>
            <th>Correo Electrónico</th>
            <th>Nombre</th>
            <th>Teléfono</th>
        </tr>
        </thead>
        <tbody id="myTable">
        <!-- Data will be dynamically inserted here -->
        </tbody>
    </table>
</div>
<!-- Bootstrap JS and DataTables JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
</body>
</html>
