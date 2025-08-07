CREATE TABLE [dl].[FactTeamReferrer] (
    [TeamReferrerId]            INT           NOT NULL,
    [TeamId]                    INT           NOT NULL,
    [ReferrerId]                INT           NOT NULL,
    [TeamReferrerCreatedDate]   DATETIME2 (7) NOT NULL,
    [TeamReferrerCreatedUserId] INT           NOT NULL,
    CONSTRAINT [PK_dl_FactTeamReferrer] PRIMARY KEY CLUSTERED ([TeamReferrerId] ASC)
);


GO

