CREATE TABLE [dl].[DimReferralServiceLevelDefinition] (
    [ReferralServiceLevelDefinitionId]          INT            NOT NULL,
    [TeamId]                                    INT            NOT NULL,
    [LookupGroupId]                             INT            NOT NULL,
    [ReferralServiceLevelDefinitionResourceKey] NVARCHAR (255) NULL,
    [ReferralServiceLevelDefinitionName]        NVARCHAR (255) NOT NULL,
    [ReferralServiceLevelDefinitionDescription] NVARCHAR (300) NULL,
    CONSTRAINT [PK_dl_DimReferralServiceLevelDefinition] PRIMARY KEY CLUSTERED ([ReferralServiceLevelDefinitionId] ASC)
);


GO

