CREATE TABLE [dl].[FactIncidentAssessment] (
    [IncidentAssessmentID]            INT            NOT NULL,
    [IncidentID]                      INT            NOT NULL,
    [IncidentSeverityID]              INT            NOT NULL,
    [IncidentLikelihoodID]            INT            NOT NULL,
    [IncidentAssessmentRawComments]   NVARCHAR (MAX) NULL,
    [IncidentAssessmentHtmlComments]  NVARCHAR (MAX) NULL,
    [IncidentAssessmentCreatedUserID] INT            NOT NULL,
    [IncidentAssessmentCreatedDate]   DATETIME       NOT NULL,
    CONSTRAINT [PK_dl_FactIncidentAssessment] PRIMARY KEY CLUSTERED ([IncidentAssessmentID] ASC)
);


GO

