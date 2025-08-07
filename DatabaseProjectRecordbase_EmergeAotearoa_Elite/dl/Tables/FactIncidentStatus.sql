CREATE TABLE [dl].[FactIncidentStatus] (
    [IncidentStatusID]            INT            NOT NULL,
    [IncidentID]                  INT            NOT NULL,
    [IncidentStatusTypeID]        INT            NOT NULL,
    [IncidentStatusCreatedUserID] INT            NOT NULL,
    [IncidentStatusCreatedDate]   DATETIME       NOT NULL,
    [IncidentStatusRawComment]    NVARCHAR (MAX) NULL,
    [IncidentStatusHtmlComment]   NVARCHAR (MAX) NULL,
    [IncidentStatusEndDate]       DATETIME       NULL,
    CONSTRAINT [PK_dl_FactIncidentStatus] PRIMARY KEY CLUSTERED ([IncidentStatusID] ASC)
);


GO

