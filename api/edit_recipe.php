<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {

    $response = array();
    if (
        isset($_POST['id_recipe']) &&
        isset($_POST['id_user']) &&
        isset($_POST['ingredient']) &&
        isset($_POST['recipe_name'])
    ) {
        $id_recipe = $_POST['id_recipe'];
        $id_user = $_POST['id_user'];
        $ingredient = $_POST['ingredient'];
        $recipe_name = $_POST['recipe_name'];
        $image = isset($_FILES['image']) ? $_FILES['image'] : null;

        $id_recipe = mysqli_real_escape_string($koneksi, $id_recipe);
        $id_user = mysqli_real_escape_string($koneksi, $id_user);
        $ingredient = mysqli_real_escape_string($koneksi, $ingredient);
        $recipe_name = mysqli_real_escape_string($koneksi, $recipe_name);

        $upload_path = "images/";
        if (!file_exists($upload_path)) {
            mkdir($upload_path, 0755, true);
        }

        function upload_file($file, $upload_path, $allowed_types = ['jpg', 'jpeg', 'png', 'gif'])
        {
            $file_name = $file['name'];
            $file_tmp = $file['tmp_name'];
            $file_size = $file['size'];
            $file_error = $file['error'];
        
            $file_name_parts = explode('.', $file_name);
            $file_ext = strtolower(end($file_name_parts));
        
            if (in_array($file_ext, $allowed_types)) {
                if ($file_error === 0) {
                    if ($file_size <= 2000000) {
                        $file_destination = $upload_path . $file_name; 
        
                        if (move_uploaded_file($file_tmp, $file_destination)) {
                            return $file_name;
                        } else {
                            return false;
                        }
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            } else {
                return false;
            }
        }

        $update_query = "UPDATE tb_recipes SET 
                            id_user = '$id_user', 
                            recipe_name = '$recipe_name', 
                            ingredient = '$ingredient', 
                            updated_at = NOW()";
        
        if ($image) {
            $uploaded_image = upload_file($image, $upload_path);
            if ($uploaded_image) {
                $update_query .= ", image = '$uploaded_image'";
            } else {
                $response['value'] = 0;
                $response['message'] = "Gagal mengunggah gambar atau format gambar tidak didukung";
                echo json_encode($response);
                exit;
            }
        }

        $update_query .= " WHERE id_recipe = '$id_recipe'";

        if (mysqli_query($koneksi, $update_query)) {
            if (mysqli_affected_rows($koneksi) > 0) {
                $response['value'] = 1;
                $response['message'] = "Resep berhasil diupdate";
            } else {
                $response['value'] = 0;
                $response['message'] = "Gagal mengupdate resep atau tidak ada perubahan";
            }
        } else {
            $response['value'] = 0;
            $response['message'] = "Gagal mengupdate resep: " . mysqli_error($koneksi);
        }
    } else {
        $response['value'] = 0;
        $response['message'] = "Parameter yang diperlukan tidak ada";
    }

    echo json_encode($response);

} else {
    $response['value'] = 0;
    $response['message'] = "Metode permintaan tidak valid";
    echo json_encode($response);
}

mysqli_close($koneksi);
?>
