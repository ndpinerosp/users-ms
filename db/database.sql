CREATE DATABASE IF NOT EXISTS user;
use user;


CREATE TABLE IF NOT EXISTS role (
    	    
    id INT(10) unsigned NOT NULL AUTO_INCREMENT,
    namerole VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY(id),
    INDEX(id)
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;
DESCRIBE role;

CREATE TABLE IF NOT EXISTS users (
    	    
    id INT(10) unsigned NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    lastname VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    birthdate date NOT NULL,
    email VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    password VARCHAR(255) COLLATE utf8_unicode_ci NOT NULL,
    idrole INT(10) unsigned NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    INDEX(id),
    UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
    PRIMARY KEY(id),
    FOREIGN KEY (idrole)
        REFERENCES role(id)
        ON DELETE CASCADE
        ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET = utf8;
DESCRIBE users;

ALTER USER 'mysql'@'%' IDENTIFIED WITH mysql_native_password BY '1234';
FLUSH PRIVILEGES; 
