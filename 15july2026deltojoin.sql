-- 1. SQL DELETE STATEMENT   it is used to delete records of table, column and table reamin same only data delete
-- SYNTAX: DELETE FROM table_name WHERE condition;

DELETE FROM Customers WHERE  CustomerID = 5;
-- Text Condition 
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste'

-- DELETE ALL RECORDS
DELETE FROM Customers;   --output will be empty table

--DROP  TABLE        IT DELETES EVERYTHING  
DROP TABLE Customers;

-- 2.SELECT  Top/Limit      when we have 1000 recordsand we want only 1st 5 records we use top select
SELECT TOP 3 * FROM Customers;   -- in mysqlwe use limit

-- oracle we use          FETCH FIRST 3 ROWS ONLY;

-- LIMIT with WWHERE
SELECT * FROM Customers WHERE Country='Germany' LIMIT 3;

-- LIMIT with ORDER BY
SELECT * FROM Customers ORDER BY CustomerName DESC LIMIT 3;

-- TOP Percent
SELECT TOP 50 PERCENT * FROM Customers;

-- 3. Aggregate Functions
-- An aggregate function is a function that performs a calculation on a set of values, and returns a single value.
-- Perform Calcultaions on multiple rows and return single result 

-- 4. SQL MIN()  calculate minimum
SELECT MIN(Price) FROM Products;

-- Alias()
SELECT MIN(Price) AS SmallestPrice FROM Products;    -- AS is temporaary name 

-- MIN on DATE
SELECT MIN(BirthDate) FROM Employees;

-- MIN with GROUP BY 
SELECT MIN(Price), CategoryID
FROM Products GROUP BY CategoryID;

-- 5. SQL MAX()
SELECT MAX(Price) FROM Products;

-- ALias 
SELECT MAX(Price) AS HighestPrice FROM Products;

-- MAX With Date 
SELECT MAX(BirthDate) FROM Employees;

--MAX with GROUP BY
SELECT MAX(Price), CategoryID
FROM Products GROUP BY CategoryID;

-- Combine All Methods
SELECT * FROM Customers WHERE Country = 'USA'
ORDER BY CustomerName ASC LIMIT 5;

-- 6. SQL COUNT() Function
-- it counts number of rows in table 
-- SYNTAX: SELECT COUNT(column_name) FROM table_name;

SELECT COUNT(*) FROM Products;
SELECT COUNT(ProductName)FROM Products;

-- COUNT DISTINCT Column
SELECT COUNT(DISTINCT Price) FROM Products;

-- COUNT With Where 
SELECT COUNT(ProductID)
FROM Products WHERE Price > 20;

-- Alias 
SELECT COUNT(*) AS TotalProducts FROM Products;

-- COUNT WITH GROUPBY:
SELECT COUNT(*) AS Total,
CategoryID FROM Products GROUP BY CategoryID;

-- 7. SQL SUM()         Add numbers 
-- SYNTAX: SELECT SUM(column) FROM table;

SELECT SUM(Quantity) FROM OrderDetails;

-- SUM With Where 
SELECT SUM(Quantity) FROM OrderDetails WHERE ProductID=11;

-- Alias
SELECT SUM(Quantity) AS Total FROM OrderDetails;

-- GROUP BY
SELECT OrderID, SUM(Quantity)
FROM OrderDetails GROUP BY OrderID;

-- SUM Expression 
SELECT SUM(Quantity*10) FROM OrderDetails;

-- SUM With JOIN
SELECT SUM(Price*Quantity)
FROM OrderDetails LEFT JOIN Products
ON OrderDetails.ProductID=Products.ProductID;

-- 8. SQL AVG()
SELECT AVG(Price) FROM Products;

-- AVG with Where
SELECT AVG(Price) FROM Products WHERE CategoryID=1;

-- Alias
SELECT AVG(Price) AS AveragePrice FROM Products;

-- Higher Than Average 
SELECT * FROM Products WHERE Price >
(SELECT AVG(Price) FROM Products);

