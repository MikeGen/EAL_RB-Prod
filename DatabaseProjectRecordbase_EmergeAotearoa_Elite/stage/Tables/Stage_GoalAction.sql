CREATE TABLE [stage].[Stage_GoalAction] (
    [ID]                 INT            NOT NULL,
    [GoalID]             INT            NOT NULL,
    [Description]        NVARCHAR (MAX) NOT NULL,
    [DueDate]            DATETIME       NULL,
    [CompletedDate]      DATETIME       NULL,
    [CompletedUserID]    INT            NULL,
    [GoalActionStatusID] INT            NULL,
    [Comments]           NVARCHAR (MAX) NULL,
    [CreatedUserID]      INT            NOT NULL,
    [CreatedDate]        DATETIME       NOT NULL,
    [ModifiedUserID]     INT            NULL,
    [ModifiedDate]       DATETIME       NULL,
    [DeletedUserID]      INT            NULL,
    [DeletedDate]        DATETIME       NULL,
    [UserCompletedDate]  DATETIME2 (7)  NULL,
    [PriorityOutcomeId]  INT            NULL
);


GO

