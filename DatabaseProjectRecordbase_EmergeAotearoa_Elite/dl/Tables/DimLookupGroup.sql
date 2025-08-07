CREATE TABLE [dl].[DimLookupGroup] (
    [LookupGroupID]                     INT            NOT NULL,
    [LookupGroupName]                   NVARCHAR (50)  NOT NULL,
    [LookupGroupKey]                    NVARCHAR (50)  NOT NULL,
    [LookupGroupDescription]            NVARCHAR (MAX) NULL,
    [LookupGroupOldTable]               NVARCHAR (50)  NULL,
    [LookupGroupIconEnabled]            BIT            NOT NULL,
    [LookupGroupRequiresUniqueValues]   BIT            NOT NULL,
    [LookupGroupComments]               NVARCHAR (MAX) NULL,
    [LookupGroupRestrictedToWildBamboo] BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimLookupGroup] PRIMARY KEY CLUSTERED ([LookupGroupID] ASC)
);


GO

