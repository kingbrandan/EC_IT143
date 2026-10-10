-- SQL Interview Demonstration #5
-- Course: IT143

--------------------------------------------------
-- 1. PRIMARY AND FOREIGN KEYS (Data Integrity)
--------------------------------------------------
-- Example showing Primary Keys, Foreign Keys, and Constraints
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) CHECK (TotalAmount >= 0)
);

--------------------------------------------------
-- 2. DEMONSTRATING SQL JOINS
--------------------------------------------------
-- INNER JOIN: Matches rows present in both tables
SELECT c.CustomerName, o.OrderID, o.TotalAmount
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID;

-- LEFT JOIN: All customers, including those without orders
SELECT c.CustomerName, o.OrderID
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- RIGHT JOIN: All orders, including those without linked customers
SELECT c.CustomerName, o.OrderID
FROM Customers c
RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;

-- FULL OUTER JOIN: All records from both tables
SELECT c.CustomerName, o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;