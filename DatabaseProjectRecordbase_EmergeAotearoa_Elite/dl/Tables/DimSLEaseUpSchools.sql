CREATE TABLE [dl].[DimSLEaseUpSchools] (
    [SLEaseUpSchoolsID]       INT            NOT NULL,
    [SLEaseUpSchoolsValue]    NVARCHAR (200) NOT NULL,
    [SLEaseUpSchoolsText]     NVARCHAR (200) NOT NULL,
    [SLEaseUpSchoolsParentId] INT            NULL,
    [SLEaseUpSchoolsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLEaseUpSchools] PRIMARY KEY CLUSTERED ([SLEaseUpSchoolsID] ASC)
);


GO

