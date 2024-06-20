<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include 'koneksi.php';

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $response = array();

    // Check if the required POST parameters are set
    if (isset($_POST['email']) && isset($_POST['password'])) {
        $email = $_POST['email'];
        $password = $_POST['password'];

        // Sanitize inputs to prevent SQL injection
        $email = mysqli_real_escape_string($koneksi, $email);
        $password = mysqli_real_escape_string($koneksi, $password);

        // Encrypt the new password using md5
        $password_md5 = md5($password);

        // Check if the email exists
        $cek = "SELECT * FROM tb_users WHERE email = '$email'";
        $result = mysqli_query($koneksi, $cek);

        if (mysqli_num_rows($result) > 0) {
            // Update the password
            $update = "UPDATE tb_users SET password = '$password_md5', updated_at = NOW() WHERE email = '$email'";
            if (mysqli_query($koneksi, $update)) {
                // Retrieve the updated user data
                $query = "SELECT id, username, email, updated_at FROM tb_users WHERE email = '$email'";
                $result = mysqli_query($koneksi, $query);

                if ($result) {
                    $row = mysqli_fetch_array($result);
                    if ($row) {
                        $response['value'] = 1;
                        $response['message'] = "Password berhasil diubah";
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
                $response['message'] = "Gagal mengubah password";
            }
        } else {
            $response['value'] = 0;
            $response['message'] = "Email tidak ditemukan";
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
