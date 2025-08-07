CREATE TABLE [stage].[Stage_IncidentOwner] (
    [ID]             INT            NOT NULL,
    [OwnerType]      CHAR (1)       NULL,
    [UserID]         INT            NOT NULL,
    [RawComments]    NVARCHAR (MAX) NULL,
    [HtmlComments]   NVARCHAR (MAX) NULL,
    [IncidentID]     INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [CreatedUserID]  INT            NOT NULL,
    [ModifiedDate]   DATETIME       NULL,
    [ModifiedUserID] INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [OwnerName]      NVARCHAR (100) NULL
);


GO

