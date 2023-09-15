CREATE SCHEMA IF NOT EXISTS `lightcodepj` DEFAULT CHARACTER SET utf8mb4 ;
USE `lightcodepj` ;

CREATE TABLE IF NOT EXISTS `lightcodepj`.`question` (
  `question_id` INT NOT NULL AUTO_INCREMENT,
  `question_name` VARCHAR(100) NOT NULL,
  `question_is_active` BOOLEAN NOT NULL,
  `question_rec_created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question_rec_modifieddate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`question_id`),
  UNIQUE INDEX `question_UNIQUE` (`question_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE IF NOT EXISTS `lightcodepj`.`answer` (
  `answer_id` INT NOT NULL,
  `question_id` INT NOT NULL,
  `answer_params` VARCHAR(100) NOT NULL,
  `answer_is_active` BOOLEAN NOT NULL,
  `answer_rec_created_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `answer_rec_modified_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`answer_id`),
  CONSTRAINT `fk_myanswer_has_question_myanswer1`
    FOREIGN KEY (`question_id`)
    REFERENCES `lightcodepj`.`question` (`question_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
  )

ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;