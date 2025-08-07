CREATE TABLE [dl].[DimSmokingSupportServices] (
    [SmokingSupportServicesID]       INT            NOT NULL,
    [SmokingSupportServicesValue]    NVARCHAR (200) NOT NULL,
    [SmokingSupportServicesText]     NVARCHAR (200) NOT NULL,
    [SmokingSupportServicesParentId] INT            NULL,
    [SmokingSupportServicesIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSmokingSupportServices] PRIMARY KEY CLUSTERED ([SmokingSupportServicesID] ASC)
);


GO

