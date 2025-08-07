CREATE TABLE [ot].[DimOutcomeToolTemplate] (
    [OutcomeToolTemplateID] INT            NOT NULL,
    [OutcomeToolTitle]      NVARCHAR (100) NOT NULL,
    [OutcomeToolQuestionID] NVARCHAR (50)  NOT NULL,
    [QuestionText]          NVARCHAR (MAX) NOT NULL,
    [QuestionType]          NVARCHAR (50)  NOT NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_DimOutcomeToolTemplate]
    ON [ot].[DimOutcomeToolTemplate]([OutcomeToolTemplateID] ASC, [OutcomeToolQuestionID] ASC);


GO

