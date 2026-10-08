-- Author: Your Name
-- Date: 2026-10-08
-- Purpose: Step 7 - Perform a "0 results expected" test.

WITH ComparisonCTE AS (
    SELECT 
        ContactName,
        CASE 
            WHEN CHARINDEX(' ', ContactName) > 0 
            THEN SUBSTRING(ContactName, 1, CHARINDEX(' ', ContactName) - 1)
            ELSE ContactName
        END AS AdHoc_FirstName,
        dbo.fn_GetFirstName(ContactName) AS UDF_FirstName
    FROM dbo.t_w3_schools_customers
)
SELECT * 
FROM ComparisonCTE
WHERE AdHoc_FirstName <> UDF_FirstName 
   OR (AdHoc_FirstName IS NULL AND UDF_FirstName IS NOT NULL)
   OR (AdHoc_FirstName IS NOT NULL AND UDF_FirstName IS NULL);