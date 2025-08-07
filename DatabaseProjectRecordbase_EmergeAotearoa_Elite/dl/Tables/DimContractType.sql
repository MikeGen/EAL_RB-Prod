CREATE TABLE [dl].[DimContractType] (
    [ContractTypeID]       INT            NOT NULL,
    [ContractTypeValue]    NVARCHAR (200) NOT NULL,
    [ContractTypeText]     NVARCHAR (200) NOT NULL,
    [ContractTypeParentId] INT            NULL,
    [ContractTypeIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimContractType] PRIMARY KEY CLUSTERED ([ContractTypeID] ASC)
);


GO

