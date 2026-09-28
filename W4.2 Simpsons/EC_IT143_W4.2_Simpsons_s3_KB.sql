SELECT 
    f.Member_ID,
    f.Name,
    SUM(v.debit) AS TotalTransactionAmount
FROM dbo.Family_Data AS f
INNER JOIN dbo.FBS_Viza_Costmo AS v
    ON f.Member_ID = v.Member_Name
GROUP BY 
    f.Member_ID, 
    f.Name;