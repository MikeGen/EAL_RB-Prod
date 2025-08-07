CREATE TABLE [dl].[FactPersonInteraction] (
    [PersonInteractionId]            INT            NOT NULL,
    [PersonId]                       INT            NOT NULL,
    [PersonInteractionTypeId]        INT            NOT NULL,
    [PersonInteractionOccurred]      DATETIME2 (7)  NOT NULL,
    [PersonInteractionComments]      NVARCHAR (MAX) NULL,
    [PersonInteractionCommentsHtml]  NVARCHAR (MAX) NULL,
    [PersonInteractionCreatedDate]   DATETIME       NOT NULL,
    [PersonInteractionCreatedUserID] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactPersonInteraction] PRIMARY KEY CLUSTERED ([PersonInteractionId] ASC)
);


GO

