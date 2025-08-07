CREATE TABLE [dl].[FactInjuryClaim] (
    [InjuryClaimId]            INT                NOT NULL,
    [PersonId]                 INT                NOT NULL,
    [InjuryClaimClaimNumber]   NVARCHAR (100)     NULL,
    [InjuryClaimAccidentDate]  DATETIMEOFFSET (0) NULL,
    [MechanismOfInjuryId]      INT                NULL,
    [PrimaryDiagnosisId]       INT                NULL,
    [SecondaryDiagnosisId]     INT                NULL,
    [InjuryClaimComments]      NVARCHAR (MAX)     NULL,
    [InjuryClaimCreatedDate]   DATETIME2 (7)      NOT NULL,
    [InjuryClaimCreatedUserId] INT                NOT NULL,
    CONSTRAINT [PK_dl_FactInjuryClaim] PRIMARY KEY CLUSTERED ([InjuryClaimId] ASC)
);


GO

