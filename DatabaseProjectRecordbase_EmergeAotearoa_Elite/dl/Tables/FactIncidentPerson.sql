CREATE TABLE [dl].[FactIncidentPerson] (
    [IncidentPersonID]            INT            NOT NULL,
    [IncidentID]                  INT            NOT NULL,
    [IncidentPersonEntityType]    NVARCHAR (50)  NOT NULL,
    [EntityID]                    INT            NOT NULL,
    [IncidentPersonRole]          NVARCHAR (150) NULL,
    [IncidentPersonIsComplainant] BIT            NULL,
    [IncidentPersonRawComments]   NVARCHAR (MAX) NULL,
    [IncidentPersonHtmlComments]  NVARCHAR (MAX) NULL,
    [IncidentPersonCreatedUserID] INT            NOT NULL,
    [IncidentPersonCreatedDate]   DATETIME       NOT NULL,
    [RoleId]                      INT            NULL,
    CONSTRAINT [PK_dl_FactIncidentPerson] PRIMARY KEY CLUSTERED ([IncidentPersonID] ASC)
);


GO

