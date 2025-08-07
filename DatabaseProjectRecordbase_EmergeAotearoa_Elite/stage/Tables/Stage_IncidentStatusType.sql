CREATE TABLE [stage].[Stage_IncidentStatusType] (
    [ID]             INT            NOT NULL,
    [Code]           NVARCHAR (30)  NULL,
    [Text]           NVARCHAR (100) NULL,
    [Description]    NVARCHAR (500) NULL,
    [Group]          NVARCHAR (100) NULL,
    [CreatedUserID]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [ModifiedUserID] INT            NULL,
    [ModifiedDate]   DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [InactiveUserID] INT            NULL,
    [InactiveDate]   DATETIME       NULL
);


GO

