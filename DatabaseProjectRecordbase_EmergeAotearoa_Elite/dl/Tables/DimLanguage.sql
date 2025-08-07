CREATE TABLE [dl].[DimLanguage] (
    [LanguageID]       INT            NOT NULL,
    [LanguageValue]    NVARCHAR (200) NOT NULL,
    [LanguageText]     NVARCHAR (200) NOT NULL,
    [LanguageParentId] INT            NULL,
    [LanguageIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimLanguage] PRIMARY KEY CLUSTERED ([LanguageID] ASC)
);


GO

