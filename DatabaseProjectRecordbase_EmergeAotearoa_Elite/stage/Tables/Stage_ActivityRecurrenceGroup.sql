CREATE TABLE [stage].[Stage_ActivityRecurrenceGroup] (
    [Id]               INT            NOT NULL,
    [SourceActivityId] INT            NOT NULL,
    [CreatedUserId]    INT            NOT NULL,
    [CreatedDate]      DATETIME2 (7)  NOT NULL,
    [ModifiedUserId]   INT            NULL,
    [ModifiedDate]     DATETIME2 (7)  NULL,
    [DeletedUserID]    INT            NULL,
    [DeletedDate]      DATETIME2 (7)  NULL,
    [RecurrenceRule]   NVARCHAR (MAX) NULL,
    [StartDate]        DATETIME2 (7)  NULL
);


GO

