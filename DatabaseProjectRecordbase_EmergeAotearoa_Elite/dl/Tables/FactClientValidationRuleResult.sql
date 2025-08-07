CREATE TABLE [dl].[FactClientValidationRuleResult] (
    [ClientValidationRuleResultID]          INT            NOT NULL,
    [ClientValidationRuleID]                INT            NOT NULL,
    [PersonID]                              INT            NOT NULL,
    [ClientValidationRuleResultCreatedDate] DATETIME       NOT NULL,
    [ClientValidationRuleResultEntityType]  NVARCHAR (MAX) NULL,
    [EntityId]                              INT            NULL
);


GO

