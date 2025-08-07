CREATE TABLE [dl].[DimFosterCarePlacementSite] (
    [FosterCarePlacementSiteID]       INT            NOT NULL,
    [FosterCarePlacementSiteValue]    NVARCHAR (200) NOT NULL,
    [FosterCarePlacementSiteText]     NVARCHAR (200) NOT NULL,
    [FosterCarePlacementSiteParentId] INT            NULL,
    [FosterCarePlacementSiteIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimFosterCarePlacementSite] PRIMARY KEY CLUSTERED ([FosterCarePlacementSiteID] ASC)
);


GO

