CREATE TABLE [dl].[DimPersonInteractionType] (
    [PersonInteractionTypeId]       INT            NOT NULL,
    [PersonInteractionTypeCode]     NVARCHAR (MAX) NOT NULL,
    [PersonInteractionTypeName]     NVARCHAR (MAX) NOT NULL,
    [PersonInteractionTypeParentId] INT            NULL,
    CONSTRAINT [PK_dl_DimPersonInteractionType] PRIMARY KEY CLUSTERED ([PersonInteractionTypeId] ASC)
);


GO

