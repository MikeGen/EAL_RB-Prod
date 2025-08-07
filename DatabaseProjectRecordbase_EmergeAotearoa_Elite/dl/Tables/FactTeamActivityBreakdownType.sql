CREATE TABLE [dl].[FactTeamActivityBreakdownType] (
    [TeamActivityBreakdownTypeID]            INT      NOT NULL,
    [ActivityBreakdownTypeID]                INT      NOT NULL,
    [TeamID]                                 INT      NOT NULL,
    [TeamActivityBreakdownTypeCreatedUserID] INT      NOT NULL,
    [TeamActivityBreakdownTypeCreatedDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_dl_FactTeamActivityBreakdownType] PRIMARY KEY CLUSTERED ([TeamActivityBreakdownTypeID] ASC)
);


GO

