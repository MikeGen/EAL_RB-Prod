CREATE TABLE [stage].[Stage_PersonDependant] (
    [ID]               INT           NOT NULL,
    [PersonID]         INT           NOT NULL,
    [Name]             NVARCHAR (50) NULL,
    [ProxyDateOfBirth] DATETIME      NULL,
    [GenderID]         INT           NULL,
    [CustodyID]        INT           NULL,
    [OldChildID]       INT           NULL,
    [CreatedDate]      DATETIME      NOT NULL,
    [CreatedUserID]    INT           NOT NULL,
    [ModifiedDate]     DATETIME      NULL,
    [ModifiedUserID]   INT           NULL,
    [DeletedDate]      DATETIME      NULL,
    [DeletedUserID]    INT           NULL,
    [DateOfBirth]      DATETIME2 (7) NULL
);


GO

