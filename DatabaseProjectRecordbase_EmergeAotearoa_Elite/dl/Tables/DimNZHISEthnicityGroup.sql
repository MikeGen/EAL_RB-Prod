CREATE TABLE [dl].[DimNZHISEthnicityGroup] (
    [ID]        INT           NOT NULL,
    [GroupName] NVARCHAR (50) NULL,
    [SortIndex] INT           NULL,
    CONSTRAINT [PK_dl_DimNZHISEthnicityGroup] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

