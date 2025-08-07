CREATE TABLE [dl].[DimRegion] (
    [RegionID]       INT           NOT NULL,
    [RegionName]     VARCHAR (300) NOT NULL,
    [CountryID]      INT           NOT NULL,
    [RegionParentID] INT           NULL,
    CONSTRAINT [PK_dl_DimRegion] PRIMARY KEY CLUSTERED ([RegionID] ASC)
);


GO

