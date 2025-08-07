CREATE TABLE [stage].[Stage_PersonTask] (
    [ID]             INT            NOT NULL,
    [PersonID]       INT            NOT NULL,
    [Name]           NVARCHAR (300) NOT NULL,
    [Description]    NVARCHAR (MAX) NULL,
    [DueDate]        DATETIME       NOT NULL,
    [CompletedDate]  DATETIME       NULL,
    [InactiveUserID] INT            NULL,
    [InactiveDate]   DATETIME       NULL,
    [CreatedUserID]  INT            NOT NULL,
    [CreatedDate]    DATETIME       NOT NULL,
    [ModifiedUserID] INT            NULL,
    [ModifiedDate]   DATETIME       NULL,
    [DeletedUserID]  INT            NULL,
    [DeletedDate]    DATETIME       NULL,
    [AssignedUserID] INT            NULL,
    [ReferralID]     INT            NULL
);


GO

