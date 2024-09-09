-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: carservice
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `id` int NOT NULL AUTO_INCREMENT,
  `make` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `year` int DEFAULT NULL,
  `engine_size` decimal(3,1) DEFAULT NULL,
  `color` varchar(30) DEFAULT NULL,
  `registration_number` varchar(20) DEFAULT NULL,
  `mileage` int DEFAULT NULL,
  `transmission_type` varchar(20) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `num_doors` int DEFAULT NULL,
  `num_seats` int DEFAULT NULL,
  `has_air_conditioning` tinyint(1) DEFAULT NULL,
  `has_navigation` tinyint(1) DEFAULT NULL,
  `has_sunroof` tinyint(1) DEFAULT NULL,
  `last_service_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (1,'Toyota','Camry',2022,2.5,'White','ABC123',15000,'Automatic','Petrol',4,5,1,1,0,'2024-03-15'),(2,'Honda','Accord',2021,1.5,'Black','DEF456',20000,'Automatic','Petrol',4,5,1,1,1,'2024-01-20'),(3,'BMW','5 Series',2023,3.0,'Blue','GHI789',5000,'Automatic','Petrol',4,5,1,1,1,'2024-05-10'),(4,'Audi','Q7',2020,3.0,'Silver','JKL012',30000,'Automatic','Diesel',5,7,1,1,1,'2024-02-25'),(5,'Mercedes-Benz','C-Class',2019,2.0,'Grey','MNO345',40000,'Automatic','Petrol',4,5,1,1,0,'2023-11-30'),(6,'Hyundai','Solaris',2022,1.6,'Red','PQR678',10000,'Manual','Petrol',4,5,1,0,0,'2024-04-05'),(7,'BMW','X3',2021,2.0,'Black','STU901',22000,'Automatic','Petrol',4,5,1,1,1,'2024-06-18'),(8,'Audi','A6',2022,2.0,'Silver','VWX234',12000,'Automatic','Diesel',4,5,1,1,0,'2024-07-12'),(9,'Kia','Sportage',2021,2.4,'Blue','YZA567',18000,'Automatic','Petrol',4,5,1,1,1,'2024-08-20'),(10,'Nissan','X-Trail',2020,2.5,'Green','BCD678',25000,'Automatic','Diesel',5,7,1,0,0,'2024-05-23'),(11,'Skoda','Octavia',2019,1.8,'White','EFG345',35000,'Manual','Petrol',4,5,1,1,1,'2024-03-10'),(12,'Kia','Sorento',2021,2.2,'Grey','HIJ456',14000,'Automatic','Diesel',5,7,1,1,0,'2024-04-15'),(13,'Volkswagen','Passat',2022,2.0,'Black','KLM789',8000,'Automatic','Petrol',4,5,1,1,1,'2024-02-05'),(14,'Lexus','RX',2022,3.5,'Silver','NOP012',10000,'Automatic','Petrol',4,5,1,1,1,'2024-03-30'),(15,'Mazda','CX-5',2021,2.5,'Red','QRS345',16000,'Automatic','Petrol',4,5,1,1,0,'2024-01-10'),(16,'Chevrolet','Cruze',2020,1.4,'Blue','TUV678',22000,'Manual','Petrol',4,5,1,0,1,'2024-07-25'),(17,'Subaru','Forester',2019,2.5,'Green','WXY901',30000,'Automatic','Petrol',5,5,1,0,0,'2024-06-15'),(18,'Porsche','Cayenne',2023,3.0,'Black','ZAB234',5000,'Automatic','Petrol',5,5,1,1,1,'2024-08-10'),(19,'Jeep','Grand Cherokee',2022,3.6,'White','CDE567',7000,'Automatic','Petrol',5,5,1,1,0,'2024-04-20'),(20,'Volvo','XC90',2021,2.0,'Silver','FGH890',19000,'Automatic','Diesel',7,7,1,1,1,'2024-03-12'),(21,'Renault','Duster',2020,1.6,'Blue','IJK345',25000,'Manual','Petrol',5,5,1,0,0,'2024-07-15'),(22,'Peugeot','308',2021,1.6,'Black','LMN678',14000,'Automatic','Diesel',5,5,1,1,1,'2024-01-30'),(23,'Citroen','C4',2019,1.8,'Grey','OPQ901',30000,'Manual','Petrol',4,5,1,0,1,'2024-06-25'),(24,'Land Rover','Discovery',2021,3.0,'Green','RST234',15000,'Automatic','Diesel',5,7,1,1,1,'2024-05-05'),(25,'Jaguar','XF',2022,2.0,'Silver','UVW567',9000,'Automatic','Petrol',4,5,1,1,0,'2024-08-20'),(26,'Mitsubishi','Outlander',2020,2.4,'Blue','XYZ890',22000,'Automatic','Petrol',5,7,1,1,0,'2024-02-10'),(27,'Suzuki','Vitara',2021,1.6,'Red','ABC456',13000,'Manual','Petrol',5,5,1,0,1,'2024-03-05'),(28,'Tesla','Model S',2022,NULL,'White','DEF789',8000,'Automatic','Electric',4,5,1,1,1,'2024-04-15'),(29,'Infiniti','QX60',2021,3.5,'Black','GHI012',10000,'Automatic','Petrol',7,7,1,1,0,'2024-05-20'),(30,'Bentley','Bentayga',2022,4.0,'Silver','JKL345',5000,'Automatic','Petrol',5,5,1,1,1,'2024-02-25'),(31,'Cadillac','Escalade',2021,6.2,'Grey','MNO678',12000,'Automatic','Petrol',7,7,1,1,0,'2024-03-15'),(32,'Rolls-Royce','Phantom',2020,6.8,'White','PQR901',20000,'Automatic','Petrol',4,5,1,1,1,'2024-07-10'),(33,'Ferrari','488',2022,3.9,'Red','STU234',5000,'Automatic','Petrol',2,2,1,1,0,'2024-08-01'),(34,'Lamborghini','Urus',2021,4.0,'Yellow','VWX567',12000,'Automatic','Petrol',5,5,1,1,1,'2024-05-05'),(35,'Aston Martin','DBX',2022,4.0,'Green','YZA890',7000,'Automatic','Petrol',5,5,1,1,1,'2024-04-20'),(36,'McLaren','720S',2021,4.0,'Orange','BCD123',8000,'Automatic','Petrol',2,2,1,1,1,'2024-06-15'),(37,'Alfa Romeo','Stelvio',2022,2.0,'Blue','EFG456',6000,'Automatic','Petrol',5,5,1,1,1,'2024-03-30'),(38,'Maserati','Levante',2021,3.0,'Red','HIJ789',15000,'Automatic','Petrol',5,5,1,1,0,'2024-02-20'),(39,'Bugatti','Chiron',2022,8.0,'Blue','KLM012',3000,'Automatic','Petrol',2,2,1,1,1,'2024-07-05'),(40,'Fiat','500',2020,1.2,'White','NOP345',22000,'Manual','Petrol',2,4,1,0,0,'2024-06-20'),(41,'Opel','Astra',2021,1.4,'Grey','QRS678',14000,'Manual','Petrol',4,5,1,1,1,'2024-03-10'),(42,'Seat','Leon',2020,1.5,'Black','TUV901',17000,'Manual','Petrol',4,5,1,0,1,'2024-04-25'),(43,'Dodge','Durango',2021,3.6,'Silver','WXY234',12000,'Automatic','Petrol',7,7,1,1,1,'2024-05-15'),(44,'Jeep','Wrangler',2020,3.6,'Green','XYZ567',25000,'Automatic','Petrol',4,4,1,1,0,'2024-06-30'),(45,'Chevrolet','Tahoe',2021,5.3,'Black','ABC678',15000,'Automatic','Petrol',7,7,1,1,0,'2024-07-15'),(46,'Hyundai','Tucson',2022,2.0,'Red','DEF789',8000,'Automatic','Petrol',5,5,1,1,1,'2024-08-20'),(47,'Ford','Mustang',2021,5.0,'Blue','GHI012',10000,'Automatic','Petrol',2,4,1,1,0,'2024-03-05'),(48,'Nissan','Qashqai',2020,1.5,'White','JKL345',20000,'Manual','Petrol',5,5,1,1,1,'2024-04-10'),(49,'Mazda','3',2021,2.0,'Grey','MNO678',12000,'Automatic','Petrol',4,5,1,1,0,'2024-05-20'),(50,'Subaru','Impreza',2020,2.0,'Silver','PQR901',23000,'Manual','Petrol',4,5,1,0,1,'2024-06-15'),(51,'Mercedes-Benz','E-Class',2021,3.0,'Black','STU234',14000,'Automatic','Petrol',4,5,1,1,1,'2024-07-10'),(52,'Chevrolet','Malibu',2022,1.5,'Blue','VWX567',8000,'Automatic','Petrol',5,5,1,1,1,'2024-08-05');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Иванов','Иван','+7 123 456-78-90','ivanov@example.com','2021-01-15','123'),(2,'Петров','Петр','+7 123 456-78-91','petrov@example.com','2021-02-20','123'),(3,'Сидоров','Александр','+7 123 456-78-92','sidorov@example.com','2021-03-10','123'),(4,'Кузнецов','Сергей','+7 123 456-78-93','kuznetsov@example.com','2021-04-05','123'),(5,'Смирнов','Андрей','+7 123 456-78-94','smirnov@example.com','2021-05-12','123'),(6,'Попов','Николай','+7 123 456-78-95','popov@example.com','2021-06-18','123'),(7,'Васильев','Дмитрий','+7 123 456-78-96','vasiliev@example.com','2021-07-22','123'),(8,'Николаев','Алексей','+7 123 456-78-97','nikolaev@example.com','2021-08-30','123'),(9,'Фёдоров','Михаил','+7 123 456-78-98','fedorov@example.com','2021-09-15','123'),(10,'Орлов','Юрий','+7 123 456-78-99','orlov@example.com','2021-10-10','123'),(11,'Григорьев','Олег','+7 123 456-79-00','grigoryev@example.com','2021-11-05','123'),(12,'Зайцев','Антон','+7 123 456-79-01','zaytsev@example.com','2021-12-15','123'),(13,'Воробьев','Константин','+7 123 456-79-02','vorobyev@example.com','2022-01-20','123'),(14,'Крылов','Роман','+7 123 456-79-03','krylov@example.com','2022-02-15','123'),(15,'Морозов','Владислав','+7 123 456-79-04','morozov@example.com','2022-03-10','123'),(16,'Тарасов','Денис','+7 123 456-79-05','tarasov@example.com','2022-04-05','123'),(17,'Медведев','Евгений','+7 123 456-79-06','medvedev@example.com','2022-05-20','123'),(18,'Захаров','Олег','+7 123 456-79-07','zakharo@example.com','2022-06-15','123'),(19,'Ефимов','Павел','+7 123 456-79-08','efimov@example.com','2022-07-10','123'),(20,'Лебедев','Максим','+7 123 456-79-09','lebedyev@example.com','2022-08-05','123');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` int DEFAULT NULL,
  `car_id` int DEFAULT NULL,
  `task` varchar(255) DEFAULT NULL,
  `dead_line` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  KEY `car_id` (`car_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'Замена масла','2024-01-12','не выполнен'),(2,1,2,'Плановый техосмотр','2024-01-23','не выполнен'),(3,1,3,'Ремонт двигателя','2024-01-15','не выполнен'),(4,2,4,'Замена тормозных колодок','2024-01-29','не выполнен'),(5,2,5,'Шиномонтаж','2024-02-05','не выполнен'),(6,2,6,'Замена масла','2024-02-18','не выполнен'),(7,3,7,'Замена свечей','2024-03-01','не выполнен'),(8,3,8,'Плановый осмотр','2024-03-10','не выполнен'),(9,3,9,'Диагностика подвески','2024-03-22','не выполнен'),(10,4,10,'Замена масла','2024-04-02','не выполнен'),(11,4,11,'Ремонт кондиционера','2024-04-15','не выполнен'),(12,4,12,'Замена тормозных колодок','2024-04-25','не выполнен'),(13,5,13,'Замена аккумулятора','2024-05-03','не выполнен'),(14,5,14,'Замена сцепления','2024-05-12','не выполнен'),(15,5,15,'Диагностика','2024-05-24','не выполнен'),(16,6,16,'Ремонт трансмиссии','2024-06-02','не выполнен'),(17,6,17,'Замена масла','2024-06-10','не выполнен'),(18,6,18,'Диагностика подвески','2024-06-20','не выполнен'),(19,7,19,'Ремонт двигателя','2024-07-01','не выполнен'),(20,7,20,'Замена масла','2024-07-15','не выполнен'),(21,7,1,'Ремонт электроники','2024-07-28','не выполнен'),(22,8,2,'Замена фильтров','2024-08-05','не выполнен'),(23,8,3,'Шиномонтаж','2024-08-17','не выполнен'),(24,8,4,'Ремонт ходовой части','2024-09-01','не выполнен'),(25,9,5,'Плановый осмотр','2024-09-10','не выполнен'),(26,9,6,'Замена тормозных дисков','2024-09-20','не выполнен'),(27,9,7,'Диагностика электроники','2024-10-01','не выполнен'),(28,10,8,'Замена сцепления','2024-10-12','не выполнен'),(29,10,9,'Замена масла','2024-10-22','не выполнен'),(30,10,10,'Плановый техосмотр','2024-11-02','не выполнен'),(31,11,11,'Ремонт двигателя','2024-11-12','не выполнен'),(32,11,12,'Шиномонтаж','2024-11-23','не выполнен'),(33,11,13,'Замена тормозных дисков','2024-12-05','не выполнен'),(34,12,14,'Ремонт подвески','2024-12-15','не выполнен'),(35,12,15,'Замена аккумулятора','2024-12-25','не выполнен'),(36,12,16,'Ремонт электроники','2024-01-07','не выполнен'),(37,13,17,'Замена сцепления','2024-01-15','не выполнен'),(38,13,18,'Шиномонтаж','2024-01-22','не выполнен'),(39,13,19,'Диагностика','2024-02-01','не выполнен'),(40,14,20,'Замена масла','2024-02-10','не выполнен'),(41,14,1,'Плановый осмотр','2024-02-20','не выполнен'),(42,14,2,'Ремонт двигателя','2024-03-01','не выполнен'),(43,15,3,'Замена тормозных колодок','2024-03-10','не выполнен'),(44,15,4,'Диагностика кондиционера','2024-03-20','не выполнен'),(45,15,5,'Плановый осмотр','2024-04-01','не выполнен'),(46,16,6,'Замена сцепления','2024-04-10','не выполнен'),(47,16,7,'Ремонт ходовой части','2024-04-20','не выполнен'),(48,16,8,'Замена аккумулятора','2024-05-01','не выполнен'),(49,17,9,'Ремонт электроники','2024-05-10','не выполнен'),(50,17,10,'Замена масла','2024-05-20','не выполнен'),(51,17,11,'Шиномонтаж','2024-06-01','не выполнен'),(52,18,12,'Замена фильтров','2024-06-10','не выполнен'),(53,18,13,'Ремонт трансмиссии','2024-06-20','не выполнен'),(54,18,14,'Диагностика подвески','2024-07-01','не выполнен'),(55,19,15,'Замена тормозных дисков','2024-07-10','не выполнен'),(56,19,16,'Шиномонтаж','2024-07-20','не выполнен'),(57,19,17,'Плановый осмотр','2024-08-01','не выполнен'),(58,20,18,'Замена масла','2024-08-10','не выполнен'),(59,20,19,'Ремонт двигателя','2024-08-20','не выполнен'),(60,20,20,'Диагностика электроники','2024-09-01','не выполнен'),(61,6,49,'Тех осмотр','2024-09-10','не выполнен');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'carservice'
--

--
-- Dumping routines for database 'carservice'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-10  0:07:43
