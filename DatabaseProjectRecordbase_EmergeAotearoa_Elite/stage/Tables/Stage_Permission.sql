CREATE TABLE [stage].[Stage_Permission] (
    [ID]             INT            NOT NULL,
    [RoleID]         INT            NOT NULL,
    [AspNetRole]     NVARCHAR (100) NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL
);


GO

