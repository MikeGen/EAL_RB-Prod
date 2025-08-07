CREATE TABLE [stage].[Stage_EmploymentPlanOutcomeJobHours] (
    [ID]                         INT      NOT NULL,
    [EmploymentPlanOutcomeJobID] INT      NOT NULL,
    [Rate]                       REAL     NOT NULL,
    [EffectiveDate]              DATETIME NOT NULL,
    [CreatedDate]                DATETIME NOT NULL,
    [CreatedUserID]              INT      NOT NULL,
    [ModifiedDate]               DATETIME NULL,
    [ModifiedUserID]             INT      NULL,
    [DeletedDate]                DATETIME NULL,
    [DeletedUserID]              INT      NULL
);


GO

