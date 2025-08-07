CREATE TABLE [stage].[Stage_HealthEventUnit] (
    [Id]                    INT           NOT NULL,
    [HealthEventTypeId]     INT           NOT NULL,
    [UnitType]              NVARCHAR (10) NOT NULL,
    [UnitOrder]             INT           NOT NULL,
    [PreviousUnitSeparator] NVARCHAR (10) NULL,
    [CreatedDate]           DATETIME2 (7) NOT NULL,
    [CreatedUserId]         INT           NOT NULL,
    [ModifiedDate]          DATETIME2 (7) NULL,
    [ModifiedUserId]        INT           NULL,
    [DeletedDate]           DATETIME2 (7) NULL,
    [DeletedUserId]         INT           NULL,
    [IsUnmigratableData]    BIT           NOT NULL
);


GO

