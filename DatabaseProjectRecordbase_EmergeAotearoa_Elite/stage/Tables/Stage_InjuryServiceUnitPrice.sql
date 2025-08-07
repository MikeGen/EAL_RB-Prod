CREATE TABLE [stage].[Stage_InjuryServiceUnitPrice] (
    [Id]                  INT            NOT NULL,
    [InjuryServiceUnitId] INT            NOT NULL,
    [PricePerUnit]        DECIMAL (8, 2) NOT NULL,
    [StartDate]           DATETIME2 (7)  NOT NULL,
    [EndDate]             DATETIME2 (7)  NULL
);


GO

