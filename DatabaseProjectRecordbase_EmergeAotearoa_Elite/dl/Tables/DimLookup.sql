CREATE TABLE [dl].[DimLookup] (
    [LookupID]        INT            NOT NULL,
    [LookupGroupID]   INT            NOT NULL,
    [LookupValue]     NVARCHAR (50)  NULL,
    [LookupText]      NVARCHAR (200) NOT NULL,
    [LookupSortIndex] INT            NULL,
    [LookupParentID]  INT            NULL,
    [HistoricalID]    INT            NULL,
    [LookupNotes]     VARCHAR (MAX)  NULL,
    [IconID]          INT            NULL,
    [LookupIsDefault] BIT            NOT NULL,
    CONSTRAINT [PK_dl_DimLookup] PRIMARY KEY CLUSTERED ([LookupID] ASC)
);


GO

