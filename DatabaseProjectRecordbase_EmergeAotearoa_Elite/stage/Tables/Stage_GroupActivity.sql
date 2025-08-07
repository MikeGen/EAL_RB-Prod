CREATE TABLE [stage].[Stage_GroupActivity] (
    [ID]             INT      NOT NULL,
    [ClonedFromID]   INT      NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserId]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserId] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserId]  INT      NULL
);


GO

