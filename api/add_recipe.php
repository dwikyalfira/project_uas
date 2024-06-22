<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();

    // Check if the required POST parameters are set
    if (isset($_POST['id_user']) && isset($_POST['ingredient'])) {
        $id_user = $_POST['id_user'];
        $ingredient = $_POST['ingredient'];

        // Sanitize inputs to prevent SQL injection
        $id_user = mysqli_real_escape_string($koneksi, $id_user);
        $ingredient = mysqli_real_escape_string($koneksi, $ingredient);

        // Insert the new recipe
        $insert = "INSERT INTO tb_recipes (id_user, ingredient, updated_at) VALUES ('$id_user', '$ingredient', NOW())";
        if (mysqli_query($koneksi, $insert)) {
            $response['value'] = 1;
            $response['message'] = "Resep berhasil ditambahkan";
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal menambahkan resep";
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

mysqli_close($koneksi);
?>
