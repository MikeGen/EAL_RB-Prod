CREATE TABLE [stage].[Stage_PersonIwi] (
    [Id]             INT           NOT NULL,
    [PersonId]       INT           NOT NULL,
    [ReferenceIwiId] INT           NOT NULL,
    [CreatedUserId]  INT           NOT NULL,
    [CreatedDate]    DATETIME2 (7) NOT NULL,
    [ModifiedUserId] INT           NULL,
    [ModifiedDate]   DATETIME2 (7) NULL,
    [DeletedUserId]  INT           NULL,
    [DeletedDate]    DATETIME2 (7) NULL
);


GO

