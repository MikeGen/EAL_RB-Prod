CREATE TABLE [stage].[Stage_PersonLinkRelationship] (
    [Id]                 INT      NOT NULL,
    [PersonLinkId]       INT      NOT NULL,
    [RelationshipTypeId] INT      NOT NULL,
    [StartDate]          DATETIME NOT NULL,
    [EndDate]            DATETIME NULL,
    [CreatedDate]        DATETIME NOT NULL,
    [CreatedUserID]      INT      NOT NULL,
    [ModifiedDate]       DATETIME NULL,
    [ModifiedUserID]     INT      NULL,
    [DeletedDate]        DATETIME NULL,
    [DeletedUserID]      INT      NULL
);


GO

