CREATE TABLE [stage].[Stage_ConfigurationSetting] (
    [ID]                INT           NOT NULL,
    [Name]              VARCHAR (MAX) NOT NULL,
    [Value]             VARCHAR (MAX) NOT NULL,
    [Code]              VARCHAR (50)  NULL,
    [Description]       VARCHAR (MAX) NULL,
    [RecordbaseVersion] VARCHAR (50)  NULL,
    [CreatedDate]       DATETIME      NOT NULL,
    [CreatedUserID]     INT           NOT NULL,
    [ModifiedDate]      DATETIME      NULL,
    [ModifiedUserID]    INT           NULL,
    [DeletedDate]       DATETIME      NULL,
    [DeletedUserID]     INT           NULL
);


GO

