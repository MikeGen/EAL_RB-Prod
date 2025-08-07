CREATE TABLE [stage].[Stage_HealthEventType] (
    [Id]                             INT            NOT NULL,
    [ParentId]                       INT            NULL,
    [Name]                           NVARCHAR (200) NOT NULL,
    [Code]                           NVARCHAR (50)  NULL,
    [SortIndex]                      INT            NOT NULL,
    [UnitOfMeasureStringResourceKey] NVARCHAR (200) NULL,
    [ShowWarningBadge]               BIT            NULL,
    [CreatedDate]                    DATETIME2 (7)  NOT NULL,
    [CreatedUserId]                  INT            NOT NULL,
    [ModifiedDate]                   DATETIME2 (7)  NULL,
    [ModifiedUserId]                 INT            NULL,
    [DeletedDate]                    DATETIME2 (7)  NULL,
    [DeletedUserId]                  INT            NULL,
    [MigrationLookupId]              INT            NULL
);


GO

