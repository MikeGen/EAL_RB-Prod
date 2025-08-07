CREATE TABLE [stage].[Stage_UserRole] (
    [ID]             INT      NOT NULL,
    [UserID]         INT      NOT NULL,
    [RoleID]         INT      NOT NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserID]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserID] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserID]  INT      NULL
);


GO

