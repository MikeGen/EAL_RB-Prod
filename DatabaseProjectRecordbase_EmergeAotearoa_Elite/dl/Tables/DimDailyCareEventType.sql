CREATE TABLE [dl].[DimDailyCareEventType] (
    [DailyCareEventTypeID]       INT            NOT NULL,
    [DailyCareEventTypeValue]    NVARCHAR (200) NOT NULL,
    [DailyCareEventTypeText]     NVARCHAR (200) NOT NULL,
    [DailyCareEventTypeParentId] INT            NULL,
    [DailyCareEventTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimDailyCareEventType] PRIMARY KEY CLUSTERED ([DailyCareEventTypeID] ASC)
);


GO

