<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all comments with user and food details from the database
    $query = "SELECT c.id_comment, c.id_user, c.id_food, c.content, c.comment_date, c.created_at, c.updated_at, 
                     u.username, f.name AS food_name
              FROM tb_comments c
              LEFT JOIN tb_users u ON c.id_user = u.id
              LEFT JOIN tb_foods f ON c.id_food = f.id_food";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Berhasil mendapatkan data komentar";
        $response['comments'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $comment_item = array(
                'id_comment' => $row['id_comment'],
                'id_user' => $row['id_user'],
                'username' => $row['username'],
                'id_food' => $row['id_food'],
                'food_name' => $row['food_name'],
                'content' => $row['content'],
                'comment_date' => $row['comment_date'],
                'created_at' => $row['created_at'],
                'updated_at' => $row['updated_at']
            );
            array_push($response['comments'], $comment_item);
        }

        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Tidak ada data komentar";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
    echo json_encode($response);
}

?>
