CREATE TABLE [emp].[FactClientVocationActivity] (
    [VocationID]            INT            NOT NULL,
    [ClientID]              INT            NOT NULL,
    [StartDate]             DATETIME       NOT NULL,
    [EndDate]               DATETIME       NULL,
    [JobEmploymentTypeID]   INT            NULL,
    [EmployerID]            INT            NULL,
    [IndustryID]            INT            NULL,
    [RegionID]              INT            NULL,
    [EndReasonID]           INT            NULL,
    [Position]              NVARCHAR (300) NOT NULL,
    [Location]              NVARCHAR (300) NULL,
    [HoursPerWeek]          REAL           NOT NULL,
    [PayRatePerHour]        REAL           NULL,
    [IsWageSubsidy]         BIT            NULL,
    [IsSheltered]           BIT            NULL,
    [IsSupportedWageScheme] BIT            NULL,
    [IsVolunteer]           BIT            NULL,
    [IsWorkExperience]      BIT            NULL,
    [IsTemporary]           BIT            NULL
);


GO

