<?php
include 'koneksi.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

if (isset($_POST['id_favorite'])) {
    $id_favorite = $_POST['id_favorite'];

    $query = "DELETE FROM tb_favorites WHERE id_favorite='$id_favorite'";
    $result = mysqli_query($koneksi, $query);

    if ($result && mysqli_affected_rows($koneksi) > 0) {
        $response = array(
            'status' => 'success',
            'message' => 'Favorite berhasil dihapus'
        );
    } else {
        $response = array(
            'status' => 'failed',
            'message' => 'Gagal hapus favorite atau favorite tidak ditemukan'
        );
    }
} else {
    $response = array(
        'status' => 'failed',
        'message' => 'Parameter tidak ditemukan'
    );
}

echo json_encode($response);

mysqli_close($koneksi);
?>
