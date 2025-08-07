CREATE TABLE [dl].[DimReferrerGroup] (
    [ReferrerGroupID]          INT            NOT NULL,
    [ReferrerGroupKey]         NVARCHAR (50)  NULL,
    [ReferrerGroupName]        NVARCHAR (50)  NULL,
    [ReferrerGroupDescription] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_dl_DimReferrerGroup] PRIMARY KEY CLUSTERED ([ReferrerGroupID] ASC)
);


GO

