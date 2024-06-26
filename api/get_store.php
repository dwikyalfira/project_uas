<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all stores with their foods from the database
    $query = "SELECT s.id_store, s.store_name, s.location, s.image, s.description, s.created_at, s.   updated_at,
              f.id_food, f.name as food_name, f.description as food_description, f.image as food_image
              FROM tb_stores s
              LEFT JOIN tb_foods f ON s.id_store = f.id_store";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Successfully retrieved store data";
        $response['stores'] = array();
        
        $stores = array();
        
        while ($row = mysqli_fetch_assoc($result)) {
            $id_store = $row['id_store'];
            
            if (!isset($stores[$id_store])) {
                $stores[$id_store] = array(
                    'storeid' => $row['id_store'], 
                    'store_name' => $row['store_name'],
                    'image' => $row['image'],
                    'location' => $row['location'],
                    'description' => $row['description'],
                    'created_at' => $row['created_at'],
                    'updated_at' => $row['updated_at'],
                    'foods' => array()
                );
            }
            
            if ($row['id_food']) {
                $food_item = array(
                    'id_food' => $row['id_food'],
                    'name' => $row['food_name'],
                    'description' => $row['food_description'],
                    'image' => $row['food_image']
                );
                $stores[$id_store]['foods'][] = $food_item;
            }
        }

        $response['stores'] = array_values($stores);
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
