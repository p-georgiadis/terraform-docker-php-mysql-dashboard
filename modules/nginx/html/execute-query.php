<?php
// execute-query.php
header('Content-Type: application/json');

$host = 'mysql_db';
$user = 'root';
$pass = 'password';

try {
    $conn = new PDO("mysql:host=$host", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Create database if it doesn't exist
    $conn->exec("CREATE DATABASE IF NOT EXISTS terraform_lab");
    $conn->exec("USE terraform_lab");

    $data = json_decode(file_get_contents('php://input'), true);
    $query = $data['query'];

    $stmt = $conn->prepare($query);
    $stmt->execute();

    // Handle different types of queries
    if (stripos($query, 'SELECT') === 0 ||
        stripos($query, 'SHOW') === 0 ||
        stripos($query, 'DESCRIBE') === 0) {
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $result = ["status" => "success", "message" => "Query executed successfully"];
    }

    echo json_encode([
        "success" => true,
        "result" => $result,
        "query_type" => strtoupper(strtok($query, ' '))  // This will help us debug
    ]);

} catch(PDOException $e) {
    echo json_encode([
        "success" => false,
        "error" => $e->getMessage(),
        "query" => $query  // This will help us debug
    ]);
}
?>