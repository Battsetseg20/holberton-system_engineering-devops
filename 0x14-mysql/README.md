# MySQL


![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/280/KkrkDHT.png)

## Resources

**Read or watch**:
-    https://www.digitalocean.com/community/tutorials/how-to-set-up-master-slave-replication-in-mysql
-   [What is a primary-replica cluster](https://intranet.hbtn.io/rltoken/yI-YnEyAx2mO5qqmbrCTbw "What is a primary-replica cluster")
-   [MySQL primary replica setup](https://intranet.hbtn.io/rltoken/M2mXERIEQA7w0Pkj85nTNw "MySQL primary replica setup")
-   [Build a robust database backup strategy](https://intranet.hbtn.io/rltoken/7C7YTJOU2iR_kZDQLPhl1A "Build a robust database backup strategy")

**man or help**:

-   `mysqldump`

## Learning Objectives

-   What is the main role of a database
-   What is a database replica
-   What is the purpose of a database replica
-   Why database backups need to be stored in different physical locations
-   What operation should you regularly perform to make sure that your database backup strategy actually works

## Requirements

### General

-   All your Bash script files must be executable
-   Your Bash script must pass  `Shellcheck`  (version  `0.3.7-5~ubuntu16.04.1`  via  `apt-get`) without any error
-   The first line of all your Bash scripts should be exactly  `#!/usr/bin/env bash`


## Tasks

* **0. Install MySQL**
  * First things first, let’s get MySQL installed on both your web-01 and web-02 servers.

MySQL distribution must be 5.7.x
Make sure that task #3 of your SSH project is completed for web-01 and web-02. 
```
$ emacs /.ssh/authorized_keys 
```
Then add ssh-rsa public key.

```
$ echo 'deb http://repo.mysql.com/apt/ubuntu/ trusty mysql-5.7-dmr' | sudo tee -a /etc/apt/sources.list
$ sudo apt-get update
$ sudo apt-get install mysql-server-5.7
$ mysql --version
mysql  Ver 14.14 Distrib 5.7.33, for Linux (x86_64) using  EditLine wrapper

$ mysql -hlocalhost -uroot -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
```

* **1. Let us in!** [create_user.sql](./create_user.sql)
  * In order for us to verify that your servers are properly configured, we need you to create a user and password for both MySQL databases which will allow the checker access to them.
  * Create a MySQL user named holberton_user on both web-01 and web-02 with the host name set to localhost and the password projectcorrection280hbtn. This will allow us to access the replication status on both servers.
  * Make sure that holberton_user has permission to check the primary/replica status of your databases.

```
ubuntu@2482-web-01:$ cat create_user.sql | mysql -hlocalhost -uroot -p
Enter password: 
ubuntu@2482-web-02:$ cat create_user.sql | mysql -hlocalhost -uroot -p
Enter password: 

ubuntu@2482-web-01: $ mysql -uholberton_user -p -e "SHOW GRANTS FOR 'holberton_user'@'localhost'"
Enter password: 
+-----------------------------------------------------------------+
| Grants for holberton_user@localhost                             |
+-----------------------------------------------------------------+
| GRANT REPLICATION CLIENT ON *.* TO 'holberton_user'@'localhost' |
+-----------------------------------------------------------------+
```

* **2. If only you could see what I've seen with your eyes** [create_db_and_table.sql](./create_db_and_table.sql)
  * In order for you to set up replication, you’ll need to have a database with at least one table and one row in your primary MySQL server (web-01) to replicate from.
    * Create a database named tyrell_corp.
    * Within the tyrell_corp database create a table named nexus6 and add at least one entry to it.
    * Make sure that holberton_user has SELECT permissions on your table so that we can check that the table exists and is not empty.
```
ubuntu@2482-web-01:$ cat create_db_and_table.sql | mysql -hlocalhost -uroot -p
Enter password: 

mysql> use tyrell_corp;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-----------------------+
| Tables_in_tyrell_corp |
+-----------------------+
| nexus6           |
+-----------------------+
1 row in set (0.00 sec)

mysql> select * from nexus6;
+------+------+
| id   | name |
+------+------+
| 1 | Leon |
+------+------+
1 row in set (0.00 sec)
```
```
ubuntu@2482-web-02:$ cat create_db_and_table.sql | mysql -hlocalhost -uroot -p
Enter password: 

ubuntu@2482-web-02::~$ mysql -uholberton_user -p -e "use tyrell_corp; select * from nexus6"
Enter password:
+----+-------+
| id | name  |
+----+-------+
|  1 | Leon  |
+----+-------+
```

* **3.Quite an experience to live in fear, isn't it?** [create_replica_user.sql](./create_replica_user.sql)
  * Before you get started with your primary-replica synchronization, you need one more thing in place. On your primary MySQL server (web-01), create a new user for the replica server.
    * The name of the new user should be replica_user, with the host name set to %, and can have whatever password you’d like.
    * replica_user must have the appropriate permissions to replicate your primary MySQL server.
    * holberton_user will need SELECT privileges on the mysql.user table in order to check that replica_user was created with the correct permissions.
```
ubuntu@2482-web-01:$ create_replica_user.sql | mysql -hlocalhost -uroot -p
Password:
```
```
mysql> use mysql;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed

mysql> SELECT user, Repl_slave_priv FROM mysql.user;
+------------------+-----------------+
| user             | Repl_slave_priv |
+------------------+-----------------+
| root             | Y               |
| mysql.session    | N               |
| mysql.sys        | N               |
| debian-sys-maint | Y               |
| holberton_user   | N               |
| replica_user     | Y               |
+------------------+-----------------+
6 rows in set (0.00 sec)
```
or
```
mysql -uholberton_user -p -e 'SELECT user, Repl_slave_priv FROM mysql.user'
Enter password: 
+------------------+-----------------+
| user             | Repl_slave_priv |
+------------------+-----------------+
| root             | Y               |
| mysql.session    | N               |
| mysql.sys        | N               |
| debian-sys-maint | Y               |
| holberton_user   | N               |
| replica_user     | Y               |
+------------------+-----------------+
```

* **4.Setup a Primary-Replica infrastructure using MySQL** 
  * Having a replica member on for your MySQL database has 2 advantages:
    * Redundancy: If you lose one of the database servers, you will still have another working one and a copy of your data
    * Load distribution: You can split the read operations between the 2 servers, reducing the load on the primary member and improving query response speed

    **Requirements:**
    * MySQL primary must be hosted on web-01 - **do not use the bind-address**, just comment out this parameter
    * MySQL replica must be hosted on web-02
    * Setup replication for the MySQL database named tyrell_corp
    * Provide your MySQL primary configuration as answer file(my.cnf or mysqld.cnf) with the name 4-      mysql_configuration_primary
    * Provide your MySQL replica configuration as an answer file with the name 4-mysql_configuration_replica
    **Tips:** 
    * Once MySQL replication is setup, add a new record in your table via MySQL on web-01 and check if the record has been replicated in MySQL web-02. If you see it, it means your replication is working!
    * Make sure that UFW is allowing connections on port 3306 (default MySQL port) otherwise replication will not work. (**sudo ufw allow 3306** on both servers) 

  * [4-mysql_configuration_primary](./4-mysql_configuration_primary)
```
ubuntu@2482-web-01:$ sudo emacs /etc/mysql/mysql.conf.d/mysqld.cnf
```
```
ubuntu@2482-web-01:$ sudo service mysql restart
ubuntu@2482-web-01:$ mysql -hlocalhost -uroot -p
Enter password: 
mysql> show master status;
+------------------+----------+--------------+------------------+-------------------+
| File             | Position | Binlog_Do_DB | Binlog_Ignore_DB | Executed_Gtid_Set |
+------------------+----------+--------------+------------------+-------------------+
| mysql-bin.000001 |      154 | tyrell_corp  |                  |                   |
+------------------+----------+--------------+------------------+-------------------+

```
  * * [4-mysql_configuration_replica](./4-mysql_configuration_replica)
```
ubuntu@2482-web-02:$ sudo emacs /etc/mysql/mysql.conf.d/mysqld.cnf
```
```
ubuntu@2482-web-02:$ sudo service mysql restart
ubuntu@2482-web-02:$ mysql -hlocalhost -uroot -p
Enter password: 

mysql> CHANGE MASTER TO MASTER_HOST='35.196.60.120',MASTER_USER='replica_user', MASTER_PASSWORD='pwd', MASTER_LOG_FILE='mysql-bin.000001', MASTER_LOG_POS=  154;
Query OK, 0 rows affected, 2 warnings (0.03 sec)

mysql> show slave status\G;
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: 35.196.60.120
                  Master_User: replica_user
                  Master_Port: 3306
                Connect_Retry: 60
              Master_Log_File: mysql-bin.000002
          Read_Master_Log_Pos: 724
               Relay_Log_File: mysql-relay-bin.000006
                Relay_Log_Pos: 890
        Relay_Master_Log_File: mysql-bin.000002
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
           ...
1 row in set (0.00 sec)

ERROR: 
No query specified

mysql> 
```
* **5. MySQL Backup**

What if the data center where both your primary and replica database servers are hosted are down because of a power outage or even worse: flooding, fire? Then all your data would inaccessible or lost. That’s why you want to backup and store them in a different system in another physical location. This can be achieved by dumping your MySQL data, compressing them and storing them in a different data center.

  * Write a Bash script that generates a MySQL dump and creates a compressed archive out of it.

  * Requirements:
    * The MySQL dump must contain all your MySQL databases
    * The MySQL dump must be named backup.sql
    * The MySQL dump file has to be compressed to a tar.gz archive
    * This archive must have the following name format: day-month-year.tar.gz
    * The user to connect to the MySQL database must be root
    * The Bash script accepts one argument that is the password used to connect to the MySQL database
 ```
ubuntu@2482-web-01:~$ ./5-mysql_backup pwd
mysqldump: [Warning] Using a password on the command line interface can be insecure.
backup.sql
```
example:
```
ubuntu@03-web-01:~$ more backup.sql
-- MySQL dump 10.13  Distrib 5.7.25, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database:
-- ------------------------------------------------------
-- Server version   5.7.25-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `tyrell_corp`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `tyrell_corp` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `tyrell_corp`;

--
-- Table structure for table `nexus6`
--

DROP TABLE IF EXISTS `nexus6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nexus6` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
ubuntu@03-web-01:~$
ubuntu@03-web-01:~$ file 01-03-2017.tar.gz
01-03-2017.tar.gz: gzip compressed data, from Unix, last modified: Wed Mar  1 23:38:09 2017
ubuntu@03-web-01:~$
```

