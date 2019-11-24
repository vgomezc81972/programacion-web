-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 24-11-2019 a las 04:37:52
-- Versión del servidor: 5.7.28-0ubuntu0.18.04.4
-- Versión de PHP: 7.2.24-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `BscInfoDB`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dat_analisis`
--

CREATE TABLE `dat_analisis` (
  `oid` int(20) NOT NULL,
  `oid_movimiento` int(20) NOT NULL,
  `estrategias` varchar(500) NOT NULL,
  `analisis` varchar(500) NOT NULL,
  `fecha` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dat_analisis`
--

INSERT INTO `dat_analisis` (`oid`, `oid_movimiento`, `estrategias`, `analisis`, `fecha`) VALUES
(1, 1, 'Controlar el personal de enfermeria', 'Se debe hacer corte cada semana, para realizar carga hasta el final de mes', '2019-11-23'),
(2, 2, 'prueba 2', 'analisis 2', '2019-11-23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dat_indicador`
--

CREATE TABLE `dat_indicador` (
  `codigo_indicador` int(20) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `grupo_indicador` varchar(4) NOT NULL,
  `codigo_objetivo` varchar(4) NOT NULL,
  `codigo_politica` varchar(4) NOT NULL,
  `codigo_proceso` varchar(4) NOT NULL,
  `codigo_area` varchar(4) NOT NULL,
  `codigo_fin` varchar(4) NOT NULL,
  `tipo_calculo` varchar(4) NOT NULL,
  `estado` varchar(4) NOT NULL,
  `tipo_indicador` varchar(4) NOT NULL,
  `frecuencia_datos` varchar(4) NOT NULL,
  `frecuencia_analisis` varchar(4) NOT NULL,
  `responsable_indicador` varchar(200) NOT NULL,
  `formula` varchar(300) NOT NULL,
  `numerador` varchar(200) NOT NULL,
  `denominador` varchar(100) NOT NULL,
  `variable3` varchar(100) NOT NULL,
  `unidad_medida` varchar(2) NOT NULL,
  `tendencia` varchar(2) NOT NULL,
  `responsable_analisis` varchar(150) NOT NULL,
  `rango_bajo` int(20) NOT NULL,
  `rango_medio` int(20) NOT NULL,
  `rango_alto` int(20) NOT NULL,
  `meta` int(20) NOT NULL,
  `atributo_calidad` varchar(4) NOT NULL,
  `grupo_estandar` varchar(4) NOT NULL,
  `proyectado` int(20) NOT NULL,
  `fecha_insercion` date NOT NULL,
  `usuario_insercion` varchar(60) NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_modificacion` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dat_indicador`
--

INSERT INTO `dat_indicador` (`codigo_indicador`, `descripcion`, `grupo_indicador`, `codigo_objetivo`, `codigo_politica`, `codigo_proceso`, `codigo_area`, `codigo_fin`, `tipo_calculo`, `estado`, `tipo_indicador`, `frecuencia_datos`, `frecuencia_analisis`, `responsable_indicador`, `formula`, `numerador`, `denominador`, `variable3`, `unidad_medida`, `tendencia`, `responsable_analisis`, `rango_bajo`, `rango_medio`, `rango_alto`, `meta`, `atributo_calidad`, `grupo_estandar`, `proyectado`, `fecha_insercion`, `usuario_insercion`, `fecha_modificacion`, `usuario_modificacion`) VALUES
(1, 'Oportunidad en la Atencion gineco-obstetrica', '1', '1', '4', '6', '13', '1', '2', '1', '1', '3', '2', 'Gestión de la Información', 'Sumatoria del ttal de dias calendario entre la fecha la cual solicita elusuario cita por cualquier medio para ser atendido en la consulta', 'numerador', 'denominador', 'variable3', '3', '1', 'Gestión Ambulatoria', 59, 79, 100, 8, '1', '1', 5, '2019-05-25', 'lidertic', '2019-10-01', 'lidertic'),
(2, 'Oportunidad en Urgencia', '1', '1', '4', '6', '13', '1', '2', '1', '1', '3', '2', 'Gestión de la Información', 'Total Pacientes adtendidos', 'numerador', 'denominador', 'variable3', '3', '1', 'Gestión urgencias', 59, 79, 100, 8, '1', '1', 5, '2019-11-21', 'lidertic', '2019-11-21', 'lidertic');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dat_movimiento`
--

CREATE TABLE `dat_movimiento` (
  `oid` int(20) NOT NULL,
  `codigo_indicador` int(20) NOT NULL,
  `numerador` decimal(8,2) NOT NULL,
  `denominador` decimal(8,2) NOT NULL DEFAULT '1.00',
  `anual` varchar(4) NOT NULL,
  `mes` varchar(4) NOT NULL,
  `meta` int(20) NOT NULL,
  `ejecutado` decimal(8,2) NOT NULL,
  `cumplimiento` decimal(8,2) NOT NULL,
  `rango` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `dat_movimiento`
--

INSERT INTO `dat_movimiento` (`oid`, `codigo_indicador`, `numerador`, `denominador`, `anual`, `mes`, `meta`, `ejecutado`, `cumplimiento`, `rango`) VALUES
(1, 1, '15.00', '8.00', '2019', '05', 30, '1.88', '0.00', 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_sistema`
--

CREATE TABLE `menu_sistema` (
  `ID` int(11) NOT NULL,
  `DESCRIPCION` varchar(50) NOT NULL,
  `IMAGEN` varchar(50) NOT NULL DEFAULT 'imagenes/not_found.png',
  `URL` varchar(50) DEFAULT NULL,
  `ORDENAMIENTO` int(11) NOT NULL DEFAULT '0',
  `ESTATUS` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_sistema`
--

INSERT INTO `menu_sistema` (`ID`, `DESCRIPCION`, `IMAGEN`, `URL`, `ORDENAMIENTO`, `ESTATUS`) VALUES
(1, 'Inicio', 'imagenes/Customer.png', '#', 1, 0),
(2, 'Agregar Usuarios', 'imagenes/Proveedores.png', '/usuarios/nuevo', 3, 0),
(3, 'Listar Usuarios', 'imagenes/Product.png', '/usuarios', 2, 0),
(4, 'Indicador', 'imagenes/Indicador.png', '/indicador', 4, 0),
(5, 'Indicadores', 'imagenes/Indicadores.png', '/indicadores', 5, 0),
(6, 'Movimiento', 'imagenes/Indicadores.png', '/movimiento', 6, 0),
(7, 'Analisis', 'imagenes/Indicadores.png', '/analisis', 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosmenu`
--

CREATE TABLE `permisosmenu` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `ID_MENU` int(11) NOT NULL,
  `ESTATUS` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisosmenu`
--

INSERT INTO `permisosmenu` (`ID`, `ID_USUARIO`, `ID_MENU`, `ESTATUS`) VALUES
(1, 1, 1, 0),
(2, 1, 2, 0),
(3, 1, 3, 0),
(5, 2, 1, 0),
(6, 2, 3, 0),
(7, 2, 2, 1),
(8, 3, 1, 0),
(9, 1, 4, 1),
(10, 1, 5, 0),
(11, 5, 1, 0),
(12, 5, 3, 0),
(13, 5, 2, 0),
(14, 1, 6, 0),
(15, 1, 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sis_multivalores`
--

CREATE TABLE `sis_multivalores` (
  `tabla` varchar(50) NOT NULL,
  `codigo` varchar(4) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `varios` varchar(100) DEFAULT NULL,
  `fecha_insercion` date NOT NULL,
  `usuario_insercion` varchar(60) NOT NULL,
  `fecha_modificacion` date DEFAULT NULL,
  `usuario_modificacion` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sis_multivalores`
--

INSERT INTO `sis_multivalores` (`tabla`, `codigo`, `descripcion`, `estado`, `varios`, `fecha_insercion`, `usuario_insercion`, `fecha_modificacion`, `usuario_modificacion`) VALUES
('Año', '1', '2019', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Año', '2', '2020', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Año', '3', '2021', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '1', 'GERENCIA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '10', 'CALIDAD', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '11', 'SISTEMAS DE INFORMACION Y TIC´S', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '12', 'SUBGERENCIA DE PRESTACION DE SERVICIOS DE SALUD', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '13', 'SERVICIOS AMBULATORIOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '14', 'SERVICIOS DE URGENCIAS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '15', 'SERVICIOS HOSPITALARIOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '16', 'SERVICIOS COMPLEMENTARIOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '17', 'GESTION DEL RIESGO EN SALUD', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '18', 'SUBGERENCIA CORPORATIVA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '19', 'FINANCIERA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '2', 'JURIDICA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '20', 'ADMINISTRATIVA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '21', 'TALENTO HUMANO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '22', 'CONTRATACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '3', 'DESARROLLO INSTITUCIONAL', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '4', 'COMUNICACIONES', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '5', 'MERCADEO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '6', 'CONTROL INTERNO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '7', 'PARTICIPACION COMUNITARIA Y SERVICIO AL CIUDADANO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '8', 'GESTION DEL CONOCIMIENTO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Areas', '9', 'CONTROL INTERNO DISCIPLINARIO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '1', 'Accesibilidad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '2', 'Continuidad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '3', 'Oportunidad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '4', 'Petinencia', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '5', 'Competencia', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '6', 'Aceptabilidad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '7', 'Coordinacion', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('AtributoCalidad', '8', 'Seguridad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('EstadoRegistro', '1', 'Activo', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('EstadoRegistro', '2', 'Inactivo', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('EstadoRegistro', '3', 'Bloqueado', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Fin', '1', 'Proceso', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '2', 'POA', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '3', 'Plan de Gestión del Gerente', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '4', 'Trazadores', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '5', 'COMITÉ', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '6', 'COMITÉ SEGURIDAD VIAL', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '7', 'Resolución 256', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Fin', '8', 'Rutas Integrales de Atención en Salud', 'A', NULL, '2019-06-13', 'lidertic', NULL, ''),
('Frecuencia', '1', 'Diaria', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Frecuencia', '2', 'Semanal', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Frecuencia', '3', 'Mensual', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Frecuencia', '4', 'Trimestral', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Frecuencia', '5', 'Semesttral', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Frecuencia', '6', 'Anual', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '1', 'Grupo de estándares del proceso de atención al cliente asistencial', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '2', 'Grupo de Estándares de Direccionamiento ', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '3', 'Grupo de Estándares de Gerencia ', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '4', 'Grupo de Estándares de Gerencia del Talento Humano ', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '5', 'Grupo de Estándares de Gerencia del Ambiente Físico ', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '6', 'Grupo de Estándares de Gestión de Tecnología', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '7', 'Grupo de Estándares de Gerencia de la Información', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('GrupoEstandar', '8', 'Grupo de Estándares de Mejoramiento de la Calidad ', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Macroprocesos', '1', 'ESTRATEGICOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Macroprocesos', '2', 'MISIONALES', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Macroprocesos', '3', 'APOYO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Macroprocesos', '4', 'EVALUACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '1', 'Enero', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '10', 'Octubre', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '11', 'Noviembre', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '12', 'Diciembre', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '2', 'Febrero', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '3', 'Marzo', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '4', 'Abril', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '5', 'Mayo', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '6', 'Junio', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '7', 'Julio', '1', '', '2019-05-25', 'lidertic', '2019-06-19', 'lidertic'),
('Mes', '8', 'Agosto', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Mes', '9', 'Septiembre', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '1', 'Formular e implementar un modelo de atención integral que dé respuesta efectiva a las necesidades en salud de la población.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '2', 'Impactar positivamente la satisfacción del cliente interno, externo y sus familias a través de un modelo de atención integral.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '3', 'Participar activamente en formación de talento humano en salud, con desarrollo sostenido de la investigación.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '4', 'Lograr equilibrio operacional de la ESE de manera sostenible..', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '5', 'Adoptar e implementar el modelo de atención integral en salud con enfoque en acreditación y hospital universitario.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '6', 'Desarrollar y fomentar en el talento humano las competencias que faciliten la implementación del modelo de atención integral. .', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '7', 'Diseñar e implementar un sistema de gestión del conocimiento e innovación.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('ObjetivoEstrategico', '8', 'Estimular y apoyar la investigación en los procesos clínicos y administrativos que faciliten el desarrollo de la atención integral en salud.', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '1', 'POLITICA DE PRESTACION DE SERVICIOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '10', 'POLITICA DE HUMANIZACION DEL SERVICIO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '11', 'POLITICA DE REFERENCIACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '12', 'POLITICA DE RESPONSABILIDAD SOCIAL', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '13', 'POLITICA DE SEGURIDAD DEL PACIENTE', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '14', 'POLITICA DOCENCIA SERVICIO E INVESTIGACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '2', 'POLITICA AMBIENTE FISICO SEGURO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '3', 'POLITICA DE ADMINISTRACION DEL RIESGO DE LAVADO DE ACTIVOS Y LA FINANCIACION DE TERRORISMO (SARLAFT).', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '4', 'POLITICA DE CALIDAD Y MEJORAMIENTO CONTINUO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '5', 'POLITICA DE GESTION AMBIENTAL', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '6', 'POLITICA DE GESTION DE LA INFORMACION Y COMUNICACIONES', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '7', 'POLITICA DE GESTION DE LATECNOLOGIA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '8', 'POLITICA DE GESTION DEL  TALENTO HUMANO Y TRASFORMACION CULTURAL', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Politicas', '9', 'POLITICA DE GESTION Y ADMINISTRACION  DEL RIESGO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '1', 'GESTION ESTRATEGICA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '10', 'GESTION FINANCIERA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '11', 'GESTION JURIDICA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '12', 'GESTION DE CONTRATACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '13', 'GESTION DE INFORMACION Y TICS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '14', 'GESTION DEL AMBIENTE FISICO Y TECNOLOGICO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '15', 'GESTION DEL TALENTO HUMANO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '16', 'EVALUACION DE GESTION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '17', 'GESTION DISCIPLINARIA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '2', 'PARTICIPACION SOCIAL Y ATENCION DEL USUARIO', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '3', 'DOCENCIA E INVESTIGACION', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '4', 'GESTION DE LA CALIDAD', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '5', 'GESTION DEL RIESGO EN SALUD', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '6', 'GESTION AMBULATORIA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '7', 'GESTION DE HOSPITALIZACION Y CIRUGIA', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '8', 'GESTION DE URGENCIAS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Procesos', '9', 'GESTION DE SERVICIO COMPLEMENTARIOS', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '1', 'CAPS Calle 80', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '10', 'USS Española', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '11', 'UMHES Simón Bolívar', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '12', 'CAPS Fray Bartolomé de Las Casas', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '13', 'UMHES Centro de Servicios Especializado', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '14', 'CAPS Suba', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '15', 'CAPS Gaitana', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '16', 'USS Prado Veraniego', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '17', 'CAPS Rincon', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '18', 'USS Servitá', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '19', 'USS Santa Cecilia', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '2', 'CAPS Emaus', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '20', 'USS Buenavista', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '21', 'USS Codito', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '22', 'CAPS San Cristóbal', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '23', 'USS Orquídeas', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '24', 'CAPS Verbenal', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '25', 'USS Usaquén', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '26', 'USS Lorencita Villegas de Santos', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '27', 'USS San Luis', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '28', 'CAPS Chapinero', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '3', 'USS Ferias', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '4', 'CAPS Boyacá Real', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '5', 'USS Bachué', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '6', 'CAPS Garces Navas', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '7', 'USS Quirigua', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '8', 'USS Bellavista', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('sucursal', '9', 'USS Alamos', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Tendencia', '1', 'Creciente', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Tendencia', '2', 'Decreciente', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Tendencia', '3', 'Mantener', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Tendencia', '4', 'Informativo', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('Tendencia', '5', 'No aplica', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('TipoCalculo', '1', 'Formula', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('TipoCalculo', '2', 'Valor', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('TipoCalculo', '3', 'Procentaje', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('tipoDocumento', 'C', 'Cedula de Ciudadania', 'A', NULL, '2011-01-11', 'admin', '2011-01-11', ''),
('tipoDocumento', 'E', 'Cedulade Extranjeria', 'A', NULL, '2011-01-11', 'admin', '2011-01-11', ''),
('tipoDocumento', 'T', 'Tarjeta de Identidad', 'A', NULL, '2011-01-11', 'admin', '2011-01-11', ''),
('TipoFuncionario', 'C', 'Contratista', 'A', NULL, '2011-01-11', 'admin', '2011-01-11', ''),
('TipoFuncionario', 'P', 'Planta', 'A', NULL, '2011-01-11', 'admin', '2011-01-11', ''),
('TipoIndicador', '1', 'Eficiencia', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('TipoIndicador', '2', 'Eficacia', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('TipoIndicador', '3', 'Efectividad', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '1', 'Años', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '2', 'Meses', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '3', 'Dias', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '4', '%', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '5', 'Numero%', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '6', 'Porcentaje', 'A', NULL, '2019-05-25', 'lidertic', NULL, ''),
('unidad_medidad', '7', 'Horas', 'A', NULL, '2019-05-25', 'lidertic', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `FECHA_REGISTRO` varchar(20) NOT NULL,
  `ESTATUS` int(11) NOT NULL DEFAULT '0',
  `TIPO` varchar(20) NOT NULL DEFAULT 'Invitado',
  `PASSWORD` varchar(50) DEFAULT '123'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `NOMBRE`, `APELLIDOS`, `EMAIL`, `FECHA_REGISTRO`, `ESTATUS`, `TIPO`, `PASSWORD`) VALUES
(1, 'Victor', 'Gomez', 'vitotoju@gmail.com', '2019-11-27 14:39:06', 0, 'Administrador', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'Jeffer', 'Ruiz', 'jeffer@hotmail.com', '2019-11-20 12:17:45', 0, 'Invitado', '81dc9bdb52d04dc20036dbd8313ed055'),
(3, 'aael', 'jimenez', 'asaelji@hotmail.com', '2019-11-21 05:26:38', 0, 'Administrador', '123'),
(4, 'david', 'jimenez', 'david@hotmail.com', '2019-11-21 05:26:38', 0, 'Administrador', '123'),
(5, 'diana', 'ussas', 'dianau@hotmail.com', '2019-11-21 18:35:40', 0, 'Administrador', '8f31cab13ec4e48de90b78c6dd71e17e');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visitas`
--

CREATE TABLE `visitas` (
  `id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `direccionip` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `direccionip4` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `visita` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `visitas`
--

INSERT INTO `visitas` (`id`, `fecha`, `direccionip`, `direccionip4`, `visita`) VALUES
(6, '2019-11-23 21:57:55', '192.168.0.8', '3232235528', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `dat_analisis`
--
ALTER TABLE `dat_analisis`
  ADD PRIMARY KEY (`oid`);

--
-- Indices de la tabla `dat_indicador`
--
ALTER TABLE `dat_indicador`
  ADD PRIMARY KEY (`codigo_indicador`);

--
-- Indices de la tabla `dat_movimiento`
--
ALTER TABLE `dat_movimiento`
  ADD PRIMARY KEY (`oid`);

--
-- Indices de la tabla `menu_sistema`
--
ALTER TABLE `menu_sistema`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `permisosmenu`
--
ALTER TABLE `permisosmenu`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `sis_multivalores`
--
ALTER TABLE `sis_multivalores`
  ADD PRIMARY KEY (`tabla`,`codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `visitas`
--
ALTER TABLE `visitas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dat_analisis`
--
ALTER TABLE `dat_analisis`
  MODIFY `oid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `dat_indicador`
--
ALTER TABLE `dat_indicador`
  MODIFY `codigo_indicador` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `dat_movimiento`
--
ALTER TABLE `dat_movimiento`
  MODIFY `oid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `menu_sistema`
--
ALTER TABLE `menu_sistema`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `permisosmenu`
--
ALTER TABLE `permisosmenu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `visitas`
--
ALTER TABLE `visitas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
