CREATE TABLE [dl].[DimCF_ContractType] (
    [CF_ContractTypeID]       INT            NOT NULL,
    [CF_ContractTypeValue]    NVARCHAR (200) NOT NULL,
    [CF_ContractTypeText]     NVARCHAR (200) NOT NULL,
    [CF_ContractTypeParentId] INT            NULL,
    [CF_ContractTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimCF_ContractType] PRIMARY KEY CLUSTERED ([CF_ContractTypeID] ASC)
);


GO

