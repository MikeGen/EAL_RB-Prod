CREATE TABLE [stage].[Stage_InjuryPurchaseOrderLineItem] (
    [Id]                    INT                NOT NULL,
    [InjuryPurchaseOrderId] INT                NOT NULL,
    [InjuryServiceUnitId]   INT                NOT NULL,
    [Quantity]              DECIMAL (9, 2)     NULL,
    [ApprovedDate]          DATETIMEOFFSET (0) NULL,
    [CreatedUserId]         INT                NOT NULL,
    [CreatedDate]           DATETIME2 (7)      NOT NULL,
    [ModifiedUserId]        INT                NULL,
    [ModifiedDate]          DATETIME2 (7)      NULL,
    [DeletedUserId]         INT                NULL,
    [DeletedDate]           DATETIME2 (7)      NULL,
    [RequestedDate]         DATETIMEOFFSET (0) NULL
);


GO

