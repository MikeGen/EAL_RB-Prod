CREATE TABLE [dl].[FactInjuryPurchaseOrder] (
    [InjuryPurchaseOrderId]                  INT                NOT NULL,
    [InjuryClaimId]                          INT                NOT NULL,
    [ReferralId]                             INT                NOT NULL,
    [InjuryPurchaseOrderPurchaseOrderNumber] NVARCHAR (100)     NULL,
    [InjuryPurchaseOrderStartDate]           DATETIMEOFFSET (0) NULL,
    [InjuryPurchaseOrderEndDate]             DATETIMEOFFSET (0) NULL,
    [InjuryPurchaseOrderCreatedDate]         DATETIME2 (7)      NOT NULL,
    [InjuryPurchaseOrderCreatedUserId]       INT                NOT NULL,
    [InjuryPurchaseOrderPurchaseOrderName]   NVARCHAR (100)     NULL,
    CONSTRAINT [PK_dl_FactInjuryPurchaseOrder] PRIMARY KEY CLUSTERED ([InjuryPurchaseOrderId] ASC)
);


GO

