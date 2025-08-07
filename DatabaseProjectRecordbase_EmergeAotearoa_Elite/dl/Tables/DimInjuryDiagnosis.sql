CREATE TABLE [dl].[DimInjuryDiagnosis] (
    [InjuryDiagnosisID]       INT            NOT NULL,
    [InjuryDiagnosisValue]    NVARCHAR (200) NOT NULL,
    [InjuryDiagnosisText]     NVARCHAR (200) NOT NULL,
    [InjuryDiagnosisParentId] INT            NULL,
    [InjuryDiagnosisIsActive] BIT            NOT NULL,
    CONSTRAINT [PK_DimInjuryDiagnosis] PRIMARY KEY CLUSTERED ([InjuryDiagnosisID] ASC)
);


GO

