<?php
// test-connection.php
header('Content-Type: application/json');

$host = 'mysql_db';
$user = 'root';
$pass = 'password';

try {
    $conn = new PDO("mysql:host=$host", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo json_encode(['success' => true, 'message' => 'Connected successfully']);
} catch(PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Connection failed: ' . $e->getMessage()]);
}
?>