CREATE TABLE [dl].[FactGoalLookupStatus] (
    [GoalLookupStatusId]            INT            NOT NULL,
    [GoalId]                        INT            NOT NULL,
    [StatusId]                      INT            NOT NULL,
    [GoalLookupStatusStartDate]     DATETIME2 (7)  NOT NULL,
    [GoalLookupStatusComment]       NVARCHAR (MAX) NULL,
    [GoalLookupStatusCreatedUserId] INT            NOT NULL,
    [GoalLookupStatusCreatedDate]   DATETIME2 (7)  NOT NULL,
    CONSTRAINT [PK_dl_FactGoalLookupStatus] PRIMARY KEY CLUSTERED ([GoalLookupStatusId] ASC)
);


GO

