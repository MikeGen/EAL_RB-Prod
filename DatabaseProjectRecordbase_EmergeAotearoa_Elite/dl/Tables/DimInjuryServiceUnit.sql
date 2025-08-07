CREATE TABLE [dl].[DimInjuryServiceUnit] (
    [InjuryServiceUnitId]     INT            NOT NULL,
    [InjuryServiceUnitName]   NVARCHAR (100) NOT NULL,
    [InjuryServiceUnitCode]   NVARCHAR (50)  NOT NULL,
    [InjuryServiceUnitTypeId] INT            NOT NULL,
    CONSTRAINT [PK_dl_DimInjuryServiceUnit] PRIMARY KEY CLUSTERED ([InjuryServiceUnitId] ASC)
);


GO

