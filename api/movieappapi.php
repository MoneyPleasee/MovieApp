<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Allow from any origin
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

// Database connection parameters
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "movie_app_db";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(array('status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error)));
}

// Function to handle user registration
function registerUser($conn) {
    $post_data = file_get_contents("php://input");
    $request = json_decode($post_data);

    $username = $request->username ?? '';
    $password = md5($request->password ?? '');

    $sql = "INSERT INTO users (username, password) VALUES (?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $password);

    if ($stmt->execute()) {
        $response = array('status' => 'success', 'message' => 'Registration successful');
    } else {
        $response = array('status' => 'error', 'message' => 'Registration failed: ' . $stmt->error);
    }

    echo json_encode($response);
    $stmt->close();
}

// Function to handle user login
function loginUser($conn) {
    $post_data = file_get_contents("php://input");
    $request = json_decode($post_data);

    $username = $request->username ?? '';
    $password = md5($request->password ?? '');

    $sql = "SELECT * FROM users WHERE username = ? AND password = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $response = array('status' => 'success', 'message' => 'Login successful');
    } else {
        $response = array('status' => 'error', 'message' => 'Invalid credentials');
    }

    echo json_encode($response);
    $stmt->close();
}

// Function to fetch movies
function fetchMovies($conn) {
    $sql = "SELECT * FROM movies";
    $result = $conn->query($sql);

    $movies = array();

    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $movies[] = $row;
        }
        $response = array('status' => 'success', 'data' => $movies);
    } else {
        $response = array('status' => 'error', 'message' => 'No movies found');
    }

    echo json_encode($response);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_GET['action']) && $_GET['action'] === 'register') {
        registerUser($conn);
    } elseif (isset($_GET['action']) && $_GET['action'] === 'login') {
        loginUser($conn);
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'fetch_movies') {
    fetchMovies($conn);
}

// Check if username is provided
if (isset($_GET['username'])) {
    $username = $conn->real_escape_string($_GET['username']);
    
    // Prepare SQL statement
    $sql = "SELECT username,fname,lname,email FROM users WHERE username = ?";
    
    // Prepare and bind
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    
    // Execute the statement
    $stmt->execute();
    
    // Get the result
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        // Fetch the user data
        $user = $result->fetch_assoc();
        
        // Convert to JSON and output
        header('Content-Type: application/json');
        echo json_encode($user);
    } else {
        // No user found
        header('HTTP/1.0 404 Not Found');
        echo json_encode(["error" => "User not found"]);
    }
    
    // Close statement
    $stmt->close();
} else {
    // Username not provided
    header('HTTP/1.0 400 Bad Request');
    echo json_encode(["error" => "Username not provided"]);
}


$conn->close();
?>
