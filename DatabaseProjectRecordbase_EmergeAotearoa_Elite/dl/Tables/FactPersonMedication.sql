CREATE TABLE [dl].[FactPersonMedication] (
    [PersonMedicationID]                         INT            NOT NULL,
    [PersonMedicationMedicationName]             NVARCHAR (MAX) NOT NULL,
    [PersonMedicationMedicationBrand]            NVARCHAR (MAX) NOT NULL,
    [PersonMedicationMedicationDosage]           NVARCHAR (MAX) NOT NULL,
    [PersonMedicationPrescribedBy]               NVARCHAR (100) NULL,
    [PersonMedicationFrequency]                  NVARCHAR (300) NULL,
    [PersonMedicationPrescriptionDate]           DATETIME       NULL,
    [RouteMethodID]                              INT            NOT NULL,
    [PersonMedicationDoseMorning]                NUMERIC (18)   NULL,
    [PersonMedicationDoseMidday]                 NUMERIC (18)   NULL,
    [PersonMedicationDoseEvening]                NUMERIC (18)   NULL,
    [PersonMedicationDoseBed]                    NUMERIC (18)   NULL,
    [PersonMedicationIsBlisterPack]              BIT            NULL,
    [PersonMedicationPRN]                        BIT            NULL,
    [PersonMedicationPRNExpiryDate]              DATETIME       NULL,
    [PersonMedicationPRNInstructions]            NVARCHAR (MAX) NULL,
    [PersonMedicationSideEffects]                NVARCHAR (MAX) NULL,
    [PersonMedicationMaxDoseIn24Hours]           NVARCHAR (50)  NULL,
    [PersonMedicationMinIntervalBetweenDoses]    NVARCHAR (50)  NULL,
    [PersonMedicationIsSelfMedicated]            BIT            NULL,
    [PersonMedicationDiscontinuedDate]           DATETIME       NULL,
    [PersonMedicationDiscontinuedBy]             NVARCHAR (100) NULL,
    [PersonMedicationDiscontinuedReason]         NVARCHAR (MAX) NULL,
    [PersonID]                                   INT            NOT NULL,
    [PersonMedicationMigratedNameAndBrand]       NVARCHAR (MAX) NULL,
    [PersonMedicationCreatedUserID]              INT            NOT NULL,
    [PersonMedicationCreatedDate]                DATETIME       NOT NULL,
    [PersonMedicationSpecialAuthorityNumber]     NVARCHAR (50)  NULL,
    [PersonMedicationComments]                   NVARCHAR (MAX) NULL,
    [PersonMedicationIsCustom]                   BIT            NOT NULL,
    [PersonMedicationIsControlled]               BIT            NOT NULL,
    [PersonMedicationSpecialAuthorityExpiryDate] DATETIME       NULL,
    CONSTRAINT [PK_dl_FactPersonMedication] PRIMARY KEY CLUSTERED ([PersonMedicationID] ASC)
);


GO

