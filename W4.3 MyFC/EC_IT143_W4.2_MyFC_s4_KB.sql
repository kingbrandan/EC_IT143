DROP VIEW IF EXISTS dbo.v_MyFC_PlayerCount;
GO

CREATE VIEW dbo.v_MyFC_PlayerCount
AS

/***************************************************************************************************
NAME:    dbo.v_MyFC_PlayerCount
PURPOSE: Create the MyFC player count view

MODIFICATION LOG:
Ver      Date        Author       Description
-------  ----------  -----------  ------------------------------------------------------------------
1.0      09/28/2026  YourInitials 1. Built this script for EC IT143

NOTES: 
This script exists to help me learn step 4 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
***************************************************************************************************/

    SELECT pl_team_id AS TeamID, COUNT(pl_id) AS TotalPlayers
    FROM dbo.tblPlayerDim
    GROUP BY pl_team_id;