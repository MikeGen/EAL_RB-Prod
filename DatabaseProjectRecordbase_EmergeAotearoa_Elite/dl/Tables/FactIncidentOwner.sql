CREATE TABLE [dl].[FactIncidentOwner] (
    [IncidentOwnerID]            INT            NOT NULL,
    [IncidentOwnerOwnerType]     CHAR (1)       NULL,
    [UserID]                     INT            NOT NULL,
    [IncidentOwnerRawComments]   NVARCHAR (MAX) NULL,
    [IncidentOwnerHtmlComments]  NVARCHAR (MAX) NULL,
    [IncidentID]                 INT            NOT NULL,
    [IncidentOwnerCreatedDate]   DATETIME       NOT NULL,
    [IncidentOwnerCreatedUserID] INT            NOT NULL,
    [IncidentOwnerOwnerName]     NVARCHAR (100) NULL,
    CONSTRAINT [PK_dl_FactIncidentOwner] PRIMARY KEY CLUSTERED ([IncidentOwnerID] ASC)
);


GO

