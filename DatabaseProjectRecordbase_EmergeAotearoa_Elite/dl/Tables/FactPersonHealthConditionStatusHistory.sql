CREATE TABLE [dl].[FactPersonHealthConditionStatusHistory] (
    [PersonHealthConditionStatusHistoryId]            INT      NOT NULL,
    [PersonHealthConditionId]                         INT      NOT NULL,
    [PersonHealthConditionStatusHistoryIsCurrent]     BIT      NOT NULL,
    [PersonHealthConditionStatusHistoryCreatedDate]   DATETIME NOT NULL,
    [PersonHealthConditionStatusHistoryCreatedUserId] INT      NOT NULL,
    CONSTRAINT [PK_dl_FactPersonHealthConditionStatusHistory] PRIMARY KEY CLUSTERED ([PersonHealthConditionStatusHistoryId] ASC)
);


GO

