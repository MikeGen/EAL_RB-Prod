CREATE TABLE [dl].[DimBenefitType] (
    [BenefitTypeID]       INT            NOT NULL,
    [BenefitTypeValue]    NVARCHAR (200) NOT NULL,
    [BenefitTypeText]     NVARCHAR (200) NOT NULL,
    [BenefitTypeParentId] INT            NULL,
    [BenefitTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimBenefitType] PRIMARY KEY CLUSTERED ([BenefitTypeID] ASC)
);


GO

