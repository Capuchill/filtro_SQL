-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TBM
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BUSES`
--
CREATE DATABASE TBM;

USE TBM;

DROP TABLE IF EXISTS `BUSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUSES` (
  `id_bus` int NOT NULL AUTO_INCREMENT,
  `placa` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_bus`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `BUSES_CONDUCTOR`
--

DROP TABLE IF EXISTS `BUSES_CONDUCTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BUSES_CONDUCTOR` (
  `id_conductor` int DEFAULT NULL,
  `id_bus` int DEFAULT NULL,
  KEY `buses_conductor_id_bus_foreign` (`id_bus`),
  KEY `buses_conductor_id_conductor_foreign` (`id_conductor`),
  CONSTRAINT `buses_conductor_id_bus_foreign` FOREIGN KEY (`id_bus`) REFERENCES `BUSES` (`id_bus`),
  CONSTRAINT `buses_conductor_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `CONDUCTORES` (`id_conductor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `CONDUCTORES`
--

DROP TABLE IF EXISTS `CONDUCTORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONDUCTORES` (
  `id_conductor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_conductor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESTACIONES`
--

DROP TABLE IF EXISTS `ESTACIONES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESTACIONES` (
  `id_estacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id_estacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ESTACIONES_RUTA`
--

DROP TABLE IF EXISTS `ESTACIONES_RUTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ESTACIONES_RUTA` (
  `id_estacion` int DEFAULT NULL,
  `id_ruta` int DEFAULT NULL,
  KEY `estaciones_ruta_id_estacion_foreign` (`id_estacion`),
  KEY `estaciones_ruta_id_ruta_foreign` (`id_ruta`),
  CONSTRAINT `estaciones_ruta_id_estacion_foreign` FOREIGN KEY (`id_estacion`) REFERENCES `ESTACIONES` (`id_estacion`),
  CONSTRAINT `estaciones_ruta_id_ruta_foreign` FOREIGN KEY (`id_ruta`) REFERENCES `RUTA` (`id_ruta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROGRAMACION`
--

DROP TABLE IF EXISTS `PROGRAMACION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROGRAMACION` (
  `id_programacion` int NOT NULL AUTO_INCREMENT,
  `id_ruta` int DEFAULT NULL,
  `id_conductor` int DEFAULT NULL,
  `dia_programado` varchar(20) DEFAULT NULL,
  `id_bus` int DEFAULT NULL,
  PRIMARY KEY (`id_programacion`),
  KEY `programacion_id_bus_foreign` (`id_bus`),
  KEY `programacion_id_ruta_foreign` (`id_ruta`),
  KEY `programacion_id_conductor_foreign` (`id_conductor`),
  CONSTRAINT `programacion_id_bus_foreign` FOREIGN KEY (`id_bus`) REFERENCES `BUSES` (`id_bus`),
  CONSTRAINT `programacion_id_conductor_foreign` FOREIGN KEY (`id_conductor`) REFERENCES `CONDUCTORES` (`id_conductor`),
  CONSTRAINT `programacion_id_ruta_foreign` FOREIGN KEY (`id_ruta`) REFERENCES `RUTA` (`id_ruta`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RUTA`
--

DROP TABLE IF EXISTS `RUTA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RUTA` (
  `id_ruta` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `tiempo` time DEFAULT NULL,
  `id_zona` int DEFAULT NULL,
  PRIMARY KEY (`id_ruta`),
  KEY `ruta_id_zona_foreign` (`id_zona`),
  CONSTRAINT `ruta_id_zona_foreign` FOREIGN KEY (`id_zona`) REFERENCES `ZONA` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ZONA`
--

DROP TABLE IF EXISTS `ZONA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ZONA` (
  `id_zona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'TBM'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-06 22:03:42
