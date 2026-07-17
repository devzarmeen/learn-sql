-- 1. SQL DEFAULT CONSTRAINTS

-- The DEFAULT constraint is used to automatically insert a default value for a column, if no value is specified.
-- The default value will be added to all new records (if no other value is specified).

INSERT INTO Persons(ID,Name) VALUES(2,'Ahmed');

-- DEFAULT CONSTRAINTS ON CREATE TABLE
CREATE TABLE Persons ( ID int PRIMARY KEY, LastName varchar(255) NOT NULL,
    FirstName varchar(255), Age int, City varchar(255) DEFAULT 'Sandnes');

INSERT INTO Persons (ID,LastName,FirstName,Age)
VALUES (1,'Khan','Ali',22);

-- Default using System Functions 
CREATE TABLE Orders (ID int PRIMARY KEY,
    OrderNumber int NOT NULL, OrderDate date DEFAULT CURRENT_DATE());

-- SQL Server Version
CREATE TABLE Orders (ID int PRIMARY KEY,
    OrderNumber int NOT NULL, OrderDate date DEFAULT CAST(GETDATE() AS date));
-- CAST(GETDATE() AS date) will store date, GETDATE() will return date

-- DEFAULT Constraint on ALTER TABLE
-- if table already exists then enter default values
ALTER TABLE Persons
ALTER City SET DEFAULT 'Sandnes';

-- SQL SERVER
ALTER TABLE Persons
ADD CONSTRAINT df_City DEFAULT 'Sandnes' FOR City;  -- will add new constraints and nae of that constraint will be df_city and default value will br sandnes

-- DROP DEFAULT CONSTRAINTS
ALTER TABLE Persons
ALTER City DROP DEFAULT; -- remove default of city

-- SQL SERVER
ALTER TABLE Persons DROP CONSTRAINT df_City; -- constraint delete 

-- 2. SQL CREATE INDEX STATEMENT
-- The CREATE INDEX statement is used to create indexes on tables in databases, to speed up data retrieval.
-- The users cannot see the indexes, they are just used to speed up searches/queries.

-- CREATE INDEX Syntax
CREATE INDEX index_name ON table_name (column1, column2);

-- Index always create on table to speed up data retrieval
SELECT * FROM Persons WHERE LastName='Ali';

CREATE INDEX idx_lastname ON Persons (LastName);

-- DROP INDEX Statement
-- The DROP INDEX statement is used to remove an index.

-- SQL Server:
DROP INDEX table_name.index_name;

-- MySQL:
ALTER TABLE table_name DROP INDEX index_name;

-- MS Access:
DROP INDEX index_name ON table_name;

-- DB2/Oracle:
DROP INDEX index_name;

-- when any value update delete  or  insert  index update also 

-- Index only on those columns  where exists  WHERE, JOIN, ORDER BY

-- Type of indexes 
-- NON UNIQUE INDEX 
CREATE INDEX

-- UNIQUE INDEX 
-- Duplication is not allowed 
CREATE UNIQUE INDEX index_name
ON table_name(column1,column2);

-- 3. SQL AUTO INCREMENT Field
-- An auto-increment field is a numeric column that automatically generates a unique number, when a new record is inserted into a table.

-- SYNTAX for MYSQL
-- MySQL uses the AUTO_INCREMENT keyword to perform an auto-increment feature.
-- Default starting value of AUTO_INCREMET is 1 and will increment each time by 1 
CREATE TABLE Persons ( Personid int AUTO_INCREMENT PRIMARY KEY,
    LastName varchar(255) NOT NULL, FirstName varchar(255), Age int);

ALTER TABLE Persons AUTO_INCREMENT = 100;  -- set value of AUTO_INCREMENT

-- Add Unique value by default
INSERT INTO Persons (FirstName, LastName)
VALUES ('Lars', 'Monsen');

