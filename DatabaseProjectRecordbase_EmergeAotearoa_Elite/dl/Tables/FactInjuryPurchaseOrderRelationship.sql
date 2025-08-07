CREATE TABLE [dl].[FactInjuryPurchaseOrderRelationship] (
    [InjuryPurchaseOrderRelationshipId]            INT           NOT NULL,
    [InjuryPurchaseOrderId]                        INT           NOT NULL,
    [RelationshipId]                               INT           NOT NULL,
    [InjuryPurchaseOrderRelationshipCreatedDate]   DATETIME2 (7) NOT NULL,
    [InjuryPurchaseOrderRelationshipCreatedUserId] INT           NOT NULL,
    CONSTRAINT [PK_dl_FactInjuryPurchaseOrderRelationship] PRIMARY KEY CLUSTERED ([InjuryPurchaseOrderRelationshipId] ASC)
);


GO

