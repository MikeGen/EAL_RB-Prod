CREATE TABLE [stage].[Stage_UserTeam] (
    [ID]             INT      NOT NULL,
    [UserID]         INT      NOT NULL,
    [TeamID]         INT      NOT NULL,
    [IsMember]       BIT      NOT NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserID]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserID] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserID]  INT      NULL
);


GO

