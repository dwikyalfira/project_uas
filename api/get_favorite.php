<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Check if user_id is provided in the URL
    if (isset($_GET['user_id']) && is_numeric($_GET['user_id'])) {
        $user_id = intval($_GET['user_id']);

        // Use prepared statements to prevent SQL injection
        $query = "SELECT tb_favorite.id_favorite, tb_favorite.id_user, tb_favorite.id_food, tb_favorite.created_at, tb_favorite.updated_at,
                         tb_users.user_name, tb_foods.name AS food_name, tb_foods.description AS food_description, 
                         tb_foods.id_store, tb_foods.id_category
                  FROM tb_favorite
                  JOIN tb_users ON tb_favorite.id_user = tb_users.id_user
                  JOIN tb_foods ON tb_favorite.id_food = tb_foods.id_food
                  WHERE tb_favorite.id_user = ?";
        if ($stmt = $koneksi->prepare($query)) {
            $stmt->bind_param("i", $user_id);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $response['value'] = 1;
                $response['message'] = "Berhasil mendapatkan data favorit";
                $response['favorites'] = array();

                while ($row = $result->fetch_assoc()) {
                    $favorite_item = array(
                        'id_favorite' => $row['id_favorite'],
                        'id_user' => $row['id_user'],
                        'user_name' => $row['user_name'],
                        'id_food' => $row['id_food'],
                        'food_name' => $row['food_name'],
                        'food_description' => $row['food_description'],
                        'id_store' => $row['id_store'],
                        'id_category' => $row['id_category'],
                        'created_at' => $row['created_at'],
                        'updated_at' => $row['updated_at']
                    );
                    array_push($response['favorites'], $favorite_item);
                }

                echo json_encode($response);
            } else {
                $response['value'] = 0;
                $response['message'] = "Tidak ada data favorit untuk user ini";
                echo json_encode($response);
            }

            $stmt->close();
        } else {
            $response['value'] = 0;
            $response['message'] = "Query preparation failed";
            echo json_encode($response);
        }
    } else {
        $response['value'] = 0;
        $response['message'] = "Invalid or missing user ID";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
    echo json_encode($response);
}

?>
