CREATE TABLE [dl].[FactPersonLinkRelationship] (
    [PersonLinkRelationshipId]            INT      NOT NULL,
    [PersonLinkId]                        INT      NOT NULL,
    [RelationshipTypeId]                  INT      NOT NULL,
    [PersonLinkRelationshipStartDate]     DATETIME NOT NULL,
    [PersonLinkRelationshipEndDate]       DATETIME NULL,
    [PersonLinkRelationshipCreatedDate]   DATETIME NOT NULL,
    [PersonLinkRelationshipCreatedUserID] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonLinkRelationship] PRIMARY KEY CLUSTERED ([PersonLinkRelationshipId] ASC)
);


GO

