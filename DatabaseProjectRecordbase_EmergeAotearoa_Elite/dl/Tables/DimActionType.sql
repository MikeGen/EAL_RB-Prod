CREATE TABLE [dl].[DimActionType] (
    [ActionTypeID]       INT            NOT NULL,
    [ActionTypeValue]    NVARCHAR (200) NOT NULL,
    [ActionTypeText]     NVARCHAR (200) NOT NULL,
    [ActionTypeParentId] INT            NULL,
    [ActionTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimActionType] PRIMARY KEY CLUSTERED ([ActionTypeID] ASC)
);


GO

