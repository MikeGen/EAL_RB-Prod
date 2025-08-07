CREATE TABLE [dl].[FactUserTeam] (
    [UserTeamID]            INT      NOT NULL,
    [UserID]                INT      NOT NULL,
    [TeamID]                INT      NOT NULL,
    [UserTeamIsMember]      BIT      NOT NULL,
    [UserTeamCreatedDate]   DATETIME NOT NULL,
    [UserTeamCreatedUserID] INT      NOT NULL,
    [UserTeamDeletedDate]   DATETIME NULL,
    [UserTeamDeletedUserID] INT      NULL,
    CONSTRAINT [PK_dl_FactUserTeam] PRIMARY KEY CLUSTERED ([UserTeamID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactUserTeam_UserID]
    ON [dl].[FactUserTeam]([UserID] ASC)
    INCLUDE([TeamID], [UserTeamDeletedDate]);


GO

