CREATE TABLE [stage].[Stage_PersonPrescription] (
    [Id]                           INT            NOT NULL,
    [PersonId]                     INT            NOT NULL,
    [PrescriberId]                 INT            NOT NULL,
    [PrescriptionDate]             DATETIME       NOT NULL,
    [PrescriptionNumber]           NVARCHAR (50)  NULL,
    [DispenseFrom]                 NVARCHAR (MAX) NULL,
    [ScriptFrom]                   DATETIME       NULL,
    [ScriptTo]                     DATETIME       NULL,
    [ConsumeOnPremisesMondayId]    INT            NULL,
    [ConsumeOnPremisesTuesdayId]   INT            NULL,
    [ConsumeOnPremisesWednesdayId] INT            NULL,
    [ConsumeOnPremisesThursdayId]  INT            NULL,
    [ConsumeOnPremisesFridayId]    INT            NULL,
    [ConsumeOnPremisesSaturdayId]  INT            NULL,
    [ConsumeOnPremisesSundayId]    INT            NULL,
    [CreatedUserId]                INT            NOT NULL,
    [CreatedDate]                  DATETIME       NOT NULL,
    [ModifiedUserId]               INT            NULL,
    [ModifiedDate]                 DATETIME       NULL,
    [DeletedUserId]                INT            NULL,
    [DeletedDate]                  DATETIME       NULL,
    [PrescriptionType]             NVARCHAR (20)  NOT NULL
);


GO

