CREATE TABLE [dl].[FactPersonPrescriptionMedication] (
    [PersonPrescriptionMedicationId]            INT            NOT NULL,
    [PrescriptionId]                            INT            NOT NULL,
    [PersonMedicationId]                        INT            NOT NULL,
    [PersonPrescriptionMedicationQuantity]      NVARCHAR (50)  NULL,
    [PersonPrescriptionMedicationPeriod]        NVARCHAR (50)  NULL,
    [PersonPrescriptionMedicationInstructions]  NVARCHAR (MAX) NULL,
    [FrequencyId]                               INT            NULL,
    [PersonPrescriptionMedicationRepeats]       INT            NULL,
    [PersonPrescriptionMedicationAllowGeneric]  BIT            NOT NULL,
    [PersonPrescriptionMedicationCreatedUserId] INT            NOT NULL,
    [PersonPrescriptionMedicationCreatedDate]   DATETIME       NOT NULL,
    CONSTRAINT [PK_dl_FactPersonPrescriptionMedication] PRIMARY KEY CLUSTERED ([PersonPrescriptionMedicationId] ASC)
);


GO

