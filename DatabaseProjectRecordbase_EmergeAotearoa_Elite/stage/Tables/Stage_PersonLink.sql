CREATE TABLE [stage].[Stage_PersonLink] (
    [Id]              INT      NOT NULL,
    [PrimaryPersonId] INT      NOT NULL,
    [LinkedPersonId]  INT      NOT NULL,
    [CreatedUserId]   INT      NOT NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [ModifiedUserId]  INT      NULL,
    [ModifiedDate]    DATETIME NULL,
    [DeletedUserId]   INT      NULL,
    [DeletedDate]     DATETIME NULL
);


GO

