<?php

$koneksi = mysqli_connect("localhost", "root", "", "project_uas");

if($koneksi){

	// echo "Database berhasil terkoneksi";
	
} else {
	echo "gagal terhubung ke database";
}

?>