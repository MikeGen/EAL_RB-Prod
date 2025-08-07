CREATE TABLE [stage].[Stage_GoalActionOwner] (
    [ID]             INT           NOT NULL,
    [GoalActionID]   INT           NOT NULL,
    [EntityType]     NVARCHAR (50) NULL,
    [EntityID]       INT           NULL,
    [Name]           NVARCHAR (50) NULL,
    [CreatedDate]    DATETIME      NOT NULL,
    [CreatedUserID]  INT           NOT NULL,
    [ModifiedDate]   DATETIME      NULL,
    [ModifiedUserID] INT           NULL,
    [DeletedDate]    DATETIME      NULL,
    [DeletedUserID]  INT           NULL
);


GO

