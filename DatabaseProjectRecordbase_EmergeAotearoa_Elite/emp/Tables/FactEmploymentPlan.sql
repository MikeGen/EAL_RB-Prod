CREATE TABLE [emp].[FactEmploymentPlan] (
    [EmploymentPlanID]           INT          NOT NULL,
    [ClientID]                   INT          NOT NULL,
    [PrimaryCaseWorkerID]        INT          NOT NULL,
    [RegionID]                   INT          NULL,
    [TeamID]                     INT          NOT NULL,
    [AreaID]                     INT          NOT NULL,
    [CloseReasonID]              INT          NULL,
    [WorkPreferenceIndustryID]   INT          NULL,
    [OutcomeJobIndustryID]       INT          NULL,
    [StartDateKey]               INT          NOT NULL,
    [ClosedDateKey]              INT          NULL,
    [StartDate]                  DATETIME     NOT NULL,
    [ClosedDate]                 DATETIME     NULL,
    [JobStartDate]               DATETIME     NULL,
    [JobSearchStartDate]         DATETIME     NULL,
    [PlacementSupportStartDate]  DATETIME     NULL,
    [FirstContactDate]           DATETIME     NULL,
    [DaysToJobSearch]            INT          NULL,
    [DaysToFirstContact]         INT          NULL,
    [DaysToJobStart]             INT          NULL,
    [TotalDaysInPlan]            INT          NULL,
    [CurrentPhaseAbbreviation]   NVARCHAR (5) NULL,
    [IsSupportPlan]              BIT          NOT NULL,
    [EmploymentPlanOutcomeJobID] INT          NULL,
    [ReferralId]                 INT          NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_FactEmploymentPlan_IsSupportPlan_TeamID_ClosedDateKey]
    ON [emp].[FactEmploymentPlan]([IsSupportPlan] ASC, [TeamID] ASC, [ClosedDateKey] ASC)
    INCLUDE([ClientID], [EmploymentPlanID]) WITH (FILLFACTOR = 100);


GO

