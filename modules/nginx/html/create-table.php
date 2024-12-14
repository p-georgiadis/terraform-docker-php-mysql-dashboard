<?php
// create-table.php
header('Content-Type: application/json');

$host = 'mysql_db';
$user = 'root';
$pass = 'password';

$data = json_decode(file_get_contents('php://input'), true);
$tableName = $data['tableName'];

try {
    $conn = new PDO("mysql:host=$host", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Create database if not exists
    $conn->exec("CREATE DATABASE IF NOT EXISTS terraform_lab");
    $conn->exec("USE terraform_lab");

    // Create sample table
    $sql = "CREATE TABLE IF NOT EXISTS $tableName (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    )";

    $conn->exec($sql);
    echo json_encode(['success' => true, 'message' => "Table $tableName created successfully"]);
} catch(PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error: ' . $e->getMessage()]);
}
?>