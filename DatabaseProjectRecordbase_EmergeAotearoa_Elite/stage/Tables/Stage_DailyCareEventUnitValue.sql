CREATE TABLE [stage].[Stage_DailyCareEventUnitValue] (
    [Id]                INT             NOT NULL,
    [DailyCareEventId]  INT             NOT NULL,
    [HealthEventUnitId] INT             NOT NULL,
    [NumberValue]       DECIMAL (18, 5) NULL,
    [StringValue]       NVARCHAR (10)   NULL,
    [CreatedDate]       DATETIME2 (7)   NOT NULL,
    [CreatedUserId]     INT             NOT NULL,
    [ModifiedDate]      DATETIME2 (7)   NULL,
    [ModifiedUserId]    INT             NULL,
    [DeletedDate]       DATETIME2 (7)   NULL,
    [DeletedUserId]     INT             NULL
);


GO

