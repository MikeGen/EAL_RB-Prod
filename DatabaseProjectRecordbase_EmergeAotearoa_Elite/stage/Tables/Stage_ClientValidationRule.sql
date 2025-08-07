CREATE TABLE [stage].[Stage_ClientValidationRule] (
    [ID]               INT            NOT NULL,
    [Name]             NVARCHAR (MAX) NOT NULL,
    [Description]      NVARCHAR (MAX) NULL,
    [RuleSQL]          NVARCHAR (MAX) NOT NULL,
    [IsActive]         BIT            NOT NULL,
    [SecondsToProcess] INT            NULL,
    [ResourceKey]      NVARCHAR (MAX) NULL
);


GO

