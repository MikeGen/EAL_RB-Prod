CREATE TABLE [stage].[Stage_LookupGroup] (
    [LookupGroupID]          INT            NOT NULL,
    [Name]                   NVARCHAR (50)  NOT NULL,
    [Key]                    NVARCHAR (50)  NOT NULL,
    [Description]            NVARCHAR (MAX) NULL,
    [OldTable]               NVARCHAR (50)  NULL,
    [IconEnabled]            BIT            NOT NULL,
    [RequiresUniqueValues]   BIT            NOT NULL,
    [CreatedDate]            DATETIME       NOT NULL,
    [ModifiedDate]           DATETIME       NULL,
    [DeletedDate]            DATETIME       NULL,
    [Comments]               NVARCHAR (MAX) NULL,
    [RestrictedToWildBamboo] BIT            NOT NULL
);


GO

