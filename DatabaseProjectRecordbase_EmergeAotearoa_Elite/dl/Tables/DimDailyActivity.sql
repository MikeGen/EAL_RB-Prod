CREATE TABLE [dl].[DimDailyActivity] (
    [DailyActivityID]       INT            NOT NULL,
    [DailyActivityValue]    NVARCHAR (200) NOT NULL,
    [DailyActivityText]     NVARCHAR (200) NOT NULL,
    [DailyActivityParentId] INT            NULL,
    [DailyActivityIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimDailyActivity] PRIMARY KEY CLUSTERED ([DailyActivityID] ASC)
);


GO

