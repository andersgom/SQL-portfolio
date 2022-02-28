-- Online shop sample BD schema

CREATE SCHEMA `online-shop` DEFAULT CHARACTER SET utf8mb4 ;
USE `online-shop`;

CREATE TABLE `online-shop`.`transactions` (
  `transaction-id` VARCHAR(15) NOT NULL,
  `product-id` VARCHAR(15) NOT NULL,
  `customer-id` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  `price` INT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`transaction-id`, `product-id`, `customer-id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `online-shop`.`products` (
	`product-id` VARCHAR(15) NOT NULL,
    `product` VARCHAR(60) NOT NULL,
    `price` INT NULL,
    `discounts` INT NULL,
    `stock` INT NULL DEFAULT 0,
    PRIMARY KEY (`product-id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `online-shop`.`customers` (
	`customer-id` VARCHAR(15) NOT NULL,
    `customer-name` VARCHAR(60) NOT NULL,
    `country` VARCHAR(60) NULL,
    `address` VARCHAR(60) NULL,
    `email` VARCHAR(60) NOT NULL,
    `phone-number` VARCHAR(60) NULL,
    PRIMARY KEY (`customer-id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;