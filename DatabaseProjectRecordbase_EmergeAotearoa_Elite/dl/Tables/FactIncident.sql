CREATE TABLE [dl].[FactIncident] (
    [IncidentID]                        INT            NOT NULL,
    [IncidentDate]                      DATETIME       NOT NULL,
    [IncidentTitle]                     NVARCHAR (500) NULL,
    [IncidentDescriptionRaw]            NVARCHAR (MAX) NULL,
    [IncidentDescriptionHtml]           NVARCHAR (MAX) NULL,
    [IncidentLocation]                  NVARCHAR (MAX) NULL,
    [IncidentImmediateActionTakenRaw]   NVARCHAR (MAX) NULL,
    [IncidentImmediateActionTakenHtml]  NVARCHAR (MAX) NULL,
    [IncidentPossiblePreventionRaw]     NVARCHAR (MAX) NULL,
    [IncidentPossiblePreventionHtml]    NVARCHAR (MAX) NULL,
    [IncidentFurtherActionRequiredRaw]  NVARCHAR (MAX) NULL,
    [IncidentFurtherActionRequiredHtml] NVARCHAR (MAX) NULL,
    [IncidentInvestigationDetailsRaw]   NVARCHAR (MAX) NULL,
    [IncidentInvestigationDetailsHtml]  NVARCHAR (MAX) NULL,
    [CurrentOwnerUserID]                INT            NULL,
    [CurrentInvestigatorUserID]         INT            NULL,
    [CurrentReporterUserID]             INT            NULL,
    [IncidentIsPublish]                 BIT            NULL,
    [IncidentPublishedDate]             DATETIME       NULL,
    [AreaID]                            INT            NULL,
    [IncidentCreatedDate]               DATETIME       NOT NULL,
    [IncidentCreatedUserID]             INT            NOT NULL,
    [CurrentIncidentStatusTypeID]       INT            NULL,
    [IncidentOutcomeDetailsRaw]         NVARCHAR (MAX) NULL,
    [IncidentOutcomeDetailsHtml]        NVARCHAR (MAX) NULL,
    [TeamID]                            INT            NULL,
    [CurrentSuspensionID]               INT            NULL,
    [IncidentReportedByName]            NVARCHAR (100) NULL,
    [CompanyId]                         INT            NOT NULL,
    CONSTRAINT [PK_dl_FactIncident] PRIMARY KEY CLUSTERED ([IncidentID] ASC)
);


GO

