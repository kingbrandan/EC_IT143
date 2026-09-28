SELECT pl_id AS TeamID, COUNT(pl_id) AS TotalPlayers
FROM dbo.tblPlayerDim
GROUP BY pl_id;