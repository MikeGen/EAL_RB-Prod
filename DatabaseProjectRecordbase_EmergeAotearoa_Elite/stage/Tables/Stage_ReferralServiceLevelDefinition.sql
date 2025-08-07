CREATE TABLE [stage].[Stage_ReferralServiceLevelDefinition] (
    [Id]             INT            NOT NULL,
    [TeamId]         INT            NOT NULL,
    [LookupGroupId]  INT            NOT NULL,
    [ResourceKey]    NVARCHAR (255) NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserId]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserId] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserId]  INT            NULL,
    [Name]           NVARCHAR (255) NOT NULL,
    [Description]    NVARCHAR (300) NULL
);


GO

