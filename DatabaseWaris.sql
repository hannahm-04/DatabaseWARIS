-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema waris
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema waris
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `waris` DEFAULT CHARACTER SET utf8 ;
USE `waris` ;

-- -----------------------------------------------------
-- Table `waris`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waris`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `no_hp` VARCHAR(45) NOT NULL,
  `role` VARCHAR(16) NOT NULL,
  `alamat` VARCHAR(255) NOT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `Email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `idUser_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `waris`.`kategori`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waris`.`kategori` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nama_kategori` VARCHAR(255) NOT NULL,
  `deskripsi` VARCHAR(255) NOT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `waris`.`produk`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waris`.`produk` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nama_produk` VARCHAR(45) NOT NULL,
  `kategori_id` INT NOT NULL,
  `harga` INT NOT NULL,
  `stok` INT NOT NULL,
  `deskripsi` VARCHAR(255) NOT NULL,
  `url_gambar` VARCHAR(255) NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_Produk_Kategori1_idx` (`kategori_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Produk_Kategori1`
    FOREIGN KEY (`kategori_id`)
    REFERENCES `waris`.`kategori` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `waris`.`favorit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waris`.`favorit` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produk_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_Favorit_Produk_idx` (`produk_id` ASC) VISIBLE,
  INDEX `fk_Favorit_User1_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Favorit_Produk`
    FOREIGN KEY (`produk_id`)
    REFERENCES `waris`.`produk` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Favorit_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `waris`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `waris`.`review`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `waris`.`review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `produk_id` INT NOT NULL,
  `komentar` VARCHAR(255) NULL,
  `rating` INT NOT NULL,
  `create_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_Review_User1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_Review_Produk1_idx` (`produk_id` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  CONSTRAINT `fk_Review_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `waris`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Produk1`
    FOREIGN KEY (`produk_id`)
    REFERENCES `waris`.`produk` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
