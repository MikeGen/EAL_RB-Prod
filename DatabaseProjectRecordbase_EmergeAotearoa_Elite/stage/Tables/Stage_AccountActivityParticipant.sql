CREATE TABLE [stage].[Stage_AccountActivityParticipant] (
    [ID]                INT      NOT NULL,
    [AccountActivityID] INT      NOT NULL,
    [UserID]            INT      NOT NULL,
    [CreatedDate]       DATETIME NOT NULL,
    [CreatedUserID]     INT      NOT NULL,
    [ModifiedDate]      DATETIME NULL,
    [ModifiedUserID]    INT      NULL,
    [DeletedDate]       DATETIME NULL,
    [DeletedUserID]     INT      NULL
);


GO

