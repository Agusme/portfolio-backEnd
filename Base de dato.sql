-- MySQL Script generated by MySQL Workbench
-- Fri Sep 16 15:40:54 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Portfolio-agus
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Portfolio-agus` ;

-- -----------------------------------------------------
-- Schema Portfolio-agus
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Portfolio-agus` DEFAULT CHARACTER SET utf8 ;
USE `Portfolio-agus` ;

-- -----------------------------------------------------
-- Table `Portfolio-agus`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-agus`.`persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  `fecha-nacimiento` DATE NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(45) NULL,
  `sobre-mi` VARCHAR(200) NULL,
  `url-foto` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-agus`.`tipo-de-empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-agus`.`tipo-de-empleo` (
  `id` INT NOT NULL,
  `nombre-tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Portfolio-agus`.`experiencia-laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Portfolio-agus`.`experiencia-laboral` (
  `id` INT NOT NULL,
  `nombre-empresa` VARCHAR(45) NULL,
  `trabajo-actual` TINYINT NULL,
  `fecha-inicio` DATE NULL,
  `fecha-fin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  `tipo-de-empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`, `tipo-de-empleo_id`),
  CONSTRAINT `fk_experiencia-laboral_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `Portfolio-agus`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia-laboral_tipo-de-empleo1`
    FOREIGN KEY (`tipo-de-empleo_id`)
    REFERENCES `Portfolio-agus`.`tipo-de-empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_experiencia-laboral_persona_idx` ON `Portfolio-agus`.`experiencia-laboral` (`persona_id` ASC) VISIBLE;

CREATE INDEX `fk_experiencia-laboral_tipo-de-empleo1_idx` ON `Portfolio-agus`.`experiencia-laboral` (`tipo-de-empleo_id` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
