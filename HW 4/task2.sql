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

mysql> NSERT INTO petPet VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ('Puffball','Diane','hamster','F','1999-03-30',NULL);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'NSERT INTO petPet VALUES
    ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL' at line 1
mysql>
mysql> INSERT INTO petEvent VALUES
    ->     ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ->     ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ->     ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ->     ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ->     ("Slim", "1997-08-03", "vet", "broken rib"),
    ->     ("Slim", "1997-10-04", "vet", "broken tooth"),
    ->     ("Bowser", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ->     ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ->     ("Whistler", "1998-12-09", "birthday", "First birthday");
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `petevent_ibfk_1` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> DESCRIBE petPet
    -> DESCRIBE petPet;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESCRIBE petPet' at line 2
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
6 rows in set (0.01 sec)

mysql> INSERT INTO petPet VALUES
    ->     ("Fluffy", "Harold", "cat", "F", "1993-02-04", NULL),
    ->     ("Claws", "Gwen", "cat", "M", "1994-03-17", NULL),
    ->     ("Buffy", "Harold", "dog", "F", "1989-05-13", NULL),
    ->     ("Fang", "Benny", "dog", "M", "1990-08-27", NULL),
    ->     ("Bowser", "Diane", "dog", "M", "1979-08-31", "1995-07-29"),
    ->     ("Chirpy", "Gwen", "bird", "F", "1998-09-11", NULL),
    ->     ("Whistler", "Gwen", "bird", NULL, "1997-12-09", NULL),
    ->     ("Slim", "Benny", "snake", "M", "1996-04-29", NULL),
    ->     ('Puffball','Diane','hamster','F','1999-03-30',NULL);
Query OK, 9 rows affected (0.02 sec)
Records: 9  Duplicates: 0  Warnings: 0

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

mysql> ALTER TABLE petEvent ADD CONSTRAINT fk_petname FOREIGN KEY (petname) REF
ERENCES petPet(petname);
Query OK, 0 rows affected (0.10 sec)
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

mysql> INSERT INTO petEvent VALUES
    ->     ("Fluffy", "1995-05-15", "litter", "4 kittens, 3 female, 1 male"),
    ->     ("Buffy", "1993-06-23", "litter", "5 puppies, 2 female, 3 male"),
    ->     ("Buffy", "1994-06-19", "litter", "3 puppies, 3 female"),
    ->     ("Chirpy", "1999-03-21", "vet", "needed beak straightened"),
    ->     ("Slim", "1997-08-03", "vet", "broken rib"),
    ->     ("Slim", "1997-10-04", "vet", "broken tooth"),
    ->     ("Bowser", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1991-10-12", "kennel", NULL),
    ->     ("Fang", "1998-08-28", "birthday", "Gave him a new chew toy"),
    ->     ("Claws", "1998-03-17","birthday", "Gave him a new flea collar"),
    ->     ("Whistler", "1998-12-09", "birthday", "First birthday");
Query OK, 11 rows affected (0.01 sec)
Records: 11  Duplicates: 0  Warnings: 0

mysql> INSERT INTO petEvent VALUES (‘Fluffy’, ‘2020-10-15’, ‘vet’, ‘antibiotics’);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '?Fluffy?, ?2020-10-15?, ?vet?, ?antibiotics?)' at line 1
mysql> INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15, ‘vet’, ‘antibiotics’
);
    "> no
    "> INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics
");
    ">
    "> DESCRIBE petEvents;
    "> show tables;'
    "> exit;
    "> quit;
    "> quit;
    ">
    ">
    ">
    ">  INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics
    -> ");
    "> stop;
    "> ^C
mysql> INSERT INTO petEvent VALUES ("Fluffy", "2020-10-15", "vet", "antibiotics");
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO petEvent VALUES ("Harry", "2020-10-15", "vet", "antibiotics"
);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `fk_petname` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> INSERT INTO petEvent VALUES ("Harry", "2020-10-15", "vet", "antibiotics"
);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `fk_petname` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> INSERT INTO petPet ("Hammy", "Diane", "hampster", "M", "2010-10-30", NULL);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"Hammy", "Diane", "hampster", "M", "2010-10-30", NULL)' at line 1
mysql> INSERT INTO petPet VALUES ("Hammy", "Diane", "hampster", "M", "2010-10-3
0", NULL);
Query OK, 1 row affected (0.02 sec)

mysql> UPDATE petEvent SET remark = ^C
mysql> UPDATE petEvent Set
    -> ^C
mysql> UPDATE petEvent SET remark = "5 kittens, 3 female, 2 male" WHERE petname
 = "Fluffy";
Query OK, 2 rows affected (0.02 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> UPDATE petPet SET death = "2020-09-01" WHERE petname = "Puffball";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> DELETE FROM petPet WHERE owner = "Harold";
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint fails (`pet_database`.`petevent`, CONSTRAINT `fk_petname` FOREIGN KEY (`petname`) REFERENCES `petpet` (`petname`))
mysql> DELETE FROM petEvent WHERE petname = "Buffy", petname = "Fluffy";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ', petname = "Fluffy"' at line 1
mysql> DELETE FROM petEvent WHERE petname = "Buffy"
    -> DELETE FROM petEvent WHERE petname = "Buffy";
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DELETE FROM petEvent WHERE petname = "Buffy"' at line 2
mysql> DELETE FROM petEvent WHERE petname = "Buffy";
Query OK, 2 rows affected (0.01 sec)

mysql>