<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();

    // Check if the required POST parameters are set
    if (isset($_POST['id']) && isset($_POST['username']) && isset($_POST['email'])) {
        $id = $_POST['id'];
        $username = $_POST['username'];
        $email = $_POST['email'];

        // Sanitize inputs to prevent SQL injection
        $id = mysqli_real_escape_string($koneksi, $id);
        $username = mysqli_real_escape_string($koneksi, $username);
        $email = mysqli_real_escape_string($koneksi, $email);

        // Check if the username or email is already taken by another user (excluding the current user)
        $cek = "SELECT * FROM tb_users WHERE (username = '$username' OR email = '$email') AND id != '$id'";
        $result = mysqli_query($koneksi, $cek);

        if (mysqli_num_rows($result) > 0) {
            $response['value'] = 2;
            $response['message'] = "Username atau email telah digunakan";
        } else {
            // Update the user details and the updated field
            $update = "UPDATE tb_users SET username = '$username', email = '$email', updated_at = NOW() WHERE id = '$id'";
            if (mysqli_query($koneksi, $update)) {
                // Retrieve the updated user data
                $query = "SELECT id, username, email, updated_at FROM tb_users WHERE id = '$id'";
                $result = mysqli_query($koneksi, $query);

                if ($result) {
                    $row = mysqli_fetch_array($result);
                    if ($row) {
                        $response['value'] = 1;
                        $response['message'] = "Profil berhasil di perbarui";
                        $response['email'] = $row['email'];
                        $response['username'] = $row['username'];
                        $response['id'] = $row['id'];
                        $response['updated_at'] = $row['updated_at'];
        
                    } else {
                        $response['value'] = 0;
                        $response['message'] = "Kesalahan dalam pengambilan data yang diperbarui";
                    }
                } else {
                    $response['value'] = 0;
                    $response['message'] = "Kesalahan dalam eksekusi kueri pengambilan data yang diperbarui";
                }
            } else {
                $response['value'] = 0;
                $response['message'] = "Profil gagal di perbarui";
            }
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

?>
