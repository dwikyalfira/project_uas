<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Check if the user_id parameter is set in the URL
    if (isset($_GET['user_id'])) {
        $user_id = $_GET['user_id'];
        // Ensure user_id is sanitized
        $user_id = mysqli_real_escape_string($koneksi, $user_id);

        // Fetch recipes for the given user ID along with the username
        $query = "SELECT r.id_recipe, r.id_user, r.image, r.ingredient, r.recipe_name, r.created_at, r.updated_at, u.username 
                  FROM tb_recipes r
                  JOIN tb_users u ON r.id_user = u.id
                  WHERE r.id_user = '$user_id'";
        $result = mysqli_query($koneksi, $query);

        if (mysqli_num_rows($result) > 0) {
            $response['value'] = 1;
            $response['message'] = "Successfully retrieved recipe data";
            $response['recipes'] = array();

            while ($row = mysqli_fetch_assoc($result)) {
                $recipe_item = array(
                    'id_recipe' => $row['id_recipe'],
                    'id_user' => $row['id_user'],
                    'username' => $row['username'],
                    'recipe_name' => $row['recipe_name'],
                    'image' => $row['image'],
                    'ingredient' => $row['ingredient'],
                    'created_at' => $row['created_at'],
                    'updated_at' => $row['updated_at']
                );
                array_push($response['recipes'], $recipe_item);
            }

            echo json_encode($response);
        } else {
            $response['value'] = 0;
            $response['message'] = "No recipe data found";
            echo json_encode($response);
        }
    } else {
        $response['value'] = 0;
        $response['message'] = "User ID not provided";
        echo json_encode($response);
    }
} else {
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Invalid request method";
    echo json_encode($response);
}
