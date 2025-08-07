CREATE TABLE [emp].[FactVocation] (
    [Id]               INT            NOT NULL,
    [Position]         NVARCHAR (300) NOT NULL,
    [Location]         NVARCHAR (300) NULL,
    [ClientId]         INT            NOT NULL,
    [EmployerId]       INT            NULL,
    [EmployerName]     NVARCHAR (300) NULL,
    [RegionId]         INT            NOT NULL,
    [StartDate]        DATETIME       NOT NULL,
    [StartDateKey]     INT            NOT NULL,
    [EndDate]          DATETIME       NULL,
    [EndDateKey]       INT            NULL,
    [EmploymentTypeId] INT            NULL,
    [SelfEmployed]     BIT            NOT NULL,
    [IndustryId]       INT            NULL,
    [PayRatePerHour]   REAL           NULL,
    [HoursPerWeek]     REAL           NULL
);


GO

