CREATE TABLE [dl].[DimInjuryServiceUnitPrice] (
    [InjuryServiceUnitPriceId]           INT            NOT NULL,
    [InjuryServiceUnitId]                INT            NOT NULL,
    [InjuryServiceUnitPricePricePerUnit] DECIMAL (8, 2) NOT NULL,
    [InjuryServiceUnitPriceStartDate]    DATETIME2 (7)  NOT NULL,
    [InjuryServiceUnitPriceEndDate]      DATETIME2 (7)  NULL,
    CONSTRAINT [PK_dl_DimInjuryServiceUnitPrice] PRIMARY KEY CLUSTERED ([InjuryServiceUnitPriceId] ASC)
);


GO

