CREATE TABLE [stage].[Stage_DailyCareEvent] (
    [Id]                INT            NOT NULL,
    [PersonId]          INT            NOT NULL,
    [EventDateTime]     DATETIME2 (7)  NOT NULL,
    [EventTypeId]       INT            NULL,
    [MoodId]            INT            NULL,
    [WeightValue]       DECIMAL (5, 2) NULL,
    [BpValue]           NVARCHAR (10)  NULL,
    [DeletedDate]       DATETIME       NULL,
    [DeletedUserID]     INT            NULL,
    [CreatedDate]       DATETIME       NOT NULL,
    [CreatedUserID]     INT            NOT NULL,
    [ModifiedDate]      DATETIME       NULL,
    [ModifiedUserID]    INT            NULL,
    [HealthEventTypeId] INT            NOT NULL
);


GO

