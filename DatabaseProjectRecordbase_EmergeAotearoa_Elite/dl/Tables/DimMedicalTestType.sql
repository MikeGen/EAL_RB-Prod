CREATE TABLE [dl].[DimMedicalTestType] (
    [MedicalTestTypeID]       INT            NOT NULL,
    [MedicalTestTypeValue]    NVARCHAR (200) NOT NULL,
    [MedicalTestTypeText]     NVARCHAR (200) NOT NULL,
    [MedicalTestTypeParentId] INT            NULL,
    [MedicalTestTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimMedicalTestType] PRIMARY KEY CLUSTERED ([MedicalTestTypeID] ASC)
);


GO

