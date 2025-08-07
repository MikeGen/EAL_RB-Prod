CREATE TABLE [stage].[Stage_PersonAbility] (
    [Id]             INT      NOT NULL,
    [PersonId]       INT      NOT NULL,
    [AbilityId]      INT      NOT NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserId]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserId] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserId]  INT      NULL
);


GO

