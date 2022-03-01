-- Online shop sample BD schema

CREATE SCHEMA `online_shop` DEFAULT CHARACTER SET utf8mb4 ;
USE `online_shop`;

CREATE TABLE `online_shop`.`transactions` (
  `transaction_id` VARCHAR(15) NOT NULL,
  `product_id` VARCHAR(15) NOT NULL,
  `customer_id` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  `price` INT NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`transaction_id`, `product_id`, `customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `online_shop`.`products` (
	`product_id` VARCHAR(15) NOT NULL,
    `product` VARCHAR(60) NOT NULL,
    `price` INT NULL,
    `discounts` INT NULL,
    `stock` INT NULL DEFAULT 0,
    PRIMARY KEY (`product_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `online_shop`.`customers` (
	`customer_id` VARCHAR(15) NOT NULL,
    `customer_name` VARCHAR(60) NOT NULL,
    `country` VARCHAR(60) NULL,
    `address` VARCHAR(60) NULL,
    `email` VARCHAR(60) NOT NULL,
    `phone_number` VARCHAR(60) NULL,
    PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;