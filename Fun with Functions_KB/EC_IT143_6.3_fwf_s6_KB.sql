-- Author: Your Name
-- Date: 2026-10-08
-- Purpose: Step 6 - Compare UDF results to ad hoc query results.

SELECT 
    ContactName,
    CASE 
        WHEN CHARINDEX(' ', ContactName) > 0 
        THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
        ELSE ContactName
    END AS AdHoc_FirstName,
    dbo.fn_GetFirstName(ContactName) AS UDF_FirstName
FROM dbo.t_w3_schools_customers;