CREATE TABLE [ot].[FactOutcomeToolResponseAnswer] (
    [OutcomeToolResponseID]         INT            NOT NULL,
    [OutcomeToolTemplateID]         INT            NOT NULL,
    [OutcomeToolQuestionID]         NVARCHAR (50)  NOT NULL,
    [ResponseAnswer]                NVARCHAR (MAX) NULL,
    [ResponseAnswerSelectedValue]   NVARCHAR (MAX) NULL,
    [ResponseAnswerSelectedText]    NVARCHAR (MAX) NULL,
    [ResponseAnswerText]            NVARCHAR (MAX) NULL,
    [ResponseAnswerCalculatedValue] NVARCHAR (MAX) NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_FactOutcomeToolResponseAnswer]
    ON [ot].[FactOutcomeToolResponseAnswer]([OutcomeToolResponseID] ASC, [OutcomeToolQuestionID] ASC)
    INCLUDE([ResponseAnswer]);


GO

