CREATE TABLE [stage].[Stage_UserPerson] (
    [ID]                INT            NOT NULL,
    [UserID]            INT            NOT NULL,
    [PersonID]          INT            NOT NULL,
    [AccessGranted]     BIT            NOT NULL,
    [AccessDenied]      BIT            NOT NULL,
    [StartDate]         DATETIME       NOT NULL,
    [EndDate]           DATETIME       NULL,
    [Reason]            NVARCHAR (256) NULL,
    [RequestedByUserID] INT            NULL,
    [CreatedDate]       DATETIME       NOT NULL,
    [CreatedUserID]     INT            NOT NULL,
    [ModifiedDate]      DATETIME       NULL,
    [ModifiedUserID]    INT            NULL,
    [DeletedDate]       DATETIME       NULL,
    [DeletedUserID]     INT            NULL
);


GO

