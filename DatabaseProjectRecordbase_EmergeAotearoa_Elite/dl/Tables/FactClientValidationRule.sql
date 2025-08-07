CREATE TABLE [dl].[FactClientValidationRule] (
    [ClientValidationRuleID]               INT            NOT NULL,
    [ClientValidationRuleName]             NVARCHAR (MAX) NOT NULL,
    [ClientValidationRuleDescription]      NVARCHAR (MAX) NULL,
    [ClientValidationRuleRuleSQL]          NVARCHAR (MAX) NOT NULL,
    [ClientValidationRuleIsActive]         BIT            NOT NULL,
    [ClientValidationRuleSecondsToProcess] INT            NULL,
    [ClientValidationRuleResourceKey]      NVARCHAR (MAX) NULL
);


GO

