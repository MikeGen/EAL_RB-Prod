CREATE TABLE [stage].[Stage_PersonAutoTask] (
    [ID]               INT           NOT NULL,
    [PersonID]         INT           NOT NULL,
    [EntityType]       NVARCHAR (50) NOT NULL,
    [EntityID]         INT           NOT NULL,
    [EntityTaskTypeID] INT           NOT NULL,
    [ActionTypeID]     INT           NULL,
    [ActionDate]       DATETIME      NULL,
    [AssignedUserID]   INT           NULL,
    [AssignedDate]     DATETIME      NULL,
    [InactiveUserID]   INT           NULL,
    [InactiveDate]     DATETIME      NULL,
    [CreatedUserID]    INT           NOT NULL,
    [CreatedDate]      DATETIME      NOT NULL,
    [ModifiedUserID]   INT           NULL,
    [ModifiedDate]     DATETIME      NULL,
    [DeletedUserID]    INT           NULL,
    [DeletedDate]      DATETIME      NULL
);


GO

