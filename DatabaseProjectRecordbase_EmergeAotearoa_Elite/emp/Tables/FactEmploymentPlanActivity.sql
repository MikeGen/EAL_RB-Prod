CREATE TABLE [emp].[FactEmploymentPlanActivity] (
    [ID]                 INT IDENTITY (1, 1) NOT NULL,
    [ActivityID]         INT NOT NULL,
    [EmploymentPlanID]   INT NOT NULL,
    [IsBeforeOutcomeJob] BIT NOT NULL,
    [IsAfterOutcomeJob]  BIT NOT NULL
);


GO

