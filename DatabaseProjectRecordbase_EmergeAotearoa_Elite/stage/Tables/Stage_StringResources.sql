CREATE TABLE [stage].[Stage_StringResources] (
    [resourceType]           NVARCHAR (256)  NOT NULL,
    [cultureCode]            NVARCHAR (10)   NOT NULL,
    [resourceKey]            NVARCHAR (128)  NOT NULL,
    [resourceValue]          NVARCHAR (4000) NOT NULL,
    [DefaultValue]           NVARCHAR (4000) NULL,
    [Description]            NVARCHAR (300)  NULL,
    [CreatedBy]              NVARCHAR (50)   NULL,
    [DeletedDate]            DATETIME        NULL,
    [LastReviewedDate]       DATETIME        NULL,
    [LastReviewedBy]         NVARCHAR (50)   NULL,
    [RestrictedToWildBamboo] BIT             NOT NULL
);


GO

