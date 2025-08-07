CREATE TABLE [dl].[FactIncidentSuspension] (
    [IncidentSuspensionID]            INT            NOT NULL,
    [IncidentSuspensionReasonTypeID]  INT            NULL,
    [IncidentSuspensionComments]      NVARCHAR (MAX) NULL,
    [IncidentSuspensionResumedDate]   DATETIME       NULL,
    [ResumedUserID]                   INT            NULL,
    [IncidentID]                      INT            NOT NULL,
    [IncidentSuspensionCreatedDate]   DATETIME       NOT NULL,
    [IncidentSuspensionCreatedUserID] INT            NOT NULL,
    CONSTRAINT [PK_dl_FactIncidentSuspension] PRIMARY KEY CLUSTERED ([IncidentSuspensionID] ASC)
);


GO

