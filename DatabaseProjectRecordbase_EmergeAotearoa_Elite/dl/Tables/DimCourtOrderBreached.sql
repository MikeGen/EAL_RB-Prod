CREATE TABLE [dl].[DimCourtOrderBreached] (
    [CourtOrderBreachedID]       INT            NOT NULL,
    [CourtOrderBreachedValue]    NVARCHAR (200) NOT NULL,
    [CourtOrderBreachedText]     NVARCHAR (200) NOT NULL,
    [CourtOrderBreachedParentId] INT            NULL,
    [CourtOrderBreachedIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCourtOrderBreached] PRIMARY KEY CLUSTERED ([CourtOrderBreachedID] ASC)
);


GO

