CREATE TABLE [dl].[DimMechanismOfInjury] (
    [MechanismOfInjuryID]       INT            NOT NULL,
    [MechanismOfInjuryValue]    NVARCHAR (200) NOT NULL,
    [MechanismOfInjuryText]     NVARCHAR (200) NOT NULL,
    [MechanismOfInjuryParentId] INT            NULL,
    [MechanismOfInjuryIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimMechanismOfInjury] PRIMARY KEY CLUSTERED ([MechanismOfInjuryID] ASC)
);


GO

