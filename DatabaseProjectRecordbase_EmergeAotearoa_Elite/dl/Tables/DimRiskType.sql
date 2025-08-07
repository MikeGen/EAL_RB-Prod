CREATE TABLE [dl].[DimRiskType] (
    [RiskTypeID]       INT            NOT NULL,
    [RiskTypeValue]    NVARCHAR (200) NOT NULL,
    [RiskTypeText]     NVARCHAR (200) NOT NULL,
    [RiskTypeParentId] INT            NULL,
    [RiskTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimRiskType] PRIMARY KEY CLUSTERED ([RiskTypeID] ASC)
);


GO

