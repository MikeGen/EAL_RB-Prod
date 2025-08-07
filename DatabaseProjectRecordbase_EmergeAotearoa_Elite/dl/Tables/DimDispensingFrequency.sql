CREATE TABLE [dl].[DimDispensingFrequency] (
    [DispensingFrequencyID]       INT            NOT NULL,
    [DispensingFrequencyValue]    NVARCHAR (200) NOT NULL,
    [DispensingFrequencyText]     NVARCHAR (200) NOT NULL,
    [DispensingFrequencyParentId] INT            NULL,
    [DispensingFrequencyIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimDispensingFrequency] PRIMARY KEY CLUSTERED ([DispensingFrequencyID] ASC)
);


GO

