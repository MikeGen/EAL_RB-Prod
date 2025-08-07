CREATE TABLE [dl].[DimServiceType] (
    [ServiceTypeID]       INT            NOT NULL,
    [ServiceTypeValue]    NVARCHAR (200) NOT NULL,
    [ServiceTypeText]     NVARCHAR (200) NOT NULL,
    [ServiceTypeParentId] INT            NULL,
    [ServiceTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimServiceType] PRIMARY KEY CLUSTERED ([ServiceTypeID] ASC)
);


GO

