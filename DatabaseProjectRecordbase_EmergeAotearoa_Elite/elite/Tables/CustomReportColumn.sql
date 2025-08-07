CREATE TABLE [elite].[CustomReportColumn] (
    [ID]            INT            NOT NULL,
    [EntityType]    NVARCHAR (50)  NOT NULL,
    [Name]          NVARCHAR (300) NOT NULL,
    [SqlColumnName] NVARCHAR (255) NOT NULL,
    [Width]         NVARCHAR (20)  NOT NULL,
    [SortOrder]     INT            DEFAULT ((0)) NULL,
    [GroupName]     NVARCHAR (MAX) NULL
);


GO

