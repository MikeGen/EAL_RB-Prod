CREATE TABLE [dl].[FactDailyCareEvent] (
    [DailyCareEventId]            INT            NOT NULL,
    [PersonId]                    INT            NOT NULL,
    [DailyCareEventEventDateTime] DATETIME2 (7)  NOT NULL,
    [EventTypeId]                 INT            NULL,
    [MoodId]                      INT            NULL,
    [DailyCareEventWeightValue]   DECIMAL (5, 2) NULL,
    [DailyCareEventBpValue]       NVARCHAR (10)  NULL,
    [DailyCareEventCreatedDate]   DATETIME       NOT NULL,
    [DailyCareEventCreatedUserID] INT            NOT NULL,
    [HealthEventTypeId]           INT            NOT NULL,
    CONSTRAINT [PK_dl_FactDailyCareEvent] PRIMARY KEY CLUSTERED ([DailyCareEventId] ASC)
);


GO

