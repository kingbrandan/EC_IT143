-- Author: King Brandan Mthimunye
-- Date: 2026-10-08
-- Purpose: Step 3 - Research and test a solution.
-- Documentation URL: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql

-- Ad hoc test updating a single record manually to inspect behavior
UPDATE dbo.t_w3_schools_customers
SET CustomerName = CustomerName
WHERE CustomerID = 1;

SELECT CustomerID, CustomerName, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;