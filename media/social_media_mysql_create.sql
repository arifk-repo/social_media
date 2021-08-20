CREATE TABLE `user` (
	`id` INT(4) NOT NULL AUTO_INCREMENT,
	`username` varchar(12) NOT NULL UNIQUE,
	`email` varchar(30) NOT NULL UNIQUE,
	`bio` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `post` (
	`id` INT(5) NOT NULL AUTO_INCREMENT,
	`caption` varchar(1000) NOT NULL,
	`attachment` varchar(300),
	`user_id` INT(5) NOT NULL,
	`date_created` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `comment` (
	`id` INT(5) NOT NULL AUTO_INCREMENT,
	`id_post` INT(5) NOT NULL,
	`username` varchar(30) NOT NULL,
	`comment` varchar(500),
	`date_created` DATETIME NOT NULL,
	`attachment` varchar(300),
	PRIMARY KEY (`id`)
);

CREATE TABLE `hashtag` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(250) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

ALTER TABLE `post` ADD CONSTRAINT `post_fk0` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk0` FOREIGN KEY (`id_post`) REFERENCES `post`(`id`);

ALTER TABLE `comment` ADD CONSTRAINT `comment_fk1` FOREIGN KEY (`username`) REFERENCES `user`(`username`);





