CREATE TABLE [dl].[DimActivityBreakdownType] (
    [ActivityBreakdownTypeID]       INT            NOT NULL,
    [TeamConfigurationID]           INT            NOT NULL,
    [ActivityBreakdownTypeCode]     NVARCHAR (50)  NULL,
    [ActivityBreakdownTypeName]     NVARCHAR (200) NOT NULL,
    [ActivityBreakdownTypeParentID] INT            NULL,
    CONSTRAINT [PK_dl_DimActivityBreakdownType] PRIMARY KEY CLUSTERED ([ActivityBreakdownTypeID] ASC)
);


GO

