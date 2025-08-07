CREATE TABLE [incident].[FactIncidentStatistics] (
    [IncidentID]                  INT      NOT NULL,
    [IncidentTypeID]              INT      NULL,
    [IncidentDate]                DATETIME NOT NULL,
    [TeamID]                      INT      NULL,
    [AreaID]                      INT      NULL,
    [IncidentLikelihoodID]        INT      NULL,
    [IncidentSeverityID]          INT      NULL,
    [PendingDate]                 DATETIME NULL,
    [AssignedToInvestigatorDate]  DATETIME NULL,
    [AssignedToReporterDate]      DATETIME NULL,
    [CompletedDate]               DATETIME NULL,
    [InvestigationDate]           DATETIME NULL,
    [ReviewDate]                  DATETIME NULL,
    [CurrentIncidentStatusTypeID] INT      NULL,
    [OriginatorUserID]            INT      NOT NULL,
    [InvestigatorUserID]          INT      NULL,
    [ReporterUserID]              INT      NULL,
    [RiskTypeID]                  INT      NULL,
    [CompanyId]                   INT      NOT NULL
);


GO

