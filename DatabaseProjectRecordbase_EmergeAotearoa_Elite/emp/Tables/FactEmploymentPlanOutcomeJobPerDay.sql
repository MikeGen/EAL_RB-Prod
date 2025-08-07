CREATE TABLE [emp].[FactEmploymentPlanOutcomeJobPerDay] (
    [ID]                       INT      NOT NULL,
    [VocationID]               INT      NOT NULL,
    [EmploymentPlanID]         INT      NOT NULL,
    [ClientID]                 INT      NOT NULL,
    [DateKey]                  INT      NOT NULL,
    [ActualDate]               DATETIME NOT NULL,
    [PayRatePerHour]           REAL     NULL,
    [DaysInJob]                INT      NULL,
    [JobHours]                 REAL     NULL,
    [EmploymentPlanClosed]     BIT      NULL,
    [JobHoursPreviousDayDelta] REAL     NULL
);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanOutcomeJobPerDay_EmploymentPlanID_DateKey]
    ON [emp].[FactEmploymentPlanOutcomeJobPerDay]([EmploymentPlanID] ASC, [DateKey] ASC)
    INCLUDE([DaysInJob], [JobHours]) WITH (FILLFACTOR = 100);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanOutcomoeJobPerDay_EmploymentPlanID]
    ON [emp].[FactEmploymentPlanOutcomeJobPerDay]([EmploymentPlanID] ASC)
    INCLUDE([DateKey], [DaysInJob], [JobHours]) WITH (FILLFACTOR = 100);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanOutcomeJobPerDay_EmploymentPlanID_ActualDate]
    ON [emp].[FactEmploymentPlanOutcomeJobPerDay]([EmploymentPlanID] ASC, [ActualDate] ASC)
    INCLUDE([JobHours]) WITH (FILLFACTOR = 100);


GO

