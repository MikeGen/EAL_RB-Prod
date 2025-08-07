CREATE TABLE [stage].[Stage_GoalLookupStatus] (
    [Id]             INT            NOT NULL,
    [GoalId]         INT            NOT NULL,
    [StatusId]       INT            NOT NULL,
    [StartDate]      DATETIME2 (7)  NOT NULL,
    [Comment]        NVARCHAR (MAX) NULL,
    [CreatedUserId]  INT            NOT NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [ModifiedUserId] INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [DeletedUserId]  INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL
);


GO

