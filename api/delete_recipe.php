<?php
include 'koneksi.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

if (isset($_POST['id_recipe'])) {
    $id_recipe = $_POST['id_recipe'];

    $query = "DELETE FROM tb_recipes WHERE id_recipe='$id_recipe'";
    $result = mysqli_query($koneksi, $query);

    if ($result && mysqli_affected_rows($koneksi) > 0) {
        $response = array(
            'status' => 'success',
            'message' => 'Resep berhasil dihapus'
        );
    } else {
        $response = array(
            'status' => 'failed',
            'message' => 'Gagal hapus resep atau resep tidak ditemukan'
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
