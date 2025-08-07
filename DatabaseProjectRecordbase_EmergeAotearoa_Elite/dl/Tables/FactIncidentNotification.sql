CREATE TABLE [dl].[FactIncidentNotification] (
    [IncidentNotificationID]               INT            NOT NULL,
    [IncidentID]                           INT            NOT NULL,
    [IncidentNotificationNotificationDate] DATETIME       NULL,
    [IncidentNotificationRecipientTypeID]  INT            NOT NULL,
    [IncidentNotificationName]             VARCHAR (MAX)  NULL,
    [IncidentNotificationRawComments]      NVARCHAR (MAX) NULL,
    [IncidentNotificationHtmlComments]     NVARCHAR (MAX) NULL,
    [IncidentNotificationCreatedDate]      DATETIME       NOT NULL,
    [IncidentNotificationCreatedUserID]    INT            NOT NULL,
    CONSTRAINT [PK_dl_FactIncidentNotification] PRIMARY KEY CLUSTERED ([IncidentNotificationID] ASC)
);


GO

