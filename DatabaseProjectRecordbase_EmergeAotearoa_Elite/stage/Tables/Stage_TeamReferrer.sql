CREATE TABLE [stage].[Stage_TeamReferrer] (
    [Id]             INT           NOT NULL,
    [TeamId]         INT           NOT NULL,
    [ReferrerId]     INT           NOT NULL,
    [InactiveDate]   DATETIME2 (7) NULL,
    [InactiveUserId] INT           NULL,
    [CreatedDate]    DATETIME2 (7) NOT NULL,
    [CreatedUserId]  INT           NOT NULL,
    [ModifiedDate]   DATETIME2 (7) NULL,
    [ModifiedUserId] INT           NULL,
    [DeletedDate]    DATETIME2 (7) NULL,
    [DeletedUserId]  INT           NULL
);


GO

