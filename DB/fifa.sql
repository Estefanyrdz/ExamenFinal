-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-07-2014 a las 03:36:12
-- Versión del servidor: 5.5.32
-- Versión de PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `fifa`
--
CREATE DATABASE IF NOT EXISTS `fifa` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `fifa`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudad`
--

CREATE TABLE IF NOT EXISTS `ciudad` (
  `idciudad` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `continente`
--

CREATE TABLE IF NOT EXISTS `continente` (
  `idcontinente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcontinente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `continente`
--

INSERT INTO `continente` (`idcontinente`, `nombre`) VALUES
(1, 'Africa'),
(2, 'Asia y Oceania'),
(3, 'CentroAmerica'),
(4, 'Europa'),
(5, 'Sudamerica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenador`
--

CREATE TABLE IF NOT EXISTS `entrenador` (
  `identrenador` int(11) NOT NULL AUTO_INCREMENT,
  `idpais` int(11) NOT NULL,
  PRIMARY KEY (`identrenador`),
  KEY `fk1Entrenador_idx` (`idpais`),
  KEY `fk2Entrenador_idx` (`identrenador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE IF NOT EXISTS `equipo` (
  `idequipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `idpais` int(11) NOT NULL,
  `escudo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk1Pais_idx` (`idpais`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `equipo`
--

INSERT INTO `equipo` (`idequipo`, `nombre`, `idpais`, `escudo`) VALUES
(1, 'Argentina', 1, 'Argentina.jpg'),
(2, 'Brasil', 2, 'Brasil.jpg'),
(3, 'Chile', 3, 'Chile.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadio`
--

CREATE TABLE IF NOT EXISTS `estadio` (
  `idestadio` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) DEFAULT NULL,
  `idciudad` int(11) NOT NULL,
  PRIMARY KEY (`idestadio`),
  KEY `fkEstadio_idx` (`idciudad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `goles_jugador`
--

CREATE TABLE IF NOT EXISTS `goles_jugador` (
  `idresultado` int(11) NOT NULL AUTO_INCREMENT,
  `minutogol` time DEFAULT NULL,
  `idjuego` int(11) NOT NULL,
  `idjugador` int(11) NOT NULL,
  PRIMARY KEY (`idresultado`),
  KEY `fk_resultado_1_idx` (`idjuego`),
  KEY `fk_golesJugador_1_idx` (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante`
--

CREATE TABLE IF NOT EXISTS `integrante` (
  `idintegrante` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(100) DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `estatura` float DEFAULT NULL,
  `foto` varchar(50) DEFAULT NULL,
  `Edad` int(11) DEFAULT NULL,
  `idequipo` int(11) NOT NULL,
  PRIMARY KEY (`idintegrante`),
  KEY `fkIntegrante_idx` (`idequipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego`
--

CREATE TABLE IF NOT EXISTS `juego` (
  `idjuego` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `idequipolocal` int(11) NOT NULL,
  `idequipovisitante` int(11) NOT NULL,
  `idestadio` int(11) NOT NULL,
  PRIMARY KEY (`idjuego`),
  KEY `fk1Juego_idx` (`idestadio`),
  KEY `fk2Juego_idx` (`idequipolocal`),
  KEY `fk3Juego_idx` (`idequipovisitante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='	' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE IF NOT EXISTS `jugador` (
  `idjugador` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) DEFAULT NULL,
  `idintegrante` int(11) NOT NULL,
  `idposicion` int(11) NOT NULL,
  PRIMARY KEY (`idjugador`),
  KEY `fk2Jugador_idx` (`idposicion`),
  KEY `fk1Jugador` (`idintegrante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pais`
--

CREATE TABLE IF NOT EXISTS `pais` (
  `idpais` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `bandera` varchar(45) DEFAULT NULL,
  `idcontinente` int(11) NOT NULL,
  PRIMARY KEY (`idpais`),
  KEY `fkContinente_idx` (`idcontinente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `pais`
--

INSERT INTO `pais` (`idpais`, `nombre`, `bandera`, `idcontinente`) VALUES
(1, 'Argentina', '', 5),
(2, 'Brasil', NULL, 5),
(3, 'Chile', NULL, 5),
(4, 'Colombia', NULL, 5),
(5, 'Ecuador', NULL, 5),
(6, 'Uruguay', NULL, 5),
(7, 'Costa Rica', '', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posision`
--

CREATE TABLE IF NOT EXISTS `posision` (
  `idposision` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `abreviatura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idposision`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarjetas_jugador`
--

CREATE TABLE IF NOT EXISTS `tarjetas_jugador` (
  `idtarjetajugador` int(11) NOT NULL AUTO_INCREMENT,
  `minutotarjeta` time NOT NULL,
  `idjuego` int(11) NOT NULL,
  `idjugador` int(11) NOT NULL,
  `tipotarjeta` varchar(10) NOT NULL,
  PRIMARY KEY (`idtarjetajugador`),
  KEY `fk_resultado_1_idx` (`idjuego`),
  KEY `fk_golesJugador_1_idx` (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `rol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `password`, `rol`) VALUES
(1, 'rivera_r_m92@hotmail.com', '96a6e41de7919dbf3d2674779e93248b', 'admin'),
(2, 'angel.099@hotmail.com', '8ac200c7f1d269a62fa60d4d1937f7bf', 'admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrenador`
--
ALTER TABLE `entrenador`
  ADD CONSTRAINT `fk1Entrenador` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2Entrenador` FOREIGN KEY (`identrenador`) REFERENCES `integrante` (`idintegrante`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `fk1Equipo` FOREIGN KEY (`idpais`) REFERENCES `pais` (`idpais`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estadio`
--
ALTER TABLE `estadio`
  ADD CONSTRAINT `fkEstadio` FOREIGN KEY (`idciudad`) REFERENCES `ciudad` (`idciudad`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `goles_jugador`
--
ALTER TABLE `goles_jugador`
  ADD CONSTRAINT `fk_golesJugador_1` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_resultado_1` FOREIGN KEY (`idjuego`) REFERENCES `juego` (`idjuego`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD CONSTRAINT `fkIntegrante` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `juego`
--
ALTER TABLE `juego`
  ADD CONSTRAINT `fk1Juego` FOREIGN KEY (`idestadio`) REFERENCES `estadio` (`idestadio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2Juego` FOREIGN KEY (`idequipolocal`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk3Juego` FOREIGN KEY (`idequipovisitante`) REFERENCES `equipo` (`idequipo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `fk1Jugador` FOREIGN KEY (`idintegrante`) REFERENCES `integrante` (`idintegrante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2Jugador` FOREIGN KEY (`idposicion`) REFERENCES `posision` (`idposision`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pais`
--
ALTER TABLE `pais`
  ADD CONSTRAINT `fkPais` FOREIGN KEY (`idcontinente`) REFERENCES `continente` (`idcontinente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tarjetas_jugador`
--
ALTER TABLE `tarjetas_jugador`
  ADD CONSTRAINT `fk_golesJugador_10` FOREIGN KEY (`idjugador`) REFERENCES `jugador` (`idjugador`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_resultado_10` FOREIGN KEY (`idjuego`) REFERENCES `juego` (`idjuego`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
