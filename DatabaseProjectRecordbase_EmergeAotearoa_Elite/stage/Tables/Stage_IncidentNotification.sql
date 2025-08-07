CREATE TABLE [stage].[Stage_IncidentNotification] (
    [ID]                                  INT            NOT NULL,
    [IncidentID]                          INT            NOT NULL,
    [NotificationDate]                    DATETIME       NULL,
    [IncidentNotificationRecipientTypeID] INT            NOT NULL,
    [Name]                                VARCHAR (MAX)  NULL,
    [RawComments]                         NVARCHAR (MAX) NULL,
    [HtmlComments]                        NVARCHAR (MAX) NULL,
    [CreatedDate]                         DATETIME       NOT NULL,
    [CreatedUserID]                       INT            NOT NULL,
    [ModifiedDate]                        DATETIME       NULL,
    [ModifiedUserID]                      INT            NULL,
    [DeletedDate]                         DATETIME       NULL,
    [DeletedUserID]                       INT            NULL
);


GO

