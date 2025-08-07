CREATE TABLE [stage].[Stage_IncidentAssessment] (
    [ID]                   INT            NOT NULL,
    [IncidentID]           INT            NOT NULL,
    [IncidentSeverityID]   INT            NOT NULL,
    [IncidentLikelihoodID] INT            NOT NULL,
    [RawComments]          NVARCHAR (MAX) NULL,
    [HtmlComments]         NVARCHAR (MAX) NULL,
    [CreatedUserID]        INT            NOT NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [ModifiedUserID]       INT            NULL,
    [ModifiedDate]         DATETIME       NULL,
    [InactiveUserID]       INT            NULL,
    [InactiveDate]         DATETIME       NULL,
    [DeletedUserID]        INT            NULL,
    [DeletedDate]          DATETIME       NULL
);


GO

