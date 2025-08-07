CREATE TABLE [dl].[DimAbilities] (
    [AbilitiesID]       INT            NOT NULL,
    [AbilitiesValue]    NVARCHAR (200) NOT NULL,
    [AbilitiesText]     NVARCHAR (200) NOT NULL,
    [AbilitiesParentId] INT            NULL,
    [AbilitiesIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAbilities] PRIMARY KEY CLUSTERED ([AbilitiesID] ASC)
);


GO

