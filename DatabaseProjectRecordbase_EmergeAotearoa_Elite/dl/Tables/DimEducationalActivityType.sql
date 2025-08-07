CREATE TABLE [dl].[DimEducationalActivityType] (
    [EducationalActivityTypeID]       INT            NOT NULL,
    [EducationalActivityTypeValue]    NVARCHAR (200) NOT NULL,
    [EducationalActivityTypeText]     NVARCHAR (200) NOT NULL,
    [EducationalActivityTypeParentId] INT            NULL,
    [EducationalActivityTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEducationalActivityType] PRIMARY KEY CLUSTERED ([EducationalActivityTypeID] ASC)
);


GO

