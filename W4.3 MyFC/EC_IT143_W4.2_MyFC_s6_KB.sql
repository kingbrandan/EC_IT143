TRUNCATE TABLE dbo.t_MyFC_PlayerCount;
INSERT INTO dbo.t_MyFC_PlayerCount SELECT * FROM dbo.v_MyFC_PlayerCount;