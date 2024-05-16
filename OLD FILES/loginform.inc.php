<?php
// Connect to MySQL database
$conn = new mysqli('localhost', 'root', 'Cus!n@to04', 'usuario');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data and sanitize inputs
$username = $_POST['username'];
$user_password = $_POST['password'];
$nombre_usuario = $_POST['name'];
$apellido_paterno = $_POST['apellido paterno'];
$apellido_materno = $_POST['apellido materno'];
$user_email = $_POST['Email'];
$telefono_movil = $_POST['Teléfono Móvil'];
$fechanacimiento = $_POST['fechanacimiento'];
$ciudad = $_POST['ciudad'];
$estado = $_POST['estado'];

// Hash password
$hashed_password = password_hash($user_password, PASSWORD_DEFAULT);

// Get current date and time
$currentDate = date('Y-m-d');
$currentTime = date('Y-m-d H:i:s');

// Insert data into database using prepared statement
$sql = $conn->prepare("INSERT INTO usuario (nombre_usuario, user_password, user_email, nombre, apellido_paterno, apellido_materno, telefono_movil, fecha_de_registro, ultima_conexion, fecha_nacimiento, ciudad, estado, pais, rol) 
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$sql->bind_param("ssssssssssssss", $username, $hashed_password, $user_email, $nombre_usuario, $apellido_paterno, $apellido_materno, $telefono_movil, $currentDate, $currentTime, $fechanacimiento, $ciudad, $estado, 'Mexico', 'user');

if ($sql->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql->error;
}

// Close prepared statement
$sql->close();

// Close database connection
$conn->close();
?>
