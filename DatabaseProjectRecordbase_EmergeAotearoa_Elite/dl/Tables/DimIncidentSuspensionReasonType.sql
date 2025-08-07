CREATE TABLE [dl].[DimIncidentSuspensionReasonType] (
    [IncidentSuspensionReasonTypeID]       INT            NOT NULL,
    [IncidentSuspensionReasonTypeValue]    NVARCHAR (200) NOT NULL,
    [IncidentSuspensionReasonTypeText]     NVARCHAR (200) NOT NULL,
    [IncidentSuspensionReasonTypeParentId] INT            NULL,
    [IncidentSuspensionReasonTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentSuspensionReasonType] PRIMARY KEY CLUSTERED ([IncidentSuspensionReasonTypeID] ASC)
);


GO

