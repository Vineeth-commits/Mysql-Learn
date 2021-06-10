# Basic SQL
---
## What is database?
* It is a collection of data like a phone book.
* It is also a method for accessing and manipulation of data.
* Final Definition - A structured set of computerized data with an accessible interface
## Database vs Database Management System
* DMS is a computerized data-keeping system which operate on a database.
* App => DBMS => Database
* PostgreSQL, MySQL, MariaDB is a database management system and not a database.
## MySQL vs SQL
* Structured Query Language(SQL) is the language we use to "talk" to our databases.
* The lines written in SQL are called queries
* MySQL is a relation database management system.
* Learning SQL makes it easier to switch DB
* What makes databases (DBMS) unique are the features they offer, not the language.
## Creating Databases
To show the existing databases -
```sql
show databases;
```
To create a database -
```sql
CREATE DATABASE <name>;
```
To delete a database -
```sql
DROP DATABASE <name>;
```
Note: Semicolon terminates the statement
To select a database -
```sql
USE <name>;
```
To know the current working database -
```sql
SELECT DATABASE();
```
## Tables - the Heart of Sequel
* A database is just a bunch of tables.
* Tables are a oollection of related data held in a structured format within a database.
* The datatypes in sequel -
    * Numeric Types
        * INT - A whole number
        * SMALLINT
        * TINYINT
        * MEDIUMINT
        * BIGINT
        * DECIMAL
        * NUMERIC
        * FLOAT
        * DOUBLE
        * BIT
    * String Types
        * CHAR - fixed length string
        * VARCHAR - variable length string
        * BINARY
        * BLOB
        * TINYBLOB
        * MEDIUMBLOB
        * LONGBLOB
        * TEXT
        * TINYTEXT
        * MEDIUMTEXT
        * LONGTEXT
        * ENUM
    * Date Types
        * DATE
        * DATETIME
        * TIME
        * YEAR
* To create a table -
    ```sql
    CREATE TABLE tablename
    (
        column_name data_type,
        column_name data_type
    );
    ```
* To display all the tables in a database -
    ```sql
    SHOW TABLES;
    ```
* To display the characteristics of the column -
    ```sql
    SHOW COLUMNS FROM <table_name>;
    <!-- or -->
    DESC <tablename>;
    ```
* To delete a table -
    ```sql
    DROP TABLE <table_name>;
    ```
* To insert data into a table -
    ```sql
    INSERT INTO <tablename>(column_name1, column_name2)
    VALUES (value1, value2);
    ```
* To display the table -
    ```sql
    SELECT * FROM <table_name>;
    ```
* To insert multiple data into a table -
    ```sql
    INSERT INTO <table_name>(column_name1, column_name2)
    VALUES(value11,value21),(value12,value22),(value13, value23);
    ```
* To display warnings -
    ```sql
    SHOW WARNINGS;
    ```
* When a invalid data type is inserted, the value will be null.
* Null - value is not known, not zero (in this context)
* To define a table with column having not null -
    ```sql
    CREATE TABLE <table_name>
    (column_name1 VARCHAR(30) NOT NULL,
     column_name2 INT NOT NULL);
    ```
* By defining a column as not null, the input becomes mandatory
* To specify default value -
    ```sql
    CREATE TABLE <tablename>
    (column_name1 VARCHAR(20) DEFAULT 'UNNAMED',
     column_name2 INT DEFAULT 0);
     ```
* Is this redundant?
    ```sql
    CREATE TABLE <tablename>
    (column_name1 VARCHAR(20) NOT NULL DEFAULT 'UNNAMED',
     column_name2 INT NOT NULL DEFAULT 0);
     ``` 
     Nope, if NULL is specified explicity through INSERT, an error will be thrown. To avoid this we can set it as NOT NULL.
