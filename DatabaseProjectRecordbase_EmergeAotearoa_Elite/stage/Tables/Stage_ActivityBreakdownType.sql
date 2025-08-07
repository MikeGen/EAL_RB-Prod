CREATE TABLE [stage].[Stage_ActivityBreakdownType] (
    [ID]                  INT            NOT NULL,
    [TeamConfigurationID] INT            NOT NULL,
    [Code]                NVARCHAR (50)  NULL,
    [Name]                NVARCHAR (200) NOT NULL,
    [ParentID]            INT            NULL,
    [CreatedDate]         DATETIME       NOT NULL,
    [CreatedUserID]       INT            NOT NULL,
    [ModifiedDate]        DATETIME       NULL,
    [ModifiedUserID]      INT            NULL,
    [DeletedDate]         DATETIME       NULL,
    [DeletedUserID]       INT            NULL
);


GO

