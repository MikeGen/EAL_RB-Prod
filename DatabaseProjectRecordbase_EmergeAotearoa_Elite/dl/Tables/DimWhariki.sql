CREATE TABLE [dl].[DimWhariki] (
    [WharikiID]       INT            NOT NULL,
    [WharikiValue]    NVARCHAR (200) NOT NULL,
    [WharikiText]     NVARCHAR (200) NOT NULL,
    [WharikiParentId] INT            NULL,
    [WharikiIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimWhariki] PRIMARY KEY CLUSTERED ([WharikiID] ASC)
);


GO

