DROP PROCEDURE IF EXISTS dbo.usp_Load_Simpsons_FamilySpend;
GO

CREATE PROCEDURE dbo.usp_Load_Simpsons_FamilySpend
AS

/***************************************************************************************************
NAME:    dbo.usp_Load_Simpsons_FamilySpend
PURPOSE: Load the Simpsons Family Spend summary table from the view

MODIFICATION LOG:
Ver      Date        Author       Description
-------  ----------  -----------  ------------------------------------------------------------------
1.0      09/28/2026  YourInitials 1. Built this script for EC IT143 W4.2

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
***************************************************************************************************/

BEGIN

    -- 1) Reload data from view
    TRUNCATE TABLE dbo.t_Simpsons_FamilySpend;

    INSERT INTO dbo.t_Simpsons_FamilySpend
        SELECT v.Member_ID, v.Name, v.TotalTransactionAmount
        FROM dbo.v_Simpsons_FamilySpend AS v;

    -- 2) Display loaded data
    SELECT t.*
    FROM dbo.t_Simpsons_FamilySpend AS t;

END;
GO