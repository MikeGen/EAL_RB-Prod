CREATE TABLE [dl].[FactEmploymentPlanOutcomeJobHours] (
    [EmploymentPlanOutcomeJobHoursID]            INT      NOT NULL,
    [EmploymentPlanOutcomeJobID]                 INT      NOT NULL,
    [EmploymentPlanOutcomeJobHoursRate]          REAL     NOT NULL,
    [EmploymentPlanOutcomeJobHoursEffectiveDate] DATETIME NOT NULL,
    [EmploymentPlanOutcomeJobHoursCreatedDate]   DATETIME NOT NULL,
    [EmploymentPlanOutcomeJobHoursCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactEmploymentPlanOutcomeJobHours] PRIMARY KEY CLUSTERED ([EmploymentPlanOutcomeJobHoursID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanOutcomeJobHours_OutcomeJobId]
    ON [dl].[FactEmploymentPlanOutcomeJobHours]([EmploymentPlanOutcomeJobID] ASC);


GO

