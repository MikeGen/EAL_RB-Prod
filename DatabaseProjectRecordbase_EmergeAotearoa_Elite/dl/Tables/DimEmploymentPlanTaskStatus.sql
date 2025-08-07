CREATE TABLE [dl].[DimEmploymentPlanTaskStatus] (
    [EmploymentPlanTaskStatusID]                   INT            NOT NULL,
    [EmploymentPlanTaskStatusName]                 NVARCHAR (100) NOT NULL,
    [EmploymentPlanTaskStatusClosedFlag]           BIT            NOT NULL,
    [EmploymentPlanTaskStatusNotToBeCompletedFlag] BIT            NOT NULL,
    [EmploymentPlanTaskStatusSystemUseOnlyFlag]    BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimEmploymentPlanTaskStatus] PRIMARY KEY CLUSTERED ([EmploymentPlanTaskStatusID] ASC)
);


GO

