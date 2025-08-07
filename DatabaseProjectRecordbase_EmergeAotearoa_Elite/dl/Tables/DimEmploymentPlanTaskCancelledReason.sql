CREATE TABLE [dl].[DimEmploymentPlanTaskCancelledReason] (
    [EmploymentPlanTaskCancelledReasonID]       INT            NOT NULL,
    [EmploymentPlanTaskCancelledReasonValue]    NVARCHAR (200) NOT NULL,
    [EmploymentPlanTaskCancelledReasonText]     NVARCHAR (200) NOT NULL,
    [EmploymentPlanTaskCancelledReasonParentId] INT            NULL,
    [EmploymentPlanTaskCancelledReasonIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEmploymentPlanTaskCancelledReason] PRIMARY KEY CLUSTERED ([EmploymentPlanTaskCancelledReasonID] ASC)
);


GO

