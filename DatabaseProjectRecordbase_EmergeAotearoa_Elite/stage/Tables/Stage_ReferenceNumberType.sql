CREATE TABLE [stage].[Stage_ReferenceNumberType] (
    [ID]                   INT            NOT NULL,
    [Key]                  NVARCHAR (20)  NULL,
    [Name]                 NVARCHAR (50)  NOT NULL,
    [IsUnique]             BIT            NOT NULL,
    [HasExpiryDate]        BIT            NOT NULL,
    [ValidationExpression] NVARCHAR (300) NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [CreatedUserID]        INT            NOT NULL,
    [ModifiedDate]         DATETIME       NULL,
    [ModifiedUserID]       INT            NULL,
    [DeletedDate]          DATETIME       NULL,
    [DeletedUserID]        INT            NULL
);


GO

