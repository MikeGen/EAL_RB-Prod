CREATE TABLE [dl].[FactPersonLanguage] (
    [PersonLanguageID]                   INT      NOT NULL,
    [PersonID]                           INT      NOT NULL,
    [LanguageID]                         INT      NOT NULL,
    [SpokenProficiencyID]                INT      NULL,
    [WrittenProficiencyID]               INT      NULL,
    [PersonLanguageIsPrimary]            BIT      NOT NULL,
    [PersonLanguageCreatedDate]          DATETIME NOT NULL,
    [PersonLanguageCreatedUserID]        INT      NOT NULL,
    [PersonLanguageIsTranslatorRequired] BIT      NOT NULL,
    [PersonLanguageIsMainLanguage]       BIT      NULL,
    CONSTRAINT [PK_dl_FactPersonLanguage] PRIMARY KEY CLUSTERED ([PersonLanguageID] ASC)
);


GO

