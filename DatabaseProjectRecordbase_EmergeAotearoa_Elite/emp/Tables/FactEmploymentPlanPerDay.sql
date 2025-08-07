CREATE TABLE [emp].[FactEmploymentPlanPerDay] (
    [PhasePerDayKey]       INT      NOT NULL,
    [DateKey]              INT      NOT NULL,
    [EmploymentPlanID]     INT      NOT NULL,
    [StartDate]            DATETIME NOT NULL,
    [PhaseID]              INT      NOT NULL,
    [DaysInPhase]          INT      NOT NULL,
    [PhaseOvertimeDays]    INT      NULL,
    [TotalActivityHours]   INT      NULL,
    [LastActivityDate]     DATETIME NULL,
    [OutstandingTaskCount] INT      NULL
);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanPerDay_DateKey_PhaseID]
    ON [emp].[FactEmploymentPlanPerDay]([DateKey] ASC, [PhaseID] ASC)
    INCLUDE([EmploymentPlanID]) WITH (FILLFACTOR = 100);


GO

CREATE NONCLUSTERED INDEX [FactEmploymentPlanPerDay_DateKey_StartDate]
    ON [emp].[FactEmploymentPlanPerDay]([DateKey] ASC, [StartDate] ASC)
    INCLUDE([DaysInPhase], [EmploymentPlanID], [OutstandingTaskCount], [PhaseID], [PhaseOvertimeDays]) WITH (FILLFACTOR = 100);


GO

