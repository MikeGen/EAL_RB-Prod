CREATE TABLE [stage].[Stage_TeamActivityBreakdownType] (
    [ID]                      INT      NOT NULL,
    [ActivityBreakdownTypeID] INT      NOT NULL,
    [TeamID]                  INT      NOT NULL,
    [InactiveUserID]          INT      NULL,
    [InactiveDate]            DATETIME NULL,
    [CreatedUserID]           INT      NOT NULL,
    [CreatedDate]             DATETIME NOT NULL,
    [ModifiedUserID]          INT      NULL,
    [ModifiedDate]            DATETIME NULL,
    [DeletedUserID]           INT      NULL,
    [DeletedDate]             DATETIME NULL
);


GO

