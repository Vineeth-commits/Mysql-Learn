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
    ```
    Note: Undo is not possible once the data is altered.
* DELETE command is used to destroy or delete the data.
    ```sql
    DELETE FROM table_name WHERE column_name='<text>';
    ```
* To delete all data
    ```sql
    DELETE FROM table_name;
    ```
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
* To sort by descending order
    ```sql
    SELECT columnName FROM tablename ORDER BY columnName DESC;
    ```
* Parameters can be chosen by number
    ```sql
    SELECT columnName1, columnName2, columnName3 FROM tablename ORDER BY 2;
    <!-- It will select columnName2 -->
    ```
* ORDER BY can use multiple parameters. The priority will be in descreasing order.
    ```sql
    SELECT columnName1, columnName2, columnName3 FROM tablename ORDER BY columnName1, columnName2;
    ```
* LIMIT command is used to return a selected amount of output
    ```sql
    SELECT columnName from tablename LIMIT 3;
    ```
* LIKE command is used to search by pattern.
* Wildcards -
    |Symbol|Description|Example|
    |-----|--------|----|
    |%|Represents zero or more characters|bl% finds bl, black, blue, and blob|
    |_|Represents a single character|h_t finds hot, hat, and hit|
    |[]|Represents any single character within the brackets|h[oa]t finds hot and hat, but not hit|
    |^|Represents any character not in the brackets|h[^oa]t finds hit, but not hot and hat|
    |-|Represents a range of characters|c[a-b]t finds cat and cbt|
## Aggregate Functions
* COUNT command -
    ```sql
    SELECT COUNT(*) FROM tablename;
    SELECT COUNT(DISTINCT columnName) FROM tablename;
    ```
* GROUP BY command summarizes or aggregates identical data into single rows.
    ```sql
    SELECT columnName1, columnName2 FROM books GROUP BY columnName2;
    ```
* To find the number books written by several authors -
    ```sql
    SELECT concat(author_fname, ' ',author_lname) AS author, COUNT(*) AS 'total' FROM books GROUP BY author_lname, author_fname ORDER BY COUNT(*) DESC;
    ```
* MIN and MAX command -
    ```sql
    SELECT MIN(columnName) FROM tablename;
    SELECT MAX(columnName) FROM tablename;
    ```
* To find max pages of a book with the title
    ```sql
    <!-- It uses subqueries and is slower since two queries must be executed -->
    SELECT title, pages FROM books WHERE pages=(SELECT MAX(pages) FROM books);
    ```
    or
    ```sql
    <!-- This is faster since it only runs one query -->
    SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;
    ```
* To find the year each author published their first book -
    ```sql
    SELECT author_lname AS 'last name',author_fname AS 'first name', MIN(released_year) AS 'first book published' FROM books GROUP BY author_lname, author_fname ORDER BY released_year;
    ```
* To find the longest page count for each author
    ```sql
    SELECT CONCAT(author_fname,' ',author_lname) AS 'Author', MAX(pages) AS 'longest page count' FROM books GROUP BY author_lname, author_fname;
    ```
* SUM command adds thing together.
    ```sql
    SELECT author_fname AS 'author', SUM(pages) AS 'sum of all pages' FROM books GROUP BY author_lname, author_fname ORDER BY SUM(pages);
    ```
* AVG command gives the average data.
    ```sql
    SELECT released_year AS 'year', AVG(stock_quantity) AS 'average stock' FROM books GROUP BY released_year ORDER BY AVG(stock_quantity);
    ```
## Data Types
* Varchar and char is used to store data types. The difference is char has a fixed length while varchar has a variable length.
* The length of a CHAR column is fixed to the length that you eclare when you create the table. The length can be any value from 0 to 255. When CHAR values are stored, they are right-padded with spaces to the specified length.
* DECIMAL data type is a fixed-point type and calculation are exact.
    ```sql
    DECIMAL(number of digits,number of digits after the decimal point);
    DECIMAL(4,2);
    ```
* The FLOAT and DOUBLE data types are floating-point type and calcuations are approximate. These store large number using less space but the precision is affected.
* FLOAT is precise upto 7 digits and DOUBLE is precise upto 15 digits.
* DATE stores a date but no time. Format 'YYYY-MM-DD'
* TIME stores time but no date. Format 'HH-MM-SS'
* DATETIME stores date and time. Format 'YYYY-MM-DD HH-MM-SS'
* CURDATE() - gives current date
* CURTIME() - gives current time
* NOW() - gives current datetime
* DAYNAME(CURDATE()) - gives the current day name.
* MONTHNAME(CURDATE()) - gives th current month name
* Other functions -
    * DAYOFTHEWEEK()
    * DAYOFTHEMONTH()
    * DAYOFTHEYEAR()
    * MINUTE()
    * DATE_FORMAT() -
        ```sql
        SELECT DATE_FORMAT(NOW(), '%W %M %Y');
        <!-- Friday June 2021 -->
        SELECT DATE_FORMAT(NOW(), '%d/%m/%y');
        <!-- 18/06/21 -->
        ```
    * DATEDIFF() -
        ```sql
        SELECT DATEDIFF(NOW(),'2000-11-22');
        <!-- 7513 -->
        ```
    * DATE_ADD() -
        ```sql
        SELECT DATE_ADD('2010-12-31 23:59:59' INTERVAL 1 SECOND);
        <!-- 2010-12-31 00:00:00 -->
        SELECT DATE_ADD('2100-12-31 23:59:59' INTERNAL '1:1' MINUTE_SECOND);
        <!-- 2100-01-01 00:01:00 -->
        ```
    * DATE_SUB()
* TIMESTAMP data type similar to DATETIME but the range is between 1970-2038.
    ```sql
    CREATE TABLE comments(content VARCHAR(20), created_at TIMESTAMP DEFAULT NOW());
    CREATE TABLE comments2(content VARCHAR(20), created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP);
    ```
* CAST() is used to convert data types
    ```sql
    SELECT CAST('2017-05-02' AS DATETIME);
    ```
## Logical operators
* NOT EQUAL
    ```sql
    SELECT * FROM books WHERE released_year!=2017;
    ```
* NOT LIKE
    ```sql
    SELECT title FROM books WHERE title NOT LIKE 'W%';
    ```
* GREATER THAN or EQUAL TO
    ```sql
    SELECT title FROM books WHERE stock_quantity>100;
    SELECT title FROM books WHERE stock_quantity>=100;
    ```
    Note: SELECT 99>1 will output 1(true). SELECT 99<1 will output 0(false). SELECT 'A'='a' will output 1.
* LESSER THAN OR EQUAL TO
    ```sql
    SELECT title FROM books WHERE stock_quantity<100;
    SELECT title FROM books WHERE stock_quantity<=100;
