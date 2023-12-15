-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-12-2023 a las 01:24:25
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `area services`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area`
--

CREATE TABLE `area` (
  `id_Area` int(11) NOT NULL,
  `idAreaType` int(11) NOT NULL,
  `idBuilding` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name Area` varchar(255) NOT NULL,
  `number` int(11) NOT NULL,
  `description Area` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `Creation Date` date NOT NULL,
  `modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areaaplication`
--

CREATE TABLE `areaaplication` (
  `id Area Aplication` int(11) NOT NULL,
  `Date Area` date NOT NULL,
  `Description` varchar(255) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `idAuthorization` int(11) NOT NULL,
  `status` bit(1) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `CreationDate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `modified date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areatype`
--

CREATE TABLE `areatype` (
  `idAreaType` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name Area` varchar(255) NOT NULL,
  `Description Area Type` varchar(255) NOT NULL,
  `Status` timestamp(1) NOT NULL DEFAULT current_timestamp(1) ON UPDATE current_timestamp(1),
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autorization`
--

CREATE TABLE `autorization` (
  `idAuthorization` int(11) NOT NULL,
  `id Employee` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Authorization Date` date NOT NULL,
  `description authorization` varchar(255) NOT NULL,
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL,
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `book catalog`
--

CREATE TABLE `book catalog` (
  `IdBook Catalog` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `book Title` varchar(50) NOT NULL,
  `Author Name` varchar(50) NOT NULL,
  `Publisher` varchar(50) NOT NULL,
  `instock` int(11) NOT NULL,
  `status` bit(1) NOT NULL,
  `Create Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `building`
--

CREATE TABLE `building` (
  `idBuilding` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `Description Building` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `Creation` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `career`
--

CREATE TABLE `career` (
  `idCareer` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Career Name` varchar(255) NOT NULL,
  `description Career` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class`
--

CREATE TABLE `class` (
  `idClass` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name class` varchar(50) NOT NULL,
  `decription Class` varchar(50) NOT NULL,
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `class detail`
--

CREATE TABLE `class detail` (
  `id Class Detail` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Start time` time NOT NULL,
  `End Time` time NOT NULL,
  `date class detail` date NOT NULL,
  `quantity student` int(11) NOT NULL,
  `Creation Date` date NOT NULL,
  `modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE `course` (
  `idCourse` int(11) NOT NULL,
  `idCareer` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name course` varchar(50) NOT NULL,
  `credit` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id Employee` int(11) NOT NULL,
  `idEmployeeType` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name employee` varchar(50) NOT NULL,
  `last name employee` varchar(50) NOT NULL,
  `salary` decimal(10,0) NOT NULL,
  `nss` int(11) NOT NULL,
  `zipCode` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `numberPhone` varchar(13) NOT NULL,
  `address` varchar(255) NOT NULL,
  `status` bit(1) NOT NULL,
  `creation date` date NOT NULL,
  `modified date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee type`
--

CREATE TABLE `employee type` (
  `idEmployeeType` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name employee Tipe` varchar(50) NOT NULL,
  `base salary` decimal(10,0) NOT NULL,
  `hourse employee Type` time NOT NULL,
  `Creation Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan aplication`
--

CREATE TABLE `loan aplication` (
  `idLoan Aplication` int(11) NOT NULL,
  `idBookCatalog` int(11) NOT NULL,
  `idStudent` int(11) NOT NULL,
  `idAuthorization` int(11) NOT NULL,
  `idEmployee` int(11) NOT NULL,
  `id Tool Catalog` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `numberLoan` int(11) NOT NULL,
  `description` varchar(50) NOT NULL,
  `delivery Date` date NOT NULL,
  `departure Date` date NOT NULL,
  `quantity` int(11) NOT NULL,
  `satatus` bit(1) NOT NULL,
  `creation date` date NOT NULL,
  `modify date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan aplication book catalog`
--

CREATE TABLE `loan aplication book catalog` (
  `loan aplication book catalog` int(11) NOT NULL,
  `idLoanAplication` int(11) NOT NULL,
  `idBookCatalog` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `status` bit(1) NOT NULL,
  `Create Date` date NOT NULL,
  `Modified Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loan aplication tool catalog`
--

CREATE TABLE `loan aplication tool catalog` (
  `idLoan Aplication tool Catalog` int(11) NOT NULL,
  `idLoanAplication` int(11) NOT NULL,
  `id Tool Catalog` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Status` bit(1) NOT NULL,
  `Create Date` date NOT NULL,
  `Modified Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `idStudent` int(11) NOT NULL,
  `idStudyPlan` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `Registration student` int(11) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `curp` varchar(18) NOT NULL,
  `nss` int(11) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `numberphone` varchar(13) NOT NULL,
  `status` bit(1) NOT NULL,
  `creation date` date NOT NULL,
  `modified date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `study plan`
--

CREATE TABLE `study plan` (
  `idStudyPlan` int(11) NOT NULL,
  `idCareer` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `Name study plan` varchar(50) NOT NULL,
  `Code` int(11) NOT NULL,
  `Duration` time NOT NULL,
  `Creedits` int(11) NOT NULL,
  `Creation Date` date NOT NULL,
  `modified Date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tool catalog`
--

CREATE TABLE `tool catalog` (
  `id Tool Catalog` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `name tool` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `Quantity existence` int(11) NOT NULL,
  `description tool catalog` varchar(50) NOT NULL,
  `status` bit(1) NOT NULL,
  `creation date` date NOT NULL,
  `modified` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL,
  `idUserCreate` int(11) NOT NULL,
  `idUserModify` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Password` varchar(10) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Status` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`id_Area`),
  ADD UNIQUE KEY `idAreaType` (`idAreaType`),
  ADD UNIQUE KEY `idBuilding` (`idBuilding`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`);

--
-- Indices de la tabla `areaaplication`
--
ALTER TABLE `areaaplication`
  ADD PRIMARY KEY (`id Area Aplication`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idAuthorization` (`idAuthorization`),
  ADD UNIQUE KEY `idClass` (`idClass`),
  ADD UNIQUE KEY `idEmployee` (`idEmployee`),
  ADD UNIQUE KEY `idArea` (`idArea`);

--
-- Indices de la tabla `areatype`
--
ALTER TABLE `areatype`
  ADD PRIMARY KEY (`idAreaType`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `autorization`
--
ALTER TABLE `autorization`
  ADD PRIMARY KEY (`idAuthorization`),
  ADD UNIQUE KEY `id Employee` (`id Employee`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `book catalog`
--
ALTER TABLE `book catalog`
  ADD PRIMARY KEY (`IdBook Catalog`),
  ADD UNIQUE KEY `idArea` (`idArea`),
  ADD UNIQUE KEY `idCourse` (`idCourse`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`idBuilding`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `career`
--
ALTER TABLE `career`
  ADD PRIMARY KEY (`idCareer`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`idClass`),
  ADD UNIQUE KEY `idCourse` (`idCourse`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `class detail`
--
ALTER TABLE `class detail`
  ADD PRIMARY KEY (`id Class Detail`),
  ADD UNIQUE KEY `idClass` (`idClass`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`idCourse`),
  ADD UNIQUE KEY `idCareer` (`idCareer`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id Employee`),
  ADD UNIQUE KEY `idEmployeeType` (`idEmployeeType`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `employee type`
--
ALTER TABLE `employee type`
  ADD PRIMARY KEY (`idEmployeeType`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `loan aplication`
--
ALTER TABLE `loan aplication`
  ADD PRIMARY KEY (`idLoan Aplication`),
  ADD UNIQUE KEY `idBookCatalog` (`idBookCatalog`),
  ADD UNIQUE KEY `idStudent` (`idStudent`),
  ADD UNIQUE KEY `idAuthorization` (`idAuthorization`),
  ADD UNIQUE KEY `idEmployee` (`idEmployee`),
  ADD UNIQUE KEY `id Tool Catalog` (`id Tool Catalog`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `loan aplication book catalog`
--
ALTER TABLE `loan aplication book catalog`
  ADD PRIMARY KEY (`loan aplication book catalog`),
  ADD UNIQUE KEY `idLoanAplication` (`idLoanAplication`),
  ADD UNIQUE KEY `idBookCatalog` (`idBookCatalog`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `loan aplication tool catalog`
--
ALTER TABLE `loan aplication tool catalog`
  ADD PRIMARY KEY (`idLoan Aplication tool Catalog`),
  ADD UNIQUE KEY `idLoanAplication` (`idLoanAplication`),
  ADD UNIQUE KEY `id Tool Catalog` (`id Tool Catalog`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`idStudent`),
  ADD UNIQUE KEY `idStudyPlan` (`idStudyPlan`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `study plan`
--
ALTER TABLE `study plan`
  ADD PRIMARY KEY (`idStudyPlan`),
  ADD UNIQUE KEY `idCareer` (`idCareer`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`) USING BTREE,
  ADD UNIQUE KEY `idUserModify` (`idUserModify`) USING BTREE;

--
-- Indices de la tabla `tool catalog`
--
ALTER TABLE `tool catalog`
  ADD PRIMARY KEY (`id Tool Catalog`),
  ADD UNIQUE KEY `idArea` (`idArea`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`idUser`),
  ADD UNIQUE KEY `idUserCreate` (`idUserCreate`),
  ADD UNIQUE KEY `idUserModify` (`idUserModify`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