* Primary key - A unique identifier
    ```sql
    CREATE TABLE <tablename>
    (column_name1 VARCHAR(20) NOT NULL,
     column_name2 INT DEFAULT 0,
     PRIMARY KEY (column_name2));
    ```
* To increment a parameter -
    ```sql
    CREATE TABLE <tablename>
    (column_name1 VARCHAR(20) NOT NULL,
     column_name2 INT DEFAULT 0 AUTO_INCREMENT,
     PRIMARY KEY (column_name2));
    ```
## CRUD - Create, Read, Update and Delete
* SELECT command can be used to filter out information.
* The below command outputs the data from the entered column only -
    ```sql
    SELECT <column_name> FROM <table_name>;
    ```
* To display multiple columns at once -
    ```sql
    SELECT <column_name1>, <column_name2>.... FROM <table_name>;
    ```
* WHERE command used to find and filter out based a particular parameter(s).
* Example which outputs all the cat names with age 4.
    ```sql
    SELECT name FROM catBasic WHERE age=4;
    ```
* The search parameters of WHERE is case insensitive by default.
* Example to make an alias (AS) of a column
    ```sql
    SELECT catID AS ID, name FROM catBasic;
    ```
    Note: This does not alter the column name in the database. It used to alter the output only.
*  UPDATE command is used to alter the database.
    ```sql
    UPDATE <table_name> SET column_name='<text>' WHERE column_name='<text>';
    Note: Undo is not possible once the data is altered.
* DELETE command is used to destroy or delete the data.
    ```sql
    DELETE FROM table_name WHERE column_name='<text>';
    ```
* To delete all data
    ```sql
    DELETE FROM table_name;

## String Functions
* To run queries from a file -
    ```sql
    source <filename.sql>;
    ```
* CONCAT command is used to combine data for cleaner output.
    ```sql
    SELECT CONCAT(x,y,z) from tablename;
    ```
    Example:
    ```sql
    SELECT CONCAT(firstname, ' ', lastname) from details;
    ```
    Note: It does not alter the data stored.
    A more complex example:
    ```sql
    SELECT fname AS first, lname AS last, CONCAT(fname, ' ', lname) AS Full_Name FROM books WHERE bookID>5;
    ``` 
* CONCAT_WS command is used to concat with a separator.
    ```sql
    SELECT CONCAT_WS('-', column_name1, column_name2, column_name3) FROM tablename;
    ```
* SUBSTRING command is used to work with parts of a string.
    ```sql
    SELECT SUBSTRING('hello world', 1, 4);
    <!-- prints hell -->
    SELECT SUBSTRING('hello world', 7);
    <!-- prints world -->
    SELECT SUBSTRING('hello world', -3);
    <!-- prints rld -->
    ```
    Note: The index value in sequel starts with 1 and not 0.
* Combined example of CONCATE and SUBSTRING -
    ```sql
    SELECT CONCAT(SUBSTRING(title, 1, 10), '....') AS 'short title' FROM books;
    ```
* REPLACE command is used to replace parts of string
    ```sql
    SELECT REPLACE('hello world', 'hello', 'new');
    ```
    Note: It is case sensitive
* REVERSE command is used to reverse a string.
    ```sql
    SELECT REVERSE('hello world');
    ```
* SELECT CHAR_LENGTH command is used to count the number of characters.
    ```sql
    SELECT CHAR_LENGTH('hello world');
    ```
* UPPER command is used to convert the characters into upper case and LOWER command converts characters into lower case.
    ```sql
    SELECT UPPER('hello world');
    SELECT LOWER('HELLO WORLD');
    ```
## Redefining Selections
* DISTINCT command returns unique values.
    ```sql
    SELECT DISTINCT columnName FROM tablename;
    ```
* ORDER BY command is used to sort results. Sorts by ascending by default 
    ```sql
    SELECT columnName FROM tablename ORDER BY columnName;
    ```
    To sort by descending order
    ```sql
    SELECT columnName FROM tablename ORDER BY columnName DESC;
