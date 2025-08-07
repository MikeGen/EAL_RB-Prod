CREATE TABLE [dl].[DimAccountActivityType] (
    [AccountActivityTypeID]       INT            NOT NULL,
    [AccountActivityTypeValue]    NVARCHAR (200) NOT NULL,
    [AccountActivityTypeText]     NVARCHAR (200) NOT NULL,
    [AccountActivityTypeParentId] INT            NULL,
    [AccountActivityTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimAccountActivityType] PRIMARY KEY CLUSTERED ([AccountActivityTypeID] ASC)
);


GO

