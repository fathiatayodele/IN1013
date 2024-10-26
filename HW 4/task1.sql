mysql> DROP DATABASE IF EXISTS pet_database;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> CREATE DATABASE pet_database;
Query OK, 1 row affected (0.01 sec)

mysql> USE pet_database;
Database changed
mysql> show tables;
Empty set (0.01 sec)

mysql> DROP TABLE IF EXISTS petPet, petEvent;
Query OK, 0 rows affected, 2 warnings (0.03 sec)

mysql> show tables;
Empty set (0.00 sec)

mysql> CREATE TABLE petPet (petname VARCHAR(20), owner VARCHAR(45), species VAR
CHAR(45), gender ENUM('M','F'), birth DATE, death DATE);
Query OK, 0 rows affected (0.06 sec)

mysql> show tables;
+------------------------+
| Tables_in_pet_database |
+------------------------+
| petpet                 |
+------------------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE petEvent (petname VARCHAR(20), eventdate DATE, eventtype VA
RCHAR(15), remark VARCHAR(255));
Query OK, 0 rows affected (0.05 sec)

mysql> show tables;
+------------------------+
| Tables_in_pet_database |
+------------------------+
| petevent               |
| petpet                 |
+------------------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE petPet ADD PRIMARY KEY (petname);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> show table petPet;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'petPet' at line 1
mysql> DROP TABLE petPet
    -> DROP TABLE petPet;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DROP TABLE petPet' at line 2
mysql> USE pet_database; SELECT * FROM petPet;
Database changed
Empty set (0.00 sec)

mysql> show tables;
+------------------------+
| Tables_in_pet_database |
+------------------------+
| petevent               |
| petpet                 |
+------------------------+
2 rows in set (0.00 sec)

mysql> ALTER TABLE petEvent DROP petname;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE petEvent;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| eventdate | date         | YES  |     | NULL    |       |
| eventtype | varchar(15)  | YES  |     | NULL    |       |
| remark    | varchar(255) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> DESCRIBE petPet;
+---------+---------------+------+-----+---------+-------+
| Field   | Type          | Null | Key | Default | Extra |
+---------+---------------+------+-----+---------+-------+
| petname | varchar(20)   | NO   | PRI | NULL    |       |
| owner   | varchar(45)   | YES  |     | NULL    |       |
| species | varchar(45)   | YES  |     | NULL    |       |
| gender  | enum('M','F') | YES  |     | NULL    |       |
| birth   | date          | YES  |     | NULL    |       |
| death   | date          | YES  |     | NULL    |       |
+---------+---------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

mysql> ALTER TABLE petEvent (FOREIGN KEY (petname) REFERENCES petPet(petname));

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(FOREIGN KEY (petname) REFERENCES petPet(petname))' at line 1
mysql> ALTER TABLE petEvent DROP eventdate;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Alter
    -> ALTER TABLE petEvent DROP eventtype;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'ALTER TABLE petEvent DROP eventtype' at line 2
mysql> ALTER TABLE petEvent DROP eventype;
ERROR 1091 (42000): Can't DROP 'eventype'; check that column/key exists
mysql> ALTER TABLE petEvent DROP eventtype;
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE petEvent DROP remark;
ERROR 1090 (42000): You can't delete all columns with ALTER TABLE; use DROP TABLE instead
mysql> ALTER  TABLE petEvent (petname VARCHAR(20), eventdate DATE, eventtype VA

    -> RCHAR(15), FOREIGN KEY (petname) REFRENCES petPet(petname));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(petname VARCHAR(20), eventdate DATE, eventtype VA
RCHAR(15), FOREIGN KEY (petna' at line 1
mysql> ALTER TABLE petEvent ADD petname VARCHAR(20);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE petEvent DROP remark;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE TABLE petEvent;
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | petEvent | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.01 sec)

mysql> DESCRIBE petEvent;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| petname | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
1 row in set (0.00 sec)

mysql> ALTER TABLE petEvent ADD FOREIGN KEY (petname) REFERENCES petPet(petname
);
Query OK, 0 rows affected (0.11 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE petEvent;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| petname | varchar(20) | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
1 row in set (0.00 sec)

mysql> ALTER TABLE petEvent ADD eventdate DATE, eventtype VARCHAR(15), remark V
ARCHAR(255);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'eventtype VARCHAR(15), remark VARCHAR(255)' at line 1
mysql> ALTER TABLE petEvent ADD evendate DATE;
Query OK, 0 rows affected (0.05 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE petEvent ADD eventtype VARCHAR(
    ->
    -> l
    -> ALTER TABLE petEvent ADD eventtype VARCHAR(15);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'l
ALTER TABLE petEvent ADD eventtype VARCHAR(15)' at line 3
mysql> ALTER TABLE petEvent ADD eventtype VARCHAR(15);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE petEvent ADD remark VARCHAR(255);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE petEvent;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| petname   | varchar(20)  | YES  | MUL | NULL    |       |
| evendate  | date         | YES  |     | NULL    |       |
| eventtype | varchar(15)  | YES  |     | NULL    |       |
| remark    | varchar(255) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql>