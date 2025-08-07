CREATE TABLE [dl].[DimStringResources] (
    [StringResourcesresourceType]           NVARCHAR (256)  NOT NULL,
    [StringResourcescultureCode]            NVARCHAR (10)   NOT NULL,
    [StringResourcesresourceKey]            NVARCHAR (128)  NOT NULL,
    [StringResourcesresourceValue]          NVARCHAR (4000) NOT NULL,
    [StringResourcesDefaultValue]           NVARCHAR (4000) NULL,
    [StringResourcesDescription]            NVARCHAR (300)  NULL,
    [StringResourcesCreatedBy]              NVARCHAR (50)   NULL,
    [StringResourcesLastReviewedDate]       DATETIME        NULL,
    [StringResourcesLastReviewedBy]         NVARCHAR (50)   NULL,
    [StringResourcesRestrictedToWildBamboo] BIT             NOT NULL
);


GO

