CREATE TABLE [dl].[DimPersonLinkType] (
    [PersonLinkTypeID]       INT            NOT NULL,
    [PersonLinkTypeValue]    NVARCHAR (200) NOT NULL,
    [PersonLinkTypeText]     NVARCHAR (200) NOT NULL,
    [PersonLinkTypeParentId] INT            NULL,
    [PersonLinkTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPersonLinkType] PRIMARY KEY CLUSTERED ([PersonLinkTypeID] ASC)
);


GO

