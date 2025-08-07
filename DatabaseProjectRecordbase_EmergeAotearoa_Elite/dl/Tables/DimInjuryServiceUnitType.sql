CREATE TABLE [dl].[DimInjuryServiceUnitType] (
    [InjuryServiceUnitTypeId]            INT           NOT NULL,
    [InjuryServiceUnitTypeName]          NVARCHAR (50) NOT NULL,
    [InjuryServiceUnitTypeDecimalPlaces] INT           NOT NULL,
    CONSTRAINT [PK_dl_DimInjuryServiceUnitType] PRIMARY KEY CLUSTERED ([InjuryServiceUnitTypeId] ASC)
);


GO

