-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 30, 2022 at 12:59 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `covid`
--

-- --------------------------------------------------------

--
-- Table structure for table `capturas_encuesta`
--

CREATE TABLE `capturas_encuesta` (
  `id` int(11) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL,
  `matricula` varchar(32) DEFAULT NULL,
  `numero_profesor` varchar(32) DEFAULT NULL,
  `numero_empleado` varchar(32) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(128) NOT NULL,
  `contacto_covid` tinyint(1) NOT NULL DEFAULT '0',
  `vacunado` tinyint(1) NOT NULL DEFAULT '1',
  `cadena_qr` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `capturas_encuesta`
--

INSERT INTO `capturas_encuesta` (`id`, `id_tipo_usuario`, `matricula`, `numero_profesor`, `numero_empleado`, `nombre`, `correo`, `contacto_covid`, `vacunado`, `cadena_qr`, `created_at`, `updated_at`) VALUES
(3, 1, NULL, NULL, NULL, 'Pedro Gutierrez', 'pedro@correo.com', 0, 1, '123456789', '2022-04-30 07:41:45', '2022-04-30 07:41:45'),
(4, 1, NULL, NULL, NULL, 'Pablo garcia', 'pablo@correo.com', 0, 1, '123456789', '2022-04-30 07:52:47', '2022-04-30 07:52:47'),
(5, 1, NULL, NULL, NULL, 'Pablo garcia', 'pablo@correo.com', 0, 1, '123456789', '2022-04-30 07:53:19', '2022-04-30 07:53:19'),
(6, 1, NULL, NULL, NULL, 'Pablo garcia', 'pablo@correo.com', 0, 1, '123456789', '2022-04-30 07:54:43', '2022-04-30 07:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `sintomas`
--

CREATE TABLE `sintomas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sintomas`
--

INSERT INTO `sintomas` (`id`, `descripcion`) VALUES
(1, 'Estoy positivo en COVID'),
(2, 'Fiebree o escalofrios'),
(3, 'Tos o catarro'),
(4, 'Dolor de cabeza o garganta'),
(5, 'Cansancio o Malestar general'),
(6, 'Perdida del olfato '),
(7, 'Ninguno de los anteriores');

-- --------------------------------------------------------

--
-- Table structure for table `sintomas_captura`
--

CREATE TABLE `sintomas_captura` (
  `id` int(11) NOT NULL,
  `id_captura` int(11) NOT NULL,
  `id_sintoma` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sintomas_captura`
--

INSERT INTO `sintomas_captura` (`id`, `id_captura`, `id_sintoma`, `created_at`, `updated_at`) VALUES
(1, 6, 3, '2022-04-30 07:54:43', '2022-04-30 07:54:43'),
(2, 6, 5, '2022-04-30 07:54:43', '2022-04-30 07:54:43');

-- --------------------------------------------------------

--
-- Table structure for table `tipos_usuarios`
--

CREATE TABLE `tipos_usuarios` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipos_usuarios`
--

INSERT INTO `tipos_usuarios` (`id`, `descripcion`) VALUES
(1, 'Alumno'),
(2, 'Profesor'),
(3, 'Empleado');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capturas_encuesta`
--
ALTER TABLE `capturas_encuesta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- Indexes for table `sintomas`
--
ALTER TABLE `sintomas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sintomas_captura`
--
ALTER TABLE `sintomas_captura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `combinacion_unica` (`id_captura`,`id_sintoma`),
  ADD KEY `id_sintoma` (`id_sintoma`),
  ADD KEY `id_captura` (`id_captura`);

--
-- Indexes for table `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capturas_encuesta`
--
ALTER TABLE `capturas_encuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sintomas`
--
ALTER TABLE `sintomas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sintomas_captura`
--
ALTER TABLE `sintomas_captura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tipos_usuarios`
--
ALTER TABLE `tipos_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `capturas_encuesta`
--
ALTER TABLE `capturas_encuesta`
  ADD CONSTRAINT `capturas_encuesta_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuarios` (`id`);

--
-- Constraints for table `sintomas_captura`
--
ALTER TABLE `sintomas_captura`
  ADD CONSTRAINT `sintomas_captura_ibfk_1` FOREIGN KEY (`id_captura`) REFERENCES `capturas_encuesta` (`id`),
  ADD CONSTRAINT `sintomas_captura_ibfk_2` FOREIGN KEY (`id_sintoma`) REFERENCES `sintomas` (`id`);
