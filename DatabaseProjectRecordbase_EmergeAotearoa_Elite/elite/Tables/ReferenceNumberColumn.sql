CREATE TABLE [elite].[ReferenceNumberColumn] (
    [ID]            INT            IDENTITY (80000, 1) NOT NULL,
    [Code]          NVARCHAR (100) NOT NULL,
    [Name]          NVARCHAR (500) NULL,
    [SqlColumnName] NVARCHAR (500) NULL,
    [Width]         NVARCHAR (50)  NULL,
    [SortOrder]     INT            DEFAULT ((0)) NULL,
    [GroupName]     NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_ReferenceNumberColumn] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO

