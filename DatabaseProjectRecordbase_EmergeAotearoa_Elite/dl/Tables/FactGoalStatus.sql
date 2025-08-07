CREATE TABLE [dl].[FactGoalStatus] (
    [GoalStatusID]                 INT            NOT NULL,
    [GoalID]                       INT            NOT NULL,
    [GoalStatusPercentageComplete] INT            NOT NULL,
    [GoalStatusComments]           NVARCHAR (MAX) NULL,
    [GoalStatusCreatedUserID]      INT            NOT NULL,
    [GoalStatusCreatedDate]        DATETIME       NOT NULL,
    [GoalStatusProgressDate]       DATETIME       NOT NULL,
    CONSTRAINT [PK_dl_FactGoalStatus] PRIMARY KEY CLUSTERED ([GoalStatusID] ASC)
);


GO

