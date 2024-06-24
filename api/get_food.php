<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all foods with store details from the database
    $query = "SELECT f.id_food, f.name, f.description, f.image, f.id_store, f.created_at, f.updated_at, s.store_name, s.location 
              FROM tb_foods f
              LEFT JOIN tb_stores s ON f.id_store = s.id_store";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Berhasil mendapatkan data makanan";
        $response['foods'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $data = array(
                'id_food' => $row['id_food'],
                'name' => $row['name'],
                'description' => $row['description'],
                'image' => $row['image'],
                'id_store' => $row['id_store'],
                'store_name' => $row['store_name'],
                'location' => $row['location'],
                'created_at' => $row['created_at'],
                'updated_at' => $row['updated_at']
            );
            array_push($response['foods'], $data);
        }

        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "Tidak ada data makanan";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
    echo json_encode($response);
}
