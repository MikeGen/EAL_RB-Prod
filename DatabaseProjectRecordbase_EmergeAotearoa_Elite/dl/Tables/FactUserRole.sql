CREATE TABLE [dl].[FactUserRole] (
    [UserRoleID]            INT      NOT NULL,
    [UserID]                INT      NOT NULL,
    [RoleID]                INT      NOT NULL,
    [UserRoleCreatedDate]   DATETIME NOT NULL,
    [UserRoleCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactUserRole] PRIMARY KEY CLUSTERED ([UserRoleID] ASC)
);


GO

