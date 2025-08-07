CREATE TABLE [dl].[FactActivityBreakdown] (
    [ActivityBreakdownID]                         INT      NOT NULL,
    [ActivityID]                                  INT      NOT NULL,
    [ActivityBreakdownTypeID]                     INT      NOT NULL,
    [ActivityBreakdownDuration]                   INT      NOT NULL,
    [ActivityBreakdownCreatedUserID]              INT      NOT NULL,
    [ActivityBreakdownCreatedDate]                DATETIME NOT NULL,
    [CreatedApplicationId]                        INT      NULL,
    [ActivityBreakdownCreatedApplicationSyncDate] DATETIME NULL,
    CONSTRAINT [PK_dl_FactActivityBreakdown] PRIMARY KEY CLUSTERED ([ActivityBreakdownID] ASC)
);


GO

CREATE NONCLUSTERED INDEX [idx_FactActivityBreakdown_ActivityID]
    ON [dl].[FactActivityBreakdown]([ActivityID] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_FactActivityBreakdown_ActivityID]
    ON [dl].[FactActivityBreakdown]([ActivityID] ASC)
    INCLUDE([ActivityBreakdownTypeID], [ActivityBreakdownDuration]);


GO

