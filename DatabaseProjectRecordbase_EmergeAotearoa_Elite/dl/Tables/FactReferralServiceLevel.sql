CREATE TABLE [dl].[FactReferralServiceLevel] (
    [ReferralServiceLevelId]            INT      NOT NULL,
    [ReferralServiceLevelDefinitionId]  INT      NOT NULL,
    [ReferralId]                        INT      NOT NULL,
    [LookupId]                          INT      NOT NULL,
    [ReferralServiceLevelEffectiveFrom] DATETIME NOT NULL,
    [ReferralServiceLevelCreatedDate]   DATETIME NOT NULL,
    [ReferralServiceLevelCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactReferralServiceLevel] PRIMARY KEY CLUSTERED ([ReferralServiceLevelId] ASC)
);


GO

