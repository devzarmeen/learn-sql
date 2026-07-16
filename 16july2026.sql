-- 1. FULL JOIN

SELECT Customers.CustomerName,Orders.OrderID
FROM Customers FULL JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

-- Full Join returns complete both tables

-- 2. SELF JOIN
-- Combine one table with itself
SELECT A.Name, B.Name FROM Employees A
JOIN Employees B ON A.ManagerID=B.ID;
-- A and B Both are same table but are aliases 

--3.UNION
-- Combine Results of 2 selected queries and column names should be same and remove duplicates
SELECT Country FROM Customers 
UNION
SELECT Country FROM Suppliers;

-- 4. UNION ALL
-- same as union but it does not remove duplicates
-- SYNTAX: SELECT column_name(s) FROM table1
--          UNION ALL
-- SELECT column_name(s) FROM table2;
-- Example 1:
SELECT Country FROM Customers
        UNION ALL
SELECT Country FROM Suppliers;

-- Example 2:
SELECT City, Country FROM Customers WHERE Country='Germany'
        UNION ALL
SELECT City, Country FROM Suppliers WHERE Country='Germany'
ORDER BY City;

-- 5. GROUP BY
-- How many each order each country have it is not possible to count without groupby
SELECT Country, COUNT(*)
FROM Orders GROUP BY Country;        -- it will group countries of same name 

-- GROUP BY Internally              -- it divide rows and then perform aggregation function on each group
-- AVG()
SELECT Department, AVG(Salary)
FROM Employees GROUP BY Department;
-- MIN()
SELECT Department, MIN(Salary)
FROM Employees GROUP BY Department;
-- MAX()
SELECT Department, MAX(Salary)
FROM Employees GROUP BY Department;
-- SORT()
SELECT Country, COUNT(CustomerID) AS [Number of Customers]
FROM Customers
GROUP BY Country ORDER BY COUNT(CustomerID) DESC;

-- 6.HAVING
-- Where filters rows before groupby
-- Having filters group's but after groupby
SELECT Country, COUNT(*) FROM Orders
GROUP BY Country HAVING COUNT(*)>2;

-- 7. EXISTS
-- Exists check either record exists or not in list 
-- Returns values in True or False 
SELECT * FROM Customers
WHERE EXISTS(
SELECT * FROM Orders WHERE Customers.ID=Orders.CustomerID);


-- 8. ANY
-- It Compares with any value of subquery
-- SYNTAX: SELECT column_name(s) FROM table_name WHERE column_name operator ANY (subquery);
SELECT ProductName FROM Products WHERE ProductID=ANY
( SELECT ProductID FROM OrderDetails WHERE Quantity=20);

SELECT ProductName FROM Products WHERE ProductID 
= ANY (SELECT ProductID FROM OrderDetails
WHERE Quantity > 99);

-- 9. SQL ALL Operator 
-- ANY (if any one condition satifyies  result will be true)
-- ALL (Each Value must satisfy condition if any one condition false result will be false)
SELECT ProductName FROM Products
WHERE ProductID = ALL( SELECT ProductID
FROM OrderDetails WHERE Quantity=10);

-- 10. SQL SELECT INTO
-- Create a new table from existing  table 
SELECT * INTO CustomersBackup FROM Customers;

-- Empty Table 
SELECT * INTO NewTable FROM Customers WHERE 1=0; -- 1=0? always false

-- 11. SQL INSERT INTO SELECT 
-- Insert Data into Existing Table
INSERT INTO Archive SELECT * FROM Customers;

-- USA Customers
INSERT INTO Archive SELECT * FROM Customers WHERE Country='USA';

-- 12. CASE Expression
if marks>90:
 Grade=A
elif marks>80:
 Grade=B
else:
 Grade=C

-- SQL
CASE
WHEN Price<20 THEN 'Low'
WHEN Price<50 THEN 'Medium'
ELSE 'High'
END

-- 13. NULL Functions  (Data Missing) if one is null value will be null

-- COALESCE
-- if order is  NULL then use 0 
COALESCE(NULL,NULL,5,7)     --First non NUll Value

-- IFNULL
IFNULL(Order,0)

-- ISNULL 
ISNULL(Order,0)

--NVL
NVL(Order,0)

-- 14. Stored Procedure
-- Instead of Writing Query each time 
SELECT *
FROM Customers
WHERE City='London';
-- Save Query 
CREATE PROCEDURE GetCustomers
-- Now just write 
EXEC GetCustomers
-- we can also give parameters
CREATE PROCEDURE GetCustomers
@City
-- RUN 
EXEC GetCustomers 'London'

-- 15. SQL Comments
-- Databasse Ignore comments 

-- Single Line
-- This is comment
SELECT * FROM Customers;

-- Multi Line 
/*
comment
comment
*/

-- 16. SQL Operator  
-- Operator means symbols That perform calculations and comparison
-- Arithmetic   (Add +, Subtract -, Multiply *, Division /, )
-- Comparison   (Equal =, Greater >, Less <, Greater equal >=, Less equal <=, Not equal <>)
-- Logical      (AND , OR, NOT, IN, BETWEEN, LIKE, EXISTS, ANY, ALL)