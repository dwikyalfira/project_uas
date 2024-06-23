-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 23, 2024 at 08:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_comments`
--

CREATE TABLE `tb_comments` (
  `id_comment` int NOT NULL,
  `id_user` int NOT NULL,
  `id_food` int NOT NULL,
  `content` text NOT NULL,
  `comment_date` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_comments`
--

INSERT INTO `tb_comments` (`id_comment`, `id_user`, `id_food`, `content`, `comment_date`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Rendangnya enak banget, dagingnya empuk dan bumbunya meresap sempurna!', '2024-06-01 10:00:00', '2024-06-22 17:07:19', '2024-06-22 17:07:19'),
(3, 1, 2, 'Sate Padangnya gurih dan pedasnya pas, sangat direkomendasikan.', '2024-06-02 12:30:00', '2024-06-22 17:07:19', '2024-06-22 17:07:19'),
(4, 1, 3, 'Gulai Ayamnya lezat, kuahnya kaya rempah dan ayamnya sangat empuk.', '2024-06-03 14:45:00', '2024-06-22 17:07:19', '2024-06-22 17:07:19'),
(5, 1, 4, 'Soto Padangnya segar dan penuh cita rasa, cocok untuk makan siang.', '2024-06-04 11:20:00', '2024-06-22 17:07:19', '2024-06-22 17:07:19'),
(6, 1, 5, 'Dendeng Baladonya mantap, dagingnya renyah dan sambalnya pedas menggigit.', '2024-06-05 13:50:00', '2024-06-22 17:07:19', '2024-06-22 17:07:19'),
(7, 1, 1, '1', '2024-06-23 05:04:09', '2024-06-23 05:04:09', '2024-06-23 05:04:09'),
(8, 1, 5, 'ENAKK', '2024-06-23 05:04:45', '2024-06-23 05:04:45', '2024-06-23 05:04:45'),
(9, 1, 5, 'ENAKK', '2024-06-23 05:05:00', '2024-06-23 05:05:08', '2024-06-23 05:05:08'),
(10, 1, 5, 'ENAKK', '2024-06-23 05:00:00', '2024-06-23 05:05:44', '2024-06-23 05:05:44'),
(11, 1, 5, 'ENAKK', '2024-06-23 05:05:54', '2024-06-23 05:05:54', '2024-06-23 05:05:54');

-- --------------------------------------------------------

--
-- Table structure for table `tb_favorites`
--

CREATE TABLE `tb_favorites` (
  `id_favorite` int NOT NULL,
  `id_user` int NOT NULL,
  `id_food` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_foods`
--

CREATE TABLE `tb_foods` (
  `id_food` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) NOT NULL,
  `id_store` int NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_foods`
--

INSERT INTO `tb_foods` (`id_food`, `name`, `description`, `image`, `id_store`, `updated_at`, `created_at`) VALUES
(1, 'Rendang', 'Masakan daging pedas yang terbuat dari daging sapi, santan, dan campuran serai, lengkuas, bawang putih, kunyit, jahe, dan cabai.', 'rendang.jpg', 1, '2024-06-22 09:18:51', '2024-06-22 09:18:51'),
(2, 'Sate Padang', 'Daging yang ditusuk dan dipanggang, disajikan dengan saus pedas yang terbuat dari kaldu sapi atau ayam dicampur tepung beras dan rempah-rempah.', 'sate_padang.jpg', 1, '2024-06-22 09:18:51', '2024-06-22 09:18:51'),
(3, 'Gulai Ayam', 'Masakan ayam berkuah kental dan pedas dengan santan.', 'gulai_ayam.jpg', 1, '2024-06-22 09:18:51', '2024-06-22 09:18:51'),
(4, 'Soto Padang', 'Sup daging sapi dengan kuah bening, disajikan dengan daging sapi goreng krispi, mie soun, dan kentang.', 'soto_padang.jpg', 1, '2024-06-22 09:18:51', '2024-06-22 09:18:51'),
(5, 'Dendeng Balado', 'Daging sapi kering yang dipotong tipis dengan saus pedas dari cabai.', 'dendeng_balado.jpg', 1, '2024-06-22 09:18:51', '2024-06-22 09:18:51'),
(6, 'Nasi Kapau', 'Nasi Kapau adalah hidangan nasi campur khas Minangkabau yang terdiri dari nasi putih dengan lauk pauk seperti gulai tambusu, rendang, dendeng, gulai cubadak, dan sayuran segar.', 'nasi_kapau.jpg', 1, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(7, 'Ikan Bakar Padang', 'Ikan Bakar Padang adalah hidangan ikan yang dibakar dengan bumbu khas Padang yang kaya rempah, memberikan rasa pedas dan gurih.', 'ikan_bakar_padang.jpg', 2, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(8, 'Asam Padeh', 'Asam Padeh adalah masakan khas Minang yang terdiri dari ikan atau daging yang dimasak dalam kuah asam pedas yang segar dan kaya rasa.', 'asam_padeh.jpg', 3, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(9, 'Ayam Pop', 'Ayam Pop adalah ayam goreng khas Padang yang digoreng tanpa kulit sehingga tampilannya putih, dan disajikan dengan sambal khas.', 'ayam_pop.jpg', 4, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(11, 'Sambalado Tanak', 'Sambalado Tanak adalah sambal khas Minang yang dibuat dari campuran cabe, santan, dan bahan lain seperti jengkol atau teri, dimasak hingga kental.', 'sambalado_tanak.jpg', 6, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(12, 'Gulai Itiak', 'Gulai Itiak adalah gulai khas Padang yang menggunakan daging itik yang dimasak dengan santan dan bumbu rempah.', 'gulai_itiak.jpg', 7, '2024-06-22 17:15:46', '2024-06-22 17:15:46'),
(13, 'Kalio Daging', 'Kalio Daging adalah masakan khas Padang yang mirip dengan rendang, tetapi dimasak lebih singkat sehingga kuahnya masih lebih banyak.', 'kalio_daging.jpg', 8, '2024-06-22 17:15:46', '2024-06-22 17:15:46');

-- --------------------------------------------------------

--
-- Table structure for table `tb_news`
--

CREATE TABLE `tb_news` (
  `news_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `publish_date` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_news`
--

INSERT INTO `tb_news` (`news_id`, `title`, `content`, `publish_date`, `author`, `created_at`, `updated_at`) VALUES
(1, 'Rendang: Masakan Terenak di Dunia', 'Rendang, makanan khas Minangkabau, kembali dinobatkan sebagai masakan terenak di dunia oleh CNN. Rendang terbuat dari daging sapi yang dimasak dengan santan dan rempah-rempah hingga berjam-jam. Proses memasaknya yang lama membuat rendang memiliki cita rasa yang kaya dan tekstur daging yang empuk. Rendang juga sering disajikan dalam acara-acara penting dan perayaan adat di Minangkabau. Keunikan dari rendang terletak pada penggunaan rempah-rempah seperti kunyit, jahe, lengkuas, dan serai yang memberikan aroma dan rasa khas. Selain itu, rendang juga bisa bertahan lama tanpa perlu dimasukkan ke dalam kulkas karena proses memasaknya yang mengurangi kadar air dalam daging.', '2024-06-01', 'Ahmad Fauzi', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(2, 'Resep Sate Padang yang Menggugah Selera', 'Sate Padang adalah salah satu makanan khas Sumatera Barat yang terkenal. Sate ini disajikan dengan saus kacang yang pedas dan gurih. Berikut resep sederhana untuk membuatnya di rumah. Bahan-bahan yang diperlukan antara lain daging sapi, bumbu kacang, dan rempah-rempah seperti serai, daun jeruk, dan lengkuas. Pertama, potong daging sapi sesuai selera lalu rebus dengan bumbu hingga empuk. Setelah itu, tusukkan daging ke tusuk sate dan panggang hingga matang. Untuk saus kacang, tumis bumbu halus hingga harum, lalu masukkan kaldu daging dan tepung beras yang sudah dilarutkan dengan air. Aduk hingga saus mengental. Sate Padang siap disajikan dengan lontong dan taburan bawang goreng.', '2024-06-02', 'Rina Agustina', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(3, 'Manfaat Kesehatan dari Gulai Ayam', 'Gulai Ayam tidak hanya lezat tetapi juga mengandung banyak nutrisi yang baik untuk kesehatan. Santan yang digunakan dalam gulai kaya akan asam laurat yang baik untuk jantung. Daging ayam sendiri merupakan sumber protein yang baik untuk pembentukan otot dan jaringan tubuh. Selain itu, rempah-rempah seperti kunyit, jahe, dan serai yang digunakan dalam gulai memiliki sifat anti-inflamasi dan antioksidan yang membantu meningkatkan sistem kekebalan tubuh. Mengonsumsi gulai ayam dengan porsi yang tepat dapat membantu memenuhi kebutuhan nutrisi harian. Namun, penting untuk diingat bahwa santan mengandung lemak jenuh, sehingga konsumsi gulai ayam sebaiknya diimbangi dengan pola makan yang sehat dan seimbang.', '2024-06-03', 'Dedi Setiawan', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(4, 'Soto Padang: Sup Sehat dan Nikmat', 'Soto Padang adalah sup bening dengan daging sapi yang digoreng kering dan ditambah dengan mie soun serta kentang. Cocok disantap saat cuaca dingin. Soto ini memiliki cita rasa yang segar karena kuahnya yang bening dan sedikit asam dari penggunaan tomat dan jeruk nipis. Daging sapi yang digoreng kering memberikan tekstur yang kontras dengan kuah yang ringan. Untuk membuat Soto Padang, pertama-tama rebus daging sapi hingga empuk, lalu goreng hingga kering. Buat kuah dengan merebus kaldu daging bersama bumbu-bumbu seperti bawang putih, jahe, dan daun jeruk. Sajikan soto dengan mie soun, potongan kentang, tomat, dan taburan bawang goreng. Soto Padang sering disajikan dengan sambal cabai merah dan kerupuk.', '2024-06-04', 'Siti Nurhaliza', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(5, 'Keunikan Dendeng Balado dari Sumatera Barat', 'Dendeng Balado adalah daging sapi yang diiris tipis dan digoreng kering, kemudian disiram dengan sambal balado yang pedas. Cocok sebagai lauk pendamping nasi. Proses pembuatan dendeng balado dimulai dengan mengiris daging sapi tipis-tipis, kemudian dijemur hingga kering. Setelah itu, daging digoreng hingga renyah. Sambal balado dibuat dari cabai merah, bawang merah, bawang putih, dan tomat yang ditumis hingga harum. Daging yang sudah digoreng kemudian dicampur dengan sambal balado hingga merata. Dendeng balado memiliki rasa yang gurih dan pedas, serta tekstur yang renyah. Makanan ini sangat populer di Sumatera Barat dan sering dijadikan oleh-oleh khas daerah tersebut.', '2024-06-05', 'Budi Santoso', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(6, 'Cara Membuat Ayam Pop yang Empuk', 'Ayam Pop adalah salah satu hidangan khas Padang yang unik. Ayam yang dimasak tanpa kulit ini direbus dengan bumbu-bumbu hingga empuk, lalu digoreng sebentar. Bahan-bahan yang dibutuhkan antara lain ayam, bawang putih, bawang merah, jahe, lengkuas, dan serai. Pertama-tama, rebus ayam bersama bumbu-bumbu hingga empuk. Setelah itu, angkat ayam dan tiriskan. Panaskan minyak, lalu goreng ayam sebentar hingga berwarna kecokelatan. Ayam Pop biasanya disajikan dengan sambal merah dan lalapan seperti daun singkong dan mentimun. Keunikan dari Ayam Pop adalah teksturnya yang empuk dan rasanya yang gurih meskipun tanpa kulit.', '2024-06-06', 'Ayu Lestari', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(7, 'Rahasia Kelezatan Pical Sate', 'Pical Sate adalah sate khas Padang yang disajikan dengan bumbu kacang dan lontong. Kelezatan Pical Sate terletak pada bumbu kacangnya yang kaya akan rempah. Bahan utama pical sate adalah daging sapi atau ayam yang dipotong kecil-kecil dan ditusuk menggunakan tusuk sate. Daging tersebut kemudian dipanggang hingga matang. Bumbu kacang dibuat dari kacang tanah yang digoreng dan dihaluskan, kemudian dicampur dengan bawang putih, cabai, gula merah, dan air asam jawa. Pical sate disajikan dengan lontong dan taburan bawang goreng serta kerupuk. Hidangan ini sangat cocok dinikmati sebagai makanan ringan atau hidangan utama.', '2024-06-07', 'Andi Wibowo', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(8, 'Mengenal Lebih Dekat Soto Padang Asli', 'Soto Padang asli memiliki rasa yang khas dengan kuah bening yang segar dan daging sapi yang renyah. Berikut adalah cara membuat Soto Padang yang autentik. Bahan-bahan yang diperlukan antara lain daging sapi, mie soun, kentang, tomat, dan bumbu-bumbu seperti bawang putih, jahe, daun jeruk, dan serai. Pertama-tama, rebus daging sapi hingga empuk, lalu goreng hingga kering. Buat kuah dengan merebus kaldu daging bersama bumbu-bumbu hingga harum. Sajikan soto dengan mie soun, potongan kentang, tomat, dan taburan bawang goreng. Soto Padang biasanya disajikan dengan sambal cabai merah dan kerupuk. Rasanya yang segar dan gurih membuat Soto Padang digemari oleh banyak orang.', '2024-06-08', 'Maya Sari', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(9, 'Sensasi Pedas Sambal Ijo Khas Padang', 'Sambal Ijo adalah sambal khas Padang yang terbuat dari cabai hijau. Sambal ini sering disajikan sebagai pelengkap hidangan Padang lainnya. Bahan utama sambal ijo adalah cabai hijau besar, cabai rawit hijau, bawang merah, bawang putih, dan tomat hijau. Semua bahan tersebut dihaluskan dan ditumis hingga matang. Sambal ijo memiliki rasa yang pedas dan segar, serta aroma yang khas. Sambal ini sering disajikan dengan berbagai hidangan seperti ayam goreng, ikan bakar, dan rendang. Sensasi pedas dari sambal ijo sangat cocok bagi Anda yang menyukai makanan pedas.', '2024-06-09', 'Rizki Ananda', '2024-06-22 16:58:21', '2024-06-22 16:58:21'),
(10, 'Keistimewaan Lontong Sayur Padang', 'Lontong Sayur Padang adalah sarapan khas Padang yang terdiri dari lontong, sayur nangka, dan sambal. Rasanya yang gurih dan pedas membuatnya digemari banyak orang. Bahan-bahan yang diperlukan untuk membuat lontong sayur antara lain lontong, nangka muda, santan, dan bumbu-bumbu seperti bawang merah, bawang putih, cabai merah, dan kunyit. Pertama, tumis bumbu halus hingga harum, lalu masukkan nangka muda dan santan. Masak hingga nangka empuk dan kuah mengental. Sajikan lontong yang sudah dipotong-potong dengan sayur nangka dan sambal. Lontong sayur Padang sering disajikan dengan kerupuk dan taburan bawang goreng.', '2024-06-10', 'Nurul Huda', '2024-06-22 16:58:21', '2024-06-22 16:58:21');

-- --------------------------------------------------------

--
-- Table structure for table `tb_recipes`
--

CREATE TABLE `tb_recipes` (
  `id_recipe` int NOT NULL,
  `id_user` int NOT NULL,
  `recipe_name` varchar(255) NOT NULL,
  `ingredient` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_recipes`
--

INSERT INTO `tb_recipes` (`id_recipe`, `id_user`, `recipe_name`, `ingredient`, `created_at`, `updated_at`) VALUES
(1, 1, 'Resep Rendang', 'Bahan-bahan:\n1 kg daging sapi.\n1 liter santan kental dari 3 butir kelapa (perasan pertama tanpa air).\n550 gram kelapa parut, disangrai sampai kecokelatan.\n5 lembar daun salam.\n1 lembar daun kunyit.\n10 lembar daun jeruk.\n5 batang serai.\n1/2 batang kayu manis.\n3 butir cengkeh.\n2 sdt garam.\n1 buah kembang lawang.\nBumbu halus:\n65 gram bawang putih.\n125 gram bawang merah.\n15 gram kunyit.\n35 gram jahe.\n75 gram lengkuas.\n35 gram kemiri.\n1/2 sdt lada bubuk.\n1 sdt ketumbar.\n1 buah kapulaga.\n1/4 buah pala.\nCara membuatnya:\nPertama-tama, tumis bumbu halus dan kelapa parut sangrai. Aduk rata.\nKemudian, masukkan daun salam, daun jeruk, daun kunyit, dan serai. Masak hingga wangi.\nSetelah itu, masukkan daging. Aduk rata.\nTuang santan. Aduk rata.\nMasak rendang dengan api kecil hingga rendang mengering. Rendang daging sapi siap kamu sajikan untuk acara spesial.', '2024-06-22 09:08:32', '2024-06-22 09:08:32'),
(2, 1, 'Sate Padang', 'Bahan-bahan:\r\n500 gram daging sapi.\r\n10 lembar daun jeruk.\r\n3 batang serai.\r\n2 cm lengkuas.\r\nBumbu halus:\r\n5 siung bawang putih.\r\n8 siung bawang merah.\r\n3 buah cabai merah.\r\n1 sdt ketumbar.\r\n1 sdt jintan.\r\nCara membuatnya:\r\nRebus daging sapi dengan daun jeruk, serai, dan lengkuas hingga empuk.\r\nHaluskan bumbu, tumis hingga harum.\r\nCampurkan daging dengan bumbu, tusuk-tusuk menggunakan tusuk sate.\r\nBakar sate hingga matang, sajikan dengan lontong dan bumbu kacang.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(3, 1, 'Gulai Ayam', 'Bahan-bahan:\r\n1 ekor ayam, potong 8 bagian.\r\n500 ml santan kental.\r\n500 ml santan encer.\r\n5 lembar daun jeruk.\r\n2 lembar daun salam.\r\n1 batang serai.\r\n2 sdt garam.\r\nBumbu halus:\r\n5 siung bawang putih.\r\n10 butir bawang merah.\r\n3 cm jahe.\r\n3 cm kunyit.\r\n5 buah cabai merah.\r\nCara membuatnya:\r\nTumis bumbu halus hingga harum, masukkan daun jeruk, daun salam, dan serai.\r\nMasukkan potongan ayam, aduk rata.\r\nTuang santan encer, masak hingga ayam empuk.\r\nTambahkan santan kental, masak hingga kuah mengental. Sajikan.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(4, 1, 'Dendeng Balado', 'Bahan-bahan:\r\n500 gram daging sapi, iris tipis.\r\n3 buah cabai merah besar.\r\n10 buah cabai rawit.\r\n5 siung bawang merah.\r\n2 siung bawang putih.\r\n1 buah tomat.\r\n1 sdt garam.\r\nCara membuatnya:\r\nGoreng daging sapi hingga kering.\r\nTumis bawang merah, bawang putih, cabai merah, dan cabai rawit hingga harum.\r\nMasukkan tomat, masak hingga layu.\r\nTambahkan garam, aduk rata.\r\nCampurkan daging goreng dengan bumbu, aduk hingga merata.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(5, 1, 'Ayam Pop', 'Bahan-bahan:\r\n1 ekor ayam kampung, potong 4 bagian.\r\n5 siung bawang putih.\r\n3 cm jahe.\r\n2 cm lengkuas.\r\n2 batang serai.\r\n1 sdt garam.\r\nCara membuatnya:\r\nRebus ayam bersama bawang putih, jahe, lengkuas, serai, dan garam hingga empuk.\r\nTiriskan ayam, goreng sebentar hingga kecokelatan.\r\nSajikan ayam pop dengan sambal dan lalapan.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(6, 1, 'Soto Padang', 'Bahan-bahan:\r\n300 gram daging sapi.\r\n1 liter air.\r\n1 batang serai.\r\n3 lembar daun jeruk.\r\n2 lembar daun salam.\r\nBumbu halus:\r\n5 siung bawang putih.\r\n7 butir bawang merah.\r\n3 cm jahe.\r\n1 sdt merica.\r\nCara membuatnya:\r\nRebus daging sapi dengan serai, daun jeruk, dan daun salam hingga empuk.\r\nAngkat daging, potong dadu, goreng hingga kering.\r\nTumis bumbu halus hingga harum, masukkan ke dalam kaldu.\r\nSajikan daging dengan kuah kaldu, mie soun, dan kentang goreng.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(7, 1, 'Lontong Sayur Padang', 'Bahan-bahan:\r\n5 buah lontong, potong-potong.\r\n300 gram nangka muda.\r\n500 ml santan.\r\n5 lembar daun jeruk.\r\n2 lembar daun salam.\r\n1 batang serai.\r\nBumbu halus:\r\n5 siung bawang putih.\r\n8 butir bawang merah.\r\n3 buah cabai merah.\r\n1 cm kunyit.\r\nCara membuatnya:\r\nTumis bumbu halus hingga harum, masukkan daun jeruk, daun salam, dan serai.\r\nMasukkan nangka muda, aduk rata.\r\nTuang santan, masak hingga nangka empuk.\r\nSajikan lontong dengan sayur nangka dan sambal.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(8, 1, 'Pical Sate', 'Bahan-bahan:\r\n500 gram daging sapi atau ayam, potong dadu.\r\n200 gram kacang tanah, goreng dan haluskan.\r\n5 siung bawang putih.\r\n3 buah cabai merah.\r\n2 sdm gula merah.\r\n2 sdm air asam jawa.\r\nCara membuatnya:\r\nTusuk daging dengan tusuk sate, panggang hingga matang.\r\nTumis bawang putih dan cabai merah hingga harum.\r\nCampurkan kacang tanah, gula merah, dan air asam jawa, masak hingga mengental.\r\nSajikan sate dengan lontong dan bumbu kacang.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(9, 1, 'Sambal Ijo', 'Bahan-bahan:\r\n10 buah cabai hijau besar.\r\n5 buah cabai rawit hijau.\r\n5 siung bawang merah.\r\n2 siung bawang putih.\r\n2 buah tomat hijau.\r\nCara membuatnya:\r\nRebus cabai hijau, cabai rawit, bawang merah, bawang putih, dan tomat hingga layu.\r\nHaluskan semua bahan, tambahkan garam.\r\nTumis sambal hingga matang, sajikan dengan berbagai hidangan Padang.', '2024-06-22 17:03:51', '2024-06-22 17:03:51'),
(10, 1, 'Gulai Tunjang', 'Bahan-bahan:\r\n1 kg kaki sapi, potong-potong.\r\n1 liter santan kental.\r\n5 lembar daun jeruk.\r\n2 lembar daun salam.\r\n1 batang serai.\r\n2 sdt garam.\r\nBumbu halus:\r\n5 siung bawang putih.\r\n10 butir bawang merah.\r\n3 cm jahe.\r\n3 cm kunyit.\r\n5 buah cabai merah.\r\nCara membuatnya:\r\nRebus kaki sapi hingga empuk, tiriskan.\r\nTumis bumbu halus hingga harum, masukkan daun jeruk, daun salam, dan serai.\r\nMasukkan kaki sapi, aduk rata.\r\nTuang santan, masak hingga kuah mengental. Sajikan.', '2024-06-22 17:03:51', '2024-06-22 17:03:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_stores`
--

CREATE TABLE `tb_stores` (
  `store_id` int NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_stores`
--

INSERT INTO `tb_stores` (`store_id`, `store_name`, `location`, `created_at`, `updated_at`) VALUES
(1, 'Rumah Makan ', 'Indonesia', '2024-06-22 09:18:43', '2024-06-22 09:18:43'),
(2, 'RM Padang Sederhana', 'Jl. Sudirman No. 123, Padang', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(3, 'RM Padang Pagi Sore', 'Jl. Veteran No. 45, Jakarta', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(4, 'RM Padang Simpang Raya', 'Jl. Ahmad Yani No. 78, Bandung', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(5, 'RM Padang Garuda', 'Jl. Thamrin No. 90, Medan', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(6, 'RM Padang Sari Ratu', 'Jl. Gatot Subroto No. 102, Surabaya', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(7, 'RM Padang Pondok Djaja', 'Jl. Pemuda No. 20, Semarang', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(8, 'RM Padang Lamak Bana', 'Jl. Malioboro No. 15, Yogyakarta', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(9, 'RM Padang Sari Bundo', 'Jl. Raya No. 85, Palembang', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(10, 'RM Padang Rindu Alam', 'Jl. Jenderal Sudirman No. 50, Makassar', '2024-06-22 17:09:32', '2024-06-22 17:09:32'),
(11, 'RM Padang Minang Saiyo', 'Jl. Gajah Mada No. 30, Denpasar', '2024-06-22 17:09:32', '2024-06-22 17:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text NOT NULL,
  `code_verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `user_status` varchar(255) NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `username`, `password`, `code_verification`, `user_status`, `created_at`, `updated_at`) VALUES
(1, 'budi@gmail.com', 'budi', '00dfc53ee86af02e742515cdcf075ed3', '0', 'pending', '2024-06-17 14:44:27', '2024-06-17 14:54:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_comments`
--
ALTER TABLE `tb_comments`
  ADD PRIMARY KEY (`id_comment`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_food` (`id_food`);

--
-- Indexes for table `tb_favorites`
--
ALTER TABLE `tb_favorites`
  ADD PRIMARY KEY (`id_favorite`),
  ADD KEY `id_food` (`id_food`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_foods`
--
ALTER TABLE `tb_foods`
  ADD PRIMARY KEY (`id_food`),
  ADD KEY `id_store` (`id_store`);

--
-- Indexes for table `tb_news`
--
ALTER TABLE `tb_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tb_recipes`
--
ALTER TABLE `tb_recipes`
  ADD PRIMARY KEY (`id_recipe`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tb_stores`
--
ALTER TABLE `tb_stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indexes for table `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_comments`
--
ALTER TABLE `tb_comments`
  MODIFY `id_comment` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_favorites`
--
ALTER TABLE `tb_favorites`
  MODIFY `id_favorite` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_foods`
--
ALTER TABLE `tb_foods`
  MODIFY `id_food` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_news`
--
ALTER TABLE `tb_news`
  MODIFY `news_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_recipes`
--
ALTER TABLE `tb_recipes`
  MODIFY `id_recipe` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_stores`
--
ALTER TABLE `tb_stores`
  MODIFY `store_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_comments`
--
ALTER TABLE `tb_comments`
  ADD CONSTRAINT `tb_comments_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_comments_ibfk_3` FOREIGN KEY (`id_food`) REFERENCES `tb_foods` (`id_food`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_favorites`
--
ALTER TABLE `tb_favorites`
  ADD CONSTRAINT `tb_favorites_ibfk_1` FOREIGN KEY (`id_food`) REFERENCES `tb_foods` (`id_food`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `tb_favorites_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_foods`
--
ALTER TABLE `tb_foods`
  ADD CONSTRAINT `tb_foods_ibfk_2` FOREIGN KEY (`id_store`) REFERENCES `tb_stores` (`store_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `tb_recipes`
--
ALTER TABLE `tb_recipes`
  ADD CONSTRAINT `tb_recipes_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
