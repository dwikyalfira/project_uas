<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all stores from the database
    $query = "SELECT store_id, store_name, id_food, location, created_at, updated_at FROM tb_stores";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Successfully retrieved store data";
        $response['stores'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $store_item = array(
                'store_id' => $row['store_id'],
                'store_name' => $row['store_name'],
                'id_food' => $row['id_food'],
                'location' => $row['location'],
                'created_at' => $row['created_at'],
                'updated_at' => $row['updated_at']
            );
            array_push($response['stores'], $store_item);
        }

        echo json_encode($response);
    } else {
        $response['value'] = 0;
        $response['message'] = "No store data found";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Invalid request method";
    echo json_encode($response);
}

?>
