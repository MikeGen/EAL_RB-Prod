CREATE TABLE [dl].[DimSLEaseUpCentralSchools] (
    [SLEaseUpCentralSchoolsID]       INT            NOT NULL,
    [SLEaseUpCentralSchoolsValue]    NVARCHAR (200) NOT NULL,
    [SLEaseUpCentralSchoolsText]     NVARCHAR (200) NOT NULL,
    [SLEaseUpCentralSchoolsParentId] INT            NULL,
    [SLEaseUpCentralSchoolsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLEaseUpCentralSchools] PRIMARY KEY CLUSTERED ([SLEaseUpCentralSchoolsID] ASC)
);


GO

