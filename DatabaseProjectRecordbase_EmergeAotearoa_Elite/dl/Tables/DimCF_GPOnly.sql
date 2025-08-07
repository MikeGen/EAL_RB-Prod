CREATE TABLE [dl].[DimCF_GPOnly] (
    [CF_GPOnlyID]       INT            NOT NULL,
    [CF_GPOnlyValue]    NVARCHAR (200) NOT NULL,
    [CF_GPOnlyText]     NVARCHAR (200) NOT NULL,
    [CF_GPOnlyParentId] INT            NULL,
    [CF_GPOnlyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCF_GPOnly] PRIMARY KEY CLUSTERED ([CF_GPOnlyID] ASC)
);


GO

