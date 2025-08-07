CREATE TABLE [dl].[DimHighestQualificationType] (
    [HighestQualificationTypeID]       INT            NOT NULL,
    [HighestQualificationTypeValue]    NVARCHAR (200) NOT NULL,
    [HighestQualificationTypeText]     NVARCHAR (200) NOT NULL,
    [HighestQualificationTypeParentId] INT            NULL,
    [HighestQualificationTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimHighestQualificationType] PRIMARY KEY CLUSTERED ([HighestQualificationTypeID] ASC)
);


GO

