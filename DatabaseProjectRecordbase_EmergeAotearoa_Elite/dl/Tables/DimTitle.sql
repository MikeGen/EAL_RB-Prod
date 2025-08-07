CREATE TABLE [dl].[DimTitle] (
    [TitleID]       INT            NOT NULL,
    [TitleValue]    NVARCHAR (200) NOT NULL,
    [TitleText]     NVARCHAR (200) NOT NULL,
    [TitleParentId] INT            NULL,
    [TitleIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimTitle] PRIMARY KEY CLUSTERED ([TitleID] ASC)
);


GO

