CREATE TABLE [dl].[DimPCSFL] (
    [PCSFLID]       INT            NOT NULL,
    [PCSFLValue]    NVARCHAR (200) NOT NULL,
    [PCSFLText]     NVARCHAR (200) NOT NULL,
    [PCSFLParentId] INT            NULL,
    [PCSFLIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimPCSFL] PRIMARY KEY CLUSTERED ([PCSFLID] ASC)
);


GO

