CREATE TABLE [stage].[Stage_FosterCareExpense] (
    [Id]             INT            NOT NULL,
    [CaregiverId]    INT            NOT NULL,
    [ChildId]        INT            NULL,
    [ClaimTypeId]    INT            NOT NULL,
    [ReceiptDate]    DATETIME2 (7)  NOT NULL,
    [ClaimAmount]    NUMERIC (9, 2) NULL,
    [CreatedUserId]  INT            NOT NULL,
    [CreatedDate]    DATETIME2 (7)  NOT NULL,
    [ModifiedUserId] INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  NULL,
    [DeletedUserId]  INT            NULL,
    [DeletedDate]    DATETIME2 (7)  NULL,
    [Comment]        NVARCHAR (MAX) NULL
);


GO

