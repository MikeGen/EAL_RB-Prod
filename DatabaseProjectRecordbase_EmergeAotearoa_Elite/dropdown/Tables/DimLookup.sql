CREATE TABLE [dropdown].[DimLookup] (
    [LookupID]           INT            NOT NULL,
    [LookupGroup]        NVARCHAR (50)  NOT NULL,
    [LookupText]         NVARCHAR (200) NOT NULL,
    [LookupParentText]   NVARCHAR (200) NULL,
    [LookupTopLevelText] NVARCHAR (200) NULL,
    [CompleteLookupText] NVARCHAR (MAX) NULL,
    [LookupCode]         NVARCHAR (50)  NULL,
    [LookupParentCode]   NVARCHAR (50)  NULL,
    [LookupTopLevelCode] NVARCHAR (50)  NULL,
    CONSTRAINT [PK_dropdown_DimLookup] PRIMARY KEY CLUSTERED ([LookupID] ASC)
);


GO

