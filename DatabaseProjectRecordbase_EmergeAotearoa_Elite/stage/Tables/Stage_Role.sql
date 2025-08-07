CREATE TABLE [stage].[Stage_Role] (
    [ID]             INT            NOT NULL,
    [Name]           VARCHAR (50)   NULL,
    [Description]    NVARCHAR (200) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL
);


GO

