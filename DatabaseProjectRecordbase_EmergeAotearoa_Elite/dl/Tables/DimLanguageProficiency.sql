CREATE TABLE [dl].[DimLanguageProficiency] (
    [LanguageProficiencyID]       INT            NOT NULL,
    [LanguageProficiencyValue]    NVARCHAR (200) NOT NULL,
    [LanguageProficiencyText]     NVARCHAR (200) NOT NULL,
    [LanguageProficiencyParentId] INT            NULL,
    [LanguageProficiencyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimLanguageProficiency] PRIMARY KEY CLUSTERED ([LanguageProficiencyID] ASC)
);


GO

