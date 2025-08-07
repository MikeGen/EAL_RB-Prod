CREATE TABLE [dl].[DimCourtOrderType] (
    [CourtOrderTypeID]       INT            NOT NULL,
    [CourtOrderTypeValue]    NVARCHAR (200) NOT NULL,
    [CourtOrderTypeText]     NVARCHAR (200) NOT NULL,
    [CourtOrderTypeParentId] INT            NULL,
    [CourtOrderTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCourtOrderType] PRIMARY KEY CLUSTERED ([CourtOrderTypeID] ASC)
);


GO

