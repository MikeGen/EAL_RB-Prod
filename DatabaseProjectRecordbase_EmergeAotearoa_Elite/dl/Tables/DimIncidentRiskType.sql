CREATE TABLE [dl].[DimIncidentRiskType] (
    [IncidentRiskTypeID]     INT             NOT NULL,
    [IncidentRiskTypeName]   NVARCHAR (40)   NOT NULL,
    [IncidentRiskTypeCode]   INT             NOT NULL,
    [IncidentRiskTypeAction] NVARCHAR (4000) NULL,
    CONSTRAINT [PK_dl_DimIncidentRiskType] PRIMARY KEY CLUSTERED ([IncidentRiskTypeID] ASC)
);


GO

