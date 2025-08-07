CREATE TABLE [dl].[FactTeamGroupActivityBreakdownType] (
    [TeamGroupActivityBreakdownTypeID]            INT            NOT NULL,
    [ActivityBreakdownTypeID]                     INT            NOT NULL,
    [TeamGroupActivityBreakdownTypeNameOverride]  NVARCHAR (MAX) NULL,
    [TeamID]                                      INT            NOT NULL,
    [TeamGroupActivityBreakdownTypeCreatedDate]   DATETIME       NOT NULL,
    [TeamGroupActivityBreakdownTypeCreatedUserID] INT            NOT NULL,
    [OrderId]                                     INT            NOT NULL,
    CONSTRAINT [PK_dl_FactTeamGroupActivityBreakdownType] PRIMARY KEY CLUSTERED ([TeamGroupActivityBreakdownTypeID] ASC)
);


GO