-- SYNTAX FOR SQL SERVER
-- SQL SERVER uses IDENTITY keyword to perform an auto-incrment feature.
CREATE TABLE Persons ( Personid int IDENTITY(1,1) PRIMARY KEY,
    LastName varchar(255) NOT NULL, FirstName varchar(255), Age int);

-- SYNTAX for MS Access 
-- The MS Access uses the AUTOINCREMENT keyword to perform an auto-increment feature.

CREATE TABLE Persons ( Personid AUTOINCREMENT PRIMARY KEY,
    LastName varchar(255) NOT NULL, FirstName varchar(255),Age in);

-- SYNTAX FOR ORACLE
-- In Oracle, you have to create an auto-increment field with the SEQUENCE object (this object generates a number sequence).
CREATE SEQUENCE seq_person
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO Persons (Personid, FirstName, LastName)
VALUES (seq_person.nextval, 'Lars', 'Monsen');

-- 4. SQL WORKING WITH DATES
-- The most difficult part when working with dates in databases, is to be sure that the format of the date you are trying to insert/select, matches the format of the date column in the database.

INSERT INTO Orders VALUES (1,'Laptop','2025-11-11');
                --or
SELECT * FROM Orders WHERE OrderDate='2025-11-11';   

-- MYSQL Date Data Types
        -- DATE      format YYYY-MM-DD
        -- DATETIME  format: YYYY-MM-DD HH:MI:SS
        -- TIMESTAMP format: YYYY-MM-DD HH:MI:SS
        -- TIME      format: HH:MI:SS
        -- YEAR      format YYYY or YY

-- SQL Server has the following date data types:
        -- DATE         format YYYY-MM-DD
        -- ATETIME      format: YYYY-MM-DD HH:MI:SS
        -- SMALLDATETIME format: YYYY-MM-DD HH:MI:SS
        -- TIME          format: HH:MI:SS
        -- TIMESTAMP       format: a unique number

-- 5. SQL View 

--An SQL view is a virtual table based on the result-set of an SQL statement. An SQL view contains rows and columns, just like a real table. The fields in the view are fields from one or more real tables in the database.

-- You can add SQL statements and functions to a view and present the data as if it were coming from one single table.

-- A view is created with the CREATE VIEW statement.

-- CREATE VIEW Syntax:
CREATE VIEW view_name AS
SELECT column1, column2, FROM table_name WHERE condition;

-- Example 1:
CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName FROM Customers
WHERE Country = 'Brazil';

-- Example 2:
CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

-- ALTER VIEW Statement(SQL Server)
-- In SQL Server, a view can be updated with the ALTER VIEW statement.

-- ALTER VIEW Syntax
ALTER VIEW view_name AS SELECT column1, column2,
FROM table_name WHERE condition;

-- The following SQL adds the "City" column to the "Brazil Customers" view:

-- Example3:
ALTER VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City FROM Customers WHERE Country = 'Brazil';

-- CREATE OR REPLACE VIEW Syntax
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2,
FROM table_name WHERE condition;

-- Example 4:
CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers WHERE Country = 'Brazil';

-- Drop VIEW STATEMENT SYNTAX:
DROP VIEW view_name;
-- Example 
DROP VIEW [Brazil Customers];

-- 6. SQL INJECTION 

-- SQL INJECTION is Cyber security Attack 
-- SQL injection is a code injection technique that can destroy your database. 
-- SQL injections are a common web hacking technique.
-- SQL injections are when attackers insert malicious SQL code into user-input fields, and this way can read, modify, or delete sensitive data in a database.

-- SQL injections usually occur when you ask a user for input, like username/userid, and instead of giving a name/id, the attacker inserts an SQL command that executes something in your database.

txtUserId = getRequestString("UserId");   -- txtUserId is variable getRequestString() is function to take input from user 
-- This is not SQL, This is PROGRAMMING LANGUAGE CODE 
txtSQL = "SELECT * FROM Users WHERE UserId = " + txtUserId;   txtSQL is string varaiable "SELECT * FROM Users" Users table data.
-- WHERE UserId=    Specific User.
-- + (String concatenate.)
-- txtUserId User input.

