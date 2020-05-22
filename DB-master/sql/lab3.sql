SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- drop database shop;
-----------------------------------------------------
-- Schema shop
-----------------------------------------------------

-----------------------------------------------------
-- Schema shop
-----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 ;
USE `shop` ;

-----------------------------------------------------
-- Table `shop`.`categories`
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_name_UNIQUE` (`category_name` ASC) VISIBLE)
ENGINE = InnoDB;


-----------------------------------------------------
-- Table `shop`.`shops`
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`shops` (
  `shop_id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`shop_id`),
  UNIQUE INDEX `address_UNIQUE` (`address` ASC) VISIBLE)
ENGINE = InnoDB;


-----------------------------------------------------
-- Table `shop`.`products`
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` DOUBLE NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `fk_products_categories_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `shop`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-----------------------------------------------------
-- Table `shop`.`shops_has_products`
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`shops_has_products` (
  `shop_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`shop_id`, `product_id`),
  INDEX `fk_shops_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_shops_has_products_shops1_idx` (`shop_id` ASC) VISIBLE,
  CONSTRAINT `fk_shops_has_products_shops1`
    FOREIGN KEY (`shop_id`)
    REFERENCES `shop`.`shops` (`shop_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_shops_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-----------------------------------------------------
-- Table `shop`.`description`
-----------------------------------------------------
CREATE TABLE IF NOT EXISTS `shop`.`description` (
  `description_id` INT NOT NULL AUTO_INCREMENT,
  `maintainer` VARCHAR(45) NOT NULL,
  `characteristics` VARCHAR(200) NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`description_id`),
  INDEX `fk_description_products1_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `fk_description_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `shop`.`products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-----------------------------------------------------
-- Data for table `shop`.`categories`
-----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (1, 'Washing machines');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (2, 'Refrigerators');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (3, 'Vacuum cleaners');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (4, 'Steamers');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (5, 'Blenders');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (6, 'Flatirons');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (7, 'Boilers');
INSERT INTO `shop`.`categories` (`category_id`, `category_name`) VALUES (8, 'Freezers');

COMMIT;


-----------------------------------------------------
-- Data for table `shop`.`shops`
-----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`shops` (`shop_id`, `address`) VALUES (1, 'Kharkiv,Horodovikova st., 45');
INSERT INTO `shop`.`shops` (`shop_id`, `address`) VALUES (2, 'Kiev, Beregova st., 23');
INSERT INTO `shop`.`shops` (`shop_id`, `address`) VALUES (3, 'Lviv, Derevyanko st., 42');
INSERT INTO `shop`.`shops` (`shop_id`, `address`) VALUES (4, 'Poltava, Zhovtneva st., 74A');

COMMIT;


-----------------------------------------------------
-- Data for table `shop`.`products`
-----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (1, 'BOSCH KGN', 15899, 2);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (2, 'LG F0J5N', 11999, 1);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (3, 'BOSCH BGS2U', 2999, 3);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (4, 'ROWENTA X-Trem', 5000, 3);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (5, 'HOBBS MaxiCook', 1999, 4);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (6, 'TEFAL VC', 1200, 4);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (7, 'Philips Avance HR36', 3999, 5);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (8, 'TEFAL HB877D', 1999, 5);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (9, 'PHILIPS Azur GC49 ', 2499, 6);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (10, 'Octopus HW C2-301', 55132, 7);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (11, 'LIEBHERR SIGN', 40999, 8);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (12, 'SAMSUNG WW90', 22999, 1);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (13, 'TOSHIBA GR-RF', 44999, 2);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (14, 'Gorenje VLG', 33628, 7);
INSERT INTO `shop`.`products` (`product_id`, `name`, `cost`, `category_id`) VALUES (15, 'BOSCH TDI', 2599, 6);

COMMIT;


-----------------------------------------------------
-- Data for table `shop`.`shops_has_products`
-----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 1);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 2);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 3);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 5);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 8);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 1);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 2);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 10);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 11);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 9);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (2, 7);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (3, 6);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (3, 7);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (3, 8);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (4, 4);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (4, 12);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (4, 13);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 13);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 14);
INSERT INTO `shop`.`shops_has_products` (`shop_id`, `product_id`) VALUES (1, 15);

COMMIT;


-------------------------------------------------------
-- Data for table `shop`.`description`
-----------------------------------------------------
START TRANSACTION;
USE `shop`;
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (1, 'Turkey', 'Volume: 400 Type: Dual chamber', 1);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (2, 'China', 'Volume: 6kg Spin speed: 1000sp/min', 2);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (3, 'Poland', 'Type: dry Weight: 4.7 Power: 2000BT ', 3);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (4, 'France','Type: dry Power: 750BT', 4);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (5, 'China', 'Functions: Delayed start, Fast steam', 5);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (6, 'China', 'Functions: Auto power off', 6);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (7, 'China', 'Power: 1400BT Glass capacity: 2000', 7);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (8, 'China', 'Power: 1000BT Glass capacity: 800', 8);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (9, 'Indonesia', 'Type: steam Material: Pottery', 9);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (10, 'Sweden', 'Volume: 300', 10);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (11, 'Germany', 'Volume: 300kg Functions: No Frost', 11);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (12, 'China', 'Spin speed: 1400sp/min', 12);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (13, 'Germany', 'Type: Multi-door Functions: No Frost', 13);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (14, 'Slovenia', 'Volume: 283.7 Type: Hidden("dry")', 14);
INSERT INTO `shop`.`description` (`description_id`, `maintainer`, `characteristics`, `product_id`) VALUES (15, 'Germany', 'Type: steam Material: Aluminum', 15);
COMMIT;


select * FROM products;








