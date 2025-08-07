CREATE TABLE [dl].[DimSupportLevelType] (
    [SupportLevelTypeID]       INT            NOT NULL,
    [SupportLevelTypeValue]    NVARCHAR (200) NOT NULL,
    [SupportLevelTypeText]     NVARCHAR (200) NOT NULL,
    [SupportLevelTypeParentId] INT            NULL,
    [SupportLevelTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSupportLevelType] PRIMARY KEY CLUSTERED ([SupportLevelTypeID] ASC)
);


GO

