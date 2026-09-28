DROP TABLE IF EXISTS dbo.t_Simpsons_FamilySpend;
GO

CREATE TABLE dbo.t_Simpsons_FamilySpend
(
    Family_ID              INT            NOT NULL,
    Family_Name            VARCHAR(100)   NOT NULL,
    TotalTransactionAmount DECIMAL(18, 2) NOT NULL,
    CONSTRAINT PK_t_Simpsons_FamilySpend PRIMARY KEY CLUSTERED (Family_ID ASC)
);
GO