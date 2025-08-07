CREATE TABLE [dl].[DimInjuryServiceUnitTeam] (
    [InjuryServiceUnitTeamId] INT NOT NULL,
    [InjuryServiceUnitId]     INT NOT NULL,
    [TeamId]                  INT NOT NULL,
    CONSTRAINT [PK_dl_DimInjuryServiceUnitTeam] PRIMARY KEY CLUSTERED ([InjuryServiceUnitTeamId] ASC)
);


GO

