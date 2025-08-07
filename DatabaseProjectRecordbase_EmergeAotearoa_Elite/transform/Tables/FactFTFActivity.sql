CREATE TABLE [transform].[FactFTFActivity] (
    [ReferralID]               INT      NULL,
    [TeamID]                   INT      NOT NULL,
    [ActivityID]               INT      NOT NULL,
    [FTFActivityStartDate]     DATETIME NOT NULL,
    [FTFActivityEndDate]       DATETIME NOT NULL,
    [ActivityClassificationID] INT      NULL,
    [ActivityTypeID]           INT      NOT NULL,
    [FTFActivityOrder]         INT      NOT NULL
);


GO

