CREATE TABLE [stage].[Stage_InjuryPurchaseOrder] (
    [Id]                  INT                NOT NULL,
    [InjuryClaimId]       INT                NOT NULL,
    [ReferralId]          INT                NOT NULL,
    [PurchaseOrderNumber] NVARCHAR (100)     NULL,
    [StartDate]           DATETIMEOFFSET (0) NULL,
    [EndDate]             DATETIMEOFFSET (0) NULL,
    [CreatedDate]         DATETIME2 (7)      NOT NULL,
    [CreatedUserId]       INT                NOT NULL,
    [ModifiedDate]        DATETIME2 (7)      NULL,
    [ModifiedUserId]      INT                NULL,
    [DeletedDate]         DATETIME2 (7)      NULL,
    [DeletedUserId]       INT                NULL,
    [PurchaseOrderName]   NVARCHAR (100)     NULL
);


GO

