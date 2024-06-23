<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    // Check if the required POST parameters are set
    if (isset($_POST['user_id']) && isset($_POST['food_id'])) {
        $id_user = $_POST['user_id'];
        $id_food = $_POST['food_id'];

        // Sanitize inputs to prevent SQL injection
        $id_user = mysqli_real_escape_string($koneksi, $id_user);
        $id_food = mysqli_real_escape_string($koneksi, $id_food);

        // Insert the new favorite
        $insert = "INSERT INTO tb_favorites (id_user, id_food, created_at ) VALUES ('$id_user', '$id_food', NOW())";
        if (mysqli_query($koneksi, $insert)) {
            $response['value'] = 1;
            $response['message'] = "Favorit berhasil ditambahkan";
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal menambahkan favorit";
        }
    } else {
        // Missing required POST parameters
        $response['value'] = 0;
        $response['message'] = "Parameter yang diperlukan tidak ada";
    }

    echo json_encode($response);
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
    echo json_encode($response);
}