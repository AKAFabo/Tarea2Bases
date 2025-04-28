<?php
// Establecer conexión a la base de datos
$connectionInfo = array("Database" => "Tarea2Bases");
$conn = sqlsrv_connect("", $connectionInfo);

if (!$conn) {
    die("Error en la conexión a la base de datos");
}
echo("conectado");
?>