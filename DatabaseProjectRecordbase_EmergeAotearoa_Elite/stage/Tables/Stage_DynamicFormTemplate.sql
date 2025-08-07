CREATE TABLE [stage].[Stage_DynamicFormTemplate] (
    [ID]              INT            NOT NULL,
    [Definition]      NVARCHAR (MAX) NOT NULL,
    [ChangeNotes]     NVARCHAR (MAX) NULL,
    [PublishedDate]   DATETIME       NULL,
    [PublishedUserId] INT            NULL,
    [IsActive]        BIT            NOT NULL,
    [DynamicFormID]   INT            NOT NULL,
    [CreatedDate]     DATETIME       NOT NULL,
    [CreatedUserID]   INT            NOT NULL,
    [ModifiedDate]    DATETIME       NULL,
    [ModifiedUserID]  INT            NULL,
    [DeletedDate]     DATETIME       NULL,
    [DeletedUserID]   INT            NULL
);


GO

