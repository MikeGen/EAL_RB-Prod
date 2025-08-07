CREATE TABLE [stage].[Stage_AccountNote] (
    [ID]             INT            NOT NULL,
    [Subject]        NVARCHAR (300) NOT NULL,
    [HTMLText]       NVARCHAR (MAX) NULL,
    [RawText]        NVARCHAR (MAX) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [AccountID]      INT            NOT NULL
);


GO

