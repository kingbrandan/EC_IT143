DROP TABLE IF EXISTS dbo.t_Simpsons_FamilySpend;
GO

SELECT v.*
INTO dbo.t_Simpsons_FamilySpend
FROM dbo.v_Simpsons_FamilySpend AS v;
GO