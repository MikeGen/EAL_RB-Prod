CREATE TABLE [dl].[DimGoalActionStatus] (
    [GoalActionStatusID]                INT            NOT NULL,
    [GoalActionStatusCode]              NVARCHAR (30)  NOT NULL,
    [GoalActionStatusText]              NVARCHAR (50)  NOT NULL,
    [GoalActionStatusDescription]       NVARCHAR (300) NULL,
    [GoalActionStatusIsCompletedStatus] BIT            NOT NULL,
    [GoalActionStatusIsCancelledStatus] BIT            NOT NULL,
    [GoalActionStatusSortIndex]         INT            NOT NULL,
    CONSTRAINT [PK_dl_DimGoalActionStatus] PRIMARY KEY CLUSTERED ([GoalActionStatusID] ASC)
);


GO

