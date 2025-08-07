CREATE TABLE [dl].[FactGoalActionOwner] (
    [GoalActionOwnerID]            INT           NOT NULL,
    [GoalActionID]                 INT           NOT NULL,
    [GoalActionOwnerEntityType]    NVARCHAR (50) NULL,
    [EntityID]                     INT           NULL,
    [GoalActionOwnerName]          NVARCHAR (50) NULL,
    [GoalActionOwnerCreatedDate]   DATETIME      NOT NULL,
    [GoalActionOwnerCreatedUserID] INT           NOT NULL,
    CONSTRAINT [PK_dl_FactGoalActionOwner] PRIMARY KEY CLUSTERED ([GoalActionOwnerID] ASC)
);


GO

