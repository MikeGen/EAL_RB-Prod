CREATE TABLE [dl].[FactIncidentContact] (
    [IncidentContactID]             INT            NOT NULL,
    [IncidentID]                    INT            NOT NULL,
    [IncidentContactName]           VARCHAR (100)  NULL,
    [IncidentContactRole]           VARCHAR (100)  NULL,
    [IncidentContactContactDetails] VARCHAR (100)  NULL,
    [IncidentContactCreatedDate]    DATETIME       NOT NULL,
    [IncidentContactCreatedUserID]  INT            NOT NULL,
    [IncidentContactRawComments]    NVARCHAR (MAX) NULL,
    [IncidentContactHtmlComments]   NVARCHAR (MAX) NULL,
    [RoleId]                        INT            NULL,
    CONSTRAINT [PK_dl_FactIncidentContact] PRIMARY KEY CLUSTERED ([IncidentContactID] ASC)
);


GO

