-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hotel_gamma
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hotel_gamma` ;

-- -----------------------------------------------------
-- Schema hotel_gamma
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel_gamma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci ;
USE `hotel_gamma` ;

-- -----------------------------------------------------
-- Table `hotel_gamma`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`user` (
                                                    `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                    `email` VARCHAR(255) NOT NULL,
                                                    `password` VARCHAR(255) NOT NULL,
                                                    `first_name` VARCHAR(255) NOT NULL,
                                                    `last_name` VARCHAR(255) NOT NULL,
                                                    `phone` VARCHAR(255) NOT NULL,
                                                    `address` VARCHAR(255) NOT NULL,
                                                    `city` VARCHAR(255) NOT NULL,
                                                    `zip_code` VARCHAR(255) NOT NULL,
                                                    `admin` TINYINT NOT NULL DEFAULT 0,
                                                    PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`category` (
                                                        `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                        `name` VARCHAR(255) NOT NULL,
                                                        PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`room` (
                                                    `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                    `name` VARCHAR(255) NOT NULL,
                                                    `picture` VARCHAR(255) NOT NULL,
                                                    `description` TEXT NOT NULL,
                                                    `nb_beds` TINYINT UNSIGNED NOT NULL,
                                                    `nb_persons` TINYINT UNSIGNED NOT NULL,
                                                    `size` TINYINT UNSIGNED NOT NULL,
                                                    `price` DECIMAL(10,2) NOT NULL,
                                                    `category_id` BIGINT NOT NULL,
                                                    PRIMARY KEY (`id`),
                                                    INDEX `fk_room_category1_idx` (`category_id` ASC) VISIBLE,
                                                    CONSTRAINT `fk_room_category1`
                                                        FOREIGN KEY (`category_id`)
                                                            REFERENCES `hotel_gamma`.`category` (`id`)
                                                            ON DELETE NO ACTION
                                                            ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`picture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`picture` (
                                                       `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `file_name` VARCHAR(255) NOT NULL,
                                                       `room_id` BIGINT NOT NULL,
                                                       PRIMARY KEY (`id`),
                                                       INDEX `fk_picture_room_idx` (`room_id` ASC) VISIBLE,
                                                       CONSTRAINT `fk_picture_room`
                                                           FOREIGN KEY (`room_id`)
                                                               REFERENCES `hotel_gamma`.`room` (`id`)
                                                               ON DELETE NO ACTION
                                                               ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`booking` (
                                                       `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `date_start` DATE NOT NULL,
                                                       `date_end` DATE NOT NULL,
                                                       `price` DECIMAL(10,2) NOT NULL,
                                                       `user_id` BIGINT NOT NULL,
                                                       `room_id` BIGINT NOT NULL,
                                                       PRIMARY KEY (`id`),
                                                       INDEX `fk_booking_user1_idx` (`user_id` ASC) VISIBLE,
                                                       INDEX `fk_booking_room1_idx` (`room_id` ASC) VISIBLE,
                                                       CONSTRAINT `fk_booking_user1`
                                                           FOREIGN KEY (`user_id`)
                                                               REFERENCES `hotel_gamma`.`user` (`id`)
                                                               ON DELETE NO ACTION
                                                               ON UPDATE NO ACTION,
                                                       CONSTRAINT `fk_booking_room1`
                                                           FOREIGN KEY (`room_id`)
                                                               REFERENCES `hotel_gamma`.`room` (`id`)
                                                               ON DELETE NO ACTION
                                                               ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`amenity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`amenity` (
                                                       `id` BIGINT NOT NULL AUTO_INCREMENT,
                                                       `name` VARCHAR(255) NOT NULL,
                                                       PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel_gamma`.`room_has_amenity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hotel_gamma`.`room_has_amenity` (
                                                                `room_id` BIGINT NOT NULL,
                                                                `amenity_id` BIGINT NOT NULL,
                                                                PRIMARY KEY (`room_id`, `amenity_id`),
                                                                INDEX `fk_room_has_amenity_amenity1_idx` (`amenity_id` ASC) VISIBLE,
                                                                INDEX `fk_room_has_amenity_room1_idx` (`room_id` ASC) VISIBLE,
                                                                CONSTRAINT `fk_room_has_amenity_room1`
                                                                    FOREIGN KEY (`room_id`)
                                                                        REFERENCES `hotel_gamma`.`room` (`id`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION,
                                                                CONSTRAINT `fk_room_has_amenity_amenity1`
                                                                    FOREIGN KEY (`amenity_id`)
                                                                        REFERENCES `hotel_gamma`.`amenity` (`id`)
                                                                        ON DELETE NO ACTION
                                                                        ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `phone`, `address`, `city`, `zip_code`, `admin`) VALUES (1, 'admin@hotel-gamma.com', 'admin', 'Oscar', 'Cunningham', '0290785983', '41 rue Victor Hugo', 'Nantes', '44000', 1);
INSERT INTO `hotel_gamma`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `phone`, `address`, `city`, `zip_code`, `admin`) VALUES (2, 'julie.holland@gmail.com', 'julie', 'Julie', 'Holland', '0749142280', '3 rue de l\'église', 'Brest', '29200', 0);
INSERT INTO `hotel_gamma`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `phone`, `address`, `city`, `zip_code`, `admin`) VALUES (3, 'sophiesullivan@hotmail.com', 'sophie', 'Sophie', 'Sullivan', '0624355886', '18 rue des cerisiers', 'Brest', '29200', 0);
INSERT INTO `hotel_gamma`.`user` (`id`, `email`, `password`, `first_name`, `last_name`, `phone`, `address`, `city`, `zip_code`, `admin`) VALUES (4, 'claude.carpentier@gmail.com', 'claude', 'Claude', 'Carpentier', '0708139225', '22 rue de la paix', 'Rennes', '35000', 0);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`category`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`category` (`id`, `name`) VALUES (1, 'Chambre');
INSERT INTO `hotel_gamma`.`category` (`id`, `name`) VALUES (2, 'Appartement');
INSERT INTO `hotel_gamma`.`category` (`id`, `name`) VALUES (3, 'Duplex');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`room`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`room` (`id`, `name`, `picture`, `description`, `nb_beds`, `nb_persons`, `size`, `price`, `category_id`) VALUES (1, 'Chambre 101', 'room1.jpeg', 'Chambre double avec lit king size.', 1, 2, 25, 110, 1);
INSERT INTO `hotel_gamma`.`room` (`id`, `name`, `picture`, `description`, `nb_beds`, `nb_persons`, `size`, `price`, `category_id`) VALUES (2, 'Chambre 102', 'room2.jpeg', 'Chambre simple avec vue sur la mer.', 1, 1, 21, 80, 1);
INSERT INTO `hotel_gamma`.`room` (`id`, `name`, `picture`, `description`, `nb_beds`, `nb_persons`, `size`, `price`, `category_id`) VALUES (3, 'Appartement 103', 'room3.jpeg', 'Grand appartement avec blacon et vue sur la mer.', 2, 3, 45, 150, 2);
INSERT INTO `hotel_gamma`.`room` (`id`, `name`, `picture`, `description`, `nb_beds`, `nb_persons`, `size`, `price`, `category_id`) VALUES (4, 'Chambre 104', 'room4.jpeg', 'Chambre double.', 1, 2, 21, 95, 1);
INSERT INTO `hotel_gamma`.`room` (`id`, `name`, `picture`, `description`, `nb_beds`, `nb_persons`, `size`, `price`, `category_id`) VALUES (5, 'Appartement 201', 'room5.jpeg', 'Appartement pour 4 personnes avec 2 lits doubles.', 2, 4, 50, 160, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`picture`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`picture` (`id`, `file_name`, `room_id`) VALUES (1, 'room1-1.jpeg', 1);
INSERT INTO `hotel_gamma`.`picture` (`id`, `file_name`, `room_id`) VALUES (2, 'room2-1.jpeg', 1);
INSERT INTO `hotel_gamma`.`picture` (`id`, `file_name`, `room_id`) VALUES (3, 'room2-2.jpeg', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`booking`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`booking` (`id`, `date_start`, `date_end`, `price`, `user_id`, `room_id`) VALUES (1, '2021-01-15', '2021-01-17', 100, 2, 1);
INSERT INTO `hotel_gamma`.`booking` (`id`, `date_start`, `date_end`, `price`, `user_id`, `room_id`) VALUES (2, '2021-01-16', '2021-01-17', 150, 3, 3);
INSERT INTO `hotel_gamma`.`booking` (`id`, `date_start`, `date_end`, `price`, `user_id`, `room_id`) VALUES (3, '2021-02-08', '2021-02-12', 90, 4, 2);
INSERT INTO `hotel_gamma`.`booking` (`id`, `date_start`, `date_end`, `price`, `user_id`, `room_id`) VALUES (4, '2021-02-12', '2021-02-14', 105, 2, 1);
INSERT INTO `hotel_gamma`.`booking` (`id`, `date_start`, `date_end`, `price`, `user_id`, `room_id`) VALUES (5, '2021-02-15', '2021-02-19', 90, 4, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`amenity` (`id`, `name`) VALUES (1, 'TV');
INSERT INTO `hotel_gamma`.`amenity` (`id`, `name`) VALUES (2, 'Frigo');
INSERT INTO `hotel_gamma`.`amenity` (`id`, `name`) VALUES (3, 'Climatisation');
INSERT INTO `hotel_gamma`.`amenity` (`id`, `name`) VALUES (4, 'Lave linge');
INSERT INTO `hotel_gamma`.`amenity` (`id`, `name`) VALUES (5, 'Lave vaisselle');

COMMIT;


-- -----------------------------------------------------
-- Data for table `hotel_gamma`.`room_has_amenity`
-- -----------------------------------------------------
START TRANSACTION;
USE `hotel_gamma`;
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (1, 1);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (1, 2);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (2, 1);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (3, 1);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (3, 2);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (3, 3);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (3, 4);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (3, 5);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (4, 1);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (4, 3);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (5, 1);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (5, 2);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (5, 4);
INSERT INTO `hotel_gamma`.`room_has_amenity` (`room_id`, `amenity_id`) VALUES (5, 5);

COMMIT;

