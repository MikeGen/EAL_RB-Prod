CREATE TABLE [stage].[Stage_TeamConfigurationField] (
    [ID]                  INT           NOT NULL,
    [TeamConfigurationID] INT           NOT NULL,
    [Field]               NVARCHAR (50) NULL,
    [Label]               NVARCHAR (50) NULL,
    [LookupGroupID]       INT           NULL,
    [CreatedUserID]       INT           NOT NULL,
    [CreatedDate]         DATETIME      NOT NULL,
    [ModifiedUserID]      INT           NULL,
    [ModifiedDate]        DATETIME      NULL,
    [DeletedUserID]       INT           NULL,
    [DeletedDate]         DATETIME      NULL
);


GO

