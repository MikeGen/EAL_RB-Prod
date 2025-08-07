CREATE TABLE [dl].[FactEmploymentPlanOutcomeJob] (
    [EmploymentPlanOutcomeJobID]   INT            NOT NULL,
    [EmploymentPlanOutcomeJobUDF1] NVARCHAR (MAX) NULL,
    [EmploymentPlanOutcomeJobUDF2] NVARCHAR (MAX) NULL,
    [EmploymentPlanOutcomeJobUDF3] NVARCHAR (MAX) NULL,
    [EmploymentPlanOutcomeJobUDF4] NVARCHAR (MAX) NULL,
    [EmploymentPlanOutcomeJobUDF5] NVARCHAR (MAX) NULL,
    [EmploymentPlanID]             INT            NOT NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanOutcomeJob] PRIMARY KEY CLUSTERED ([EmploymentPlanOutcomeJobID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanOutcomeJob_JobId]
    ON [dl].[FactEmploymentPlanOutcomeJob]([EmploymentPlanOutcomeJobID] ASC);


GO

