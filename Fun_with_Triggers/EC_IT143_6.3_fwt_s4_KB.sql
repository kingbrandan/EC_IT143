-- Author: King Brandan Mthimunye
-- Date: 2026-10-08
-- Purpose: Step 4 - Create an after-update trigger.

IF OBJECT_ID('dbo.trg_t_w3_schools_customers_after_update', 'TR') IS NOT NULL
    DROP TRIGGER dbo.trg_t_w3_schools_customers_after_update;
GO

CREATE TRIGGER dbo.trg_t_w3_schools_customers_after_update
ON dbo.t_w3_schools_customers
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE t
    SET last_modified_date = GETDATE(),
        last_modified_by = SUSER_NAME()
    FROM dbo.t_w3_schools_customers t
    INNER JOIN inserted i ON t.CustomerID = i.CustomerID;
END;
GO