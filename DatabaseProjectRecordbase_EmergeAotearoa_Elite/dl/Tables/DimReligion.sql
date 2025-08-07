CREATE TABLE [dl].[DimReligion] (
    [ReligionID]       INT            NOT NULL,
    [ReligionValue]    NVARCHAR (200) NOT NULL,
    [ReligionText]     NVARCHAR (200) NOT NULL,
    [ReligionParentId] INT            NULL,
    [ReligionIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimReligion] PRIMARY KEY CLUSTERED ([ReligionID] ASC)
);


GO

