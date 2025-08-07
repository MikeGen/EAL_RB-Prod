CREATE TABLE [stage].[Stage_Contract] (
    [ID]                  INT            NOT NULL,
    [TeamConfigurationID] INT            NOT NULL,
    [Name]                NVARCHAR (50)  NOT NULL,
    [Description]         NVARCHAR (MAX) NULL,
    [StartDate]           DATETIME       NOT NULL,
    [EndDate]             DATETIME       NULL,
    [InactiveUserID]      INT            NULL,
    [InactiveDate]        DATETIME       NULL,
    [CreatedUserID]       INT            NOT NULL,
    [CreatedDate]         DATETIME       NOT NULL,
    [ModifiedUserID]      INT            NULL,
    [ModifiedDate]        DATETIME       NULL,
    [DeletedUserID]       INT            NULL,
    [DeletedDate]         DATETIME       NULL
);


GO

