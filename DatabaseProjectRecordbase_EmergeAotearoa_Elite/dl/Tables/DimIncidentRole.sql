CREATE TABLE [dl].[DimIncidentRole] (
    [IncidentRoleID]       INT            NOT NULL,
    [IncidentRoleValue]    NVARCHAR (200) NOT NULL,
    [IncidentRoleText]     NVARCHAR (200) NOT NULL,
    [IncidentRoleParentId] INT            NULL,
    [IncidentRoleIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimIncidentRole] PRIMARY KEY CLUSTERED ([IncidentRoleID] ASC)
);


GO

