CREATE TABLE [dl].[DimSLEaseUpWestSchools] (
    [SLEaseUpWestSchoolsID]       INT            NOT NULL,
    [SLEaseUpWestSchoolsValue]    NVARCHAR (200) NOT NULL,
    [SLEaseUpWestSchoolsText]     NVARCHAR (200) NOT NULL,
    [SLEaseUpWestSchoolsParentId] INT            NULL,
    [SLEaseUpWestSchoolsIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSLEaseUpWestSchools] PRIMARY KEY CLUSTERED ([SLEaseUpWestSchoolsID] ASC)
);


GO

