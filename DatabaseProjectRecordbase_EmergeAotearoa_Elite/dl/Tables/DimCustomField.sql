CREATE TABLE [dl].[DimCustomField] (
    [CustomFieldId]          INT            NOT NULL,
    [EntityTypeId]           INT            NOT NULL,
    [CustomFieldDataType]    NVARCHAR (MAX) NOT NULL,
    [CustomFieldName]        NVARCHAR (MAX) NOT NULL,
    [CustomFieldDescription] NVARCHAR (MAX) NULL,
    [CustomFieldLength]      INT            NULL,
    [LookupGroupId]          INT            NULL,
    [CustomFieldValidator]   NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimCustomField] PRIMARY KEY CLUSTERED ([CustomFieldId] ASC)
);


GO

