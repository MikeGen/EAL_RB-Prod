CREATE TABLE [dl].[DimDailyCareEventMood] (
    [DailyCareEventMoodID]       INT            NOT NULL,
    [DailyCareEventMoodValue]    NVARCHAR (200) NOT NULL,
    [DailyCareEventMoodText]     NVARCHAR (200) NOT NULL,
    [DailyCareEventMoodParentId] INT            NULL,
    [DailyCareEventMoodIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimDailyCareEventMood] PRIMARY KEY CLUSTERED ([DailyCareEventMoodID] ASC)
);


GO

