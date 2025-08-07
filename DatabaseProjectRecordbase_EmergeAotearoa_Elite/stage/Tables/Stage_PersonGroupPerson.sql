CREATE TABLE [stage].[Stage_PersonGroupPerson] (
    [Id]             INT           NOT NULL,
    [PersonGroupId]  INT           NOT NULL,
    [PersonId]       INT           NOT NULL,
    [CreatedDate]    DATETIME2 (7) NOT NULL,
    [CreatedUserID]  INT           NOT NULL,
    [ModifiedDate]   DATETIME2 (7) NULL,
    [ModifiedUserID] INT           NULL,
    [DeletedDate]    DATETIME2 (7) NULL,
    [DeletedUserID]  INT           NULL
);


GO

