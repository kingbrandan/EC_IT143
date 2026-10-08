-- Author: Your Name
-- Date: 2026-10-08
-- Purpose: Step 5 - Create a user-defined scalar function.

IF OBJECT_ID('dbo.fn_GetFirstName', 'FN') IS NOT NULL
    DROP FUNCTION dbo.fn_GetFirstName;
GO

CREATE FUNCTION dbo.fn_GetFirstName
(
    @Full Name VARCHAR(100)
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FirstName VARCHAR(100);

    SET @FirstName = CASE 
        WHEN CHARINDEX(' ', LTRIM(@FullName)) > 0 
        THEN SUBSTRING(LTRIM(@FullName), 1, CHARINDEX(' ', LTRIM(@FullName)) - 1)
        ELSE LTRIM(@FullName)
    END;

    RETURN @FirstName;
END;
GO