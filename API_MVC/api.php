<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

$mysqli = new mysqli("localhost", "root", "", "quanLyKyTuc1");
if ($mysqli->connect_error) {
    sendResponse(500, ["error" => "Database connection failed: " . $mysqli->connect_error]);
}

$method = $_SERVER['REQUEST_METHOD'];
$request = isset($_SERVER['PATH_INFO']) ? explode('/', trim($_SERVER['PATH_INFO'], '/')) : [];

function sendResponse($statusCode, $data) {
    http_response_code($statusCode);
    echo json_encode(["status" => $statusCode, "data" => $data]);
    exit();
}

switch ($method) {
    case 'GET':
        if (!empty($request[0])) {
            $stmt = $mysqli->prepare("SELECT * FROM students WHERE id = ?");
            $stmt->bind_param("i", $request[0]);
            $stmt->execute();
            $result = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
            if ($result) {
                sendResponse(200, $result);
            } else {
                sendResponse(404, ["error" => "No student found with the ID"]);
            }
        } else {
            $result = $mysqli->query("SELECT * FROM students")->fetch_all(MYSQLI_ASSOC);
            sendResponse(200, $result);
        }
        break;

    case 'POST':
        $input = json_decode(file_get_contents('php://input'), true);
        if (!$input) {
            sendResponse(400, ["error" => "Invalid input data"]);
        }
        $stmt = $mysqli->prepare("INSERT INTO students (image_path, MSV, name, birthday, sex, phoneNumber, class) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("sssssss", $input['image_path'], $input['MSV'], $input['name'], $input['birthday'], $input['sex'], $input['phoneNumber'], $input['class']);
        try {
            $stmt->execute();
            sendResponse(201, ["success" => "Student added successfully"]);
        } catch (mysqli_sql_exception $e) {
            if ($e->getCode() == 1062) {
                sendResponse(400, ["error" => "Duplicate entry for MSV"]);
            } else {
                sendResponse(500, ["error" => "Failed to add student: " . $e->getMessage()]);
            }
        }
        break;

    case 'PUT':
        if (empty($request[0])) {
            sendResponse(400, ["error" => "Student ID is required for update"]);
        }
        $input = json_decode(file_get_contents('php://input'), true);
        $stmt = $mysqli->prepare("UPDATE students SET image_path = ?, MSV = ?, name = ?, birthday = ?, sex = ?, phoneNumber = ?, class = ? WHERE id = ?");
        $stmt->bind_param("sssssssi", $input['image_path'], $input['MSV'], $input['name'], $input['birthday'], $input['sex'], $input['phoneNumber'], $input['class'], $request[0]);
        try {
            $stmt->execute();
            sendResponse(200, ["success" => "Student updated successfully"]);
        } catch (mysqli_sql_exception $e) {
            if ($e->getCode() == 1062) {
                sendResponse(400, ["error" => "Duplicate entry for MSV"]);
            } else {
                sendResponse(500, ["error" => "Failed to update student: " . $e->getMessage()]);
            }
        }
        break;

    case 'DELETE':
        if (empty($request[0])) {
            sendResponse(400, ["error" => "Student ID is required for deletion"]);
        }
        $stmt = $mysqli->prepare("DELETE FROM students WHERE id = ?");
        $stmt->bind_param("i", $request[0]);
        try {
            $stmt->execute();
            sendResponse(200, ["success" => "Student deleted successfully"]);
        } catch (mysqli_sql_exception $e) {
            sendResponse(500, ["error" => "Failed to delete student: " . $e->getMessage()]);
        }
        break;

    default:
        sendResponse(405, ["error" => "Method not allowed"]);
        break;
}

$mysqli->close();
?>
