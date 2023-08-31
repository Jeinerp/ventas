CREATE DATABASE  IF NOT EXISTS `ventas` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ventas`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ventas
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  `apellido` char(50) NOT NULL,
  `direccion` char(50) NOT NULL,
  `correo` char(50) NOT NULL,
  `fecha_nacimiento` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `correo_UNIQUE` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','Calle 123','juan.perez@gmail.com','1990-05-15'),(2,'María','García','Avenida XYZ','maria.garcia@hotmail.com','1988-10-20'),(3,'Luis','Martínez','Calle ABC','luis.martinez@gmail.com','1995-03-12'),(4,'Ana','Rodríguez','Av. Principal','ana.rodriguez@hotmail.com','1992-07-05'),(5,'Carlos','Fernández','Calle Central','carlos.fernandez@gmail.com','1993-11-30'),(6,'Laura','López','Calle 456','laura.lopez@hotmail.com','1985-09-18'),(7,'Pedro','Díaz','Av. Secundaria','pedro.diaz@gmail.com','1997-02-25'),(8,'Isabel','Hernández','Av. 2','isabel.hernandez@hotmail.com','1987-12-10'),(9,'Sergio','Vargas','Calle 789','sergio.vargas@gmail.com','1991-08-07'),(10,'Mónica','Ramírez','Calle 987','monica.ramirez@hotmail.com','1994-06-22');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int unsigned NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precioCompra` decimal(10,0) NOT NULL,
  `precioVenta` decimal(10,0) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Camiseta',80000,200000,200),(2,'Zapatos',25000,500000,100),(3,'Pantalones',150000,350000,150),(4,'Vestido',300000,600000,80),(5,'Reloj',500000,1000000,30),(6,'Computadora Portátil',6000000,10000000,10),(7,'Botas',400000,800000,50),(8,'Teléfono Inteligente',3000000,5000000,25),(9,'Gafas de Sol',100000,250000,200),(10,'Auriculares Inalámbricos',200000,450000,150),(11,'Mochila',150000,350000,100),(12,'Bolso',120000,300000,120),(13,'Gorra',50000,150000,300),(14,'Cartera',200000,500000,80),(15,'Sneakers',300000,700000,70),(16,'Chaqueta',450000,900000,60),(17,'Bufanda',800000,180000,180),(18,'Reloj de Pulsera',350000,700000,100),(19,'Guitarra Acústica',1500000,2800000,20),(20,'Libro',50000,120000,500);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_tipo_producto`
--

