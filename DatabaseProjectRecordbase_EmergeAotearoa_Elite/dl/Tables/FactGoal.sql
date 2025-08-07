CREATE TABLE [dl].[FactGoal] (
    [GoalID]                    INT            NOT NULL,
    [GoalTitle]                 NVARCHAR (200) NOT NULL,
    [GoalRawDescription]        NVARCHAR (MAX) NULL,
    [GoalHTMLDescription]       NVARCHAR (MAX) NULL,
    [GoalStartDate]             DATETIME       NOT NULL,
    [GoalDueDate]               DATETIME       NULL,
    [OldGoalID]                 INT            NULL,
    [PersonID]                  INT            NOT NULL,
    [GoalRawComments]           NVARCHAR (MAX) NULL,
    [GoalHTMLComments]          NVARCHAR (MAX) NULL,
    [InactiveGoalReasonID]      INT            NULL,
    [GoalCreatedDate]           DATETIME       NOT NULL,
    [GoalCreatedUserID]         INT            NOT NULL,
    [ReferralID]                INT            NULL,
    [PersonalPlanID]            INT            NULL,
    [GoalCloseCompletedDate]    DATETIME       NULL,
    [GoalCloseNotCompletedDate] DATETIME       NULL,
    [GoalCloseComments]         NVARCHAR (MAX) NULL,
    [CategoryID]                INT            NULL,
    [PriorityOutcome1Id]        INT            NULL,
    [PriorityOutcome2Id]        INT            NULL,
    [PriorityOutcome3Id]        INT            NULL,
    CONSTRAINT [PK_dl_FactGoal] PRIMARY KEY CLUSTERED ([GoalID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [<Goal>]
    ON [dl].[FactGoal]([PersonID] ASC, [GoalCloseCompletedDate] ASC, [GoalCloseNotCompletedDate] ASC)
    INCLUDE([ReferralID]);


GO

