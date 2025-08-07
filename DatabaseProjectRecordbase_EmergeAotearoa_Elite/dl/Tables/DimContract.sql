CREATE TABLE [dl].[DimContract] (
    [ContractID]          INT            NOT NULL,
    [TeamConfigurationID] INT            NOT NULL,
    [ContractName]        NVARCHAR (50)  NOT NULL,
    [ContractDescription] NVARCHAR (MAX) NULL,
    [ContractStartDate]   DATETIME       NOT NULL,
    [ContractEndDate]     DATETIME       NULL,
    CONSTRAINT [PK_dl_DimContract] PRIMARY KEY CLUSTERED ([ContractID] ASC)
);


GO

