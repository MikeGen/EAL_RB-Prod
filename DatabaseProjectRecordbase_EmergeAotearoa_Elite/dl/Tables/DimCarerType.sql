CREATE TABLE [dl].[DimCarerType] (
    [CarerTypeID]       INT            NOT NULL,
    [CarerTypeValue]    NVARCHAR (200) NOT NULL,
    [CarerTypeText]     NVARCHAR (200) NOT NULL,
    [CarerTypeParentId] INT            NULL,
    [CarerTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCarerType] PRIMARY KEY CLUSTERED ([CarerTypeID] ASC)
);


GO

