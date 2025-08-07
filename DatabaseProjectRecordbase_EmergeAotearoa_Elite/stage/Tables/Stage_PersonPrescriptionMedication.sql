CREATE TABLE [stage].[Stage_PersonPrescriptionMedication] (
    [Id]                 INT            NOT NULL,
    [PrescriptionId]     INT            NOT NULL,
    [PersonMedicationId] INT            NOT NULL,
    [Quantity]           NVARCHAR (50)  NULL,
    [Period]             NVARCHAR (50)  NULL,
    [Instructions]       NVARCHAR (MAX) NULL,
    [FrequencyId]        INT            NULL,
    [Repeats]            INT            NULL,
    [AllowGeneric]       BIT            NOT NULL,
    [CreatedUserId]      INT            NOT NULL,
    [CreatedDate]        DATETIME       NOT NULL,
    [ModifiedUserId]     INT            NULL,
    [ModifiedDate]       DATETIME       NULL,
    [DeletedUserId]      INT            NULL,
    [DeletedDate]        DATETIME       NULL
);


GO

