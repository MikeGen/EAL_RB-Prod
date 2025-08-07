CREATE TABLE [dl].[DimIncidentStatusType] (
    [IncidentStatusTypeID]          INT            NOT NULL,
    [IncidentStatusTypeCode]        NVARCHAR (30)  NULL,
    [IncidentStatusTypeText]        NVARCHAR (100) NULL,
    [IncidentStatusTypeDescription] NVARCHAR (500) NULL,
    [IncidentStatusTypeGroup]       NVARCHAR (100) NULL,
    CONSTRAINT [PK_dl_DimIncidentStatusType] PRIMARY KEY CLUSTERED ([IncidentStatusTypeID] ASC)
);


GO

