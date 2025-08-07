CREATE TABLE [dl].[DimIndustry] (
    [IndustryID]       INT            NOT NULL,
    [IndustryValue]    NVARCHAR (200) NOT NULL,
    [IndustryText]     NVARCHAR (200) NOT NULL,
    [IndustryParentId] INT            NULL,
    [IndustryIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIndustry] PRIMARY KEY CLUSTERED ([IndustryID] ASC)
);


GO

