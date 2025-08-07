CREATE TABLE [dl].[FactEmploymentPlanTask] (
    [EmploymentPlanTaskID]                     INT            NOT NULL,
    [EmploymentPlanID]                         INT            NOT NULL,
    [EmploymentPlanPhaseID]                    INT            NULL,
    [EmploymentPlanTaskStatusID]               INT            NOT NULL,
    [StatusUserID]                             INT            NOT NULL,
    [EmploymentPlanTaskStatusDate]             DATETIME       NOT NULL,
    [EmploymentPlanTaskStatusComment]          NVARCHAR (500) NULL,
    [CancelledReasonID]                        INT            NULL,
    [EmploymentPlanTaskExpectedCompletionDays] INT            NULL,
    [EmploymentPlanTaskName]                   NVARCHAR (300) NOT NULL,
    [EmploymentPlanTaskDescription]            NVARCHAR (MAX) NULL,
    [EmploymentPlanTaskRelatedURL]             NVARCHAR (500) NULL,
    [EmploymentPlanTaskDueDate]                DATETIME       NULL,
    [EmploymentPlanTaskIsMandatory]            BIT            NULL,
    [EmploymentPlanTemplateTaskID]             INT            NULL,
    [EmploymentPlanTaskCreatedDate]            DATETIME       NOT NULL,
    [EmploymentPlanTaskCreatedUserID]          INT            NOT NULL,
    [EmploymentPlanTaskTaskType]               NVARCHAR (30)  NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanTask] PRIMARY KEY CLUSTERED ([EmploymentPlanTaskID] ASC)
);


GO

