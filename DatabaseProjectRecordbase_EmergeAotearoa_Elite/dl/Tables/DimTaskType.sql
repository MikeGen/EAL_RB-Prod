CREATE TABLE [dl].[DimTaskType] (
    [TaskTypeID]       INT            NOT NULL,
    [TaskTypeValue]    NVARCHAR (200) NOT NULL,
    [TaskTypeText]     NVARCHAR (200) NOT NULL,
    [TaskTypeParentId] INT            NULL,
    [TaskTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimTaskType] PRIMARY KEY CLUSTERED ([TaskTypeID] ASC)
);


GO

