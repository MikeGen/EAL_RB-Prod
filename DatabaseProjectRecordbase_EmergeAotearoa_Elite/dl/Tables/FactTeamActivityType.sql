CREATE TABLE [dl].[FactTeamActivityType] (
    [TeamActivityTypeID]            INT      NOT NULL,
    [ActivityTypeID]                INT      NOT NULL,
    [TeamID]                        INT      NOT NULL,
    [TeamActivityTypeCreatedUserID] INT      NOT NULL,
    [TeamActivityTypeCreatedDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_dl_FactTeamActivityType] PRIMARY KEY CLUSTERED ([TeamActivityTypeID] ASC)
);


GO

