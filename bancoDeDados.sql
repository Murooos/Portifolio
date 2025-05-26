-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema aplicativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema aplicativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `aplicativo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `aplicativo` ;

-- -----------------------------------------------------
-- Table `aplicativo`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`usuario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Endereco` VARCHAR(200) NULL DEFAULT NULL,
  `Telefone` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Senha` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aplicativo`.`animal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`animal` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Especie` VARCHAR(50) NULL DEFAULT NULL,
  `Raca` VARCHAR(50) NULL DEFAULT NULL,
  `DataNascimento` DATE NULL DEFAULT NULL,
  `usuario_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `usuario_ID`),
  INDEX `fk_animal_usuario1_idx` (`usuario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_animal_usuario1`
    FOREIGN KEY (`usuario_ID`)
    REFERENCES `aplicativo`.`usuario` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aplicativo`.`clinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`clinica` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Endereco` VARCHAR(200) NULL DEFAULT NULL,
  `Telefone` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Senha` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aplicativo`.`convenio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`convenio` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `TipoPlano` VARCHAR(100) NULL DEFAULT NULL,
  `DataValidade` DATE NULL DEFAULT NULL,
  `animal_ID` INT NOT NULL,
  `animal_usuario_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `animal_ID`, `animal_usuario_ID`),
  INDEX `fk_convenio_animal1_idx` (`animal_ID` ASC, `animal_usuario_ID` ASC) VISIBLE,
  CONSTRAINT `fk_convenio_animal1`
    FOREIGN KEY (`animal_ID` , `animal_usuario_ID`)
    REFERENCES `aplicativo`.`animal` (`ID` , `usuario_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aplicativo`.`veterinario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`veterinario` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NULL DEFAULT NULL,
  `Telefone` VARCHAR(15) NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `RegistroProfissional` VARCHAR(50) NULL DEFAULT NULL,
  `Senha` VARCHAR(100) NULL DEFAULT NULL,
  `clinica_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `clinica_ID`),
  INDEX `fk_veterinario_clinica1_idx` (`clinica_ID` ASC) VISIBLE,
  CONSTRAINT `fk_veterinario_clinica1`
    FOREIGN KEY (`clinica_ID`)
    REFERENCES `aplicativo`.`clinica` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `aplicativo`.`historicomedico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `aplicativo`.`historicomedico` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `DataConsulta` DATE NULL DEFAULT NULL,
  `Diagnostico` VARCHAR(200) NULL DEFAULT NULL,
  `Tratamento` VARCHAR(200) NULL DEFAULT NULL,
  `Observacoes` VARCHAR(200) NULL DEFAULT NULL,
  `AnimalID` INT NULL DEFAULT NULL,
  `VeterinarioID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  INDEX `AnimalID` (`AnimalID` ASC) VISIBLE,
  INDEX `VeterinarioID` (`VeterinarioID` ASC) VISIBLE,
  CONSTRAINT `historicomedico_ibfk_1`
    FOREIGN KEY (`AnimalID`)
    REFERENCES `aplicativo`.`animal` (`ID`),
  CONSTRAINT `historicomedico_ibfk_2`
    FOREIGN KEY (`VeterinarioID`)
    REFERENCES `aplicativo`.`veterinario` (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
