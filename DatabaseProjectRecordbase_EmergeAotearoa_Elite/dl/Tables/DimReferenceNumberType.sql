CREATE TABLE [dl].[DimReferenceNumberType] (
    [ReferenceNumberTypeID]                   INT            NOT NULL,
    [ReferenceNumberTypeKey]                  NVARCHAR (20)  NULL,
    [ReferenceNumberTypeName]                 NVARCHAR (50)  NOT NULL,
    [ReferenceNumberTypeIsUnique]             BIT            NOT NULL,
    [ReferenceNumberTypeHasExpiryDate]        BIT            NOT NULL,
    [ReferenceNumberTypeValidationExpression] NVARCHAR (300) NULL,
    CONSTRAINT [PK_dl_DimReferenceNumberType] PRIMARY KEY CLUSTERED ([ReferenceNumberTypeID] ASC)
);


GO

