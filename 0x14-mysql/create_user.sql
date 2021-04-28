-- Creates the MySQL server user holberton_user (not fail if user exists)
CREATE USER IF NOT EXISTS 'holberton_user'@'localhost';
SET PASSWORD FOR 'holberton_user'@'localhost' = 'projectcorrection280hbtn';
-- holberton_user has permission to check the primary/replica status of your databases
GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost'
