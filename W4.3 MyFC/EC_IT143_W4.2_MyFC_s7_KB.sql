DROP PROCEDURE IF EXISTS dbo.usp_Load_MyFC_PlayerCount;
GO

CREATE PROCEDURE dbo.usp_Load_MyFC_PlayerCount
AS

/***************************************************************************************************
NAME:    dbo.usp_Load_MyFC_PlayerCount
PURPOSE: Load the MyFC Player Count table from the view

MODIFICATION LOG:
Ver      Date        Author       Description
-------  ----------  -----------  ------------------------------------------------------------------
1.0      09/28/2026  KB.MTHIMUNYE 1. Built this script for EC IT143

NOTES: 
This script exists to help me learn step 7 of 8 in the Answer Focused Approach for T-SQL Data Manipulation
***************************************************************************************************/

BEGIN

    -- 1) Reload data
    TRUNCATE TABLE dbo.t_MyFC_PlayerCount;

    INSERT INTO dbo.t_MyFC_PlayerCount
        SELECT v.TeamID, v.TotalPlayers
          FROM dbo.v_MyFC_PlayerCount AS v;


    -- 2) Review results
    SELECT t.*
      FROM dbo.t_MyFC_PlayerCount AS t;

END;
GO