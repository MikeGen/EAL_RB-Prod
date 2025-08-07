CREATE TABLE [dl].[FactActivityRecurrenceGroup] (
    [ActivityRecurrenceGroupId]             INT            NOT NULL,
    [SourceActivityId]                      INT            NOT NULL,
    [ActivityRecurrenceGroupCreatedUserId]  INT            NOT NULL,
    [ActivityRecurrenceGroupCreatedDate]    DATETIME2 (7)  NOT NULL,
    [ActivityRecurrenceGroupRecurrenceRule] NVARCHAR (MAX) NULL,
    [ActivityRecurrenceGroupStartDate]      DATETIME2 (7)  NULL,
    CONSTRAINT [PK_dl_FactActivityRecurrenceGroup] PRIMARY KEY CLUSTERED ([ActivityRecurrenceGroupId] ASC)
);


GO

