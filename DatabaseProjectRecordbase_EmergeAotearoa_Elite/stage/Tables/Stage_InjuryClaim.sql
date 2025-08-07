CREATE TABLE [stage].[Stage_InjuryClaim] (
    [Id]                   INT                NOT NULL,
    [PersonId]             INT                NOT NULL,
    [ClaimNumber]          NVARCHAR (100)     NULL,
    [AccidentDate]         DATETIMEOFFSET (0) NULL,
    [MechanismOfInjuryId]  INT                NULL,
    [PrimaryDiagnosisId]   INT                NULL,
    [SecondaryDiagnosisId] INT                NULL,
    [Comments]             NVARCHAR (MAX)     NULL,
    [CreatedDate]          DATETIME2 (7)      NOT NULL,
    [CreatedUserId]        INT                NOT NULL,
    [ModifiedDate]         DATETIME2 (7)      NULL,
    [ModifiedUserId]       INT                NULL,
    [DeletedDate]          DATETIME2 (7)      NULL,
    [DeletedUserId]        INT                NULL
);


GO

