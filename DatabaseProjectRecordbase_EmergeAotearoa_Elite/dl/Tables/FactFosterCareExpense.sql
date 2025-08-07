CREATE TABLE [dl].[FactFosterCareExpense] (
    [FosterCareExpenseId]            INT            NOT NULL,
    [CaregiverId]                    INT            NOT NULL,
    [ChildId]                        INT            NULL,
    [ClaimTypeId]                    INT            NOT NULL,
    [FosterCareExpenseReceiptDate]   DATETIME2 (7)  NOT NULL,
    [FosterCareExpenseClaimAmount]   NUMERIC (9, 2) NULL,
    [FosterCareExpenseCreatedUserId] INT            NOT NULL,
    [FosterCareExpenseCreatedDate]   DATETIME2 (7)  NOT NULL,
    [FosterCareExpenseComment]       NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_FactFosterCareExpense] PRIMARY KEY CLUSTERED ([FosterCareExpenseId] ASC)
);


GO

