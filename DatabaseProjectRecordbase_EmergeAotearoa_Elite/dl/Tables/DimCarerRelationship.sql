CREATE TABLE [dl].[DimCarerRelationship] (
    [CarerRelationshipID]       INT            NOT NULL,
    [CarerRelationshipValue]    NVARCHAR (200) NOT NULL,
    [CarerRelationshipText]     NVARCHAR (200) NOT NULL,
    [CarerRelationshipParentId] INT            NULL,
    [CarerRelationshipIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCarerRelationship] PRIMARY KEY CLUSTERED ([CarerRelationshipID] ASC)
);


GO

