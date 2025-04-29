<?php
session_start();
require_once 'db_connection.php';

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$conn = connectDB();
$filtro = isset($_GET['filtro']) ? $_GET['filtro'] : '';
$userIP = $_SERVER['REMOTE_ADDR'];
$userId = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : 1; // Fallback to 1 if not set

echo "Testing connection and parameters:<br>";
echo "Filter: " . $filtro . "<br>";
echo "IP: " . $userIP . "<br>";
echo "UserID: " . $userId . "<br><br>";

// Corregir la llamada al SP - El problema está en que estás mezclando valores hardcodeados con parámetros
$sql = "{CALL sp_FiltrarEmpleados (?, ?, ?)}";
$params = array(
    $filtro,    
    $userIP,    
    1           // Por ahora usamos 1 como ID de usuario fijo
);

$stmt = sqlsrv_query($conn, $sql, $params);

// Simplificar el debug y mantener el cursor en la posición correcta
if ($stmt === false) {
    echo "Error al ejecutar SP:<br>";
    die(print_r(sqlsrv_errors(), true));
}

// Eliminar la verificación intermedia que mueve el cursor
?>

<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .search-container {
            margin: 20px 0;
        }
        .search-container input[type="text"] {
            padding: 8px;
            width: 300px;
        }
        .search-container button {
            padding: 8px 15px;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <h1>Bienvenido, <?php echo $_SESSION['username']; ?>!</h1>
    
    <div class="search-container">
        <form method="GET" action="">
            <input type="text" name="filtro" placeholder="Buscar por nombre o documento" value="<?php echo htmlspecialchars($filtro); ?>">
            <button type="submit">Buscar</button>
        </form>
    </div>

    <h2>Lista de Empleados</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Documento</th>
                <th>Nombre</th>
                <th>Puesto</th>
                <th>Saldo Vacaciones</th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
                echo "<tr>";
                echo "<td>" . htmlspecialchars($row['Id']) . "</td>";
                echo "<td>" . htmlspecialchars($row['Documento']) . "</td>";  // Cambiar a 'Documento' según el SP
                echo "<td>" . htmlspecialchars($row['Nombre']) . "</td>";
                echo "<td>" . htmlspecialchars($row['Puesto']) . "</td>";     // Cambiar a 'Puesto' según el SP
                echo "<td>" . htmlspecialchars($row['SaldoVacaciones']) . "</td>";
                echo "</tr>";
            }
            sqlsrv_close($conn);
            ?>
        </tbody>
    </table>

    <br>
    <a href="logout.php">Cerrar Sesión</a>
</body>
</html>