-- Author: Your Name
-- Date: 2026-10-08
-- Purpose: Step 4 - Research and test a solution.
-- Documentation URL: https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql

SELECT 
    ContactName,
    LTRIM(RTRIM(
        CASE 
            WHEN CHARINDEX(' ', ContactName) > 0 
            THEN LEFT(ContactName, CHARINDEX(' ', ContactName) - 1)
            ELSE ContactName
        END
    )) AS FirstName_Tested
FROM dbo.t_w3_schools_customers;