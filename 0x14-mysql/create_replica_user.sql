-- replica_user, with the host name set to %, and can have whatever password you’d like.
CREATE USER IF NOT EXISTS 'replica_user'@'%' IDENTIFIED BY 'replica';
-- replica_user must have the appropriate permissions to replicate your primary MySQL server
GRANT REPLICATION SLAVE ON *.* TO 'replica_user'@'%';
-- change database
USE mysql;
-- holberton_user will need SELECT privileges on the mysql.user table in order to check that replica_user was created with the correct permissions.
GRANT SELECT ON `user` TO holberton_user@localhost;
