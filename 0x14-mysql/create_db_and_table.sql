-- creates the database tyrell_corp in your MySQL server
-- If the database tyrell_corp already exists, your script should not fail
CREATE DATABASE IF NOT EXISTS `tyrell_corp`;
-- Go to db tyrell_corp and create table nexus6;
USE tyrell_corp;
CREATE TABLE IF NOT EXISTS `nexus6` (`id` INT NOT NULL, `name` VARCHAR(256) NOT NULL);
-- Add entry to this table
INSERT INTO `nexus6` (id, name) VALUES (1, "Leon");
-- Grant select permission to holberton_user
GRANT SELECT ON `nexus6` TO holberton_user@localhost;
