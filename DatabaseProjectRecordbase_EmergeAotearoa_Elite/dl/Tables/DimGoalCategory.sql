CREATE TABLE [dl].[DimGoalCategory] (
    [GoalCategoryID]       INT            NOT NULL,
    [GoalCategoryValue]    NVARCHAR (200) NOT NULL,
    [GoalCategoryText]     NVARCHAR (200) NOT NULL,
    [GoalCategoryParentId] INT            NULL,
    [GoalCategoryIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimGoalCategory] PRIMARY KEY CLUSTERED ([GoalCategoryID] ASC)
);


GO

