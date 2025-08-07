CREATE TABLE [dl].[FactAllocatedSupportTime] (
    [AllocatedSupportTimeId]             INT      NOT NULL,
    [PersonId]                           INT      NOT NULL,
    [TeamId]                             INT      NOT NULL,
    [AllocatedSupportTimeEffectiveDate]  DATETIME NOT NULL,
    [AllocatedSupportTimeMinutesPerWeek] INT      NOT NULL,
    [AllocatedSupportTimeCreatedDate]    DATETIME NOT NULL,
    [AllocatedSupportTimeCreatedUserId]  INT      NOT NULL,
    CONSTRAINT [PK_dl_FactAllocatedSupportTime] PRIMARY KEY CLUSTERED ([AllocatedSupportTimeId] ASC)
);


GO

