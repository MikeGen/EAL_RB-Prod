CREATE TABLE [dl].[FactIncidentCollaborator] (
    [IncidentCollaboratorID]                INT            NOT NULL,
    [IncidentID]                            INT            NOT NULL,
    [UserID]                                INT            NOT NULL,
    [IncidentCollaboratorStartDate]         DATETIME       NOT NULL,
    [IncidentCollaboratorEndDate]           DATETIME       NULL,
    [IncidentCollaboratorRole]              NVARCHAR (150) NULL,
    [IncidentCollaboratorCanAddNotes]       BIT            NOT NULL,
    [IncidentCollaboratorCanAddAttachments] BIT            NOT NULL,
    [IncidentCollaboratorInactiveReason]    NVARCHAR (MAX) NULL,
    [IncidentCollaboratorComments]          NVARCHAR (MAX) NULL,
    [IncidentCollaboratorCreatedUserID]     INT            NOT NULL,
    [IncidentCollaboratorCreatedDate]       DATETIME       NOT NULL,
    CONSTRAINT [PK_dl_FactIncidentCollaborator] PRIMARY KEY CLUSTERED ([IncidentCollaboratorID] ASC)
);


GO

