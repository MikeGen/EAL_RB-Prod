CREATE TABLE [dl].[DimHealthEventType] (
    [HealthEventTypeId]                             INT            NOT NULL,
    [HealthEventTypeParentId]                       INT            NULL,
    [HealthEventTypeName]                           NVARCHAR (200) NOT NULL,
    [HealthEventTypeCode]                           NVARCHAR (50)  NULL,
    [HealthEventTypeSortIndex]                      INT            NOT NULL,
    [HealthEventTypeUnitOfMeasureStringResourceKey] NVARCHAR (200) NULL,
    [HealthEventTypeShowWarningBadge]               BIT            NULL,
    [MigrationLookupId]                             INT            NULL
);


GO

