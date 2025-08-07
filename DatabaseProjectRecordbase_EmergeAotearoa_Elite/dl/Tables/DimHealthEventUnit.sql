CREATE TABLE [dl].[DimHealthEventUnit] (
    [HealthEventUnitId]                    INT           NOT NULL,
    [HealthEventTypeId]                    INT           NOT NULL,
    [HealthEventUnitUnitType]              NVARCHAR (10) NOT NULL,
    [HealthEventUnitUnitOrder]             INT           NOT NULL,
    [HealthEventUnitPreviousUnitSeparator] NVARCHAR (10) NULL,
    [HealthEventUnitIsUnmigratableData]    BIT           NOT NULL
);


GO

