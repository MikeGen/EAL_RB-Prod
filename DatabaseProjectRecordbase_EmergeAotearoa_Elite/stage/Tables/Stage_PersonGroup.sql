CREATE TABLE [stage].[Stage_PersonGroup] (
    [Id]             INT            NOT NULL,
    [Name]           NVARCHAR (256) NOT NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL,
    [DeletedUserID]  INT            NULL
);


GO

