CREATE TABLE [stage].[Stage_IncidentStatus] (
    [ID]                   INT            NOT NULL,
    [IncidentID]           INT            NOT NULL,
    [IncidentStatusTypeID] INT            NOT NULL,
    [CreatedUserID]        INT            NOT NULL,
    [CreatedDate]          DATETIME       NOT NULL,
    [ModifiedUserID]       INT            NULL,
    [ModifiedDate]         DATETIME       NULL,
    [DeletedUserID]        INT            NULL,
    [DeletedDate]          DATETIME       NULL,
    [RawComment]           NVARCHAR (MAX) NULL,
    [HtmlComment]          NVARCHAR (MAX) NULL,
    [EndDate]              DATETIME       NULL
);


GO

