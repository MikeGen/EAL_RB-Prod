CREATE TABLE [stage].[Stage_ClientValidationRuleResult] (
    [ID]                     INT            NOT NULL,
    [ClientValidationRuleID] INT            NOT NULL,
    [PersonID]               INT            NOT NULL,
    [CreatedDate]            DATETIME       NOT NULL,
    [EntityType]             NVARCHAR (MAX) NULL,
    [EntityId]               INT            NULL
);


GO