* LOGICAL AND(&&) - all conditions must be true
    ```sql
    SELECT title FROM books WHERE CONCAT(author_fname, ' ',author_lname)='Dave eggers' && released_year>2010;
    ```
* LOGICAL OR(||) - atleast one of the condition must be satisfied
    ```sql
    SELECT title FROM books WHERE CONCAT(author_fname, ' ',author_lname)='Dave eggers' || released_year>2010;
* BETWEEN and NOT BETWEEN - 
    ```sql
    SELECT title,released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;
    ```
    ```sql
    SELECT title,released_year FROM books WHERE released_year NOT   BETWEEN 2004 AND 2015 ORDER BY released_year;
    ```
* CAST using logical operators
    ```sql
    SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1890-05-01' AS DATETIME) AND CAST('2000-04-05' AS DATETIME);
    ```
* IN and NOT- replacement to multiple OR conditions for IN and the inverse result of IN is NOT IN.
    ```sql
    SELECT title, author_lname FROM books WHERE author_lname IN('carver', 'lahiri', 'Smith');
    ```
    ```sql
    SELECT title, author_lname FROM books WHERE author_lname NOT IN('carver', 'lahiri', 'Smith');
    ```
* To find a book with release year greater than 2000 and year being odd.
    ```sql
    SELECT title, released_year FROM books WHERE released_year>2000 AND
    released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);
    ```
    alternative using modulus(%) -
    ```
    SELECT title, released_year FROM books WHERE released_year>2000 AND released_year % 2 !=0;
    ```
* CASE Statements - 
    ```sql
    SELECT title, released_year as 'year',
        CASE
            WHEN released_year IS NULL THEN 'MISSING'
            <!-- IS NULL checks for null -->
            WHEN released_year>=2000 THEN '21ST CENTURY'
            WHEN released_year>=1900 AND released_year<2000 THEN '20TH CENTURY'
            ELSE '19TH CENTURY'
        END AS 'TIMELINE'
    FROM books;
    ```
## One to Many
* Types of Relationships -
    * One to one relationship
    * One to many relationship
    * Many to many relationship
* Primary Key - A primary key constrain is a column or group of columns that uniquely identifies every row in the table of the relational database management system. There can not be any duplicate in the table. A table can have only one primary key.
* Foreign key - A foreign key is a column that creates a relationship between two tables. It acts as a cross-reference between two tables as it references the primary key of another table. Every relationship int eh database should be supported by a foreign key.
* An example to create two tables (one to many)-
    ```sql
    CREATE TABLE customers(
        id INT auto_increment PRIMARY KEY, 
        first_name VARCHAR(20) NOT NULL, 
        last_name VARCHAR(20) NOT NULL,
        email VARCHAR(50) NOT NULL);
    CREATE TABLE orders(
        id INT auto_increment PRIMARY KEY, 
        order_date DATE DEFAULT NOW(),
        amount DECIMAL (8,2) DEFAULT 0.00, 
        customer_id INT, 
        FOREIGN KEY(customer_id) REFERENCES customers(id));
    ```
* Joins - To establish a connection between two or more database tables based on matching columns, thereby creating a relationship between the tables.
* Cross join produces a result set which is the number of rows in the first table multiplied by the number of rows in the second table if no where clause is used. Example of a cross join -
    ```sql
    SELECT * FROM orders,customers;
    ```
* Inner join - Selects records that have matching values in both tables.
Example of implicit inner join -
    ```sql
    SELECT first_name,last_name,order_date, amount FROM customers,orders 
    WHERE customers.id = orders.customer_id;
    ```
    Example of Explicit inner join(Prefered) -
    ```sql
    SELECT first_name,last_name,order_date,amount FROM customers
    JOIN orders
        ON customers.id = orders.customer_id;
    ```
* Left join - returns all records from the left table and the matching records from the right table.
Example of left join -
    ```sql
    SELECT first_name,last_name,order_date,amount FROM customers
    LEFT JOIN orders
        ON customers.id = orders.customer_id;
    ```
* To replace NULL with something -
    ```sql
    SELECT IFNULL([checker],[replacement]) FROM tablename;
    ```
* To display the total spending of all customers -
    ```sql
    SELECT first_name, last_name, IFNULL(sum(amount),0.00) AS 'Total spent' 
    FROM customers 
    LEFT JOIN orders 
        ON customers.id = orders.customer_id
    GROUP BY customers.id 
    ORDER BY 'total spent';
    ```
* Right join - returns all records from the right table and the matching records from the left table.
    ```sql
    SELECT first_name,last_name,order_date,amount FROM customers
    RIGHT JOIN orders
        ON customers.id = orders.customer_id;
    ```
* Delete a table data with foreign key
    ```sql
    <!-- use ON DELETE CASCADE while creating table -->
    CREATE TABLE orders(
        id INT auto_increment PRIMARY KEY, 
        order_date DATE DEFAULT NOW(),
        amount DECIMAL (8,2) DEFAULT 0.00, 
        customer_id INT, 
        FOREIGN KEY(customer_id) REFERENCES customers(id)
        ON DELETE CASCADE);
    DELETE FROM customers WHERE email='xyz@gmail.com';
    ```