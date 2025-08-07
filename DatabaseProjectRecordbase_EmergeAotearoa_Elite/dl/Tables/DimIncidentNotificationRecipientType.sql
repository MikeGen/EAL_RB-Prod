CREATE TABLE [dl].[DimIncidentNotificationRecipientType] (
    [IncidentNotificationRecipientTypeID]       INT            NOT NULL,
    [IncidentNotificationRecipientTypeValue]    NVARCHAR (200) NOT NULL,
    [IncidentNotificationRecipientTypeText]     NVARCHAR (200) NOT NULL,
    [IncidentNotificationRecipientTypeParentId] INT            NULL,
    [IncidentNotificationRecipientTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentNotificationRecipientType] PRIMARY KEY CLUSTERED ([IncidentNotificationRecipientTypeID] ASC)
);


GO

