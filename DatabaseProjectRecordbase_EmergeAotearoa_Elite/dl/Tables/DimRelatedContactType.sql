CREATE TABLE [dl].[DimRelatedContactType] (
    [RelatedContactTypeID]       INT            NOT NULL,
    [RelatedContactTypeValue]    NVARCHAR (200) NOT NULL,
    [RelatedContactTypeText]     NVARCHAR (200) NOT NULL,
    [RelatedContactTypeParentId] INT            NULL,
    [RelatedContactTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimRelatedContactType] PRIMARY KEY CLUSTERED ([RelatedContactTypeID] ASC)
);


GO

