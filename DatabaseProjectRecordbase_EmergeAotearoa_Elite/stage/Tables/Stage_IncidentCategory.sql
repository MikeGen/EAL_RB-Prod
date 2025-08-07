CREATE TABLE [stage].[Stage_IncidentCategory] (
    [ID]                     INT      NOT NULL,
    [IncidentID]             INT      NOT NULL,
    [IncidentCategoryTypeID] INT      NULL,
    [CreatedUserID]          INT      NOT NULL,
    [CreatedDate]            DATETIME NOT NULL,
    [ModifiedUserID]         INT      NULL,
    [ModifiedDate]           DATETIME NULL,
    [DeletedUserID]          INT      NULL,
    [DeletedDate]            DATETIME NULL,
    [InactiveUserID]         INT      NULL,
    [InactiveDate]           DATETIME NULL
);


GO

