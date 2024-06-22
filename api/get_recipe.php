<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "GET") {
    $response = array();

    // Fetch all recipes from the database
    $query = "SELECT id_recipe, id_user, ingredient, recipe_name, created_at, updated_at FROM tb_recipes";
    $result = mysqli_query($koneksi, $query);

    if (mysqli_num_rows($result) > 0) {
        $response['value'] = 1;
        $response['message'] = "Successfully retrieved recipe data";
        $response['recipes'] = array();

        while ($row = mysqli_fetch_assoc($result)) {
            $recipe_item = array(
                'id_recipe' => $row['id_recipe'],
                'id_user' => $row['id_user'],
                'recipe_name' => $row['recipe_name'],
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
    // Invalid request method
    $response['value'] = 0;
    $response['message'] = "Invalid request method";
    echo json_encode($response);
}

?>
