DROP VIEW IF EXISTS dbo.v_Simpsons_FamilySpend;
GO

CREATE VIEW dbo.v_Simpsons_FamilySpend
AS

/***************************************************************************************************
NAME:    dbo.v_Simpsons_FamilySpend
PURPOSE: Create the Simpsons family total transaction amount view

MODIFICATION LOG:
Ver      Date        Author       Description
-------  ----------  -----------  ------------------------------------------------------------------
1.0      09/28/2026  YourInitials 1. Built this script for EC IT143 W4.2

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
***************************************************************************************************/

    SELECT 
        f.Member_ID,
        f.Name,
        SUM(v.Debit) AS TotalTransactionAmount
    FROM dbo.Family_Data AS f
    INNER JOIN dbo.FBS_Viza_Costmo AS v
        ON f.Member_ID = v.Member_Name
    GROUP BY 
        f.Member_ID,
        f.Name;
GO