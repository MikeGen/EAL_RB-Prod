CREATE TABLE [emp].[FactEmploymentPlanTask] (
    [EmploymentPlanTaskID]       INT            NOT NULL,
    [EmploymentPlanID]           INT            NOT NULL,
    [EmploymentPlanPhaseID]      INT            NULL,
    [EmploymentPlanTaskStatusID] INT            NOT NULL,
    [TaskCancelledReasonID]      INT            NULL,
    [TaskStartDateKey]           INT            NOT NULL,
    [TaskStartDate]              DATETIME       NOT NULL,
    [DueDate]                    DATETIME       NULL,
    [ClosedDate]                 DATETIME       NULL,
    [ExpectedCompletionDays]     INT            NULL,
    [ActualCompletionDays]       INT            NULL,
    [IsMandatory]                BIT            NOT NULL,
    [CreatedDate]                DATETIME       NULL,
    [CreatedUserID]              INT            NULL,
    [StatusDate]                 DATETIME       NULL,
    [TaskName]                   NVARCHAR (MAX) NULL
);


GO

