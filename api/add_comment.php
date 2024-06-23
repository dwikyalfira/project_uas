<?php
include 'koneksi.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    // Check if required parameters are provided
    if (isset($_POST['id_user']) && isset($_POST['id_food']) && isset($_POST['content'])) {
        $id_user = $_POST['id_user'];
        $id_food = $_POST['id_food'];
        $content = $_POST['content'];
        $comment_date = date('Y-m-d H:i:s');
        $created_at = date('Y-m-d H:i:s');
        $updated_at = date('Y-m-d H:i:s');

        // Use prepared statements to prevent SQL injection
        $query = "INSERT INTO tb_comments (id_user, id_food, content, comment_date, created_at, updated_at)
                  VALUES (?, ?, ?, ?, ?, ?)";
        if ($stmt = $koneksi->prepare($query)) {
            // Define the types for the bind parameters: i for integer, s for string
            $stmt->bind_param("iissss", $id_user, $id_food, $content, $comment_date, $created_at, $updated_at);
            $stmt->execute();

            if ($stmt->affected_rows > 0) {
                $response = array(
                    'status' => 'success',
                    'message' => 'Comment successfully added'
                );
            } else {
                $response = array(
                    'status' => 'failed',
                    'message' => 'Failed to add comment'
                );
            }

            $stmt->close();
        } else {
            $response = array(
                'status' => 'failed',
                'message' => 'Query preparation failed'
            );
        }
    } else {
        $response = array(
            'status' => 'failed',
            'message' => 'Missing required parameters'
        );
    }
} else {
    $response = array(
        'status' => 'failed',
        'message' => 'Invalid request method'
    );
}

echo json_encode($response);

mysqli_close($koneksi);
?>
