CREATE TABLE [stage].[Stage_ActivityBreakdown] (
    [ID]                         INT      NOT NULL,
    [ActivityID]                 INT      NOT NULL,
    [ActivityBreakdownTypeID]    INT      NOT NULL,
    [Duration]                   INT      NOT NULL,
    [CreatedUserID]              INT      NOT NULL,
    [CreatedDate]                DATETIME NOT NULL,
    [ModifiedUserID]             INT      NULL,
    [ModifiedDate]               DATETIME NULL,
    [DeletedUserID]              INT      NULL,
    [DeletedDate]                DATETIME NULL,
    [CreatedApplicationId]       INT      NULL,
    [CreatedApplicationSyncDate] DATETIME NULL
);


GO

