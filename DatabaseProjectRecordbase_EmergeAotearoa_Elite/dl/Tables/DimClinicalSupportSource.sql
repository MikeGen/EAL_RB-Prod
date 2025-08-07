CREATE TABLE [dl].[DimClinicalSupportSource] (
    [ClinicalSupportSourceID]       INT            NOT NULL,
    [ClinicalSupportSourceValue]    NVARCHAR (200) NOT NULL,
    [ClinicalSupportSourceText]     NVARCHAR (200) NOT NULL,
    [ClinicalSupportSourceParentId] INT            NULL,
    [ClinicalSupportSourceIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimClinicalSupportSource] PRIMARY KEY CLUSTERED ([ClinicalSupportSourceID] ASC)
);


GO

