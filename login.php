<?php 
session_start();
require_once 'db_connection.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $conn = connectDB();
    $username = $_POST['username'];
    $password = $_POST['password'];
    
    $codigoError = -1;
    $mensaje = 'Error no especificado';
    
    $sql = "{CALL sp_ValidarUsuario (@Username = ?, @Password = ?, @IP = ?, @CodigoError = ? OUTPUT, @Mensaje = ? OUTPUT)}";
    $userIP = $_SERVER['REMOTE_ADDR'];
    $params = array(
        array($username, SQLSRV_PARAM_IN),
        array($password, SQLSRV_PARAM_IN),
        array($userIP, SQLSRV_PARAM_IN),
        array(&$codigoError, SQLSRV_PARAM_OUT, SQLSRV_PHPTYPE_INT),
        array(&$mensaje, SQLSRV_PARAM_OUT, SQLSRV_PHPTYPE_STRING(SQLSRV_ENC_CHAR))
    );

    $stmt = sqlsrv_query($conn, $sql, $params);
    
    if ($stmt === false) {
        die(print_r(sqlsrv_errors(), true));
    }
    
    if ($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)) {
        $_SESSION['username'] = $username;
        $_SESSION['user_id'] = $row['Id']; // Store the user ID if returned by SP
        header("Location: welcome.php");
        exit();
    } else {
        $error = "Usuario o contraseña incorrectos";
    }
    
    sqlsrv_close($conn);
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        .login-container {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <?php if(isset($error)) { ?>
            <div class="error"><?php echo $error; ?></div>
        <?php } ?>
        <form method="POST" action="">
            <div class="form-group">
                <label>Usuario:</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>Contraseña:</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit">Iniciar Sesión</button>
        </form>
    </div>
</body>
</html>