DROP TABLE IF EXISTS `productos_tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_tipo_producto` (
  `tipo_producto_id` int NOT NULL,
  `productos_id` int unsigned NOT NULL,
  KEY `fk_productos_has_tipo_producto_tipo_producto1_idx` (`tipo_producto_id`),
  KEY `fk_productos_has_tipo_producto_productos1_idx` (`productos_id`),
  CONSTRAINT `fk_productos_has_tipo_producto_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_productos_has_tipo_producto_tipo_producto1` FOREIGN KEY (`tipo_producto_id`) REFERENCES `tipo_producto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_tipo_producto`
--

LOCK TABLES `productos_tipo_producto` WRITE;
/*!40000 ALTER TABLE `productos_tipo_producto` DISABLE KEYS */;
INSERT INTO `productos_tipo_producto` VALUES (1,1),(2,2),(1,3),(1,4),(4,5),(3,6),(2,7),(3,8),(4,9),(3,10),(2,11),(5,12),(1,13),(4,14),(2,15),(1,16),(1,17),(4,18),(5,19),(5,20),(1,1),(2,2),(1,3),(1,4),(4,5),(3,6),(2,7),(3,8),(4,9),(3,10),(2,11),(5,12),(1,13),(4,14),(2,15),(1,16),(1,17),(4,18),(5,19),(5,20);
/*!40000 ALTER TABLE `productos_tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_ventas`
--

DROP TABLE IF EXISTS `productos_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_ventas` (
  `ventas_id` int NOT NULL,
  `productos_id` int unsigned NOT NULL,
  KEY `fk_productos_has_ventas_ventas1_idx` (`ventas_id`),
  KEY `fk_productos_has_ventas_productos1_idx` (`productos_id`),
  CONSTRAINT `fk_productos_has_ventas_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_productos_has_ventas_ventas1` FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_ventas`
--

LOCK TABLES `productos_ventas` WRITE;
/*!40000 ALTER TABLE `productos_ventas` DISABLE KEYS */;
INSERT INTO `productos_ventas` VALUES (1,1),(1,2),(2,3),(2,4),(3,5),(3,6),(4,7),(4,8),(5,9),(5,10),(6,11),(6,12),(7,13),(7,14),(8,15),(8,16),(9,17),(9,18),(10,19),(10,20),(11,1),(11,2),(12,3),(12,4);
/*!40000 ALTER TABLE `productos_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(80) NOT NULL,
  `dirrecion` char(80) NOT NULL,
  `telefono` char(40) NOT NULL,
  `correo` char(120) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'FashionStyle Co.','123 Calle de la Moda, Ciudad Moda','+1-555-123-4567','contacto@fashionstyle.com'),(2,'TechGadgets Inc.','456 Avenida Tecnológica, Ciudad Tecnología','+1-555-987-6543','ventas@techgadgets.com'),(3,'SportsEmpire Ltd.','789 Calle del Deporte, Ciudad Deportiva','+1-555-456-7890','info@sportsempire.com'),(4,'HomeDecor Solutions','567 Avenida del Hogar, Ciudad Hogar','+1-555-234-5678','info@homedecorsolutions.com'),(5,'FreshProduce Distributors','890 Calle Fresca, Ciudad Frescura','+1-555-789-0123','sales@freshproduce.com'),(6,'HealthWell Pharma','456 Avenida de la Salud, Ciudad Salud','+1-555-345-6789','orders@healthwellpharma.com'),(7,'GourmetDelights Supply','678 Calle Gourmet, Ciudad Delicia','+1-555-567-8901','info@gourmetdelights.com'),(8,'AutoTech Solutions','234 Avenida Automotriz, Ciudad Motor','+1-555-901-2345','support@autotechsolutions.com'),(9,'ArtisticCrafts Creations','789 Calle Artística, Ciudad Creatividad','+1-555-123-5678','sales@artisticcrafts.com'),(10,'GreenThumb Nursery','345 Avenida del Jardín, Ciudad Naturaleza','+1-555-678-9012','info@greenthumbnursery.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_productos`
--

DROP TABLE IF EXISTS `proveedores_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores_productos` (
  `proveedores_id` int NOT NULL,
  `productos_id` int unsigned NOT NULL,
  KEY `fk_proveedores_has_productos1_proveedores1_idx` (`proveedores_id`),
  KEY `fk_proveedores_has_productos1_productos1_idx` (`productos_id`),
  CONSTRAINT `fk_proveedores_has_productos1_productos1` FOREIGN KEY (`productos_id`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_proveedores_has_productos1_proveedores1` FOREIGN KEY (`proveedores_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_productos`
--

LOCK TABLES `proveedores_productos` WRITE;
/*!40000 ALTER TABLE `proveedores_productos` DISABLE KEYS */;
INSERT INTO `proveedores_productos` VALUES (1,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(10,12),(9,13),(8,14),(7,15),(6,16),(5,17),(4,18),(3,19),(2,20),(1,1),(1,2),(1,1),(1,2),(2,3),(3,4),(4,5),(5,6),(6,7),(7,8),(8,9),(9,10),(10,11),(10,12),(9,13),(8,14),(7,15),(6,16),(5,17),(4,18),(3,19),(2,20),(1,1),(1,2);
/*!40000 ALTER TABLE `proveedores_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(10) NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_telefono_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_telefono_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,'555-1234',1),(2,'555-5678',1),(3,'555-4321',2),(4,'555-8765',3),(5,'555-9876',3),(6,'555-2345',4),(7,'555-7890',5),(8,'555-6789',6),(9,'555-3456',7),(10,'555-4567',8),(11,'555-8901',9),(12,'555-9012',10);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'Ropa'),(2,'Calzado'),(3,'Electrónica'),(4,'Joyas'),(5,'Hogar');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` char(50) NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` bigint NOT NULL,
  `iva` decimal(10,0) NOT NULL,
  `descuento` decimal(10,0) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `cliente_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_ventas_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_ventas_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'Venta 1','2023-08-01',15000,1200,1000,152,1),(2,'Venta 2','2023-08-02',25000,2000,1500,255,2),(3,'Venta 3','2023-08-03',30000,2400,2000,304,3),(4,'Venta 4','2023-08-04',10000,800,500,10300,4),(5,'Venta 5','2023-08-05',45000,3600,3000,45600,5),(6,'Venta 6','2023-08-06',20000,1600,1000,20600,6),(7,'Venta 7','2023-08-07',18000,1440,1200,18240,7),(8,'Venta 8','2023-08-08',30000,2400,2000,30400,8),(9,'Venta 9','2023-08-09',5000,400,250,5150,9),(10,'Venta 10','2023-08-10',12000,960,800,12160,10),(11,'Venta 11','2023-08-11',28000,2240,1800,28440,1),(12,'Venta 12','2023-08-12',15000,1200,1000,15200,2),(13,'Venta 13','2023-08-13',9000,720,500,9220,3),(14,'Venta 14','2023-08-14',20000,1600,1200,20400,4),(15,'Venta 15','2023-08-15',18000,1440,1000,18440,5),(16,'Venta 16','2023-08-16',28000,2240,2000,28240,6),(17,'Venta 17','2023-08-17',7000,560,400,7160,7),(18,'Venta 18','2023-08-18',15000,1200,1000,15200,8),(19,'Venta 19','2023-08-19',40000,3200,2500,40700,9),(20,'Venta 20','2023-08-20',18000,1440,1200,18240,10);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ventas'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-31  9:37:56
