CREATE TABLE [dl].[DimUserEmploymentType] (
    [UserEmploymentTypeID]       INT            NOT NULL,
    [UserEmploymentTypeValue]    NVARCHAR (200) NOT NULL,
    [UserEmploymentTypeText]     NVARCHAR (200) NOT NULL,
    [UserEmploymentTypeParentId] INT            NULL,
    [UserEmploymentTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimUserEmploymentType] PRIMARY KEY CLUSTERED ([UserEmploymentTypeID] ASC)
);


GO

