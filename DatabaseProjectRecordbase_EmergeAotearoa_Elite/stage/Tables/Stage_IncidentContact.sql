CREATE TABLE [stage].[Stage_IncidentContact] (
    [ID]             INT            NOT NULL,
    [IncidentID]     INT            NOT NULL,
    [Name]           VARCHAR (100)  NULL,
    [Role]           VARCHAR (100)  NULL,
    [ContactDetails] VARCHAR (100)  NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [Inactivedate]   DATETIME       NULL,
    [InactiveUserID] INT            NULL,
    [RawComments]    NVARCHAR (MAX) NULL,
    [HtmlComments]   NVARCHAR (MAX) NULL,
    [RoleId]         INT            NULL
);


GO

