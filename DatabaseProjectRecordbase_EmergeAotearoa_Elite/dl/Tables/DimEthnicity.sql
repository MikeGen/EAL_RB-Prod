CREATE TABLE [dl].[DimEthnicity] (
    [EthnicityID]       INT            NOT NULL,
    [EthnicityValue]    NVARCHAR (200) NOT NULL,
    [EthnicityText]     NVARCHAR (200) NOT NULL,
    [EthnicityParentId] INT            NULL,
    [EthnicityIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimEthnicity] PRIMARY KEY CLUSTERED ([EthnicityID] ASC)
);


GO

