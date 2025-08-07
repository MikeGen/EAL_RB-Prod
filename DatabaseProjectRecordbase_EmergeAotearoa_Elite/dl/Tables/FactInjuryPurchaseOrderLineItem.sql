CREATE TABLE [dl].[FactInjuryPurchaseOrderLineItem] (
    [InjuryPurchaseOrderLineItemId]            INT                NOT NULL,
    [InjuryPurchaseOrderId]                    INT                NOT NULL,
    [InjuryServiceUnitId]                      INT                NOT NULL,
    [InjuryPurchaseOrderLineItemQuantity]      DECIMAL (9, 2)     NULL,
    [InjuryPurchaseOrderLineItemApprovedDate]  DATETIMEOFFSET (0) NULL,
    [InjuryPurchaseOrderLineItemCreatedUserId] INT                NOT NULL,
    [InjuryPurchaseOrderLineItemCreatedDate]   DATETIME2 (7)      NOT NULL,
    [InjuryPurchaseOrderLineItemRequestedDate] DATETIMEOFFSET (0) NULL,
    CONSTRAINT [PK_dl_FactInjuryPurchaseOrderLineItem] PRIMARY KEY CLUSTERED ([InjuryPurchaseOrderLineItemId] ASC)
);


GO

