CREATE TABLE [dl].[FactPersonJob] (
    [PersonJobID]           INT            NOT NULL,
    [PersonJobUDF1]         NVARCHAR (MAX) NULL,
    [PersonJobUDF2]         NVARCHAR (MAX) NULL,
    [PersonJobUDF3]         NVARCHAR (MAX) NULL,
    [PersonJobUDF4]         NVARCHAR (MAX) NULL,
    [PersonJobUDF5]         NVARCHAR (MAX) NULL,
    [PersonJobHoursPerWeek] REAL           NULL,
    CONSTRAINT [PK_dl_FactPersonJob] PRIMARY KEY CLUSTERED ([PersonJobID] ASC)
);


GO

