-- Author: Your Name
-- Date: 2026-10-08
-- Purpose: Step 3 - Create an ad hoc SQL query.

SELECT 
    ContactName,
    CASE 
        WHEN CHARINDEX(' ', ContactName) > 0 
        THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ContactName
    END AS FirstName
FROM dbo.t_w3_schools_customers;