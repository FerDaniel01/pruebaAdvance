-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema enterprises
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema enterprises
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `enterprises` DEFAULT CHARACTER SET utf8 ;
USE `enterprises` ;

-- -----------------------------------------------------
-- Table `enterprises`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enterprises`.`employee` (
  `employeeid` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NULL,
  `lastname` VARCHAR(100) NULL,
  `gender` VARCHAR(30) NULL,
  `email` VARCHAR(100) NULL,
  `phonenumber` INT NULL,
  `adress` VARCHAR(100) NULL,
  `documenttype` VARCHAR(30) NULL,
  `documentnumber` INT NULL,
  `created` DATETIME NULL,
  `updated` DATETIME NULL,
  PRIMARY KEY (`employeeid`),
  UNIQUE INDEX `employeeid_UNIQUE` (`employeeid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enterprises`.`employeeacounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enterprises`.`employeeacounts` (
  `employeeacountsid` INT NOT NULL AUTO_INCREMENT,
  `backname` VARCHAR(100) NULL,
  `acountnumber` INT NULL,
  `status` VARCHAR(255) NULL,
  `employee_employeeid` INT NULL,
  PRIMARY KEY (`employeeacountsid`),
  UNIQUE INDEX `employeeacountsid_UNIQUE` (`employeeacountsid` ASC) VISIBLE,
  INDEX `fk_employeeacounts_employee1_idx` (`employee_employeeid` ASC) VISIBLE,
  CONSTRAINT `fk_employeeacounts_employee1`
    FOREIGN KEY (`employee_employeeid`)
    REFERENCES `enterprises`.`employee` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `enterprises`.`companyemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `enterprises`.`companyemployee` (
  `companyemployeid` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(150) NULL,
  `companyemail` VARCHAR(100) NULL,
  `salary` INT NULL,
  `workstartdate` DATE NULL,
  `workenddate` DATE NULL,
  `employee_employeeid` INT NULL,
  PRIMARY KEY (`companyemployeid`),
  UNIQUE INDEX `companyemployeid_UNIQUE` (`companyemployeid` ASC) VISIBLE,
  INDEX `fk_companyemployee_employee1_idx` (`employee_employeeid` ASC) VISIBLE,
  CONSTRAINT `fk_companyemployee_employee1`
    FOREIGN KEY (`employee_employeeid`)
    REFERENCES `enterprises`.`employee` (`employeeid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
