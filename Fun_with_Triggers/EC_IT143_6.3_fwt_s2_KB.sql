-- Author: King Brandan Mthimunye
-- Date: 2026-10-08
-- Purpose: Step 2 - Begin creating an answer.

-- Answer: I can create an AFTER UPDATE trigger on dbo.t_w3_schools_customers that sets 
-- last_modified_date = GETDATE() and last_modified_by = SUSER_NAME() whenever a record changes.