CREATE TABLE [stage].[Stage_IncidentPerson] (
    [ID]             INT            NOT NULL,
    [IncidentID]     INT            NOT NULL,
    [EntityType]     NVARCHAR (50)  NOT NULL,
    [EntityID]       INT            NOT NULL,
    [Role]           NVARCHAR (150) NULL,
    [IsComplainant]  BIT            NULL,
    [RawComments]    NVARCHAR (MAX) NULL,
    [HtmlComments]   NVARCHAR (MAX) NULL,
    [CreatedUserID]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [ModifiedUserID] INT            NULL,
    [ModifiedDate]   DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [InactiveUserID] INT            NULL,
    [InactiveDate]   DATETIME       NULL,
    [RoleId]         INT            NULL
);


GO

