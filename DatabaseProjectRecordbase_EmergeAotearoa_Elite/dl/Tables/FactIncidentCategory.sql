CREATE TABLE [dl].[FactIncidentCategory] (
    [IncidentCategoryID]            INT      NOT NULL,
    [IncidentID]                    INT      NOT NULL,
    [IncidentCategoryTypeID]        INT      NULL,
    [IncidentCategoryCreatedUserID] INT      NOT NULL,
    [IncidentCategoryCreatedDate]   DATETIME NOT NULL,
    CONSTRAINT [PK_dl_FactIncidentCategory] PRIMARY KEY CLUSTERED ([IncidentCategoryID] ASC)
);


GO

