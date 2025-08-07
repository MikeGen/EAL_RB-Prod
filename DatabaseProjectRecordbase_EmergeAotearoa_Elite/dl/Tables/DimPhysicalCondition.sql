CREATE TABLE [dl].[DimPhysicalCondition] (
    [PhysicalConditionID]       INT            NOT NULL,
    [PhysicalConditionValue]    NVARCHAR (200) NOT NULL,
    [PhysicalConditionText]     NVARCHAR (200) NOT NULL,
    [PhysicalConditionParentId] INT            NULL,
    [PhysicalConditionIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPhysicalCondition] PRIMARY KEY CLUSTERED ([PhysicalConditionID] ASC)
);


GO

