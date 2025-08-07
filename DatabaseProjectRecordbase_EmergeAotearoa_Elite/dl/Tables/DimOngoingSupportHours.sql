CREATE TABLE [dl].[DimOngoingSupportHours] (
    [OngoingSupportHoursID]       INT            NOT NULL,
    [OngoingSupportHoursValue]    NVARCHAR (200) NOT NULL,
    [OngoingSupportHoursText]     NVARCHAR (200) NOT NULL,
    [OngoingSupportHoursParentId] INT            NULL,
    [OngoingSupportHoursIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimOngoingSupportHours] PRIMARY KEY CLUSTERED ([OngoingSupportHoursID] ASC)
);


GO

