TRUNCATE TABLE dbo.t_Simpsons_FamilySpend;

INSERT INTO dbo.t_Simpsons_FamilySpend
    SELECT v.Member_ID, v.Name, v.TotalTransactionAmount
    FROM dbo.v_Simpsons_FamilySpend AS v;

-- Review results
SELECT t.*
FROM dbo.t_Simpsons_FamilySpend AS t;