CREATE TABLE [stage].[Stage_TeamGroupActivityBreakdownType] (
    [ID]                      INT            NOT NULL,
    [ActivityBreakdownTypeID] INT            NOT NULL,
    [NameOverride]            NVARCHAR (MAX) NULL,
    [TeamID]                  INT            NOT NULL,
    [InactiveUserID]          INT            NULL,
    [InactiveDate]            DATETIME       NULL,
    [CreatedDate]             DATETIME       NOT NULL,
    [CreatedUserID]           INT            NOT NULL,
    [ModifiedDate]            DATETIME       NULL,
    [ModifiedUserID]          INT            NULL,
    [DeletedDate]             DATETIME       NULL,
    [DeletedUserID]           INT            NULL,
    [OrderId]                 INT            NOT NULL
);


GO

