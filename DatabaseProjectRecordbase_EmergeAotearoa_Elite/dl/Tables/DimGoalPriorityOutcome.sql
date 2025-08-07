CREATE TABLE [dl].[DimGoalPriorityOutcome] (
    [GoalPriorityOutcomeID]       INT            NOT NULL,
    [GoalPriorityOutcomeValue]    NVARCHAR (200) NOT NULL,
    [GoalPriorityOutcomeText]     NVARCHAR (200) NOT NULL,
    [GoalPriorityOutcomeParentId] INT            NULL,
    [GoalPriorityOutcomeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimGoalPriorityOutcome] PRIMARY KEY CLUSTERED ([GoalPriorityOutcomeID] ASC)
);


GO

