CREATE SCHEMA quiz;

CREATE TABLE quiz.question (
  id int(11) NOT NULL AUTO_INCREMENT,
  description varchar(200) NOT NULL,
  difficulty varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE quiz.answer (
  id int(11) NOT NULL AUTO_INCREMENT,
  question_id int(11) NOT NULL,
  description varchar(200) NOT NULL,
  is_correct tinyint(1) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT id FOREIGN KEY (question_id) REFERENCES question (id) ON DELETE CASCADE ON UPDATE CASCADE
);
