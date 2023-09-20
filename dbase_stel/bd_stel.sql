-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2023 a las 17:01:57
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_stel`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_multa` ()   BEGIN
select 
r.cedResidente documento,r.nomResidente nombre
,r.emaResidente email,im.andInmueble numero_anden,im.numInmueble numero_inmueble,  
m.tipoMulta tipo_multa,m.fecMulta fecha_multa,m.valMulta valor_multa,
case when m.fpagMulta is not null then 'PAGADA'
WHEN m.fpagMulta IS NULL then  'PENDIENTE'
END estado,
tr.cargTrabajador Cargo,tr.nomTrabajador nombre_administrador
from tbl_residente r
inner join  tbl_inmueble  im on (r.pkidResidente=im.fkidResidente) 
inner join tbl_multa m on (m.fkidInmueble=im.pkidInmueble)
inner join tbl_trabajador tr on(tr.pkidTrabajador=m.fkidTrabajador);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residente_docsadmin`
--

CREATE TABLE `residente_docsadmin` (
  `pkidResidente` int(11) NOT NULL,
  `pkidDocsAdmin` int(11) NOT NULL,
  `docDocsAdmin` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residente_novedades`
--

CREATE TABLE `residente_novedades` (
  `pkidResidente` int(11) NOT NULL,
  `pkidNovedades` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `residente_novedades`
--

INSERT INTO `residente_novedades` (`pkidResidente`, `pkidNovedades`) VALUES
(6, 2),
(7, 3),
(8, 4),
(9, 5),
(10, 6),
(11, 7),
(12, 8),
(13, 9),
(14, 10),
(15, 11),
(16, 12),
(17, 13),
(18, 14),
(19, 15),
(20, 16),
(21, 17),
(22, 18),
(23, 19),
(24, 20),
(25, 21),
(26, 22),
(27, 23),
(28, 24),
(29, 25),
(30, 26),
(31, 27),
(32, 28),
(33, 29),
(34, 30),
(35, 31),
(36, 32),
(37, 33),
(38, 34),
(39, 35),
(40, 36),
(41, 37),
(42, 38),
(43, 39),
(44, 40),
(45, 41),
(46, 42),
(47, 43),
(48, 44),
(49, 45),
(50, 46),
(51, 47),
(52, 48),
(53, 49),
(54, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_correspondencia`
--

CREATE TABLE `tbl_correspondencia` (
  `pkidCorrespondencia` int(11) NOT NULL,
  `tipoCorrespondencia` varchar(30) NOT NULL,
  `frecCorrespondencia` date DEFAULT NULL,
  `estCorrespondencia` varchar(20) NOT NULL,
  `fentrCorrespondencia` date DEFAULT NULL,
  `fkidTrabajador` int(11) NOT NULL,
  `fkidInmueble` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_correspondencia`
--

INSERT INTO `tbl_correspondencia` (`pkidCorrespondencia`, `tipoCorrespondencia`, `frecCorrespondencia`, `estCorrespondencia`, `fentrCorrespondencia`, `fkidTrabajador`, `fkidInmueble`) VALUES
(1, 'Acta de Asamblea', '2023-07-08', 'Entregado', '2023-07-08', 3, 1),
(2, 'Recibo Agua', '2023-07-09', 'No Entregado', '0000-00-00', 3, 2),
(3, 'Recibo Luz', '2023-07-10', 'Entregado', '2023-07-10', 3, 3),
(4, 'Recibo Gas', '2023-07-11', 'No Entregado', '0000-00-00', 3, 4),
(5, 'Recibo Internet', '2023-07-12', 'Entregado', '2023-07-12', 3, 5),
(6, 'Paquete', '2023-07-13', 'No Entregado', '0000-00-00', 3, 6),
(7, 'Paquete Banco', '2023-07-14', 'Entregado', '2023-07-14', 3, 7),
(8, 'Acta de Asamblea', '2023-07-15', 'No Entregado', '0000-00-00', 3, 8),
(9, 'Recibo Agua', '2023-07-16', 'Entregado', '2023-07-16', 3, 9),
(10, 'Recibo Luz', '2023-07-16', 'No Entregado', '0000-00-00', 3, 10),
(11, 'Recibo Gas', '2023-07-17', 'Entregado', '2023-07-17', 3, 11),
(12, 'Recibo Internet', '2023-07-18', 'No Entregado', '0000-00-00', 3, 12),
(13, 'Paquete', '2023-07-19', 'Entregado', '2023-07-19', 3, 13),
(14, 'Paquete Banco', '2023-07-20', 'No Entregado', '0000-00-00', 3, 14),
(15, 'Carta reunion', '2023-07-21', 'Entregado', '2023-07-21', 3, 15),
(16, 'Recibo Agua', '2023-07-22', 'No Entregado', '0000-00-00', 3, 16),
(17, 'Recibo Luz', '2023-07-23', 'Entregado', '2023-07-23', 3, 17),
(18, 'Recibo Gas', '2023-07-24', 'No Entregado', '0000-00-00', 3, 18),
(19, 'Recibo Internet', '2023-07-25', 'Entregado', '2023-07-25', 3, 19),
(20, 'Paquete', '2023-07-26', 'No Entregado', '0000-00-00', 3, 20),
(21, 'Carta Reunion', '2023-07-27', 'Entregado', '2023-07-27', 3, 21),
(22, 'Acta de Asamblea', '2023-07-28', 'No Entregado', '0000-00-00', 3, 22),
(23, 'Recibo Agua', '2023-07-29', 'Entregado', '2023-07-29', 3, 23),
(24, 'Recibo Luz', '2023-07-30', 'No Entregado', '0000-00-00', 3, 24),
(25, 'Recibo Luz', '2023-08-01', 'Entregado', '2023-08-01', 3, 25),
(26, 'Recibo Internet', '2023-08-02', 'No Entregado', '0000-00-00', 3, 26),
(27, 'Paquete', '2023-08-03', 'Entregado', '2023-08-03', 3, 27),
(28, 'Paquete Banco', '2023-08-04', 'No Entregado', '0000-00-00', 3, 28),
(29, 'Acta de Asamblea', '2023-08-05', 'Entregado', '2023-08-05', 3, 29),
(30, 'Recibo Agua', '2023-08-06', 'No Entregado', '0000-00-00', 3, 30),
(31, 'Recibo Luz', '2023-08-07', 'Entregado', '2023-08-07', 3, 31),
(32, 'Recibo Gas', '2023-08-08', 'No Entregado', '0000-00-00', 3, 32),
(33, 'Recibo Internet', '2023-08-09', 'Entregado', '2023-08-09', 3, 33),
(34, 'Paquete', '2023-08-10', 'No Entregado', '0000-00-00', 3, 34),
(35, 'Paquete Banco', '2023-08-11', 'Entregado', '2023-08-11', 3, 35),
(36, 'Acta de Asamblea', '2023-08-12', 'No Entregado', '0000-00-00', 3, 36),
(37, 'Recibo Agua', '2023-08-13', 'Entregado', '2023-08-13', 3, 37),
(38, 'Recibo Luz', '2023-08-14', 'No Entregado', '0000-00-00', 3, 38),
(39, 'Recibo Administracion', '2023-08-15', 'Entregado', '2023-08-15', 3, 39),
(40, 'Recibo Internet', '2023-08-16', 'No Entregado', '0000-00-00', 3, 40),
(41, 'Paquete', '2023-08-17', 'Entregado', '2023-08-17', 3, 41),
(42, 'Recibo Administracion', '2023-08-18', 'No Entregado', '0000-00-00', 3, 42),
(43, 'Acta de Asamblea', '2023-08-19', 'Entregado', '2023-08-19', 3, 43),
(44, 'Recibo Administracion', '2023-08-20', 'No Entregado', '0000-00-00', 3, 44),
(45, 'Recibo Luz', '2023-08-21', 'Entregado', '2023-08-21', 3, 45),
(46, 'Recibo Gas', '2023-08-22', 'No Entregado', '0000-00-00', 3, 46),
(47, 'Recibo Internet', '2023-08-23', 'Entregado', '2023-08-23', 3, 47),
(48, 'Paquete', '2023-08-24', 'No Entregado', '0000-00-00', 3, 48),
(49, 'Paquete Banco', '2023-08-25', 'Entregado', '2023-08-25', 3, 49),
(50, 'Acta de Asamblea', '2023-08-26', 'No Entregado', '0000-00-00', 3, 50),
(51, 'Paquete', '2023-09-15', 'Entregado', '2023-09-22', 3, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_docsadmin`
--

CREATE TABLE `tbl_docsadmin` (
  `pkidDocsAdmin` int(11) NOT NULL,
  `classDocsAdmin` varchar(30) NOT NULL,
  `petiDocsAdmin` varchar(30) NOT NULL,
  `fkidTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_docsadmin`
--

INSERT INTO `tbl_docsadmin` (`pkidDocsAdmin`, `classDocsAdmin`, `petiDocsAdmin`, `fkidTrabajador`) VALUES
(1, 'Estado cartera', '2023 Enero', 2),
(2, 'Estado cartera', '2022 Marzo', 2),
(3, 'Estado cartera', '2021 Abril', 2),
(4, 'Estado cartera', '2020 Mayo', 2),
(5, 'Estado cartera', '2019 Marzo', 2),
(6, 'Estado cartera', '2018 Abril', 2),
(7, 'Estado cartera', '2017 Marzo', 2),
(8, 'Estado cartera', '2016 Enero', 2),
(9, 'Estado cartera', '2015 Mayo', 2),
(10, 'Estado cartera', '2014 Mayo', 2),
(11, 'Presupuesto', '2023 Enero', 2),
(12, 'Estado financiero', '2023 Enero', 2),
(13, 'Presupuesto', '2022 Marzo', 2),
(14, 'Estado financiero', '2022 Marzo', 2),
(15, 'Presupuesto', '2021 Abril', 2),
(16, 'Estado financiero', '2021 Abril', 2),
(17, 'Presupuesto', '2020 Mayo', 2),
(18, 'Estado financiero', '2020 Mayo', 2),
(19, 'Presupuesto', '2019 Marzo', 2),
(20, 'Estado financiero', '2019 Marzo', 2),
(21, 'Presupuesto', '2018 Abril', 2),
(22, 'Estado financiero', '2018 Abril', 2),
(23, 'Presupuesto', '2017 Marzo', 2),
(24, 'Estado financiero', '2017 Marzo', 2),
(25, 'Presupuesto', '2016 Enero', 2),
(26, 'Estado financiero', '2016 Enero', 2),
(27, 'Presupuesto', '2015 Mayo', 2),
(28, 'Estado financiero', '2015 Mayo', 2),
(29, 'Presupuesto', '2014 Mayo', 2),
(30, 'Estado financiero', '2014 Mayo', 2),
(31, 'Manual de convivencia', '2023', 2),
(32, 'Actas de Asamblea', '2023 Enero', 2),
(33, 'Actas de Asamblea', '2022 Marzo', 2),
(34, 'Actas de Asamblea', '2021 Abril', 2),
(35, 'Actas de Asamblea', '2020 Mayo', 2),
(36, 'Actas de Asamblea', '2019 Marzo', 2),
(37, 'Actas de Asamblea', '2018 Abril', 2),
(38, 'Actas de Asamblea', '2017 Marzo', 2),
(39, 'Actas de Asamblea', '2016 Enero', 2),
(40, 'Actas de Asamblea', '2015 Mayo', 2),
(41, 'Actas de Asamblea', '2014 Mayo', 2),
(42, 'Poliza', '2023 Enero', 2),
(43, 'Poliza', '2022 Marzo', 2),
(44, 'Poliza', '2021 Abril', 2),
(45, 'Poliza', '2020 Mayo', 2),
(46, 'Poliza', '2019 Marzo', 2),
(47, 'Poliza', '2018 Abril', 2),
(48, 'Poliza', '2017 Marzo', 2),
(49, 'Poliza', '2016 Enero', 2),
(50, 'Poliza', '2015 Mayo', 2),
(51, 'Poliza', '2014 Agosto', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_estcartera`
--

CREATE TABLE `tbl_estcartera` (
  `pkidEstCartera` int(11) NOT NULL,
  `docEstCartera` varchar(50) NOT NULL,
  `estCartera` varchar(30) NOT NULL,
  `taccEstCartera` varchar(20) NOT NULL,
  `notiEstCartera` varchar(35) DEFAULT NULL,
  `fkidInmueble` int(11) DEFAULT NULL,
  `fkidTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_estcartera`
--

INSERT INTO `tbl_estcartera` (`pkidEstCartera`, `docEstCartera`, `estCartera`, `taccEstCartera`, `notiEstCartera`, `fkidInmueble`, `fkidTrabajador`) VALUES
(1, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 1, 2),
(2, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 4, 2),
(3, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 5, 2),
(4, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 8, 2),
(5, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 9, 2),
(6, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 12, 2),
(7, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 13, 2),
(8, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 16, 2),
(9, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 17, 2),
(10, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 20, 2),
(11, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 21, 2),
(12, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 24, 2),
(13, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 25, 2),
(14, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 28, 2),
(15, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 29, 2),
(16, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 32, 2),
(17, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 33, 2),
(18, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 36, 2),
(19, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 37, 2),
(20, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 40, 2),
(21, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 41, 2),
(22, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 44, 2),
(23, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 45, 2),
(24, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 48, 2),
(25, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 49, 2),
(26, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 1, 2),
(27, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 4, 2),
(28, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 5, 2),
(29, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 8, 2),
(30, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 9, 2),
(31, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 12, 2),
(32, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 13, 2),
(33, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 16, 2),
(34, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 17, 2),
(35, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 20, 2),
(36, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 21, 2),
(37, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 24, 2),
(38, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 25, 2),
(39, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 28, 2),
(40, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 29, 2),
(41, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 32, 2),
(42, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 33, 2),
(43, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 36, 2),
(44, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 37, 2),
(45, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 40, 2),
(46, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 41, 2),
(47, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 44, 2),
(48, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 45, 2),
(49, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 48, 2),
(50, 'carta acuerdo pago.pdf', 'Mora', 'Bloqueado', 'Notificar residente', 49, 2),
(51, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 2, 2),
(52, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 3, 2),
(53, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 6, 2),
(54, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 7, 2),
(55, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 10, 2),
(56, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 11, 2),
(57, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 14, 2),
(58, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 15, 2),
(59, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 18, 2),
(60, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 19, 2),
(61, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 22, 2),
(62, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 23, 2),
(63, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 26, 2),
(64, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 27, 2),
(65, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 30, 2),
(66, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 31, 2),
(67, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 34, 2),
(68, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 35, 2),
(69, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 38, 2),
(70, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 39, 2),
(71, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 42, 2),
(72, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 43, 2),
(73, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 46, 2),
(74, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 47, 2),
(75, 'certificado.pdf', 'Paz y salvo', 'Permitido', NULL, 50, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inmueble`
--

CREATE TABLE `tbl_inmueble` (
  `pkidInmueble` int(11) NOT NULL,
  `andInmueble` int(11) NOT NULL,
  `numInmueble` int(11) NOT NULL,
  `fkidResidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_inmueble`
--

INSERT INTO `tbl_inmueble` (`pkidInmueble`, `andInmueble`, `numInmueble`, `fkidResidente`) VALUES
(1, 1, 1, 5),
(2, 3, 65, 6),
(3, 2, 35, 7),
(4, 5, 102, 9),
(5, 8, 164, 10),
(6, 9, 205, 11),
(7, 10, 224, 12),
(8, 1, 30, 13),
(9, 4, 89, 14),
(10, 5, 111, 15),
(11, 6, 117, 16),
(12, 7, 140, 17),
(13, 8, 186, 18),
(14, 9, 196, 19),
(15, 10, 240, 20),
(16, 1, 3, 21),
(17, 2, 40, 22),
(18, 3, 80, 23),
(19, 4, 101, 24),
(20, 5, 115, 25),
(21, 6, 139, 26),
(22, 7, 150, 27),
(23, 8, 170, 28),
(24, 9, 202, 29),
(25, 1, 2, 8),
(26, 1, 7, 30),
(27, 2, 61, 31),
(28, 3, 79, 32),
(29, 4, 92, 33),
(30, 5, 104, 34),
(31, 6, 124, 35),
(32, 7, 157, 36),
(33, 8, 176, 37),
(34, 9, 210, 38),
(35, 1, 4, 39),
(36, 1, 6, 40),
(37, 2, 55, 41),
(38, 3, 81, 42),
(39, 4, 94, 43),
(40, 5, 110, 44),
(41, 6, 139, 45),
(42, 7, 152, 46),
(43, 8, 168, 47),
(44, 9, 199, 48),
(45, 10, 222, 49),
(46, 1, 5, 50),
(47, 2, 45, 51),
(48, 3, 74, 52),
(49, 10, 218, 53),
(50, 9, 211, 54),
(51, 1, 8, 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_integrante`
--

CREATE TABLE `tbl_integrante` (
  `pkidIntegrante` int(11) NOT NULL,
  `tipIntegrante` varchar(20) NOT NULL,
  `nomIntegrante` varchar(35) NOT NULL,
  `edIntegrante` int(11) NOT NULL,
  `nacIntegrante` date NOT NULL,
  `fkidResidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_multa`
--

CREATE TABLE `tbl_multa` (
  `pkidMulta` int(11) NOT NULL,
  `ninmMulta` int(11) NOT NULL,
  `tipoMulta` varchar(30) NOT NULL,
  `fecMulta` date NOT NULL,
  `evidMulta` varchar(35) NOT NULL,
  `valMulta` int(11) NOT NULL,
  `fpagMulta` date DEFAULT NULL,
  `fkidInmueble` int(11) DEFAULT NULL,
  `fkidTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_multa`
--

INSERT INTO `tbl_multa` (`pkidMulta`, `ninmMulta`, `tipoMulta`, `fecMulta`, `evidMulta`, `valMulta`, `fpagMulta`, `fkidInmueble`, `fkidTrabajador`) VALUES
(5, 104, 'Estacionamiento indebido', '2023-01-10', 'Multa.pdf', 100000, '2023-02-10', 5, 2),
(8, 4, 'No recoger excrementos', '2023-02-18', '', 50000, '2023-03-15', 8, 2),
(9, 22, 'Exceso de velocidad', '2023-03-03', 'Multa.pdf', 50000, '2023-04-15', 9, 2),
(10, 37, 'Ruido excesivo', '2023-01-26', 'Multa.pdf', 100000, '2023-02-15', 10, 2),
(11, 41, 'Mascota sin correa', '2023-02-14', 'Multa.pdf', 50000, '2023-03-10', 11, 2),
(12, 35, 'Inasistencia a reunion', '2023-06-09', 'Multa.pdf', 100000, '2023-07-15', 12, 2),
(13, 43, 'No recoger excrementos', '2022-08-19', 'Multa.pdf', 50000, '2022-09-10', 13, 2),
(14, 190, 'Discusion con vecino', '2022-06-14', 'Multa.pdf', 100000, '2022-06-30', 14, 2),
(15, 201, 'Discusion con vecino', '2022-06-27', 'Multa.pdf', 100000, '2022-06-30', 15, 2),
(16, 175, 'Ruido excesivo', '2022-07-14', 'Multa.pdf', 100000, '2022-08-10', 16, 2),
(17, 184, 'No recoger excrementos', '2022-09-25', 'Multa.pdf', 50000, '2022-10-11', 17, 2),
(18, 200, 'Mascota sin bozal', '2023-02-28', 'Multa.pdf', 100000, '2023-03-15', 18, 2),
(19, 33, 'Estacionamiento indebido', '2023-01-01', 'Multa.pdf', 100000, '2023-05-10', 19, 2),
(20, 44, 'No recoger excrementos', '2022-05-20', 'Multa.pdf', 50000, '2022-06-10', 20, 2),
(21, 55, 'Mascota sin correa', '2022-02-05', 'Multa.pdf', 50000, '2022-03-05', 21, 2),
(22, 64, 'Inasistencia a asamblea', '2023-03-12', 'Multa.pdf', 150000, '2023-04-15', 22, 2),
(23, 73, 'Inasistencia a asamblea', '2023-03-12', 'Multa.pdf', 150000, '2023-04-15', 23, 2),
(24, 80, 'Uso indebido de areas comunes', '2022-04-15', 'Multa.pdf', 100000, '2022-05-10', 24, 2),
(25, 93, 'Mascota sin correa', '2022-06-25', 'Multa.pdf', 50000, '2022-07-25', 25, 2),
(26, 6, 'Romper vidrios', '2022-08-04', 'Multa.pdf', 150000, '2022-10-15', 26, 2),
(27, 27, 'Golpe a vehiculo', '2022-11-19', 'Multa.pdf', 150000, '2022-12-15', 27, 2),
(28, 19, 'Estacionamiento indebido', '2023-01-29', 'Multa.pdf', 100000, '2023-02-15', 28, 2),
(29, 8, 'Mascota sin correa', '2022-09-09', 'Multa.pdf', 50000, '2022-10-10', 29, 2),
(30, 11, 'Mascota sin bozal', '2022-10-14', 'Multa.pdf', 100000, '2022-11-10', 30, 2),
(31, 18, 'Ruido excesivo', '2022-12-24', 'Multa.pdf', 100000, '2023-01-10', 31, 2),
(32, 21, 'Golpe a vehiculo', '2023-03-05', 'Multa.pdf', 150000, '2023-04-15', 32, 2),
(33, 32, 'Inasistencia a asamblea', '2023-03-12', 'Multa.pdf', 150000, '2023-04-15', 33, 2),
(34, 24, 'Uso indebido de areas comunes', '2023-06-20', 'Multa.pdf', 100000, '2023-07-11', 34, 2),
(35, 5, 'No recoger desechos de mascota', '2023-07-25', 'Multa.pdf', 50000, '2023-08-15', 35, 2),
(36, 7, 'Mascota sin correa', '2023-08-30', 'Multa.pdf', 50000, '2023-09-15', 36, 2),
(37, 14, 'Ruido excesivo', '2023-05-06', 'Multa.pdf', 100000, '2023-06-15', 37, 2),
(38, 29, 'Mantenimiento a vehiculo', '2023-01-19', 'Multa.pdf', 50000, '2023-02-15', 38, 2),
(39, 9, 'Inasistencia a asamblea', '2022-04-20', 'Multa.pdf', 150000, '2022-05-20', 39, 2),
(40, 85, 'Mascota sin correa', '2023-08-21', 'Multa.pdf', 50000, '2023-09-21', 40, 2),
(41, 12, 'Ruido excesivo', '2022-09-26', '', 100000, '2022-10-15', 41, 2),
(42, 7, 'Discusion con vecino', '2022-10-30', 'Multa.pdf', 100000, '2022-12-15', 42, 2),
(43, 94, 'Vehiculo mal estacionado', '2023-10-31', 'Multa.pdf', 100000, '2023-11-15', 43, 2),
(44, 87, 'Mantenimiento vehiculo', '2022-10-14', 'Multa.pdf', 50000, '2022-11-15', 44, 2),
(45, 16, 'Lavar vehiculo en conjunto', '2023-06-11', 'Multa.pdf', 50000, '2023-07-30', 45, 2),
(46, 31, 'Discusion con vecino', '2023-08-21', 'Multa.pdf', 100000, '2023-09-15', 46, 2),
(49, 30, 'Mantenimiento vehiculo', '2023-05-15', 'Multa.pdf', 50000, '2023-06-15', 49, 2),
(50, 1, 'Ruido excesivo', '2023-08-30', 'Multa.pdf', 100000, '2023-09-15', 50, 2),
(61, 204, 'Ruido Excesivo', '2023-09-03', '', 25000, '2023-09-14', NULL, 2),
(62, 1, 'No recoger excrementos', '2023-08-16', '', 3222, '2023-09-09', NULL, 2),
(69, 150, 'Estacionamiento indebido', '2023-09-05', '', 250000, '2023-09-15', NULL, 2),
(81, 8, 'No recoger excrementos', '2023-09-14', '', 150000, NULL, 8, 2),
(82, 1, 'Mascota sin correa', '2023-09-23', '', 150000, NULL, 1, 2),
(83, 2, 'Ruido Excesivo', '2023-09-16', '', 250000, NULL, 2, 2),
(84, 3, 'Estacionamiento indebido', '2023-09-30', '', 500000, NULL, 3, 2),
(85, 10, 'Mascota sin bozal', '2023-09-21', '', 150000, NULL, 10, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_novedades`
--

CREATE TABLE `tbl_novedades` (
  `pkidNovedades` int(11) NOT NULL,
  `remNovedades` varchar(30) NOT NULL,
  `TipoNovedad` varchar(45) NOT NULL,
  `asuntoNovedades` varchar(65) NOT NULL,
  `descNovedades` varchar(65) NOT NULL,
  `docNovedades` varchar(35) NOT NULL,
  `fecNovedades` date NOT NULL,
  `resNovedades` varchar(30) NOT NULL,
  `estNovedades` varchar(25) NOT NULL,
  `fkidTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_novedades`
--

INSERT INTO `tbl_novedades` (`pkidNovedades`, `remNovedades`, `TipoNovedad`, `asuntoNovedades`, `descNovedades`, `docNovedades`, `fecNovedades`, `resNovedades`, `estNovedades`, `fkidTrabajador`) VALUES
(2, 'David Perez', 'Administrador', 'Solicitud Camara Seguridad', 'Permiso para obtener grabaciones de las camar', 'documentonovedad.pdf', '2023-08-02', 'Programar revision', 'Espera', 2),
(3, 'Juanes Olaya', 'Vigilante', 'Solicitud Reunion con vecino', 'Quejas de ruido', 'documentonovedad.pdf', '2023-08-03', 'conciliacion con vecinos', 'Solicitud Atendida', 3),
(4, 'Johanna Pinto', 'Residente', 'Solicitud Reunion con administracion', 'Para hablar sobre documentos', 'documentonovedad.pdf', '2023-08-04', 'programar reunion', 'Espera', 1),
(5, 'Valentina Morales', 'Vigilante', 'Solicitud permiso laboral', 'Solicitud permiso laboral', 'documentonovedad.pdf', '2023-08-05', 'Revision turnos', 'Espera', 3),
(6, 'Daniela Ramirez', 'Residente', 'Solicitud Zonas Comunes', 'Reporte de danos en las areas comunes', 'documentonovedad.pdf', '2023-08-06', 'verificar danos', 'Solicitud Atendida', 1),
(7, 'Alejandro Castro', 'Todero', 'Solicitud permiso laboral', 'Solicitud permiso laboral', 'documentonovedad.pdf', '2023-08-07', 'Revision cronograma', 'Espera', 4),
(8, 'Carolina Rojas', 'Vigilante', 'Solicitud Reunion con vecino', 'Quejas por ruido excesivo proveniente del vec', 'documentonovedad.pdf', '2023-08-08', 'citar vecinos', 'Solicitud Atendida', 3),
(9, 'Ricardo Sanchez', 'Vigilante', 'Solicitud Reunion con administrador', 'Asuntos pendientes relacionados con la administracion', 'documentonovedad.pdf', '2023-08-09', 'programar reunion', 'Espera', 3),
(10, 'Maria Torres', 'Todero', 'Solicitud Anden', 'Problemas con la instalacion electrica del anden', 'documentonovedad.pdf', '2023-08-10', 'cita con el electricista', 'Espera', 4),
(11, 'Andrea Gomez', 'Todero', 'Solicitud Zonas Comunes', 'Reporte de problemas con el uso de las areas ', 'documentonovedad.pdf', '2023-08-11', 'revisar camaras', 'Solicitud Atendida', 4),
(12, 'Sebastian Rios', 'Administrador', 'Solicitud Camara Seguridad', 'Autorizacion para revision de camaras', 'documentonovedad.pdf', '2023-08-12', 'revision de camaras', 'Solicitud Atendida', 2),
(13, 'Laura Medina', 'Vigilante', 'Solicitud Reunion con vecino', 'Problemas de convivencia con el vecino', 'documentonovedad.pdf', '2023-08-13', 'conciliacion con vecinos', 'Solicitud Atendida', 3),
(14, 'Carlos Paredes', 'Todero', 'Solicitud Reunion con administrador', 'Solicitar informacion sobre el mantenimiento ', 'documentonovedad.pdf', '2023-08-14', 'programar reunion', 'Espera', 4),
(15, 'Valeria Vargas', 'Vigilante', 'Solicitud permiso laboral', 'Solicitud permiso laboral ', 'documentonovedad.pdf', '2023-08-15', 'Revisar cronograma', 'Espera', 3),
(16, 'Juan Ramirez', 'Todero', 'Solicitud Zonas Comunes', 'Uso inadecuado de las areas de recreacion', 'documentonovedad.pdf', '2023-08-16', 'revisar camaras', 'Solicitud Atendida', 4),
(17, 'Daniela Castro', 'Vigilante', 'Solicitud Camara Seguridad', 'Revision de las grabaciones de seguridad ', 'documentonovedad.pdf', '2023-08-17', 'programar revision camaras', 'Espera', 3),
(18, 'Andres Rios', 'Vigilante', 'Solicitud Reunion con vecino', 'Quejas por ruido excesivo proveniente del vecino', 'documentonovedad.pdf', '2023-08-18', 'conciliacion vecinos', 'Solicitud Atendida', 3),
(19, 'Marta Lopez', 'Todero', 'Solicitud Reunion con administrador', 'Discutir temas relacionados con el mantenimie', 'documentonovedad.pdf', '2023-08-19', 'programar reunion', 'Espera', 4),
(20, 'Alejandro Torres', 'Administrador', 'Solicitud Anden', 'Problemas con el anden 3', 'documentonovedad.pdf', '2023-08-20', 'convocar reunion anden', 'Espera', 2),
(21, 'Laura Vargas', 'Todero', 'Solicitud Zonas Comunes', 'Reporte de problemas con el uso de las areas ', 'documentonovedad.pdf', '2023-08-21', 'dialogar con vecinos', 'Solicitud Atendida', 4),
(22, 'David Chavarro', 'Vigilante', 'Solicitud permiso laboral', 'Solicitud permiso laboral', 'documentonovedad.pdf', '2023-08-22', 'Revision turnos', 'Espera', 3),
(23, 'Maria Mendoza', 'Vigilante', 'Solicitud Reunion con vecino', '', '', '2023-08-23', 'dialogar con vecino', 'Solicitud Atendida', 3),
(24, 'Juan Paredes', '', 'Solicitud Reunion con administrador', 'Solicitar informacion sobre las normas del co', 'documentonovedad.pdf', '2023-08-24', 'programar reunion', 'Espera', 1),
(25, '', '', 'Solicitud Anden ', 'Problemas con el anden 5', 'documentonovedad.pdf', '2023-08-25', 'Convocar reunion anden', 'Solicitud No atendida', 0),
(26, 'Carlos Soto', '', 'Solicitud Zonas Comunes', 'Informar sobre desperfectos en las areas', 'documentonovedad.pdf', '2023-08-26', 'verificar desperfectos', 'Solicitud Atendida', 0),
(27, 'Daniela Vargas', '', 'Solicitud Camara Seguridad', 'Autorizacion para acceder a las grabaciones d', 'documentonovedad.pdf', '2023-08-27', 'revision camaras', 'Solicitud Atendida', 0),
(28, 'Alejandro Rodriguez', '', 'Solicitud Reunion con vecino', 'Quejas por problemas de convivencia con un ve', 'documentonovedad.pdf', '2023-08-28', 'conciliacion vecinos', 'Solicitud Atendida', 0),
(29, 'Carolina Gomez', '', 'Solicitud Reunion con administ', 'Solicitar mejoras en las areas comunes', 'documentonovedad.pdf', '2023-08-29', 'programar reunion', 'Solicitud Atendida', 0),
(30, 'Jose Torres', '', 'Solicitud Anden', 'Problemas con el anden 8', 'documentonovedad.pdf', '2023-08-30', 'verificar problemas en anden', 'Solicitud Atendida', 0),
(31, 'Laura Chavarro', '', 'Solicitud Zonas Comunes', 'Problemas con el uso de las areas comunes', 'documentonovedad.pdf', '2023-08-31', 'enviar comunicado', 'Solicitud Atendida', 0),
(32, 'David Perez', '', 'Solicitud Camara Seguridad', 'Permiso para obtener grabaciones de las camar', 'documentonovedad.pdf', '2023-09-01', 'analizar solicitud', 'Solicitud No Atendida', 0),
(33, 'Juanes Salazar', '', 'Solicitud Reunion con vecino', 'Quejas de ruido', 'documentonovedad.pdf', '2023-09-02', 'citar residente', 'Solicitud Atendida', 0),
(34, 'Johanna Gomez', '', 'Solicitud Reunion con administ', 'Para hablar sobre documentos', 'documentonovedad.pdf', '2023-09-03', 'programar reunion', 'Solicitud No Atendida', 0),
(35, 'Valentina Morales', '', 'Solicitud Anden', 'Problemas con el anden 9', 'documentonovedad.pdf', '2023-09-04', 'hablar con consejo', 'Solicitud No atendida', 0),
(36, 'Pedro Martinez', '', 'Solicitud Zonas Comunes', 'Problemas con el uso de las areas comunes', 'documentonovedad.pdf', '2023-09-05', 'verificar estado zonas', 'Solicitud Atendida', 0),
(37, 'Andrea Lopez', '', 'Solicitud Camara Seguridad', 'Acceso a las grabaciones de seguridad', 'documentonovedad.pdf', '2023-09-06', 'programar revision camaras', 'Solicitud No Atendida', 0),
(38, 'Sebastian Ramirez', '', 'Solicitud Reunion con vecino', 'Quejas por problemas de estacionamiento', 'documentonovedad.pdf', '2023-09-07', 'informar al residente', 'Solicitud Atendida', 0),
(39, 'Carolina Castro', '', 'Solicitud Reunion con administ', 'Solicitar mejoras en las areas comunes', 'documentonovedad.pdf', '2023-09-08', 'programar reunion consejo', 'Solicitud No Atendida', 0),
(40, 'Natalia Rojas', '', 'Solicitud Anden', 'Problemas con la instalacion electrica del an', 'documentonovedad.pdf', '2023-09-09', 'llamar electricista', 'Solicitud No atendida', 0),
(41, 'Juan Perez', '', 'Solicitud Zonas Comunes', 'Reporte de problemas con el uso de las zonas ', 'documentonovedad.pdf', '2023-09-10', 'verificar estado de zona', 'Solicitud Atendida', 0),
(42, 'Maria Rodriguez', '', 'Solicitud Camara Seguridad', 'Autorizacion para acceder a las grabaciones d', 'documentonovedad.pdf', '2023-09-11', 'programar revision camaras', 'Solicitud Atendida', 0),
(43, 'Andres Lopez', '', 'Solicitud Reunion con vecino', 'Quejas por problemas de convivencia con un ve', 'documentonovedad.pdf', '2023-09-12', 'conciliacion vecinos', 'Solicitud Atendida', 0),
(44, 'Johanna Carrascal', '', 'Solicitud Reunion con administ', 'Solicitar informacion sobre el reciclaje', 'documentonovedad.pdf', '2023-09-13', 'programar reunion', 'Solicitud No Atendida', 0),
(45, 'Valentina Morales', '', 'Solicitud Anden', 'Informar sobre problemas poda arboles', 'documentonovedad.pdf', '2023-09-14', 'hablar con el todero', 'Solicitud No atendida', 0),
(46, 'Laura Vargas', '', 'Solicitud Zonas Comunes', 'Problemas con el uso de las areas recreativas', 'documentonovedad.pdf', '2023-09-15', 'informar residentes', 'Solicitud Atendida', 0),
(47, 'David Gomez', '', 'Solicitud Camara Seguridad', 'Permiso para acceder a las grabaciones de las', 'documentonovedad.pdf', '2023-09-16', 'programar revision', 'Solicitud No Atendida', 0),
(48, 'Maria Ocampo', '', 'Solicitud Reunion con vecino', 'Quejas por malos olores provenientes del veci', 'documentonovedad.pdf', '2023-09-17', 'citar residente', 'Solicitud Atendida', 0),
(49, 'Juan Paredes', '', 'Solicitud Reunion con administ', 'Solicitar informacion sobre las normas del co', 'documentonovedad.pdf', '2023-09-18', 'programar reunion', 'Solicitud No Atendida', 0),
(50, 'Valeria Rios', '', 'Solicitud Anden', 'Problemas con lamparas anden 5', 'documentonovedad.pdf', '2023-09-19', 'verificar estado lamparas', 'Solicitud No atendida', 0),
(51, 'Dan Reynolds', 'Residente', 'Solicitud zonas comunes', 'danos en las zonas', 'formulario.txt', '2023-09-21', 'Solicitud zonas comunes', 'Solicitud Inmueble', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_parqueadero`
--

CREATE TABLE `tbl_parqueadero` (
  `pkidParqueadero` int(11) NOT NULL,
  `tipoParqueadero` varchar(30) NOT NULL,
  `EstadoParqueadero` varchar(30) NOT NULL,
  `fecParqueadero` datetime DEFAULT NULL,
  `dtveParqueadero` varchar(45) DEFAULT NULL,
  `cupParqueadero` int(11) NOT NULL,
  `Horasalida` datetime DEFAULT NULL,
  `tarParqueadero` int(11) NOT NULL,
  `fkidResidente` int(11) NOT NULL,
  `fkidVisitante` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_parqueadero`
--

INSERT INTO `tbl_parqueadero` (`pkidParqueadero`, `tipoParqueadero`, `EstadoParqueadero`, `fecParqueadero`, `dtveParqueadero`, `cupParqueadero`, `Horasalida`, `tarParqueadero`, `fkidResidente`, `fkidVisitante`) VALUES
(45, 'comunal carro', 'Inhabilitado', '2023-06-15 08:13:00', 'BMW-672 BMW Negro', 1, NULL, 45000, 5, NULL),
(46, 'comunal moto', 'Inhabilitado', '2023-03-05 11:00:00', 'MRC-384 Mercedes Rojo', 8, NULL, 38000, 6, NULL),
(47, 'visitante carro', '', NULL, '', 2, NULL, 5000, 7, 3),
(48, 'visitante moto', '', '0000-00-00 00:00:00', '', 6, '0000-00-00 00:00:00', 5000, 8, 4),
(49, 'comunal carro', 'Inhabilitado', '2023-04-27 12:26:00', 'VLV-157 Volvo Plateado', 26, NULL, 45000, 9, NULL),
(50, 'comunal carro', '', '0000-00-00 00:00:00', '', 30, '0000-00-00 00:00:00', 45000, 10, NULL),
(51, 'comunal carro', '', '0000-00-00 00:00:00', '', 4, '0000-00-00 00:00:00', 45000, 11, NULL),
(52, 'comunal carro', 'Inhabilitado', '2023-12-30 14:23:00', 'HND-823 Honda Negro', 24, NULL, 45000, 12, NULL),
(53, 'comunal carro', '', '0000-00-00 00:00:00', '', 41, '0000-00-00 00:00:00', 45000, 13, NULL),
(54, 'comunal carro', '', '0000-00-00 00:00:00', '', 42, '0000-00-00 00:00:00', 45000, 14, NULL),
(55, 'comunal moto', 'Inhabilitado', '2023-09-29 15:42:00', 'VWS-241 Volkswagen Rojo', 27, NULL, 38000, 15, NULL),
(56, 'comunal moto', '', '0000-00-00 00:00:00', '', 7, '0000-00-00 00:00:00', 38000, 16, NULL),
(57, 'comunal moto', '', '0000-00-00 00:00:00', '', 41, '0000-00-00 00:00:00', 38000, 17, NULL),
(58, 'comunal moto', 'Inhabilitado', '2023-10-19 13:12:00', 'KIA-736 KIA Azul', 2, NULL, 38000, 18, NULL),
(59, 'visitante carro', '', '0000-00-00 00:00:00', '', 43, '0000-00-00 00:00:00', 5000, 19, 5),
(60, 'comunal moto', '', '0000-00-00 00:00:00', '', 43, '0000-00-00 00:00:00', 38000, 20, NULL),
(61, 'visitante carro', 'Inhabilitado', '2023-01-09 10:13:00', 'MZD-619 Mazda Rojo', 20, '2023-01-09 11:44:14', 5000, 21, NULL),
(62, 'comunal moto', '', '0000-00-00 00:00:00', '', 44, '0000-00-00 00:00:00', 38000, 22, NULL),
(63, 'visitante carro', 'Inhabilitado', '2023-05-03 11:18:00', 'JAG-367 Jaguar Amarillo', 21, '2023-05-03 12:44:14', 5000, 23, NULL),
(64, 'comunal carro', '', '0000-00-00 00:00:00', '', 22, '0000-00-00 00:00:00', 45000, 24, NULL),
(65, 'comunal moto', 'Inhabilitado', '2023-01-09 11:18:00', 'RLL-418 Chevrolet Blanco', 1, NULL, 38000, 25, NULL),
(66, 'visitante carro', '', '0000-00-00 00:00:00', '', 27, '0000-00-00 00:00:00', 5000, 26, NULL),
(67, 'visitante moto', '', '0000-00-00 00:00:00', '', 45, '0000-00-00 00:00:00', 5000, 27, NULL),
(68, 'comunal carro', 'Inhabilitado', '2023-05-03 15:22:00', 'BNT-754 Mazda Negro', 3, NULL, 45000, 28, NULL),
(69, 'comunal moto', '', '0000-00-00 00:00:00', '', 11, '0000-00-00 00:00:00', 38000, 29, NULL),
(70, 'visitante carro', 'Inhabilitado', '2023-04-27 09:00:00', 'CDT-582 Chevrolet Azul', 5, '2023-04-27 15:44:14', 5000, 30, NULL),
(71, 'visitante carro', '', '0000-00-00 00:00:00', '', 6, '0000-00-00 00:00:00', 5000, 31, NULL),
(72, 'visitante moto', '', '0000-00-00 00:00:00', '', 12, '0000-00-00 00:00:00', 5000, 32, NULL),
(73, 'comunal carro', '', '0000-00-00 00:00:00', '', 13, '0000-00-00 00:00:00', 45000, 33, NULL),
(74, 'comunal moto', 'Inhabilitado', '2023-12-30 08:42:00', 'JEP-846 JEEP Azul', 3, NULL, 38000, 34, NULL),
(75, 'visitante carro', '', '0000-00-00 00:00:00', '', 7, '0000-00-00 00:00:00', 5000, 35, NULL),
(76, 'visitante carro', '', '0000-00-00 00:00:00', '', 19, '0000-00-00 00:00:00', 5000, 36, NULL),
(77, 'visitante moto', 'Inhabilitado', '2023-10-19 11:00:00', 'JEP-268 Renault Negro', 4, '2023-10-19 13:44:14', 5000, 37, NULL),
(78, 'comunal carro', '', '0000-00-00 00:00:00', '', 31, '0000-00-00 00:00:00', 45000, 38, NULL),
(79, 'comunal moto', '', '0000-00-00 00:00:00', '', 13, '0000-00-00 00:00:00', 38000, 39, NULL),
(80, 'visitante carro', 'Inhabilitado', '2023-01-16 07:09:00', 'MZD-734 Mazda Gris', 9, '2023-01-16 13:44:14', 5000, 40, NULL),
(81, 'comunal moto', '', '0000-00-00 00:00:00', '', 15, '0000-00-00 00:00:00', 38000, 41, NULL),
(82, 'comunal carro', 'Inhabilitado', '2023-07-31 08:26:00', 'BWM-584 BMW Gris', 8, NULL, 45000, 42, NULL),
(83, 'comunal moto', '', '0000-00-00 00:00:00', '', 14, '0000-00-00 00:00:00', 38000, 43, NULL),
(84, 'visitante moto', '', '0000-00-00 00:00:00', '', 18, '0000-00-00 00:00:00', 5000, 44, NULL),
(85, 'comunal carro', 'Inhabilitado', '2023-04-04 13:00:00', 'HYN-873 KIA Azul', 11, NULL, 45000, 45, NULL),
(86, 'comunal moto', '', '0000-00-00 00:00:00', '', 19, '0000-00-00 00:00:00', 38000, 46, NULL),
(87, 'visitante moto', '', '0000-00-00 00:00:00', '', 20, '0000-00-00 00:00:00', 5000, 47, NULL),
(88, 'comunal carro', 'Inhabilitado', '2023-05-01 12:00:00', 'BNT-516 Renault Rojo', 18, NULL, 45000, 48, NULL),
(89, 'comunal moto', '', '0000-00-00 00:00:00', '', 22, '0000-00-00 00:00:00', 38000, 49, NULL),
(90, 'comunal carro', '', '0000-00-00 00:00:00', '', 33, '0000-00-00 00:00:00', 45000, 50, NULL),
(91, 'comunal moto', 'Inhabilitado', '2023-09-08 08:19:00', 'JEP-937 Ford Negro', 5, NULL, 38000, 51, NULL),
(92, 'comunal carro', '', '0000-00-00 00:00:00', '', 32, '0000-00-00 00:00:00', 45000, 52, NULL),
(93, 'comunal moto', '', '0000-00-00 00:00:00', '', 23, '0000-00-00 00:00:00', 38000, 53, NULL),
(94, 'comunal carro', 'Inhabilitado', '2023-01-25 11:19:00', 'VWS-425 Ford Gris', 25, NULL, 45000, 54, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_residente`
--

CREATE TABLE `tbl_residente` (
  `pkidResidente` int(11) NOT NULL,
  `nomResidente` varchar(35) NOT NULL,
  `cedResidente` int(11) NOT NULL,
  `emaResidente` varchar(40) NOT NULL,
  `celResidente` int(11) NOT NULL,
  `mascResidente` tinyint(1) NOT NULL,
  `nmascResidente` int(11) DEFAULT NULL,
  `nintResidente` int(11) NOT NULL,
  `fkidRol` int(11) DEFAULT NULL,
  `fnacResidente` date NOT NULL,
  `edadResidente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_residente`
--

INSERT INTO `tbl_residente` (`pkidResidente`, `nomResidente`, `cedResidente`, `emaResidente`, `celResidente`, `mascResidente`, `nmascResidente`, `nintResidente`, `fkidRol`, `fnacResidente`, `edadResidente`) VALUES
(5, 'Orlando Diaz', 14244635, 'orlandodiazdelgado@hotmail.com', 2147483647, 1, 1, 4, 1, '1962-07-21', 60),
(6, 'Johanna Diaz', 1015439181, 'johanna1727@hotmail.com', 2147483647, 1, 1, 4, 1, '1993-06-27', 29),
(7, 'Adiela Rojas', 24350175, 'adielaa24@hotmail.com', 2147483647, 1, 1, 3, 1, '1966-04-18', 57),
(8, 'Ruben Garcia', 15840613, 'rubendgarcia@gmail.com', 2147483647, 0, 0, 4, 1, '1965-01-05', 58),
(9, 'Gonzalo Hernandez', 18314670, 'gonzalohernandez@hotmail.com', 2147483647, 0, 0, 3, 1, '1958-03-15', 65),
(10, 'Blanca Garzon', 20614917, 'blancagarzon@yahoo.com', 2147483647, 0, 0, 3, 1, '1951-11-26', 72),
(11, 'Jaime Robledo', 26240280, 'jaimealrobledo@hotmail.com', 2147483647, 0, 0, 1, 1, '1953-10-28', 70),
(12, 'Jairo Monroy', 34162348, 'jairomonroy@gmail.com', 2147483647, 1, 3, 4, 1, '1966-12-20', 57),
(13, 'Andrea Suarez', 45281346, 'andreabea@gmail.com', 2147483647, 0, 0, 4, 1, '1978-08-11', 45),
(14, 'Adonay Arias', 35482310, 'adonayarias@yahoo.com', 2147483647, 1, 2, 6, 1, '1969-07-24', 53),
(15, 'Diego Ruiz', 1101435648, 'diegoru@gmail.com', 2147483647, 1, 1, 1, 1, '2002-06-15', 20),
(16, 'Antonio Mateo', 1015027411, 'tonymateo@gmail.com', 2147483647, 1, 2, 3, 1, '1995-03-14', 27),
(17, 'Daniel Rodriguez', 1013471980, 'dannro@hotmail.com', 2147483647, 0, 0, 3, 1, '1987-07-14', 35),
(18, 'Ben Casas', 53161245, 'bencasas@gmail.com', 2147483647, 1, 1, 2, 1, '1987-04-07', 36),
(19, 'Camila Carrero', 1110456132, 'camilacar@gmail.com', 2147483647, 0, 0, 4, 1, '2006-11-15', 16),
(20, 'Ferney Bautista', 48321644, 'ferneybautista@hotmail.com', 2147483647, 1, 1, 4, 1, '1982-09-28', 40),
(21, 'Carlos Olivares', 1015284316, 'jcaolivares@gmail.com', 2147483647, 1, 2, 2, 1, '1992-01-09', 31),
(22, 'Andres Torres', 1011812346, 'andrestorres@gmail.com', 2147483647, 0, 0, 4, 1, '1988-12-07', 34),
(23, 'David Zarate', 27460310, 'davidzarate@gmail.com', 2147483647, 1, 1, 3, 1, '1962-03-18', 60),
(24, 'Juliana Salamanca', 1010462315, 'julisalamancar@gmail.com', 2147483647, 1, 1, 7, 1, '2004-11-18', 18),
(25, 'Santiago Ramirez', 1015846318, 'santirami@gmail.com', 2147483647, 1, 1, 4, 1, '2003-06-12', 19),
(26, 'Maria Rosales', 30482318, 'mariarosales@gmail.com', 2147483647, 0, 0, 2, 1, '1962-08-28', 60),
(27, 'Fernanda Martinez', 31141608, 'fernandamar@hotmail.com', 2147483647, 1, 3, 4, 1, '1985-12-23', 37),
(28, 'German Garcia', 29462134, 'gergarcia@gmail.com', 2147483647, 0, 0, 2, 1, '1953-05-24', 69),
(29, 'Felipe Diaz', 1015462313, 'fepdiaz@hotmail.com', 2147483647, 1, 1, 4, 1, '1995-06-01', 27),
(30, 'Alberto Lugo', 1012464821, 'albertolugo@gmail.com', 2147483647, 0, 0, 3, 1, '2002-02-10', 21),
(31, 'Judith Robledo', 28843920, 'judithrobledoq@gmail.com', 2147483647, 1, 1, 4, 1, '1951-04-13', 72),
(32, 'Abraham Figueroa', 1019213540, 'abrahamfig@gmail.com', 2147483647, 0, 0, 3, 1, '1997-05-13', 25),
(33, 'Ximena Valencia', 1451342482, 'ximeval@gmail.com', 2147483647, 1, 1, 4, 1, '1999-06-03', 24),
(34, 'Mireya Leal', 31386997, 'mireyaleal@gmail.com', 2147483647, 1, 1, 4, 1, '1955-05-25', 68),
(35, 'Alcira Guzman', 24615342, 'alciraguz@gmail.com', 2147483647, 1, 1, 2, 1, '1957-04-12', 65),
(36, 'Luis Alvarez', 14521365, 'luisalvarez@gmail.com', 2147483647, 0, 0, 3, 1, '1953-05-01', 70),
(37, 'Gilberto Hoyos', 15612446, 'hoyosgilberto@yahoo.com', 2147483647, 0, 0, 3, 1, '1963-03-05', 59),
(38, 'Valeria Bermudez', 1018461230, 'bermudezvaleria@gmail.com', 2147483647, 1, 1, 1, 1, '2002-07-07', 20),
(39, 'Paul Cardona', 1018264321, 'paulcardona@gmail.com', 2147483647, 1, 1, 3, 1, '1998-09-24', 24),
(40, 'Marcela Robles', 24621303, 'marcerobles@gmail.com', 2147483647, 0, 0, 4, 1, '1956-10-13', 66),
(41, 'Lidia Castro', 34162357, 'lidiacastro@hotmail.com', 2147483647, 1, 1, 1, 1, '1956-12-02', 66),
(42, 'Enrique Delgado', 45132150, 'enriquedelgado@gmail.com', 2147483647, 0, 0, 2, 1, '1952-01-19', 70),
(43, 'Tatiana Urrea', 1011451341, 'tatiurr@gmail.com', 2147483647, 1, 1, 2, 1, '1992-02-27', 30),
(44, 'Andrea Avellaneda', 1046813130, 'AndreAve@gmail.com', 2147483647, 0, 0, 2, 1, '1994-05-05', 28),
(45, 'Camila Bonilla', 1064678101, 'camibon@gmail.com', 2147483647, 1, 1, 3, 1, '1995-06-29', 27),
(46, 'Daniel Ferrer', 1046168123, 'daniferrer@gmail.com', 2147483647, 0, 0, 3, 1, '1996-08-19', 26),
(47, 'Daniela Garcia', 1015413143, 'danielagarcia@hotmail.com', 2147483647, 0, 0, 3, 1, '1998-10-19', 24),
(48, 'Julio Monterrosa', 1014321543, 'juliomonterrosa@gmail.com', 2147483647, 1, 1, 2, 1, '1988-07-01', 34),
(49, 'Sandra Pinzon', 1100464231, 'pinzonsandra@gmail.com', 2147483647, 1, 2, 3, 1, '1985-10-26', 37),
(50, 'Sarah Acevedo', 1015433453, 'acevedoSarah@gmail.com', 2147483647, 1, 3, 3, 1, '1996-02-25', 26),
(51, 'Steven Arenas', 1044646416, 'stevenarenas123@gmail.com', 2147483647, 1, 1, 3, 1, '1991-04-05', 31),
(52, 'Noah Sanchez', 1045134135, 'sanchesnoah24@gmail.com', 2147483647, 0, 0, 4, 1, '1987-06-21', 35),
(53, 'Milena Gonzalez', 1054216348, 'milenagonz@gmail.com', 2147483647, 1, 2, 4, 1, '1992-05-03', 30),
(54, 'Valentino Torres', 1510364131, 'valentintorr@gmail.com', 2147483647, 1, 1, 3, 1, '1988-03-08', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `pkidRol` int(11) NOT NULL,
  `nombreRol` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`pkidRol`, `nombreRol`) VALUES
(1, 'Residente'),
(2, 'Administrador'),
(3, 'Vigilante'),
(4, 'Todero');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_trabajador`
--

CREATE TABLE `tbl_trabajador` (
  `pkidTrabajador` int(11) NOT NULL,
  `nomTrabajador` varchar(35) NOT NULL,
  `ccTrabajador` int(11) NOT NULL,
  `celTrabajador` int(11) NOT NULL,
  `emaTrabajador` varchar(40) NOT NULL,
  `tpcoTrabajador` varchar(40) NOT NULL,
  `contTrabajador` varchar(50) NOT NULL,
  `cargTrabajador` varchar(30) NOT NULL,
  `empTrabajador` varchar(30) NOT NULL,
  `fkidRol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_trabajador`
--

INSERT INTO `tbl_trabajador` (`pkidTrabajador`, `nomTrabajador`, `ccTrabajador`, `celTrabajador`, `emaTrabajador`, `tpcoTrabajador`, `contTrabajador`, `cargTrabajador`, `empTrabajador`, `fkidRol`) VALUES
(2, 'Alba Amaya', 1032798029, 2147483647, 'Alva1988@gmail.com', 'Indefinido', 'contrato.pdf', 'Administrador', 'Administradores Colombia', 2),
(3, 'Juan Gonzales', 1032798025, 2147483647, 'Juan1971@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(4, 'Celso Olaya', 1032798026, 2147483647, 'Celso1971@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(5, 'Maria Rodriguez', 1032896023, 2147483647, 'Maria1988@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(6, 'Claudia Gomez', 1035788523, 2147483647, 'Claudia1991@gmail.com', 'Fijo', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(7, 'Alejandra Noguera', 1004596034, 2147483647, 'Alejandra1974@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(8, 'David Cardenas', 1032798756, 2147483647, 'David2000@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(9, 'Ana Lopez', 1032798027, 2147483647, 'Ana1985@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(10, 'Luis Mendoza', 1032798028, 2147483647, 'Luis1979@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(11, 'Laura Rios', 1032798029, 2147483647, 'Laura1990@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(12, 'Ricardo Perez', 1035788530, 2147483647, 'Ricardo1982@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(13, 'Sofia Ramirez', 1004596035, 2147483647, 'Sofia1987@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(14, 'Daniel Castro', 1032798757, 2147483647, 'Daniel1995@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(15, 'Carolina Torres', 1032798758, 2147483647, 'Carolina1984@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(16, 'Mario Sanchez', 1032798759, 2147483647, 'Mario1992@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(17, 'Patricia Castro', 1032798760, 2147483647, 'Patricia1980@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(18, 'Alejandro Gomez', 1032798761, 2147483647, 'Alejandro1986@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(19, 'Carolina Rios', 1032798762, 2147483647, 'Carolina1993@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(20, 'Luisa Torres', 1032798763, 2147483647, 'Luisa1983@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(21, 'Fernando Mendez', 1032798764, 2147483647, 'Fernando1981@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(22, 'Andrea Morales', 1032798765, 2147483647, 'Andrea1989@gmail.com', 'Fijo', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(23, 'Miguel Castro', 1032798766, 2147483647, 'Miguel1978@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(24, 'Gabriela Torres', 1032798767, 2147483647, 'Gabriela1994@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(25, 'Eduardo Ramirez', 1032798768, 2147483647, 'Eduardo1987@gmail.com', 'Fijo', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(26, 'Camila Vargas', 1032798769, 2147483647, 'Camila1982@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(27, 'Ricardo Gomez', 1032798770, 2147483647, 'Ricardo1990@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(28, 'Valentina Lopez', 1032798771, 2147483647, 'Valentina1985@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(29, 'Alejandro Torres', 1032798772, 2147483647, 'Alejandro1979@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(30, 'Laura Gomez', 1032798773, 2147483647, 'Laura1988@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(31, 'Sebastian Morales', 1032798774, 2147483647, 'Sebastian1984@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(32, 'Carolina Mendez', 1032798775, 2147483647, 'Carolina1991@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(33, 'Andres Ramirez', 1032798776, 2147483647, 'Andres1983@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(34, 'Maria Vargas', 1032798777, 2147483647, 'Maria1992@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(35, 'Juan Castro', 1032798778, 2147483647, 'Juan1981@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(36, 'Daniela Lopez', 1032798779, 2147483647, 'Daniela1977@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(37, 'Carlos Mendez', 1032798780, 2147483647, 'Carlos1993@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(38, 'Patricia Gomez', 1032798781, 2147483647, 'Patricia1987@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(39, 'Luis Torres', 1032798782, 2147483647, 'Luis1985@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(40, 'Alejandra Ramirez', 1032798783, 2147483647, 'Alejandra1989@gmail.com', 'Fijo', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(41, 'Juan Perez', 1032798784, 2147483647, 'Juan1975@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(42, 'Maria Mendez', 1032798785, 2147483647, 'Maria1984@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(43, 'Carlos Castro', 1032798786, 2147483647, 'Carlos1990@gmail.com', 'Fijo', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(44, 'Laura Vargas', 1032798787, 2147483647, 'Laura1988@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(45, 'Jose Gonzales', 1032798788, 2147483647, 'Jose1978@gmail.com', 'Indefinido', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(46, 'Andrea Ramirez', 1032798789, 2147483647, 'Andrea1996@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(47, 'Luisa Mendez', 1032798790, 2147483647, 'Luisa1983@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(48, 'Juan Torres', 1032798791, 2147483647, 'Juan1992@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2),
(49, 'Maria Castro', 1032798792, 2147483647, 'Maria1981@gmail.com', 'Fijo', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(50, 'Carlos Lopez', 1032798793, 2147483647, 'Carlos1994@gmail.com', 'Prestacion de servicios', 'contrato.pdf', 'Todero', 'ToderoColombia', 4),
(51, 'Laura Gomez', 1032798794, 2147483647, 'Laura1985@gmail.com', 'Indefinido', 'contrato.pdf', 'Vigilante', 'Seguridad 365', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuarios`
--

CREATE TABLE `tbl_usuarios` (
  `pkidUsuarios` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contraseña` varchar(15) NOT NULL,
  `fkidRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_usuarios`
--

INSERT INTO `tbl_usuarios` (`pkidUsuarios`, `usuario`, `contraseña`, `fkidRol`) VALUES
(1, 'pabloguzman@gmail.com', 'P@-Gu7m4n.3!', 2),
(2, 'danreynolds@gmail.com', 'D4n.!d-1a287', 1),
(3, 'bentedder27@gmail.com', 'T3d-de!37*8/', 3),
(4, 'borjavilaseca@gmail.com', ' B0!r2!/1$-3a', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_visitantes`
--

CREATE TABLE `tbl_visitantes` (
  `pkidVisitante` int(11) NOT NULL,
  `nomVisitante` varchar(35) NOT NULL,
  `cedVisitante` int(11) NOT NULL,
  `numInmueble` int(11) NOT NULL,
  `nomResidente` varchar(35) NOT NULL,
  `carVisitante` tinyint(1) NOT NULL,
  `ingrVisitante` tinyint(1) NOT NULL,
  `fecVisitante` datetime NOT NULL,
  `fkidTrabajador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tbl_visitantes`
--

INSERT INTO `tbl_visitantes` (`pkidVisitante`, `nomVisitante`, `cedVisitante`, `numInmueble`, `nomResidente`, `carVisitante`, `ingrVisitante`, `fecVisitante`, `fkidTrabajador`) VALUES
(3, 'Carlos Alvarez', 28432120, 15, 'Juan Lopez', 0, 1, '2023-04-17 15:30:05', 3),
(4, 'Fernando Martinez', 1014312301, 32, 'Maria Garcia', 1, 1, '2023-03-24 10:10:00', 3),
(5, 'Benjamin Rojas', 24513125, 240, 'Carlos Martinez', 0, 1, '2023-05-10 14:05:15', 3),
(6, 'Guido Hernandez', 1011423150, 205, 'Ana Rodriguez', 1, 1, '2023-06-07 16:10:45', 3),
(7, 'Laura Bautista', 1011415027, 224, 'Luis Gonzalez', 0, 1, '2023-01-01 08:00:00', 3),
(8, 'Nicolas Gonzalez', 1001543213, 240, 'Laura Hernandez', 1, 1, '2022-12-15 09:30:00', 3),
(9, 'Estela Torres', 1015454654, 14, 'Pedro Fernandez', 0, 1, '2022-11-05 10:50:15', 3),
(10, 'Juan Lopez', 12345313, 25, 'Andrea Torres', 1, 1, '0000-00-00 00:00:00', 3),
(11, 'Mario Garcia', 1202414513, 39, 'Alejandro Ruiz', 0, 1, '2022-11-15 12:30:05', 3),
(12, 'Juan Rodriguez', 1513135431, 40, 'Carmen Morales', 1, 1, '2022-01-15 14:15:31', 3),
(13, 'Ana Lopez', 1545413414, 90, 'Miguel Castro', 0, 1, '2022-11-18 16:06:37', 3),
(14, 'Luis Martinez', 21545613, 150, 'Paula Vargas', 0, 1, '2022-10-25 17:08:06', 3),
(15, 'Carlos Gonzalez', 11454313, 240, 'Gabriel Medina', 1, 0, '2022-08-10 18:40:13', 3),
(16, 'Gabriela Torres', 1015431431, 138, 'Sofia Ramirez', 1, 1, '2023-02-15 19:40:57', 3),
(17, 'Sandra Ramirez', 1854132131, 209, 'Manuel Mendoza', 0, 1, '2023-04-09 20:00:13', 3),
(18, 'Andres Diaz', 1015131038, 104, 'Valeria Silva', 0, 0, '2023-02-10 05:45:30', 3),
(19, 'Emilio Riveros', 1541313463, 80, 'Jorge Ortega', 1, 0, '2022-11-23 07:12:03', 3),
(20, 'Carlos Meza', 1536464631, 2, 'Julian Cerati', 1, 1, '2023-05-24 08:14:34', 3),
(21, 'Santiago Carrero', 21348540, 5, 'Natalia Paredes', 0, 1, '2022-09-14 09:30:40', 3),
(22, 'Isabella Castro', 24613813, 16, 'Rafael Reyes', 1, 1, '2022-10-27 10:46:03', 3),
(23, 'Diego Figueroa', 1530481309, 80, 'Camila Rojas', 0, 0, '2022-06-27 11:46:08', 3),
(24, 'Valentina Vargas', 31854130, 96, 'Diego Morales', 1, 1, '2023-04-21 12:48:41', 3),
(25, 'Jose Fernandez', 1853103163, 154, 'Victoria Santos', 0, 1, '2022-11-01 13:40:13', 3),
(26, 'Camila Navarro', 46131543, 180, 'Ryan Castro', 1, 1, '2023-05-12 14:46:03', 3),
(27, 'Antonio Chamorro', 1343131330, 94, 'Gabriela Acosta', 1, 0, '2022-07-21 15:08:16', 3),
(28, 'Natalia Rios', 1545634164, 115, 'Sebastian Navarro', 1, 1, '2022-05-30 16:34:19', 3),
(29, 'Camilo Anaya', 1976413009, 225, 'Isabella Rios', 0, 0, '2023-03-11 17:49:05', 3),
(30, 'Alejandro Silva', 13464630, 108, 'Andres Morales', 1, 1, '2022-11-15 18:49:40', 3),
(31, 'Javier Reyes', 31646303, 204, 'Martina Lopez', 0, 0, '2022-12-21 19:04:49', 3),
(32, 'Lucia Leal', 1306467486, 45, 'Leonardo Delgado', 1, 1, '2022-12-23 20:15:09', 3),
(33, 'Ricardo Rojas', 12313466, 10, 'Enzo Diaz', 0, 1, '2022-08-19 21:00:46', 3),
(34, 'Esteban Rubiano', 24846333, 54, 'Antonia Guzman', 1, 0, '2022-07-14 08:16:00', 3),
(35, 'Angelica Padilla', 13164632, 28, 'Francisco Mendoza', 0, 0, '2023-04-28 09:14:06', 3),
(36, 'Victoria Ortiz', 169131634, 98, 'Valentina Herrera', 1, 1, '2022-01-29 10:46:09', 3),
(37, 'Daniela Sanchez', 24638316, 111, 'Guillermo Soto', 0, 0, '2023-02-13 11:46:07', 3),
(38, 'Francisco Romero', 31649316, 129, 'Lucia Aguilar', 1, 1, '2023-04-04 12:00:04', 3),
(39, 'Eduardo Medina', 138997313, 167, 'Emilio Flores', 0, 1, '2022-05-19 13:06:15', 3),
(40, 'Martina Delgado', 64941310, 184, 'Renata Ponce', 0, 0, '2022-08-21 14:20:40', 3),
(41, 'Noah Lopez', 13464930, 128, 'Daniel Salazar', 1, 0, '2022-07-14 15:30:48', 3),
(42, 'Samuel Gomez', 31616963, 27, 'Eduardo Medina', 1, 1, '2023-12-07 16:08:49', 3),
(43, 'Paula Morales', 13649436, 35, 'Isabel Mendez', 0, 0, '2022-11-24 17:46:04', 3),
(44, 'Gabriela Herrera', 13164639, 28, 'Gabriela Quiroz', 1, 1, '2022-02-06 18:13:04', 3),
(45, 'Andres Torres', 964320385, 38, 'Tomas Contreras', 0, 1, '2022-01-18 19:13:49', 3),
(46, 'Fernando Salamanca', 46465136, 10, 'Constanza Vidal', 1, 1, '2022-03-04 20:46:13', 3),
(47, 'Carolina Molina', 697464313, 18, 'Ignacio Rivas', 0, 1, '2022-05-27 21:48:02', 3),
(48, 'David Aguilar', 46493248, 187, 'Romina Espinoza', 1, 1, '2022-06-26 07:06:13', 3),
(49, 'Rocio Velasco', 762168243, 18, 'Daniela Cortes', 1, 1, '2022-12-06 09:46:30', 3),
(50, 'Rafael Guzman', 18643123, 19, 'Felipe Rojas', 1, 0, '2022-11-18 10:30:16', 3),
(51, 'Guillermo Martinez', 494823130, 36, 'Ruben Noel', 1, 1, '2022-03-19 11:35:16', 3),
(52, 'Jose Diaz', 154674832, 224, 'Juan Carlos Arauzo', 1, 0, '2023-01-15 13:05:10', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `residente_docsadmin`
--
ALTER TABLE `residente_docsadmin`
  ADD PRIMARY KEY (`pkidResidente`,`pkidDocsAdmin`),
  ADD KEY `pkidDocsAdmin` (`pkidDocsAdmin`);

--
-- Indices de la tabla `residente_novedades`
--
ALTER TABLE `residente_novedades`
  ADD PRIMARY KEY (`pkidResidente`,`pkidNovedades`),
  ADD KEY `pkidNovedades` (`pkidNovedades`);

--
-- Indices de la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  ADD PRIMARY KEY (`pkidCorrespondencia`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`) USING BTREE,
  ADD KEY `fkidInmueble` (`fkidInmueble`) USING BTREE;

--
-- Indices de la tabla `tbl_docsadmin`
--
ALTER TABLE `tbl_docsadmin`
  ADD PRIMARY KEY (`pkidDocsAdmin`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`);

--
-- Indices de la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  ADD PRIMARY KEY (`pkidEstCartera`),
  ADD KEY `fkidInmueble` (`fkidInmueble`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`);

--
-- Indices de la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  ADD PRIMARY KEY (`pkidInmueble`),
  ADD KEY `fkidResidente` (`fkidResidente`);

--
-- Indices de la tabla `tbl_integrante`
--
ALTER TABLE `tbl_integrante`
  ADD PRIMARY KEY (`pkidIntegrante`),
  ADD KEY `fkidResidente` (`fkidResidente`);

--
-- Indices de la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  ADD PRIMARY KEY (`pkidMulta`),
  ADD KEY `fkidInmueble` (`fkidInmueble`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`) USING BTREE;

--
-- Indices de la tabla `tbl_novedades`
--
ALTER TABLE `tbl_novedades`
  ADD PRIMARY KEY (`pkidNovedades`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`) USING BTREE;

--
-- Indices de la tabla `tbl_parqueadero`
--
ALTER TABLE `tbl_parqueadero`
  ADD PRIMARY KEY (`pkidParqueadero`),
  ADD KEY `fkidResidente` (`fkidResidente`),
  ADD KEY `fkidVisitante` (`fkidVisitante`);

--
-- Indices de la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  ADD PRIMARY KEY (`pkidResidente`),
  ADD KEY `fkidRol` (`fkidRol`);

--
-- Indices de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`pkidRol`);

--
-- Indices de la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  ADD PRIMARY KEY (`pkidTrabajador`),
  ADD KEY `fkidRol` (`fkidRol`);

--
-- Indices de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD PRIMARY KEY (`pkidUsuarios`),
  ADD KEY `fkidRol` (`fkidRol`);

--
-- Indices de la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  ADD PRIMARY KEY (`pkidVisitante`),
  ADD KEY `fkidTrabajador` (`fkidTrabajador`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  MODIFY `pkidCorrespondencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `tbl_docsadmin`
--
ALTER TABLE `tbl_docsadmin`
  MODIFY `pkidDocsAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  MODIFY `pkidEstCartera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  MODIFY `pkidInmueble` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `tbl_integrante`
--
ALTER TABLE `tbl_integrante`
  MODIFY `pkidIntegrante` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  MODIFY `pkidMulta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `tbl_novedades`
--
ALTER TABLE `tbl_novedades`
  MODIFY `pkidNovedades` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `tbl_parqueadero`
--
ALTER TABLE `tbl_parqueadero`
  MODIFY `pkidParqueadero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  MODIFY `pkidResidente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `pkidRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  MODIFY `pkidTrabajador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  MODIFY `pkidUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  MODIFY `pkidVisitante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `residente_docsadmin`
--
ALTER TABLE `residente_docsadmin`
  ADD CONSTRAINT `residente_docsadmin_ibfk_1` FOREIGN KEY (`pkidResidente`) REFERENCES `tbl_residente` (`pkidResidente`),
  ADD CONSTRAINT `residente_docsadmin_ibfk_2` FOREIGN KEY (`pkidDocsAdmin`) REFERENCES `tbl_docsadmin` (`pkidDocsAdmin`);

--
-- Filtros para la tabla `residente_novedades`
--
ALTER TABLE `residente_novedades`
  ADD CONSTRAINT `residente_novedades_ibfk_1` FOREIGN KEY (`pkidResidente`) REFERENCES `tbl_residente` (`pkidResidente`),
  ADD CONSTRAINT `residente_novedades_ibfk_2` FOREIGN KEY (`pkidNovedades`) REFERENCES `tbl_novedades` (`pkidNovedades`);

--
-- Filtros para la tabla `tbl_correspondencia`
--
ALTER TABLE `tbl_correspondencia`
  ADD CONSTRAINT `tbl_correspondencia_ibfk_1` FOREIGN KEY (`fkidTrabajador`) REFERENCES `tbl_trabajador` (`pkidTrabajador`);

--
-- Filtros para la tabla `tbl_docsadmin`
--
ALTER TABLE `tbl_docsadmin`
  ADD CONSTRAINT `tbl_docsadmin_ibfk_1` FOREIGN KEY (`fkidTrabajador`) REFERENCES `tbl_trabajador` (`pkidTrabajador`);

--
-- Filtros para la tabla `tbl_estcartera`
--
ALTER TABLE `tbl_estcartera`
  ADD CONSTRAINT `tbl_estcartera_ibfk_1` FOREIGN KEY (`fkidInmueble`) REFERENCES `tbl_inmueble` (`pkidInmueble`),
  ADD CONSTRAINT `tbl_estcartera_ibfk_2` FOREIGN KEY (`fkidTrabajador`) REFERENCES `tbl_trabajador` (`pkidTrabajador`);

--
-- Filtros para la tabla `tbl_inmueble`
--
ALTER TABLE `tbl_inmueble`
  ADD CONSTRAINT `tbl_inmueble_ibfk_1` FOREIGN KEY (`fkidResidente`) REFERENCES `tbl_residente` (`pkidResidente`),
  ADD CONSTRAINT `tbl_inmueble_ibfk_2` FOREIGN KEY (`pkidInmueble`) REFERENCES `tbl_correspondencia` (`pkidCorrespondencia`);

--
-- Filtros para la tabla `tbl_integrante`
--
ALTER TABLE `tbl_integrante`
  ADD CONSTRAINT `tbl_integrante_ibfk_1` FOREIGN KEY (`fkidResidente`) REFERENCES `tbl_residente` (`pkidResidente`);

--
-- Filtros para la tabla `tbl_multa`
--
ALTER TABLE `tbl_multa`
  ADD CONSTRAINT `tbl_multa_ibfk_1` FOREIGN KEY (`fkidInmueble`) REFERENCES `tbl_inmueble` (`pkidInmueble`);

--
-- Filtros para la tabla `tbl_parqueadero`
--
ALTER TABLE `tbl_parqueadero`
  ADD CONSTRAINT `tbl_parqueadero_ibfk_1` FOREIGN KEY (`fkidResidente`) REFERENCES `tbl_residente` (`pkidResidente`),
  ADD CONSTRAINT `tbl_parqueadero_ibfk_2` FOREIGN KEY (`fkidVisitante`) REFERENCES `tbl_visitantes` (`pkidVisitante`);

--
-- Filtros para la tabla `tbl_residente`
--
ALTER TABLE `tbl_residente`
  ADD CONSTRAINT `tbl_residente_ibfk_1` FOREIGN KEY (`fkidRol`) REFERENCES `tbl_rol` (`pkidRol`);

--
-- Filtros para la tabla `tbl_trabajador`
--
ALTER TABLE `tbl_trabajador`
  ADD CONSTRAINT `tbl_trabajador_ibfk_1` FOREIGN KEY (`fkidRol`) REFERENCES `tbl_rol` (`pkidRol`);

--
-- Filtros para la tabla `tbl_usuarios`
--
ALTER TABLE `tbl_usuarios`
  ADD CONSTRAINT `tbl_usuarios_ibfk_1` FOREIGN KEY (`fkidRol`) REFERENCES `tbl_rol` (`pkidRol`);

--
-- Filtros para la tabla `tbl_visitantes`
--
ALTER TABLE `tbl_visitantes`
  ADD CONSTRAINT `tbl_visitantes_ibfk_1` FOREIGN KEY (`fkidTrabajador`) REFERENCES `tbl_trabajador` (`pkidTrabajador`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
