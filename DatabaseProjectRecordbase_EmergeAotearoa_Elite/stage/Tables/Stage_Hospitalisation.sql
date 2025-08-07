CREATE TABLE [stage].[Stage_Hospitalisation] (
    [ID]             INT            NOT NULL,
    [PersonStatusID] INT            NOT NULL,
    [Belongings]     NVARCHAR (MAX) NULL,
    [OldReasons]     NVARCHAR (MAX) NULL,
    [Planned]        BIT            NOT NULL,
    [InactiveUserID] INT            NULL,
    [InactiveDate]   DATETIME       NULL,
    [CreatedUserID]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [ModifiedUserID] INT            NULL,
    [ModifiedDate]   DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [DeletedDate]    DATETIME       NULL
);


GO

