-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 14, 2025 at 01:18 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre_banco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `nombre_banco`, `created_at`, `updated_at`) VALUES
(1, 'Bancolombia', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(2, 'Banco de Bogotá', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(3, 'Banco Popular', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(4, 'Davivienda', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(5, 'BBVA Colombia', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(6, 'Banco Caja Social', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(7, 'Banco de Occidente', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(8, 'Banco Agrario', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(9, 'Scotiabank Colpatria', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(10, 'Banco AV Villas', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(11, 'Banco Falabella', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(12, 'Banco Pichincha', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(13, 'Banco GNB Sudameris', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(14, 'Bancoomeva', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(15, 'Banco Cooperativo Coopcentral', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(16, 'Banco Finandina', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(17, 'Banco ProCredit', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(18, 'Banco Serfinanza', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(19, 'Banco W', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(20, 'Nequi', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(21, 'Daviplata', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(22, 'Movii', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(23, 'RappiPay', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(24, 'Lulo Bank', '2025-03-02 17:58:55', '2025-03-02 17:58:55'),
(25, 'Nu', '2025-03-02 17:58:55', '2025-03-02 17:58:55');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'BMX', 'La categoría BMX (Bicycle Motocross) es una disciplina del ciclismo que se caracteriza por su dinamismo.', '2025-01-27 05:33:04', '2025-02-19 00:34:04', NULL),
(3, 'LLANTAS', 'Esta descripción fue actualizada por medio del front-end.', '2025-01-27 05:35:23', '2025-01-30 21:04:22', NULL),
(4, 'RINES', 'Editado por front-end.', '2025-01-27 05:57:46', '2025-01-30 22:45:43', NULL),
(5, 'SILLINES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget dui varius risus venenatis gravida.', '2025-01-27 05:58:09', '2025-01-27 05:58:09', NULL),
(6, 'TRANSMISION', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget dui varius risus venenatis gravida.', '2025-01-27 06:01:47', '2025-01-27 06:01:47', NULL),
(7, 'PIÑONES', 'Editado nuevamente.', '2025-01-27 06:02:01', '2025-02-21 00:15:25', NULL),
(8, 'BIELA', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. N.', '2025-01-27 06:09:14', '2025-04-17 03:09:32', NULL),
(9, 'TIJERAS', 'Componente que conecta la rueda delantera con el cuadro de la bicicleta y permite el control de la dirección.', '2025-01-27 06:09:48', '2025-01-30 21:06:07', NULL),
(10, 'BUJES', 'Lorem ipsum dolor sit amet.', '2025-01-27 06:10:02', '2025-01-31 00:05:41', NULL),
(11, 'PLATOS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget dui varius risus venenatis gravida.', '2025-01-27 06:10:33', '2025-01-27 06:10:33', NULL),
(12, 'FRENOS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget dui varius risus venenatis gravida.', '2025-01-27 06:10:54', '2025-01-27 06:10:54', NULL),
(13, 'AMORTIGUADORES', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2025-01-30 19:18:11', '2025-02-24 21:02:51', NULL),
(23, 'test 1', 'asdasdasdasd', '2025-04-17 03:09:53', '2025-04-17 03:10:08', '2025-04-17 03:10:08'),
(24, 'test 2', 'asasdasdasdasd', '2025-04-17 03:10:00', '2025-04-17 03:10:08', '2025-04-17 03:10:08');

-- --------------------------------------------------------

--
-- Table structure for table `ciudades`
--

CREATE TABLE `ciudades` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ciudades`
--

INSERT INTO `ciudades` (`id`, `nombre`, `departamento_id`, `created_at`, `updated_at`) VALUES
(1, 'Leticia', 1, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(2, 'Puerto Nariño', 1, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(3, 'La Chorrera', 1, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(4, 'Medellín', 2, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(5, 'Bello', 2, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(6, 'Itagüí', 2, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(7, 'Arauca', 3, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(8, 'Tame', 3, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(9, 'Saravena', 3, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(10, 'Barranquilla', 4, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(11, 'Soledad', 4, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(12, 'Malambo', 4, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(13, 'Cartagena', 5, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(14, 'Magangué', 5, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(15, 'Turbaco', 5, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(16, 'Tunja', 6, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(17, 'Duitama', 6, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(18, 'Sogamoso', 6, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(19, 'Manizales', 7, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(20, 'Villamaría', 7, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(21, 'Chinchiná', 7, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(22, 'Florencia', 8, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(23, 'San Vicente del Caguán', 8, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(24, 'Puerto Rico', 8, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(25, 'Yopal', 9, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(26, 'Aguazul', 9, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(27, 'Villanueva', 9, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(28, 'Popayán', 10, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(29, 'Santander de Quilichao', 10, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(30, 'Puerto Tejada', 10, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(31, 'Valledupar', 11, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(32, 'Aguachica', 11, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(33, 'Curumaní', 11, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(34, 'Quibdó', 12, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(35, 'Istmina', 12, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(36, 'Condoto', 12, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(37, 'Montería', 13, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(38, 'Cereté', 13, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(39, 'Sahagún', 13, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(40, 'Bogotá', 14, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(41, 'Soacha', 14, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(42, 'Zipaquirá', 14, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(43, 'Inírida', 15, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(44, 'Barranco Minas', 15, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(45, 'Cacahual', 15, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(46, 'San José del Guaviare', 16, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(47, 'El Retorno', 16, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(48, 'Calamar', 16, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(49, 'Neiva', 17, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(50, 'Garzón', 17, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(51, 'Pitalito', 17, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(52, 'Riohacha', 18, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(53, 'Maicao', 18, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(54, 'Uribia', 18, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(55, 'Santa Marta', 19, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(56, 'Ciénaga', 19, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(57, 'Fundación', 19, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(58, 'Villavicencio', 20, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(59, 'Acacías', 20, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(60, 'Granada', 20, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(61, 'Pasto', 21, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(62, 'Ipiales', 21, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(63, 'Tumaco', 21, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(64, 'Cúcuta', 22, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(65, 'Ocaña', 22, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(66, 'Pamplona', 22, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(67, 'Mocoa', 23, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(68, 'Puerto Asís', 23, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(69, 'Sibundoy', 23, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(70, 'Armenia', 24, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(71, 'Montenegro', 24, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(72, 'Quimbaya', 24, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(73, 'Pereira', 25, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(74, 'Dosquebradas', 25, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(75, 'Santa Rosa de Cabal', 25, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(76, 'San Andrés', 26, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(77, 'Providencia', 26, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(78, 'La Loma', 26, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(79, 'Bucaramanga', 27, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(80, 'Floridablanca', 27, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(81, 'Girón', 27, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(82, 'Sincelejo', 28, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(83, 'Corozal', 28, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(84, 'Sampués', 28, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(85, 'Ibagué', 29, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(86, 'Espinal', 29, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(87, 'Honda', 29, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(88, 'Cali', 30, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(89, 'Palmira', 30, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(90, 'Buenaventura', 30, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(91, 'Mitú', 31, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(92, 'Pacoa', 31, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(93, 'Taraira', 31, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(94, 'Puerto Carreño', 32, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(95, 'La Primavera', 32, '2025-01-15 01:56:12', '2025-01-15 01:56:12'),
(96, 'Santa Rosalía', 32, '2025-01-15 01:56:12', '2025-01-15 01:56:12');

-- --------------------------------------------------------

--
-- Table structure for table `composition_types`
--

CREATE TABLE `composition_types` (
  `id` bigint UNSIGNED NOT NULL,
  `opcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `composition_types`
--

INSERT INTO `composition_types` (`id`, `opcion`, `created_at`, `updated_at`) VALUES
(1, 'Sí', NULL, NULL),
(2, 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departamentos`
--

CREATE TABLE `departamentos` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Amazonas', NULL, NULL),
(2, 'Antioquia', NULL, NULL),
(3, 'Arauca', NULL, NULL),
(4, 'Atlántico', NULL, NULL),
(5, 'Bolívar', NULL, NULL),
(6, 'Boyacá', NULL, NULL),
(7, 'Caldas', NULL, NULL),
(8, 'Caquetá', NULL, NULL),
(9, 'Casanare', NULL, NULL),
(10, 'Cauca', NULL, NULL),
(11, 'Cesar', NULL, NULL),
(12, 'Chocó', NULL, NULL),
(13, 'Córdoba', NULL, NULL),
(14, 'Cundinamarca', NULL, NULL),
(15, 'Guainía', NULL, NULL),
(16, 'Guaviare', NULL, NULL),
(17, 'Huila', NULL, NULL),
(18, 'La Guajira', NULL, NULL),
(19, 'Magdalena', NULL, NULL),
(20, 'Meta', NULL, NULL),
(21, 'Nariño', NULL, NULL),
(22, 'Norte de Santander', NULL, NULL),
(23, 'Putumayo', NULL, NULL),
(24, 'Quindío', NULL, NULL),
(25, 'Risaralda', NULL, NULL),
(26, 'San Andrés y Providencia', NULL, NULL),
(27, 'Santander', NULL, NULL),
(28, 'Sucre', NULL, NULL),
(29, 'Tolima', NULL, NULL),
(30, 'Valle del Cauca', NULL, NULL),
(31, 'Vaupés', NULL, NULL),
(32, 'Vichada', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `formats`
--

CREATE TABLE `formats` (
  `id` bigint UNSIGNED NOT NULL,
  `formato` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `formats`
--

INSERT INTO `formats` (`id`, `formato`, `created_at`, `updated_at`) VALUES
(1, 'Digital', '2025-03-18 15:36:55', '2025-03-18 15:36:55'),
(2, 'Físico', '2025-03-18 15:36:55', '2025-03-18 15:36:55');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '0001_01_01_000000_create_users_table', 1),
(5, '0001_01_01_000001_create_cache_table', 1),
(6, '0001_01_01_000002_create_jobs_table', 1),
(7, '2025_01_15_012738_tipo_documento_table', 2),
(8, '2025_01_15_014729_create_departamentos_table', 3),
(9, '2025_01_15_014924_create_rol_table', 3),
(10, '2025_01_27_000758_create_categories_table', 4),
(11, '2025_01_30_191709_add_deleted_at_to_usuarios_table', 5),
(12, '2025_01_30_200624_add_deleted_at_to_categories_table', 6),
(15, '2025_03_02_174532_create_banks_table', 7),
(16, '2025_03_02_174756_create_tipo_cuenta_banco_table', 8),
(17, '2025_03_18_133852_create_formats', 9),
(18, '2025_03_18_141751_create_compostion_options', 10),
(19, '2025_05_10_151705_create_product_management_tables', 11);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@example.com', '$2y$12$IlgQX0seUJ59ng4wR0eliOQiJEiZ8QlDDvHBaXaAu0nMOFVUr67F6', '2025-05-11 23:43:51'),
('julio@example.com', '$2y$12$sSTcTjdQ7Y9aG1MK7bwiFeQVVKn/vLRExhvj/evUpDZXbqQUOFtkO', '2025-02-21 00:09:59');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `precio_regular` decimal(10,2) NOT NULL,
  `precio_oferta` decimal(10,2) DEFAULT NULL,
  `composition_option_id` bigint UNSIGNED NOT NULL,
  `format_id` bigint UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `unidades_disponibles` int NOT NULL DEFAULT '0',
  `imagen_portada` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `nombre`, `descripcion`, `precio_regular`, `precio_oferta`, `composition_option_id`, `format_id`, `category_id`, `unidades_disponibles`, `imagen_portada`, `url`, `deleted_at`, `created_at`, `updated_at`) VALUES
(23, 'TEST PRODUCT', 'qwe qw we ae', 999999.00, 12312.00, 2, 2, 1, 3, 'products/qnK9VhRrd7X3WSReIbz06GXAgafrzzvnEtVuEJ5l.png', 'https://www.studocu.com/co/document/servicio-nacional-de-aprendizaje/tecnologo-en-analisis-y-desarrollo-de-software/cuestionario-ga2-240202501-aa1-ev01-ingles/58275504', NULL, '2025-05-11 23:04:27', '2025-05-11 23:04:27'),
(24, 'PRODUCTO PRUEBA', 'qweqw eqwe12312 asd123123', 50000.00, 12312.00, 2, 2, 7, 3, 'products/7qVSapKcHVIXOgyfyj10NIPGqUfzFspIeySEGUmC.png', 'https://www.studocu.com/co/document/servicio-nacional-de-aprendizaje/tecnologo-en-analisis-y-desarrollo-de-software/cuestionario-ga2-240202501-aa1-ev01-ingles/58275504', NULL, '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(25, 'CREADO DESDE JENINSON', 'Texto de prueba', 85000.00, NULL, 2, 2, 9, 8, 'products/0ZIwMb7yU8R9TGJFCmsSMYvyibzJkPMtgjrsNl82.png', 'https://www.studocu.com/co/document/servicio-nacional-de-aprendizaje/tecnologo-en-analisis-y-desarrollo-de-software/cuestionario-ga2-240202501-aa1-ev01-ingles/58275504', NULL, '2025-05-11 23:47:41', '2025-05-11 23:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attributes`
--

INSERT INTO `product_attributes` (`id`, `product_id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(23, 23, 'Peso real', '255 g', '2025-05-11 23:04:27', '2025-05-11 23:04:27'),
(24, 24, 'COLOR', 'MORADO', '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(25, 25, 'Peso real', '255 g', '2025-05-11 23:47:41', '2025-05-11 23:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_compositions`
--

CREATE TABLE `product_compositions` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `nombre_campo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint UNSIGNED DEFAULT NULL,
  `articulo_id` bigint UNSIGNED DEFAULT NULL,
  `precio_adicional` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_galleries`
--

CREATE TABLE `product_galleries` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `imagen_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `orden` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_galleries`
--

INSERT INTO `product_galleries` (`id`, `product_id`, `imagen_url`, `orden`, `created_at`, `updated_at`) VALUES
(1, 23, 'products/gallery/0lTExKucXzYoTcDwQhqB49Gy3ea6VN6dfsDEFHZz.png', 0, '2025-05-11 23:04:27', '2025-05-11 23:04:27'),
(2, 24, 'products/gallery/1xOdXAqcAGSDAeqlpsfcqMblwBqJPQcXNS4aBnU2.png', 0, '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(3, 24, 'products/gallery/ivOB5p2B3BDfheDUxhWWgTUPNw3etjdrSvD0NOx4.png', 0, '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(4, 24, 'products/gallery/WhDcw0I2I6it1bRFYcwL5cSIi6aXdsRMpW9V6Ptc.jpg', 0, '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(5, 25, 'products/gallery/p2TwTAiusr7TSBxEoCSiminxrt2poTr3ZmWtEm8D.png', 0, '2025-05-11 23:47:41', '2025-05-11 23:47:41'),
(6, 25, 'products/gallery/T3ypYlY3gg8G1utE7dMAKB0kn4B52FkytoNuzGNW.png', 0, '2025-05-11 23:47:41', '2025-05-11 23:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `product_shippings`
--

CREATE TABLE `product_shippings` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `envio_gratis` tinyint(1) NOT NULL DEFAULT '0',
  `costo_envio` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_shippings`
--

INSERT INTO `product_shippings` (`id`, `product_id`, `envio_gratis`, `costo_envio`, `created_at`, `updated_at`) VALUES
(22, 23, 1, 0, '2025-05-11 23:04:27', '2025-05-11 23:04:27'),
(23, 24, 0, 123123, '2025-05-11 23:05:05', '2025-05-11 23:05:05'),
(24, 25, 1, 0, '2025-05-11 23:47:41', '2025-05-11 23:47:41');

-- --------------------------------------------------------

--
-- Table structure for table `rol`
--

CREATE TABLE `rol` (
  `id` bigint UNSIGNED NOT NULL,
  `rol` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rol`
--

INSERT INTO `rol` (`id`, `rol`, `created_at`, `updated_at`) VALUES
(1, 'Administrador', '2025-01-15 01:51:12', '2025-01-15 01:51:12'),
(2, 'Gestor', '2025-01-15 01:51:12', '2025-01-15 01:51:12');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('OXWel2p4EruVfq7lQYF083hRSsdKSWKexEoIfjp5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRVpHNURmM3N4UWlMc01oZmxBZXdsQVB4RlR0MmdmYnhhSVExTUg0TyI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vY3VzdG9tc2hvcC50ZXN0L251ZXZvLXByb2R1Y3RvIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1747185440),
('qxHQUgD4xczY9PW2tVtLrqQRyF4u0BuGbgNzNyYy', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0JuZDZmNDhhazBFOEdOb2ZZOGlpQklnbXc4TnB2YUdNWXdLNkhPSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjI6Imh0dHA6Ly9jdXN0b21zaG9wLnRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1746982546),
('ri85iZk6iROYRRNY4rkJuoqCuoUcF9L9idkg8YQq', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36 Edg/136.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiR083cTI3R2toTDk4MWxLcUFSbzdSUzJ4VkJHZURxQmVWWDl1dkRmcyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vY3VzdG9tc2hvcC50ZXN0L251ZXZvLXByb2R1Y3RvIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1746990695);

-- --------------------------------------------------------

--
-- Table structure for table `tipos_cuentas_bancos`
--

CREATE TABLE `tipos_cuentas_bancos` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_cuenta` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipos_cuentas_bancos`
--

INSERT INTO `tipos_cuentas_bancos` (`id`, `tipo_cuenta`, `created_at`, `updated_at`) VALUES
(1, 'Ahorros', '2025-03-02 17:59:36', '2025-03-02 17:59:36'),
(2, 'Corriente', '2025-03-02 17:59:36', '2025-03-02 17:59:36'),
(3, 'Nómina', '2025-03-02 17:59:36', '2025-03-02 17:59:36');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `id` bigint UNSIGNED NOT NULL,
  `tipoDocu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tipo_documento`
--

INSERT INTO `tipo_documento` (`id`, `tipoDocu`) VALUES
(1, 'Cédula de ciudadanía'),
(2, 'Pasaporte'),
(3, 'Cédula de extranjería'),
(4, 'Tarjeta de identidad');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` bigint UNSIGNED NOT NULL,
  `nombreUs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidosUs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_documento_id` bigint UNSIGNED NOT NULL,
  `numDocu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `departamento_id` bigint UNSIGNED NOT NULL,
  `ciudad_id` bigint UNSIGNED NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` bigint UNSIGNED NOT NULL,
  `telefono` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombreUs`, `apellidosUs`, `tipo_documento_id`, `numDocu`, `departamento_id`, `ciudad_id`, `direccion`, `rol_id`, `telefono`, `email`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'USUARIO', 'TESTER', 1, '999999', 3, 8, 'TRV 25 # 90 90', 2, '3001111111', 'user@example.com', 'hashed_password_here', NULL, '2025-01-19 02:55:27', '2025-03-12 20:58:05', NULL),
(2, 'JUAN', 'ESCOBAR', 1, '1102831057', 14, 40, 'CLL 1 # 2-3', 1, '3008888888', 'admin@example.com', '$2y$12$skMCyErbax3WG51x53MW4OjJ3nc5vPEPyfuKhtMdBQ3eAM4xV1PCi', NULL, '2025-01-19 07:57:59', '2025-01-19 07:57:59', NULL),
(3, 'ELIANA', 'TRUJILLO', 1, '888888', 14, 40, 'VEREDA 27', 2, '3338888888', 'eliana@example.com', '$2y$12$WjG5l7f7a/YOEYu7nyItjObnDl2UFN1BYG3/X7rreiwh40UjmdZOW', NULL, '2025-01-20 21:05:53', '2025-03-12 06:19:53', NULL),
(5, 'ANDREA', 'GUEVARA', 1, '2222222', 28, 82, 'CLL 1 # 2-3', 2, '3000000000', 'andrea@example.com', '$2y$12$8Bl4sGGGndXMC4mZkRfkLOGWSQJZRR5surV5D5YN7hgbrQNNQTSK.', NULL, '2025-01-21 05:40:54', '2025-01-21 05:40:54', NULL),
(6, 'JENINSON', 'PERALTA', 1, '00002222', 4, 10, 'CRA 20 # 20 - 20', 1, '3001234567', 'jeninson@example.com', '$2y$12$BLqsOuKjyus06tz8YcsnDe95O43eXlgsLOryrvPl9C7ftPLKxgM6G', NULL, '2025-01-27 04:56:59', '2025-03-12 06:21:58', NULL),
(7, 'DANIEL', 'RAMIREZ', 2, '9888444', 30, 88, 'CRA 1 # 99-99', 2, '3008888887', 'daniel@example.com', '$2y$12$MsRdqdJJpnOcN8p1qPJ3wevHEEsLvFNj2pekocSIBjywrkBAUEIFW', NULL, '2025-01-30 23:09:14', '2025-03-12 06:21:43', '2025-03-12 06:21:43'),
(8, 'PRUEBA 2', 'TEST', 3, '1111111', 2, 4, 'ST 155 AV98', 2, '3110000000', 'test@example.com', '$2y$12$I9QMLn92v59vMfrRCtcOp.csAS3i0Hn.pqcJ1ySK4SPpFPYO1qDlS', NULL, '2025-01-30 23:36:17', '2025-03-12 06:21:40', '2025-03-12 06:21:40'),
(9, 'PRUEBA', 'SERVIDOR', 1, '988888888', 1, 1, 'CRA 66 # 110D - 14', 1, '3222940325', 'juanster1w@hotmail.com', '$2y$12$LxNX4HYbDhX3SpQWPkZPZeTSqufB4EPy8N0J9h.3lsLdwLpC0HFPq', NULL, '2025-02-05 03:55:30', '2025-03-12 06:21:38', '2025-03-12 06:21:38'),
(10, 'PRUEBA', 'SERVIDOR', 1, '988888888', 1, 1, 'CRA 66 # 110D - 14', 2, '3222940325', 'aaddd@hotmail.com', '$2y$12$DUrroSKs/nN3D3g4GEt0AukE.jZ6DOvV4VLM3pG76SiD3G0r4iade', NULL, '2025-02-05 04:02:16', '2025-03-12 06:21:36', '2025-03-12 06:21:36'),
(11, 'PRUEBA', 'TEST', 2, '9874562', 1, 1, 'CLL 1 # 2-3', 2, '3000000000', 'prueba@example.com', '$2y$12$7LDLOGgtYCT0SXGwbbGMU.qfrIS8p8jbazQAeCFlP9z6v0Bdoc1Qm', NULL, '2025-02-13 03:20:39', '2025-03-12 06:21:34', '2025-03-12 06:21:34'),
(12, 'JULIO', 'GUEVARA', 2, '9987878', 4, 10, 'AV 68 # 88 - 77', 2, '3008888888', 'julio@example.com', '$2y$12$rp4J.bxlZJUqJmU90JV0F.fbIDOhQz9gb4IUNbW9XO/N7IGgTBJKe', NULL, '2025-02-21 00:02:02', '2025-03-12 06:21:19', '2025-03-12 06:21:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudades_departamento_id_foreign` (`departamento_id`);

--
-- Indexes for table `composition_types`
--
ALTER TABLE `composition_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `departamentos_nombre_unique` (`nombre`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `formats`
--
ALTER TABLE `formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_composition_option_id_foreign` (`composition_option_id`),
  ADD KEY `products_format_id_foreign` (`format_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_attributes_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_compositions`
--
ALTER TABLE `product_compositions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_compositions_product_id_foreign` (`product_id`),
  ADD KEY `product_compositions_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_galleries_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_shippings`
--
ALTER TABLE `product_shippings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_shippings_product_id_foreign` (`product_id`);

--
-- Indexes for table `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `tipos_cuentas_bancos`
--
ALTER TABLE `tipos_cuentas_bancos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuarios_tipo_documento_id_foreign` (`tipo_documento_id`),
  ADD KEY `usuarios_departamento_id_foreign` (`departamento_id`),
  ADD KEY `usuarios_ciudad_id_foreign` (`ciudad_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `ciudades`
--
ALTER TABLE `ciudades`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `composition_types`
--
ALTER TABLE `composition_types`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `formats`
--
ALTER TABLE `formats`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `product_compositions`
--
ALTER TABLE `product_compositions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_galleries`
--
ALTER TABLE `product_galleries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_shippings`
--
ALTER TABLE `product_shippings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipos_cuentas_bancos`
--
ALTER TABLE `tipos_cuentas_bancos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_composition_option_id_foreign` FOREIGN KEY (`composition_option_id`) REFERENCES `composition_types` (`id`),
  ADD CONSTRAINT `products_format_id_foreign` FOREIGN KEY (`format_id`) REFERENCES `formats` (`id`);

--
-- Constraints for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD CONSTRAINT `product_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_compositions`
--
ALTER TABLE `product_compositions`
  ADD CONSTRAINT `product_compositions_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `product_compositions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_galleries`
--
ALTER TABLE `product_galleries`
  ADD CONSTRAINT `product_galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_shippings`
--
ALTER TABLE `product_shippings`
  ADD CONSTRAINT `product_shippings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ciudad_id_foreign` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuarios_departamento_id_foreign` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usuarios_tipo_documento_id_foreign` FOREIGN KEY (`tipo_documento_id`) REFERENCES `tipo_documento` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
