CREATE TABLE [dl].[DimSubstanceType] (
    [SubstanceTypeID]       INT            NOT NULL,
    [SubstanceTypeValue]    NVARCHAR (200) NOT NULL,
    [SubstanceTypeText]     NVARCHAR (200) NOT NULL,
    [SubstanceTypeParentId] INT            NULL,
    [SubstanceTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimSubstanceType] PRIMARY KEY CLUSTERED ([SubstanceTypeID] ASC)
);


GO

