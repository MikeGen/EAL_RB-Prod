CREATE TABLE [stage].[Stage_PersonHealthConditionStatusHistory] (
    [Id]                      INT      NOT NULL,
    [PersonHealthConditionId] INT      NOT NULL,
    [IsCurrent]               BIT      NOT NULL,
    [CreatedDate]             DATETIME NOT NULL,
    [CreatedUserId]           INT      NOT NULL,
    [ModifiedDate]            DATETIME NULL,
    [ModifiedUserId]          INT      NULL,
    [DeletedDate]             DATETIME NULL,
    [DeletedUserId]           INT      NULL
);


GO

