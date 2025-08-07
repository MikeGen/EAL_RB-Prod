CREATE TABLE [dl].[DimPhysicalHealthConditionStatus] (
    [PhysicalHealthConditionStatusID]       INT            NOT NULL,
    [PhysicalHealthConditionStatusValue]    NVARCHAR (200) NOT NULL,
    [PhysicalHealthConditionStatusText]     NVARCHAR (200) NOT NULL,
    [PhysicalHealthConditionStatusParentId] INT            NULL,
    [PhysicalHealthConditionStatusIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPhysicalHealthConditionStatus] PRIMARY KEY CLUSTERED ([PhysicalHealthConditionStatusID] ASC)
);


GO

