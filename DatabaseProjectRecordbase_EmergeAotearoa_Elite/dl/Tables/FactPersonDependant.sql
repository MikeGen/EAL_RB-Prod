CREATE TABLE [dl].[FactPersonDependant] (
    [PersonDependantID]               INT           NOT NULL,
    [PersonID]                        INT           NOT NULL,
    [PersonDependantName]             NVARCHAR (50) NULL,
    [PersonDependantProxyDateOfBirth] DATETIME      NULL,
    [GenderID]                        INT           NULL,
    [CustodyID]                       INT           NULL,
    [OldChildID]                      INT           NULL,
    [PersonDependantCreatedDate]      DATETIME      NOT NULL,
    [PersonDependantCreatedUserID]    INT           NOT NULL,
    [PersonDependantDateOfBirth]      DATETIME2 (7) NULL,
    CONSTRAINT [PK_dl_FactPersonDependant] PRIMARY KEY CLUSTERED ([PersonDependantID] ASC)
);


GO

