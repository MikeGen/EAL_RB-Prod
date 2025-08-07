CREATE TABLE [dl].[DimGoalStatusType] (
    [GoalStatusTypeID]       INT            NOT NULL,
    [GoalStatusTypeValue]    NVARCHAR (200) NOT NULL,
    [GoalStatusTypeText]     NVARCHAR (200) NOT NULL,
    [GoalStatusTypeParentId] INT            NULL,
    [GoalStatusTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimGoalStatusType] PRIMARY KEY CLUSTERED ([GoalStatusTypeID] ASC)
);


GO

