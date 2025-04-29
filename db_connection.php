<?php
function connectDB() {
    $connectionInfo = array("Database" => "Proyecto2BD");
    $conn = sqlsrv_connect("", $connectionInfo);

    if (!$conn) {
        die("Error en la conexión a la base de datos");
    }
    return $conn;
}
?>