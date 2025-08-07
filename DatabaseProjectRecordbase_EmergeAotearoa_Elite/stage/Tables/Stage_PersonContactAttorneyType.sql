CREATE TABLE [stage].[Stage_PersonContactAttorneyType] (
    [Id]              INT      NOT NULL,
    [PersonContactId] INT      NOT NULL,
    [AttorneyTypeId]  INT      NOT NULL,
    [CreatedDate]     DATETIME NOT NULL,
    [CreatedUserId]   INT      NOT NULL,
    [ModifiedDate]    DATETIME NULL,
    [ModifiedUserId]  INT      NULL,
    [DeletedDate]     DATETIME NULL,
    [DeletedUserId]   INT      NULL
);


GO

