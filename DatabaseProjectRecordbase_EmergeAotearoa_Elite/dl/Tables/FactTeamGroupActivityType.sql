CREATE TABLE [dl].[FactTeamGroupActivityType] (
    [TeamGroupActivityTypeID]            INT            NOT NULL,
    [ActivityTypeID]                     INT            NOT NULL,
    [TeamGroupActivityTypeNameOverride]  NVARCHAR (MAX) NULL,
    [TeamID]                             INT            NOT NULL,
    [TeamGroupActivityTypeCreatedDate]   DATETIME       NOT NULL,
    [TeamGroupActivityTypeCreatedUserID] INT            NOT NULL,
    [OrderId]                            INT            NOT NULL,
    CONSTRAINT [PK_dl_FactTeamGroupActivityType] PRIMARY KEY CLUSTERED ([TeamGroupActivityTypeID] ASC)
);


GO

