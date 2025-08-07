CREATE TABLE [stage].[Stage_EmploymentPlanTask] (
    [ID]                           INT            NOT NULL,
    [EmploymentPlanID]             INT            NOT NULL,
    [EmploymentPlanPhaseID]        INT            NULL,
    [EmploymentPlanTaskStatusID]   INT            NOT NULL,
    [StatusUserID]                 INT            NOT NULL,
    [StatusDate]                   DATETIME       NOT NULL,
    [StatusComment]                NVARCHAR (500) NULL,
    [CancelledReasonID]            INT            NULL,
    [ExpectedCompletionDays]       INT            NULL,
    [Name]                         NVARCHAR (300) NOT NULL,
    [Description]                  NVARCHAR (MAX) NULL,
    [RelatedURL]                   NVARCHAR (500) NULL,
    [DueDate]                      DATETIME       NULL,
    [IsMandatory]                  BIT            NULL,
    [EmploymentPlanTemplateTaskID] INT            NULL,
    [CreatedDate]                  DATETIME       NOT NULL,
    [CreatedUserID]                INT            NOT NULL,
    [ModifiedDate]                 DATETIME       NULL,
    [ModifiedUserID]               INT            NULL,
    [DeletedDate]                  DATETIME       NULL,
    [DeletedUserID]                INT            NULL,
    [TaskType]                     NVARCHAR (30)  NULL
);


GO

