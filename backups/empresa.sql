-- MySQL dump 10.13
--
-- Host: localhost    Database: empresa
-- ------------------------------------------------------
-- Server version 8.0

CREATE DATABASE IF NOT EXISTS `empresa`;

USE `empresa`;

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `usuarios` WRITE;
INSERT INTO `usuarios` VALUES
(1,'Maria Silva','maria@email.com'),
(2,'Joao Souza','joao@email.com'),
(3,'Ana Lima','ana@email.com');
UNLOCK TABLES;

-- Dump completed
