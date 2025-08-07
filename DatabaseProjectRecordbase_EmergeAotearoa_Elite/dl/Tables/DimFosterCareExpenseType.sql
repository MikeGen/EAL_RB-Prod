CREATE TABLE [dl].[DimFosterCareExpenseType] (
    [FosterCareExpenseTypeID]       INT            NOT NULL,
    [FosterCareExpenseTypeValue]    NVARCHAR (200) NOT NULL,
    [FosterCareExpenseTypeText]     NVARCHAR (200) NOT NULL,
    [FosterCareExpenseTypeParentId] INT            NULL,
    [FosterCareExpenseTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimFosterCareExpenseType] PRIMARY KEY CLUSTERED ([FosterCareExpenseTypeID] ASC)
);


GO

