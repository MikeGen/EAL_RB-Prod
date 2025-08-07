CREATE TABLE [transform].[DimEthnicityGroup] (
    [EthnicityID]    INT            NOT NULL,
    [EthnicityName]  NVARCHAR (200) NULL,
    [NZHISGroupName] NVARCHAR (50)  NULL,
    [StatsNZLevel1]  NVARCHAR (50)  NULL,
    CONSTRAINT [PK_transform_DimEthnicityGroup] PRIMARY KEY CLUSTERED ([EthnicityID] ASC)
);


GO

