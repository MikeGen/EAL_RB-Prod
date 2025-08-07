CREATE TABLE [dl].[FactTeamGroupActivityClassification] (
    [TeamGroupActivityClassificationID]            INT            NOT NULL,
    [ActivityClassificationID]                     INT            NOT NULL,
    [TeamGroupActivityClassificationNameOverride]  NVARCHAR (MAX) NULL,
    [TeamID]                                       INT            NOT NULL,
    [TeamGroupActivityClassificationCreatedDate]   DATETIME       NOT NULL,
    [TeamGroupActivityClassificationCreatedUserID] INT            NOT NULL,
    [OrderId]                                      INT            NOT NULL,
    CONSTRAINT [PK_dl_FactTeamGroupActivityClassification] PRIMARY KEY CLUSTERED ([TeamGroupActivityClassificationID] ASC)
);


GO

