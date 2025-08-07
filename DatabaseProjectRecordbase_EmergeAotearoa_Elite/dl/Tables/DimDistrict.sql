CREATE TABLE [dl].[DimDistrict] (
    [DistrictID]       INT            NOT NULL,
    [DistrictValue]    NVARCHAR (200) NOT NULL,
    [DistrictText]     NVARCHAR (200) NOT NULL,
    [DistrictParentId] INT            NULL,
    [DistrictIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimDistrict] PRIMARY KEY CLUSTERED ([DistrictID] ASC)
);


GO

