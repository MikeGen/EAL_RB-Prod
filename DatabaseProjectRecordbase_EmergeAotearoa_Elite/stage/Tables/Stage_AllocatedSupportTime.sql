CREATE TABLE [stage].[Stage_AllocatedSupportTime] (
    [Id]             INT      NOT NULL,
    [PersonId]       INT      NOT NULL,
    [TeamId]         INT      NOT NULL,
    [EffectiveDate]  DATETIME NOT NULL,
    [MinutesPerWeek] INT      NOT NULL,
    [CreatedDate]    DATETIME NOT NULL,
    [CreatedUserId]  INT      NOT NULL,
    [ModifiedDate]   DATETIME NULL,
    [ModifiedUserId] INT      NULL,
    [DeletedDate]    DATETIME NULL,
    [DeletedUserId]  INT      NULL
);


GO

