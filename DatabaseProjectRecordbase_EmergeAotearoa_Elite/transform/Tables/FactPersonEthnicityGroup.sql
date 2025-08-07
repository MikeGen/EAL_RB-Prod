CREATE TABLE [transform].[FactPersonEthnicityGroup] (
    [PersonID]                        INT          NOT NULL,
    [Prioritised_NZHISEthnicityGroup] VARCHAR (50) NULL,
    [Primary_StatsNZLevel1Ethnicity]  VARCHAR (50) NULL,
    CONSTRAINT [PK_transform_FactPersonEthnicityGroup] PRIMARY KEY CLUSTERED ([PersonID] ASC)
);


GO

