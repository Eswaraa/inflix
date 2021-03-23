CREATE TABLE `inflix`.`book` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `edition` VARCHAR(45) NULL,
  `press` VARCHAR(45) NULL,
  `author_id` INT NOT ZEROFILL NULL,
  `price` DECIMAL(10,2) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP
  PRIMARY KEY (`id`));

CREATE TABLE `inflix`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `mobile_number` INT NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mobile_number_UNIQUE` (`mobile_number` ASC) VISIBLE);

CREATE TABLE `inflix`.`author` (
  `id` INT NOT NULL,
  `name` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

ALTER TABLE `inflix`.`book` 
ADD CONSTRAINT `book_author_id`
  FOREIGN KEY (`author_id`)
  REFERENCES `inflix`.`author` (`id`)
  ON DELETE NO ACTION

CREATE TABLE `inflix`.`album` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `release` DATE NOT NULL,
  `production` VARCHAR(45) NULL,
  `director` VARCHAR(45) NOT NULL,
  `is_premium`  BOOLEAN NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`));

  //Reviews

CREATE TABLE `inflix`.`review` (
  `id` INT NOT NULL,
  `rating` INT NOT NULL,
  `comment` VARCHAR(100) NULL,
  `user_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `reviewcol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `review_user_id`
    FOREIGN KEY (`id`)
    REFERENCES `inflix`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `review_album_id`
    FOREIGN KEY (`id`)
    REFERENCES `inflix`.`album` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);