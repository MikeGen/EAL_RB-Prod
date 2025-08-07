CREATE TABLE [stage].[Stage_PersonLanguage] (
    [ID]                   INT      NOT NULL,
    [PersonID]             INT      NOT NULL,
    [LanguageID]           INT      NOT NULL,
    [SpokenProficiencyID]  INT      NULL,
    [WrittenProficiencyID] INT      NULL,
    [IsPrimary]            BIT      NOT NULL,
    [CreatedDate]          DATETIME NOT NULL,
    [CreatedUserID]        INT      NOT NULL,
    [ModifiedDate]         DATETIME NULL,
    [ModifiedUserID]       INT      NULL,
    [DeletedDate]          DATETIME NULL,
    [DeletedUserID]        INT      NULL,
    [IsTranslatorRequired] BIT      NOT NULL,
    [IsMainLanguage]       BIT      NULL
);


GO

