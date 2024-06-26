<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all news from the database
    $query = "SELECT news_id, title, content, image, publish_date, author, created_at, updated_at FROM tb_news";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Successfully retrieved news data";
        $response['news'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $news_item = array(
                'news_id' => $row['news_id'],
                'title' => $row['title'],
                'content' => $row['content'],
                'image' => $row['image'],
                'publish_date' => $row['publish_date'],
                'author' => $row['author'],
                'created_at' => $row['created_at'],
                'updated_at' => $row['updated_at']
            );
            array_push($response['news'], $news_item);
        }

        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "No news data found";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Invalid request method";
    echo json_encode($response);
}

?>
