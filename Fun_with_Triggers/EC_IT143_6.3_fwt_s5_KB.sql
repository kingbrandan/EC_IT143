-- Author: King  Brandan Mthimunye
-- Date: 2026-10-08
-- Purpose: Step 5 - Test results to see if they are as expected.

-- Execute an update operation
UPDATE dbo.t_w3_schools_customers
SET ContactName = ContactName
WHERE CustomerID = 1;

-- Verify update audit details
SELECT CustomerID, ContactName, last_modified_date, last_modified_by
FROM dbo.t_w3_schools_customers
WHERE CustomerID = 1;