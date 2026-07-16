-- 1. CREATE DATABASE 
-- Database is container  that stores tables, views and procedures

CREATE DATABASE University;  -- it will create database

-- How to use Database 
USE University;

-- SQL Server
USE University;
GO
-- All tables will be stored in university database COMMENT

-- Syntax for SQL Server

SELECT name FROM sys.databases;

-- Syntax for MySQL

SHOW DATABASES;

-- 2. DROP DATABASE
-- Delete database Permanently
DROP DATABASE University;

-- 3. BACKUP DATABASE
-- just use in SQL Server if fatabases crashes we can use backup restore
BACKUP DATABASE University
TO DISK='D:\Backup\University.bak';

-- Differential  Backup
-- firstly we will backup of 100 
-- then we have 2GB backup only and will save this.

-- 4. CREATE TABLE 
-- Table created in Database 
CREATE TABLE Students
(StudentID INT, Name VARCHAR(100), Age INT);

-- DataTypes
-- INT  (Numbers only)
-- VARCHAR (Characters)
-- DATE
-- FLOAT

-- CONSTRAINTS
-- These are Rules of database
CREATE TABLE Students
(StudentID INT PRIMARY KEY, Name VARCHAR(100) NOT NULL,
Age INT);

-- CREATE Table From Another Table 
CREATE TABLE GermanCustomers AS
SELECT * FROM Customers WHERE Country='Germany';

-- 5. DROP TABLE
DROP TABLE Students;   -- will delete structure and data 
DROP TABLE IF EXISTS Shippers;

-- 6. TRUNCATE TABLE   -- will delete data and table will reamin same.
TRUNCATE TABLE Students;

-- 7. ALERT TABLE
-- It Change existing Table
-- ADD COLUMN
ALTER TABLE Students ADD Email VARCHAR(100);

-- DROP COLUMN
ALTER TABLE Students DROP COLUMN Email;

-- RENAME COlUMN
ALTER TABLE Students RENAME COLUMN Name TO StudentName;

-- MODIFY DATATYPE
ALTER TABLE Students ALTER COLUMN Name VARCHAR(200);

-- RENAME TABLE
ALTER TABLE Students RENAME TO Learners;

-- 8. CONSTRAINTS
-- It keeps data valid
--1.NOTNULL(), 2.UNIQUE(),3.PRIMARY KEY(),4.FOREIGN KEY(), CHECK(), DEFAULT(), CREATE INDEX()

-- 8. NOT NULL 
-- it can not be empty
CREATE TABLE Students
(ID INT, Name VARCHAR(50) NOT NULL);

CREATE TABLE Persons (ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,Age int);

ALTER TABLE Persons
ALTER COLUMN Age int NOT NULL;

-- SQLDB UNIQUE
-- DoesNot Allow Duplicate 
Email VARCHAR(100) UNIQUE

-- UNIQUE Constarint on CREATE TABLE
CREATE TABLE Persons (ID int NOT NULL UNIQUE,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),Age int);

-- MYSQL
CREATE TABLE Persons (
    ID int NOT NULL, LastName varchar(255) NOT NULL,
    FirstName varchar(255), Age int, UNIQUE (ID));

--UNIQUE Constraint on ALTER TABLE
ALTER TABLE Persons
ADD UNIQUE (ID);

-- DROP UNIQUE Constraints 
ALTER TABLE Persons
DROP INDEX UC_Person;