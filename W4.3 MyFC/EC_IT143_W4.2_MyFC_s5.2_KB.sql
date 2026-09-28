DROP TABLE IF EXISTS dbo.t_MyFC_PlayerCount;
GO

CREATE TABLE dbo.t_MyFC_PlayerCount
(
    TeamID       INT NOT NULL,
    TotalPlayers INT NOT NULL,
    CONSTRAINT PK_t_MyFC_PlayerCount PRIMARY KEY CLUSTERED (TeamID ASC)
);
GO