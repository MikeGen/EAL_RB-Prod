CREATE TABLE [emp].[FactEmploymentPlanOutcomeJob] (
    [VocationID]            INT            NOT NULL,
    [EmploymentPlanID]      INT            NOT NULL,
    [ClientID]              INT            NOT NULL,
    [StartDate]             DATETIME       NOT NULL,
    [StartDateKey]          INT            NOT NULL,
    [EndDate]               DATETIME       NULL,
    [EndDateKey]            INT            NULL,
    [EmployerID]            INT            NULL,
    [JobEmploymentTypeID]   INT            NULL,
    [IndustryID]            INT            NOT NULL,
    [RegionID]              INT            NOT NULL,
    [EndReasonID]           INT            NULL,
    [Position]              NVARCHAR (300) NOT NULL,
    [Location]              NVARCHAR (300) NOT NULL,
    [PayRatePerHour]        REAL           NOT NULL,
    [IsWageSubsidy]         BIT            NULL,
    [IsSheltered]           BIT            NULL,
    [IsSupportedWageScheme] BIT            NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_FactEmploymentPlanOutcomeJob_EmploymentPlanID]
    ON [emp].[FactEmploymentPlanOutcomeJob]([EmploymentPlanID] ASC)
    INCLUDE([VocationID]) WITH (FILLFACTOR = 100);


GO

