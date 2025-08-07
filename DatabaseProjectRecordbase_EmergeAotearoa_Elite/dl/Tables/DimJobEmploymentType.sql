CREATE TABLE [dl].[DimJobEmploymentType] (
    [JobEmploymentTypeID]       INT            NOT NULL,
    [JobEmploymentTypeValue]    NVARCHAR (200) NOT NULL,
    [JobEmploymentTypeText]     NVARCHAR (200) NOT NULL,
    [JobEmploymentTypeParentId] INT            NULL,
    [JobEmploymentTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimJobEmploymentType] PRIMARY KEY CLUSTERED ([JobEmploymentTypeID] ASC)
);


GO

