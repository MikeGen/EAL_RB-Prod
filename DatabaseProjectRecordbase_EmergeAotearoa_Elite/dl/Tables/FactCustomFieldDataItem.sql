CREATE TABLE [dl].[FactCustomFieldDataItem] (
    [CustomFieldDataItemId]            INT            NOT NULL,
    [EntityId]                         INT            NOT NULL,
    [CustomFieldId]                    INT            NOT NULL,
    [CustomFieldDataItemInteger]       INT            NULL,
    [CustomFieldDataItemBoolean]       BIT            NULL,
    [CustomFieldDataItemDecimal]       DECIMAL (18)   NULL,
    [CustomFieldDataItemString]        NVARCHAR (MAX) NULL,
    [LookupId]                         INT            NULL,
    [CustomFieldDataItemDateTime]      DATETIME       NULL,
    [CustomFieldDataItemDateTimeFrom]  DATETIME       NULL,
    [CustomFieldDataItemDateTimeTo]    DATETIME       NULL,
    [CustomFieldDataItemDiscriminator] NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_dl_FactCustomFieldDataItem] PRIMARY KEY CLUSTERED ([CustomFieldDataItemId] ASC)
);


GO

