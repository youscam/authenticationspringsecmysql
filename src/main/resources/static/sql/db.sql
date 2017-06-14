CREATE SCHEMA `spring_security_schema` ;

CREATE  TABLE spring_security_schema.users (
  username VARCHAR(20) NOT NULL ,
  password VARCHAR(20) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE spring_security_schema.user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(20) NOT NULL,
  role varchar(20) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES spring_security_schema.users (username));

INSERT INTO spring_security_schema.users(username,password,enabled) VALUES ('kamal','kamal', true);
INSERT INTO spring_security_schema.users(username,password,enabled) VALUES ('fati','fati', true);

INSERT INTO spring_security_schema.user_roles (username, role) VALUES ('kamal', 'ROLE_USER');
INSERT INTO spring_security_schema.user_roles (username, role) VALUES ('kamal', 'ROLE_ADMIN');
INSERT INTO spring_security_schema.user_roles (username, role) VALUES ('fati', 'ROLE_USER');