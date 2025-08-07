CREATE TABLE [dl].[DimOutletType] (
    [OutletTypeID]       INT            NOT NULL,
    [OutletTypeValue]    NVARCHAR (200) NOT NULL,
    [OutletTypeText]     NVARCHAR (200) NOT NULL,
    [OutletTypeParentId] INT            NULL,
    [OutletTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimOutletType] PRIMARY KEY CLUSTERED ([OutletTypeID] ASC)
);


GO

