CREATE TABLE [dl].[FactPersonPrescription] (
    [PersonPrescriptionId]                 INT            NOT NULL,
    [PersonId]                             INT            NOT NULL,
    [PrescriberId]                         INT            NOT NULL,
    [PersonPrescriptionPrescriptionDate]   DATETIME       NOT NULL,
    [PersonPrescriptionPrescriptionNumber] NVARCHAR (50)  NULL,
    [PersonPrescriptionDispenseFrom]       NVARCHAR (MAX) NULL,
    [PersonPrescriptionScriptFrom]         DATETIME       NULL,
    [PersonPrescriptionScriptTo]           DATETIME       NULL,
    [ConsumeOnPremisesMondayId]            INT            NULL,
    [ConsumeOnPremisesTuesdayId]           INT            NULL,
    [ConsumeOnPremisesWednesdayId]         INT            NULL,
    [ConsumeOnPremisesThursdayId]          INT            NULL,
    [ConsumeOnPremisesFridayId]            INT            NULL,
    [ConsumeOnPremisesSaturdayId]          INT            NULL,
    [ConsumeOnPremisesSundayId]            INT            NULL,
    [PersonPrescriptionCreatedUserId]      INT            NOT NULL,
    [PersonPrescriptionCreatedDate]        DATETIME       NOT NULL,
    [PersonPrescriptionPrescriptionType]   NVARCHAR (20)  NOT NULL,
    CONSTRAINT [PK_dl_FactPersonPrescription] PRIMARY KEY CLUSTERED ([PersonPrescriptionId] ASC)
);


GO

