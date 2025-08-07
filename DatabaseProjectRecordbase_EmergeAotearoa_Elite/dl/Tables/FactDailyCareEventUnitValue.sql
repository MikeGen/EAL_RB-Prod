CREATE TABLE [dl].[FactDailyCareEventUnitValue] (
    [DailyCareEventUnitValueId]            INT             NOT NULL,
    [DailyCareEventId]                     INT             NOT NULL,
    [HealthEventUnitId]                    INT             NOT NULL,
    [DailyCareEventUnitValueNumberValue]   DECIMAL (18, 5) NULL,
    [DailyCareEventUnitValueStringValue]   NVARCHAR (10)   NULL,
    [DailyCareEventUnitValueCreatedDate]   DATETIME2 (7)   NOT NULL,
    [DailyCareEventUnitValueCreatedUserId] INT             NOT NULL
);


GO

