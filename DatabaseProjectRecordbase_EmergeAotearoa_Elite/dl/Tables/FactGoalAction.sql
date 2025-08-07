CREATE TABLE [dl].[FactGoalAction] (
    [GoalActionID]                INT            NOT NULL,
    [GoalID]                      INT            NOT NULL,
    [GoalActionDescription]       NVARCHAR (MAX) NOT NULL,
    [GoalActionDueDate]           DATETIME       NULL,
    [GoalActionCompletedDate]     DATETIME       NULL,
    [CompletedUserID]             INT            NULL,
    [GoalActionStatusID]          INT            NULL,
    [GoalActionComments]          NVARCHAR (MAX) NULL,
    [GoalActionCreatedUserID]     INT            NOT NULL,
    [GoalActionCreatedDate]       DATETIME       NOT NULL,
    [GoalActionUserCompletedDate] DATETIME2 (7)  NULL,
    [PriorityOutcomeId]           INT            NULL,
    CONSTRAINT [PK_dl_FactGoalAction] PRIMARY KEY CLUSTERED ([GoalActionID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [<GoalAction>]
    ON [dl].[FactGoalAction]([GoalID] ASC)
    INCLUDE([GoalActionDueDate]);


GO

