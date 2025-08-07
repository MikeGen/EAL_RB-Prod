CREATE TABLE [dl].[FactPersonAbility] (
    [PersonAbilityId]            INT      NOT NULL,
    [PersonId]                   INT      NOT NULL,
    [AbilityId]                  INT      NOT NULL,
    [PersonAbilityCreatedDate]   DATETIME NOT NULL,
    [PersonAbilityCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonAbility] PRIMARY KEY CLUSTERED ([PersonAbilityId] ASC)
);


GO

