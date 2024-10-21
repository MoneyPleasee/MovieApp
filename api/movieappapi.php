<?php
// Enable error reporting for debugging
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Allow from any origin and set CORS headers
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Handle OPTIONS request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    // Return a 200 OK response for OPTIONS requests
    http_response_code(200);
    exit();
}

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
    $email = $request->email ?? '';
    $fname = $request->fname ?? '';
    $lname = $request->lname ?? '';

    $sql = "INSERT INTO users (username, password, email, fname, lname) VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $username, $password, $email, $fname, $lname);

    if ($stmt->execute()) {
        $response = array('status' => 'success', 'message' => 'Registration successful');
    } else {
        $response = array('status' => 'error', 'message' => 'Registration failed: ' . $stmt->error);
    }

    echo json_encode($response);
    $stmt->close();

    exit;
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

    exit;
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

// Process POST requests
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_GET['action'])) {
        switch ($_GET['action']) {
            case 'register':
                registerUser($conn);
                break;
            case 'login':
                loginUser($conn);
                break;
            case 'update_user':
                updateUserInfo($conn);
                break;
            default:
                echo json_encode(array('status' => 'error', 'message' => 'Invalid action'));
                break;
        }
    } else {
        echo json_encode(array('status' => 'error', 'message' => 'No action specified'));
    }
}

// Process GET requests for fetching movies
elseif ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['action']) && $_GET['action'] === 'fetch_movies') {
    fetchMovies($conn);
}

// Fetch user details based on username
if (isset($_GET['username'])) {
    $username = $conn->real_escape_string($_GET['username']);
    
    $sql = "SELECT username,fname,lname,email,imageURL FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();
        header('Content-Type: application/json');
        echo json_encode($user);
    } else {
        header('HTTP/1.0 404 Not Found');
        echo json_encode(["error" => "User not found"]);
    }
    
    $stmt->close();
} else {
    // Username not provided
    header('HTTP/1.0 400 Bad Request');
    echo json_encode(["error" => "Username not provided"]);
}

// Function to handle user profile updates
function updateUserInfo($conn) {
    $post_data = file_get_contents("php://input");
    $request = json_decode($post_data);

    error_log(print_r($request, true));


     // Validate input
     if (!isset($request->username) || empty($request->username)) {
        echo json_encode(array('status' => 'error', 'message' => 'Username is required'));
        return;
    }

    $username = $request->username ?? '';
    $fname = $request->fname ?? '';
    $lname = $request->lname ?? '';
    $email = $request->email ?? '';
    $imageURL  = $request->imageURL ?? '';

    $sql = "UPDATE users SET fname = ?, lname = ?, email = ?, imageURL = ? WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sssss", $fname, $lname, $email, $imageURL, $username);
    if ($stmt->execute()) {
        $response = array('status' => 'success', 'message' => 'Profile updated successfully');
    } else {
        $response = array('status' => 'error', 'message' => 'Profile update failed: ' . $stmt->error);
    }
    if (!$stmt->execute()) {
        error_log("MySQL Error: " . $stmt->error);
    }
    echo json_encode($response);
    $stmt->close();
    exit;
}


$conn->close();
?>
