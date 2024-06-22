<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();
    
    // Fetch all foods from the database
    $query = "SELECT * FROM tb_foods";
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
                'id_store' => $row['id_store'],
                'id_category' => $row['id_category'],
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

?>
