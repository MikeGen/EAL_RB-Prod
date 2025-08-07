CREATE TABLE [dl].[DimIncidentSeverity] (
    [IncidentSeverityID]       INT            NOT NULL,
    [IncidentSeverityValue]    NVARCHAR (200) NOT NULL,
    [IncidentSeverityText]     NVARCHAR (200) NOT NULL,
    [IncidentSeverityParentId] INT            NULL,
    [IncidentSeverityIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentSeverity] PRIMARY KEY CLUSTERED ([IncidentSeverityID] ASC)
);


GO

