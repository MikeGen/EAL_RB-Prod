CREATE TABLE [stage].[Stage_PresentingIssue] (
    [ID]             INT            NOT NULL,
    [Code]           NVARCHAR (50)  NOT NULL,
    [Name]           NVARCHAR (150) NOT NULL,
    [Description]    NVARCHAR (255) NULL,
    [ParentId]       INT            NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL,
    [DeletedUserID]  INT            NULL
);


GO

