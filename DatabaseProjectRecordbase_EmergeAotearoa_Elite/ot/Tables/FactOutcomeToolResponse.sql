CREATE TABLE [ot].[FactOutcomeToolResponse] (
    [OutcomeToolResponseID]          INT      NOT NULL,
    [OutcomeToolTemplateID]          INT      NOT NULL,
    [PersonID]                       INT      NOT NULL,
    [ReferralID]                     INT      NULL,
    [ResponseSecuredAgainstReferral] BIT      NOT NULL,
    [ResponseCreatedUserID]          INT      NOT NULL,
    [ResponseCreatedDate]            DATETIME NOT NULL,
    [ActivityId]                     INT      NULL,
    CONSTRAINT [PK_ot_FactOutcomeToolResponse] PRIMARY KEY CLUSTERED ([OutcomeToolResponseID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_FactOutcomeToolResponse]
    ON [ot].[FactOutcomeToolResponse]([OutcomeToolResponseID] ASC, [OutcomeToolTemplateID] ASC, [PersonID] ASC, [ReferralID] ASC);


GO

