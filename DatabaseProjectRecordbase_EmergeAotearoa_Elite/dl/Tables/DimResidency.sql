CREATE TABLE [dl].[DimResidency] (
    [ResidencyID]       INT            NOT NULL,
    [ResidencyValue]    NVARCHAR (200) NOT NULL,
    [ResidencyText]     NVARCHAR (200) NOT NULL,
    [ResidencyParentId] INT            NULL,
    [ResidencyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimResidency] PRIMARY KEY CLUSTERED ([ResidencyID] ASC)
);


GO

