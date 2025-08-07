CREATE TABLE [dl].[DimIncidentCategoryType] (
    [IncidentCategoryTypeID]       INT            NOT NULL,
    [IncidentCategoryTypeValue]    NVARCHAR (200) NOT NULL,
    [IncidentCategoryTypeText]     NVARCHAR (200) NOT NULL,
    [IncidentCategoryTypeParentId] INT            NULL,
    [IncidentCategoryTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentCategoryType] PRIMARY KEY CLUSTERED ([IncidentCategoryTypeID] ASC)
);


GO

