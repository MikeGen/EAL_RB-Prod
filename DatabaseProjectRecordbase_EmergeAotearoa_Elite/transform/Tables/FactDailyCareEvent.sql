CREATE TABLE [transform].[FactDailyCareEvent] (
    [DailyCareEventID] INT            NOT NULL,
    [PersonID]         INT            NOT NULL,
    [EventDateTime]    DATETIME       NOT NULL,
    [EventType]        NVARCHAR (200) NOT NULL,
    [Value]            NVARCHAR (255) NULL,
    [MoodText]         NVARCHAR (200) NULL
);


GO