uName=getRequestString("username"); -- get username
uName=getRequestString("username"); -- get password

-- How to prevent from SQL Injection
-- Prepared Statements 
-- Validate User input 
-- Escape User input
-- Allow minimum permissions to database users 

-- 7. SQL PARAMETERS
-- SQL parameters (Parameterized Queries) can be used to protect a web site from SQL injections.
-- A parameterized query is a SQL statement that uses placeholders instead of directly adding the input values into the query text. The placeholders get replaced with the actual values when the query executes. This makes the queries more safe and more reusable.

userid = getRequestString("UserId");
query = "SELECT * FROM Users WHERE UserId = @userid";
db.Execute(query, userid);

-- parameters in SQL Server are presented by a @ marker.
-- The SQL engine checks each parameter to ensure that it is correct for its column and are treated literally, and not as part of the SQL to be executed.

cname = getRequestString("CustomerName");
caddress = getRequestString("Address");
ccity = getRequestString("City");
query = "INSERT INTO Customers (CustomerName, Address, City) Values(@cname, @caddress, @ccity)";
db.Execute(query, cname, caddress, ccity);

-- 8. SQL Prepared Statements 
-- SQL prepared statements can be used to protect a web site from SQL injections.
-- Prepared statements seperates the query structure (the SQL) from the actual data (user input).

--Prepared statements basically work like this:
--Prepare: An SQL query template with placeholders is sent to the server. The data values are not sent. Example: INSERT INTO MyGuests VALUES(?, ?, ?). Then, the server parses, compiles, and optimizes the SQL query template, without executing it
--Execute: At a later time, the application binds the values to the parameters, and the database executes the query. The application may execute the query as many times as it wants with different values
--Prepared statements have four main advantages:

--Reduced parsing time - as the preparation on the query is done only once (although the statement is executed multiple times)
--Minimize bandwidth - Bound parameters minimize bandwidth to the server as you need send only the parameters each time, and not the whole query
--Security - Prepared statements are very useful against SQL injections, because parameter values, which are transmitted later using a different protocol, need not be correctly escaped. If the original statement template is not derived from external input, SQL injection cannot occur
--Cleaner code - by seperating data from SQL commands

SELECT * FROM Users
WHERE username=' " OR 1=1 -- '

SELECT * FROM Users
WHERE username=?

INSERT INTO Students
VALUES (?, ?, ?)

-- Execute
-- At a later time, the application binds the values to the parameters

-- SQL Query Template 
$sql ="INSERT INTO MyGuests
(firstname, lastname, email)VALUES (?, ?, ?)";

-- Bind Parameters
$stmt->bind_param("sss",$firstname,$lastname,$email);
-- bind_param it replaces placeholders with varaibles

-- 9. SQL HOSTING
-- Connect website with  any database server to store and retrieve data 

-- Website + Database + Server = SQL Hosting
-- If you want your web site to store and retrieve data from a database, your web server must have access to a database-system.


-- When you write www.amazon.com in browser  it goes to web server
-- Server Should be connected to  database if you dont have connection website cann not read or write data 

-- If your web server is hosted by an Internet Service Provider (ISP), you will have to look for SQL hosting plans.

-- Some common SQL hosting databases are MySQL, PostgreSQL, SQL Server, and Oracle.

-- MySQL is a popular database software for web sites.
-- MySQL is known for speed, reliability, and ease of use.
-- MySQL is an inexpensive alternative to the expensive Microsoft and Oracle solutions.
-- Microsoft SQL Server has a strong integration with other Microsoft products, powerful tools, and robust security features.
-- Oracle is a popular database software for database-driven web sites with high traffic.
-- PostgreSQL is a popular database software for web sites.
