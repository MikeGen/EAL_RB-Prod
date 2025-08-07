CREATE TABLE [dl].[FactTeamActivityClassification] (
    [TeamActivityClassificationID]            INT      NOT NULL,
    [ActivityClassificationID]                INT      NOT NULL,
    [TeamID]                                  INT      NOT NULL,
    [TeamActivityClassificationCreatedUserID] INT      NOT NULL,
    [TeamActivityClassificationCreatedDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_dl_FactTeamActivityClassification] PRIMARY KEY CLUSTERED ([TeamActivityClassificationID] ASC)
);


GO

