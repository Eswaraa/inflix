CREATE TABLE `inflix`.`user` (
  `id` INT NOT NULL,
  `username` VARCHAR(16) NOT NULL,
  `email` VARCHAR(255) NULL,
  `mobile_number` BIGINT NOT NULL,
  `password` VARCHAR(32) NOT NULL,
  `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `mobile_number_UNIQUE` (`mobile_number` ASC) VISIBLE);

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
  PRIMARY KEY (`id`),
  CONSTRAINT `review_album_id` 
      FOREIGN KEY (`album_id`) 
      REFERENCES `album` (`id`) 
      ON DELETE CASCADE 
      ON UPDATE CASCADE,
  CONSTRAINT `review_user_id` 
      FOREIGN KEY (`user_id`) 
      REFERENCES `user` (`id`) 
      ON DELETE CASCADE 
      ON UPDATE CASCADE