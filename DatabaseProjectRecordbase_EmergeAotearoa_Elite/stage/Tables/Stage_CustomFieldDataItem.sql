CREATE TABLE [stage].[Stage_CustomFieldDataItem] (
    [Id]            INT            NOT NULL,
    [EntityId]      INT            NOT NULL,
    [CustomFieldId] INT            NOT NULL,
    [Integer]       INT            NULL,
    [Boolean]       BIT            NULL,
    [Decimal]       DECIMAL (18)   NULL,
    [String]        NVARCHAR (MAX) NULL,
    [LookupId]      INT            NULL,
    [DateTime]      DATETIME       NULL,
    [DateTimeFrom]  DATETIME       NULL,
    [DateTimeTo]    DATETIME       NULL,
    [Discriminator] NVARCHAR (MAX) NOT NULL
);


GO

