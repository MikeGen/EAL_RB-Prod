CREATE TABLE [dl].[DimIncidentNotificationRecipientT] (
    [IncidentNotificationRecipientTID]       INT            NOT NULL,
    [IncidentNotificationRecipientTValue]    NVARCHAR (200) NOT NULL,
    [IncidentNotificationRecipientTText]     NVARCHAR (200) NOT NULL,
    [IncidentNotificationRecipientTParentId] INT            NULL,
    [IncidentNotificationRecipientTIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentNotificationRecipientT] PRIMARY KEY CLUSTERED ([IncidentNotificationRecipientTID] ASC)
);


GO

