CREATE TABLE [stage].[Stage_CustomField] (
    [Id]            INT            NOT NULL,
    [EntityTypeId]  INT            NOT NULL,
    [DataType]      NVARCHAR (MAX) NOT NULL,
    [Name]          NVARCHAR (MAX) NOT NULL,
    [Description]   NVARCHAR (MAX) NULL,
    [Length]        INT            NULL,
    [LookupGroupId] INT            NULL,
    [Validator]     NVARCHAR (MAX) NULL
);


GO

