CREATE TABLE [stage].[Stage_PersonInteractionType] (
    [Id]             INT            NOT NULL,
    [Code]           NVARCHAR (MAX) NOT NULL,
    [Name]           NVARCHAR (MAX) NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [ParentId]       INT            NULL
);


GO

