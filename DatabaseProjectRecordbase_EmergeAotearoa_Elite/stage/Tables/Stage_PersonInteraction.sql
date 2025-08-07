CREATE TABLE [stage].[Stage_PersonInteraction] (
    [Id]                      INT            NOT NULL,
    [PersonId]                INT            NOT NULL,
    [PersonInteractionTypeId] INT            NOT NULL,
    [Occurred]                DATETIME2 (7)  NOT NULL,
    [Comments]                NVARCHAR (MAX) NULL,
    [CommentsHtml]            NVARCHAR (MAX) NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [CreatedUserID]           INT            NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [ModifiedUserID]          INT            NULL,
    [DeletedDate]             DATETIME       NULL,
    [DeletedUserID]           INT            NULL
);


GO

