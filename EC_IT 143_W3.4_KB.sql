/*****************************************************************************************************************
NAME:    3.4 Adventure Works-Create Answers
PURPOSE:translation of user questions into SQL statements

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     09/24/2026   KB.MTHIMUNYE      1. Built this script for EC IT440


RUNTIME: 
Xm Xs

NOTES: 
 Built for Adventure Works
 
******************************************************************************************************************/

-- Question 1: Which ten employees have the most accumulated vacation hours remaining on record?
-- Author: [King Brandan Mthimunye]

SELECT TOP (10)
    e.BusinessEntityID,
    p.FirstName,
    p.LastName,
    e.JobTitle,
    e.VacationHours
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p
    ON e.BusinessEntityID = p.BusinessEntityID
ORDER BY e.VacationHours DESC;

-- Question 2: What are the ten most expensive products based on their list price?
-- Author: [James Eyong arikpo]

SELECT TOP (10)
    ProductID,
    Name AS ProductName,
    ProductNumber,
    ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

-- Question 3: Which five accessories generate the highest net profit per unit when calculating list price minus standard cost?
-- Author: [King Brandan Mthimunye]

SELECT TOP (5)
    p.ProductID,
    p.Name AS ProductName,
    p.ListPrice,
    p.StandardCost,
    (p.ListPrice - p.StandardCost) AS ProfitPerUnit
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE pc.Name = 'Accessories'
ORDER BY ProfitPerUnit DESC;

-- Question 4: Which product category generated the highest total profit margin in 2013?
-- Author: [Eleazar Uchechukwu Ikpegbu]

SELECT TOP (1)
    pc.Name AS CategoryName,
    SUM(sod.LineTotal) AS TotalRevenue,
    SUM(sod.OrderQty * p.StandardCost) AS TotalCost,
    SUM(sod.LineTotal - (sod.OrderQty * p.StandardCost)) AS TotalProfitMargin
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Sales.SalesOrderHeader AS soh
    ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory AS psc
    ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory AS pc
    ON psc.ProductCategoryID = pc.ProductCategoryID
WHERE soh.OrderDate >= '2013-01-01' AND soh.OrderDate <= '2013-12-31'
GROUP BY pc.Name
ORDER BY TotalProfitMargin DESC;

-- Question 5: Who are the top three customers by total spending in 2013, including order count and average order value?
-- Author: [Eleazar Uchechukwu Ikpegbu]

SELECT TOP (3)
    c.CustomerID,
    ISNULL(p.FirstName + ' ' + p.LastName, s.Name) AS CustomerName,
    COUNT(DISTINCT soh.SalesOrderID) AS TotalOrders,
    SUM(soh.TotalDue) AS TotalSpent,
    AVG(soh.TotalDue) AS AverageOrderValue
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.Customer AS c
    ON soh.CustomerID = c.CustomerID
LEFT JOIN Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID
WHERE soh.OrderDate >= '2013-01-01' AND soh.OrderDate <= '2013-12-31'
GROUP BY c.CustomerID, p.FirstName, p.LastName, s.Name
ORDER BY TotalSpent DESC;

-- Question 6: Which product has the lowest total sales quantity in Sales.SalesOrderDetail?
-- Author: [Natalia Andrea López]

SELECT TOP (1)
    p.ProductID,
    p.Name AS ProductName,
    SUM(sod.OrderQty) AS TotalQuantitySold
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Production.Product AS p
    ON sod.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY TotalQuantitySold ASC;

-- Question 7: List all tables in the Sales schema and their table types.
-- Author: [Your Name]

SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    TABLE_TYPE
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'Sales'
ORDER BY TABLE_NAME;

-- Question 8: Retrieve all column metadata for the Production.Product table.
-- Author: [Natalia Andrea López]

SELECT 
    TABLE_SCHEMA,
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'Production' 
  AND TABLE_NAME = 'Product'
ORDER BY ORDINAL_POSITION;