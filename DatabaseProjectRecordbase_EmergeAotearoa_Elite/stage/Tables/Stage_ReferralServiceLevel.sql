CREATE TABLE [stage].[Stage_ReferralServiceLevel] (
    [Id]                               INT      NOT NULL,
    [ReferralServiceLevelDefinitionId] INT      NOT NULL,
    [ReferralId]                       INT      NOT NULL,
    [LookupId]                         INT      NOT NULL,
    [EffectiveFrom]                    DATETIME NOT NULL,
    [CreatedDate]                      DATETIME NOT NULL,
    [CreatedUserId]                    INT      NOT NULL,
    [ModifiedDate]                     DATETIME NULL,
    [ModifiedUserId]                   INT      NULL,
    [DeletedDate]                      DATETIME NULL,
    [DeletedUserId]                    INT      NULL
);


GO

