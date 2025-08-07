CREATE TABLE [dl].[DimEducationQualificationType] (
    [EducationQualificationTypeID]       INT            NOT NULL,
    [EducationQualificationTypeValue]    NVARCHAR (200) NOT NULL,
    [EducationQualificationTypeText]     NVARCHAR (200) NOT NULL,
    [EducationQualificationTypeParentId] INT            NULL,
    [EducationQualificationTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEducationQualificationType] PRIMARY KEY CLUSTERED ([EducationQualificationTypeID] ASC)
);


GO

