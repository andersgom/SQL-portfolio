-- Employee sample DB schema

CREATE SCHEMA `employee_db`
DEFAULT CHARACTER SET utf8mb4 ;

USE `employee_db`;

CREATE TABLE `employee_db`.`employees` (
  `employee_id` VARCHAR(15) NOT NULL,
  `name` VARCHAR(15) NOT NULL,
  `onboarding_date` DATE NOT NULL,
  `salary` INT NOT NULL,
  `benefit_tier` VARCHAR(1) NOT NULL,
  `position` VARCHAR(15) NOT NULL,
  `department` VARCHAR(15) NOT NULL,
  `office_id` VARCHAR(15) NOT NULL,
  `manager_id` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`employee_id`, `benefit_tier`, `office_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `employee_db`.`benefis` (
  `benefit_tier` VARCHAR(1) NOT NULL,
  `health_insurance` TINYINT NOT NULL,
  `meal_allowance` TINYINT NOT NULL,
  `transportation` TINYINT NOT NULL,
  `technical_skill_bonus` TINYINT NOT NULL,
  `performance_bonus` TINYINT NOT NULL,
  `travel_expenses` TINYINT NOT NULL,
  PRIMARY KEY (`benefit_tier`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `employee_db`.`office` (
  `office_id` VARCHAR(15) NOT NULL,
  `office_address` VARCHAR(30) NULL,
  `owned` TINYINT NOT NULL,
  PRIMARY KEY (`office_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;

