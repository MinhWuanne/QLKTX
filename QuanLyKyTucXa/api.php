<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

$mysqli = new mysqli("localhost", "root", "", "quanLyKyTuc1");
if ($mysqli->connect_error) {
    http_response_code(500);
    echo json_encode(["error" => "Database connection failed: " . $mysqli->connect_error]);
    exit();
}

$method = $_SERVER['REQUEST_METHOD'];
$request = isset($_SERVER['PATH_INFO']) ? explode('/', trim($_SERVER['PATH_INFO'], '/')) : [];

switch ($method) {
    case 'GET':
        if (!empty($request[0])) {
            $stmt = $mysqli->prepare("SELECT * FROM students WHERE id = ?");
            $stmt->bind_param("i", $request[0]);
            $stmt->execute();
            $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            echo json_encode($result);
        } else {
            $result = $mysqli->query("SELECT * FROM students")->fetch_all(MYSQLI_ASSOC);
            echo json_encode($result);
        }
        break;

    case 'POST':
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $mysqli->prepare("INSERT INTO students (image_path, MSV, name, birthday, sex, phoneNumber, class) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $input['image_path'], $input['MSV'], $input['name'], $input['birthday'], $input['sex'], $input['phoneNumber'], $input['class']);
        $stmt->execute();
        echo json_encode(["success" => "Student added successfully"]);
        break;

    case 'PUT':
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $mysqli->prepare("UPDATE students SET image_path = ?, MSV = ?, name = ?, birthday = ?, sex = ?, phoneNumber = ?, class = ? WHERE id = ?");
        $stmt->bind_param("sssssssi", $input['image_path'], $input['MSV'], $input['name'], $input['birthday'], $input['sex'], $input['phoneNumber'], $input['class'], $request[0]);
        $stmt->execute();
        if ($stmt->affected_rows > 0) {
            echo json_encode(["success" => "Student updated successfully"]);
        } else {
            echo json_encode(["error" => "Student does not exist"]);
        }
        break;

        case 'DELETE':
            $stmt = $mysqli->prepare("DELETE FROM students WHERE id = ?");
            $stmt->bind_param("i", $request[0]);
            $stmt->execute();
        
            if ($stmt->affected_rows > 0) {
                echo json_encode(["success" => "Student deleted successfully"]);
            } else {
                echo json_encode(["error" => "Student does not exist"]);
            }
            break;
        }
        

$mysqli->close();
