CREATE TABLE [dl].[DimEmploymentPlanTaskCancelledRea] (
    [EmploymentPlanTaskCancelledReaID]       INT            NOT NULL,
    [EmploymentPlanTaskCancelledReaValue]    NVARCHAR (200) NOT NULL,
    [EmploymentPlanTaskCancelledReaText]     NVARCHAR (200) NOT NULL,
    [EmploymentPlanTaskCancelledReaParentId] INT            NULL,
    [EmploymentPlanTaskCancelledReaIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEmploymentPlanTaskCancelledRea] PRIMARY KEY CLUSTERED ([EmploymentPlanTaskCancelledReaID] ASC)
);


GO