-- 9. SQL LIKE          Search pattern, not exact word search only pattern 
SELECT * FROM Customers WHERE CustomerName LIKE pattern;

-- Start with A
SELECT * FROM Customers WHERE CustomerName LIKE '%A'

-- End with a
SELECT * FROM Customers WHERE CustomerName LIKE '%a'

-- Contains
SELECT * FROM Customers WHERE CustomerName LIKE '%or%'

-- 10. WILDCARD  (_)   only one character
SELECT * FROM Customers WHERE CustomerName LIKE '_ondon'
-- 3 characters missing 
SELECT * FROM Customers WHERE CustomerName LIKE 'L___on'

-- Mulitple WildCard
SELECT * FROM Customers WHERE CustomerName LIKE 'a__%'  -- word should have atleast 3 words

-- Second Character r
SELECT * FROM Customers WHERE CustomerName LIKE '_r%'

--Without WildCard
SELECT * FROM Customers WHERE CustomerName LIKE 'Ali'

-- Range
SELECT * FROM Customers WHERE CustomerName LIKE '[a-z]%'

--11. SQL IN OPERATOR
-- IN Operator check given column value exsits in list
-- Syntax: SELECT column_name(s) FROM table_name WHERE column_name IN (value1, value2, value3);

-- SELECT column_name(s)    tell which column should be displayed 
SELECT *

-- FROM table_name
FROM Customers

-- Where for Condition 
-- column_name IN()

-- OR Operator 
SELECT * FROM Customers
WHERE Country='Germany' OR Country='France' OR Country='UK';

-- IN Operator 
SELECT * FROM Customers
WHERE Country IN('USA', 'UK', 'Canada', 'Germany','France')

--NOT IN
SELECT * FROM Customers
WHERE Country NOT IN ('Germany','France','UK');

-- IN with Subquery 
SELECT * FROM Customers
WHERE CustomerID IN
(SELECT CustomerID FROM Orders);

-- SQL BETWEEN Operator    check values in range 
-- Starting and ending both values included
-- Syntax: SELECT column_name(s) FROM table_name WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Products WHERE Price BETWEEN 10 AND 20;

-- NOT BETWEEN
SELECT * FROM Products WHERE Price NOT BETWEEN 10 AND 20;

-- Between and IN
SELECT * FROM ProductsWHERE Price BETWEEN 10 AND 20
AND CategoryID IN (1,2,3);

-- Between on Text 
SELECT * FROM Products WHERE ProductName BETWEEN 'Geitost'
AND 'Louisiana Hot Spiced Okra';

-- Between Dates
SELECT *FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

--12. SQL Aliases 
-- it is temporary name 
SELECT CustomerID AS ID FROM Customers;

-- Alias wih Space 
SELECT ProductName AS "My Products"
FROM Products;

-- Concatenate 
SELECT CustomerName,
Address+', '+PostalCode+' '+City+', '+Country AS FullAddress
FROM Customers;

-- 13. SQL Join 
-- SYNTAX: SELECT columns FROM Table1 JOIN Table2 ON Table1.ID=Table2.ID;

-- 14. SQL INNER JOIN  it returns matching rows 
SELECT * FROM Customers INNER JOIN Orders
ON Customers.CustomerID=Orders.CustomerID;

-- Join and Inner join are same 


-- 15. SQL Left Join
-- All rows of left table and just matching rows of right table 
-- if it doesnot find matching rows then null 
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers LEFT JOIN Orders ON Customers.CustomerID= Orders.CustomerID;

-- not order
SELECT Customers.CustomerName FROM Customers
LEFT JOIN Orders ON Customers.CustomerID=
Orders.CustomerID WHERE Orders.CustomerID IS NULL;

-- 16. SQL Right Join
-- All rows of right table and matching rows of left table  
SELECT Orders.OrderID,Employees.FirstName
FROM Orders RIGHT JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID;