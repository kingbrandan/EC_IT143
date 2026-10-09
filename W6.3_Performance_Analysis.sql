-- ============================================================================
-- Course: IT143
-- Assignment: 6.3 Performance Analysis (Deliverable W6.4)
-- Purpose: Demonstrate execution plans, missing index recommendations, 
--          and performance optimization on AdventureWorks.
-- ============================================================================

USE AdventureWorks2022;
GO
   
-------------------------------------------------------------------------------
-- QUERY 1: Person.Address (Filtering on unindexed character column 'City')
-------------------------------------------------------------------------------

-- Step 1: Run query with "Include Actual Execution Plan" enabled (Ctrl + M).
-- Notice: Table scan on Person.Address and missing index recommendation in green.
SELECT AddressID, AddressLine1, City, PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO

-- Step 2: Create the recommended index.
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Address_City' AND object_id = OBJECT_ID('Person.Address')
)
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Address_City]
    ON [Person].[Address] ([City])
    INCLUDE ([AddressLine1], [PostalCode]);
END
GO

-- Step 3: Re-run query to verify index usage and reduced Subtree Cost.
SELECT AddressID, AddressLine1, City, PostalCode
FROM Person.Address
WHERE City = 'Bothell';
GO


-------------------------------------------------------------------------------
-- QUERY 2: Production.Product (Filtering on unindexed character column 'Color')
-------------------------------------------------------------------------------

-- Step 1: Run query with "Include Actual Execution Plan" enabled.
-- Notice: Clustered Index Scan and missing index recommendation.
SELECT ProductID, Name, ProductNumber, Color, ListPrice
FROM Production.Product
WHERE Color = 'Silver';
GO

-- Step 2: Create the recommended index.
IF NOT EXISTS (
    SELECT * FROM sys.indexes 
    WHERE name = 'IX_Product_Color' AND object_id = OBJECT_ID('Production.Product')
)
BEGIN
    CREATE NONCLUSTERED INDEX [IX_Product_Color]
    ON [Production].[Product] ([Color])
    INCLUDE ([Name], [ProductNumber], [ListPrice]);
END
GO

-- Step 3: Re-run query to verify performance improvement (Index Seek).
SELECT ProductID, Name, ProductNumber, Color, ListPrice
FROM Production.Product
WHERE Color = 'Silver';
GO