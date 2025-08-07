CREATE TABLE [dl].[DimRelationshipType] (
    [RelationshipTypeID]       INT            NOT NULL,
    [RelationshipTypeValue]    NVARCHAR (200) NOT NULL,
    [RelationshipTypeText]     NVARCHAR (200) NOT NULL,
    [RelationshipTypeParentId] INT            NULL,
    [RelationshipTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimRelationshipType] PRIMARY KEY CLUSTERED ([RelationshipTypeID] ASC)
);


GO

